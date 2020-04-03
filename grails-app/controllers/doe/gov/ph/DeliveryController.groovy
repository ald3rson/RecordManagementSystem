package doe.gov.ph

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_USER'])
class DeliveryController {

    DeliveryService deliveryService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def entryCriteria = Delivery.createCriteria().list(params) {
            order("id", "desc")
        }
        def count = entryCriteria.totalCount
        render(view:'index', model:[ 'results':entryCriteria, 'resultCount' : count])
    }

    def show(Long id) {
        respond deliveryService.get(id)
    }

    def create() {
        respond new Delivery(params)
    }

    def save(Delivery delivery) {
        if (delivery == null) {
            notFound()
            return
        }

        try {
            deliveryService.save(delivery)

        } catch (ValidationException e) {
            respond delivery.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'delivery.label', default: 'Delivery'), delivery.id])
                redirect action: "index"
            }
            '*' { respond delivery, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond deliveryService.get(id)
    }

    def update(Delivery delivery) {
        if (delivery == null) {
            notFound()
            return
        }

        try {
            deliveryService.save(delivery)
        } catch (ValidationException e) {
            respond delivery.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'delivery.label', default: 'Delivery'), delivery.id])
                redirect action: "index" 
            }
            '*'{ respond delivery, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        deliveryService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'delivery.label', default: 'Delivery'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }


    def searchResults =  {
        params.max = params.max ?: 10
        def entryCriteria = Delivery.createCriteria().list(params) {
            or {
                    ilike("control", "%${params.search}%")
                    ilike("bureau", "%${params.search}%") 
                    ilike("remarks", "%${params.search}%") 
                    ilike("city", "%${params.search}%")
                    ilike("receiver", "%${params.search}%") 
                    ilike("company", "%${params.search}%") 
                    ilike("date", "%${params.search}%") 
            }
            order("id", "desc")

        }

        def count = entryCriteria.totalCount
        render(view:'index', model:[ 'results':entryCriteria, 'resultCount' : count])
    }    


    def report = {
        render(view:'report')
    }


    def searchReport =  {
        // params.max = params.max ?: 10
        report = Delivery.executeQuery("FROM Delivery WHERE company LIKE CONCAT('%', :company, '%') AND (STR_TO_DATE(date, '%m/%d/%Y') BETWEEN (:from) AND (:to)) order by id desc",[company: [params.company], from: [params.from], to: [params.to]])
        render(view:'report', model:[ 'report':report])
    } 

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'delivery.label', default: 'Delivery'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
