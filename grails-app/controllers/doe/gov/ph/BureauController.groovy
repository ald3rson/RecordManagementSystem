package doe.gov.ph

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_USER'])
class BureauController {

    BureauService bureauService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bureauService.list(params), model:[bureauCount: bureauService.count()]
    }

    def searchResults =  {
        params.max = params.max ?: 10
        def entryCriteria = Bureau.createCriteria().list(params) {
            or {
                    ilike("bureauName", "%${params.search}%")
            }
            order("id", "desc")

        }

        def count = entryCriteria.totalCount
        render(view:'index', model:[ 'bureauList':entryCriteria, 'bureauCount' : count])
    }        

    def show(Long id) {
        respond bureauService.get(id)
    }

    def create() {
        respond new Bureau(params)
    }

    def save(Bureau bureau) {
        if (bureau == null) {
            notFound()
            return
        }

        try {
            bureauService.save(bureau)
        } catch (ValidationException e) {
            respond bureau.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bureau.label', default: 'Bureau'), bureau.id])
                redirect action: "index" 
            }
            '*' { respond bureau, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond bureauService.get(id)
    }

    def update(Bureau bureau) {
        if (bureau == null) {
            notFound()
            return
        }

        try {
            bureauService.save(bureau)
        } catch (ValidationException e) {
            respond bureau.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'bureau.label', default: 'Bureau'), bureau.id])
                redirect action: "index" 
            }
            '*'{ respond bureau, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        bureauService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'bureau.label', default: 'Bureau'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bureau.label', default: 'Bureau'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
