package doe.gov.ph

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_USER'])
class CityController {

    CityService cityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond cityService.list(params), model:[cityCount: cityService.count()]
    }

    def searchResults =  {
        params.max = params.max ?: 10
        def entryCriteria = City.createCriteria().list(params) {
            or {
                    ilike("cityName", "%${params.search}%")
            }
            order("id", "desc")

        }

        def count = entryCriteria.totalCount
        render(view:'index', model:[ 'cityList':entryCriteria, 'cityCount' : count])
    }  

    def show(Long id) {
        respond cityService.get(id)
    }

    def create() {
        respond new City(params)
    }

    def save(City city) {
        if (city == null) {
            notFound()
            return
        }

        try {
            cityService.save(city)
        } catch (ValidationException e) {
            respond city.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'city.label', default: 'City'), city.id])
                redirect action: "index" 
            }
            '*' { respond city, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond cityService.get(id)
    }

    def update(City city) {
        if (city == null) {
            notFound()
            return
        }

        try {
            cityService.save(city)
        } catch (ValidationException e) {
            respond city.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'city.label', default: 'City'), city.id])
                redirect action: "index"
            }
            '*'{ respond city, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        cityService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'city.label', default: 'City'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'city.label', default: 'City'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
