package doe.gov.ph

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_ADMIN'])
class TypeController {

    TypeService typeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond typeService.list(params), model:[typeCount: typeService.count()]
    }

    def searchResults =  {
        params.max = params.max ?: 10
        def entryCriteria = Type.createCriteria().list(params) {
            or {
                    ilike("typeName", "%${params.search}%")

            }
            order("id", "desc")

        }

        def count = entryCriteria.totalCount
        render(view:'index', model:[ 'typeList':entryCriteria, 'typeCount' : count])
    }

    def show(Long id) {
        respond typeService.get(id)
    }

    def save(Type type) {
        if (type == null) {
            notFound()
            return
        }

        try {
            type.typeDateCreated = new Date()
            typeService.save(type)
        } catch (ValidationException e) {
            respond type.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'type.label', default: 'Type'), type.id])
                redirect action: "index" 
            }
            '*' { respond type, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond typeService.get(id)
    }

    def update(Type type) {
        if (type == null) {
            notFound()
            return
        }

        try {
            typeService.save(type)
        } catch (ValidationException e) {
            respond type.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'type.label', default: 'Type'), type.id])
                redirect action: "index" 
            }
            '*'{ respond type, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        typeService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'type.label', default: 'Type'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'type.label', default: 'Type'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
