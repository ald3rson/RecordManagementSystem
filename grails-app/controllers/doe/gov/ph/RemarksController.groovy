package doe.gov.ph

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_USER'])
class RemarksController {

    RemarksService remarksService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond remarksService.list(params), model:[remarksCount: remarksService.count()]
    }

    def searchResults =  {
        params.max = params.max ?: 10
        def entryCriteria = Remarks.createCriteria().list(params) {
            or {
                    ilike("remarksName", "%${params.search}%")

            }
            order("id", "desc")

        }

        def count = entryCriteria.totalCount
        render(view:'index', model:[ 'remarksList':entryCriteria, 'remarksCount' : count])
    }

    def show(Long id) {
        respond remarksService.get(id)
    }

    def create() {
        respond new Remarks(params)
    }

    def save(Remarks remarks) {
        if (remarks == null) {
            notFound()
            return
        }

        try {
            remarksService.save(remarks)
        } catch (ValidationException e) {
            respond remarks.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'remarks.label', default: 'Remarks'), remarks.id])
                redirect action: "index" 
            }
            '*' { respond remarks, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond remarksService.get(id)
    }

    def update(Remarks remarks) {
        if (remarks == null) {
            notFound()
            return
        }

        try {
            remarksService.save(remarks)
        } catch (ValidationException e) {
            respond remarks.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'remarks.label', default: 'Remarks'), remarks.id])
                redirect action: "index" 
            }
            '*'{ respond remarks, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        remarksService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'remarks.label', default: 'Remarks'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'remarks.label', default: 'Remarks'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
