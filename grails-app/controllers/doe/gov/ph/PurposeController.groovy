package doe.gov.ph

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_ADMIN'])
class PurposeController {

    PurposeService purposeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond purposeService.list(params), model:[purposeCount: purposeService.count()]
    }

    def searchResults =  {
        params.max = params.max ?: 10
        def entryCriteria = Purpose.createCriteria().list(params) {
            or {
                    ilike("purposeDescription", "%${params.search}%")

            }
            order("id", "desc")

        }

        def count = entryCriteria.totalCount
        render(view:'index', model:[ 'purposeList':entryCriteria, 'purposeCount' : count])
    }

    def show(Long id) {
        respond purposeService.get(id)
    }

    def save(Purpose purpose) {
        if (purpose == null) {
            notFound()
            return
        }

        try {
            purpose.purposeDateCreated = new Date()
            purposeService.save(purpose)
        } catch (ValidationException e) {
            respond purpose.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'purpose.label', default: 'Purpose'), purpose.id])
                redirect action: "index" 
            }
            '*' { respond purpose, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond purposeService.get(id)
    }

    def update(Purpose purpose) {
        if (purpose == null) {
            notFound()
            return
        }

        try {
            purposeService.save(purpose)
        } catch (ValidationException e) {
            respond purpose.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'purpose.label', default: 'Purpose'), purpose.id])
                redirect action: "index" 
            }
            '*'{ respond purpose, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        purposeService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'purpose.label', default: 'Purpose'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'purpose.label', default: 'Purpose'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
