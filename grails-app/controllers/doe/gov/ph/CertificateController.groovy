package doe.gov.ph

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_ADMIN'])
class CertificateController {

    CertificateService certificateService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def tecCertificate = Certificate.createCriteria().list(params) {
            order("id", "desc")
            type{
                eq("typeName", "TEC")
            }
        }
        def count = tecCertificate.totalCount
        render(view:'index', model:[ 'results':tecCertificate, 'resultCount' : count])
    }

    def searchResults =  {
        params.max = params.max ?: 10
        def entryCriteria = Certificate.createCriteria().list(params) {
            type{
                eq("typeName", "TEC")
            }
            or {
                company {
                    ilike("companyName", "%${params.search}%")
                }
                
                purpose {
                   ilike("purposeDescription", "%${params.search}%")
                }

                    ilike("certificateDescription", "%${params.search}%")
                    ilike("certificateCurrencyForeign", "%${params.search}%")
                    ilike("certificateOrNumber", "%${params.search}%")
                    ilike("certificateTecNumber", "%${params.search}%")
                    ilike("certificatePlace", "%${params.search}%")
            }
            order("id", "desc")

        }

        def count = entryCriteria.totalCount
        render(view:'index', model:[ 'results':entryCriteria, 'resultCount' : count])
    } 

    def searchResults2 =  {
        params.max = params.max ?: 10
        def entryCriteria = Certificate.createCriteria().list(params) {
            type{
                eq("typeName", "COE")
            }
            or {
                company {
                    ilike("companyName", "%${params.search}%")
                }
                
                purpose {
                   ilike("purposeDescription", "%${params.search}%")
                }

                    ilike("certificateDescription", "%${params.search}%")
                    ilike("certificateCurrencyForeign", "%${params.search}%")
                    ilike("certificateOrNumber", "%${params.search}%")
                    ilike("certificateTecNumber", "%${params.search}%")
                    ilike("certificatePlace", "%${params.search}%")
            }
            order("id", "desc")

        }

        def count = entryCriteria.totalCount
        render(view:'index2', model:[ 'results':entryCriteria, 'resultCount' : count])
    } 

    def searchResults3 =  {
        params.max = params.max ?: 10
        def entryCriteria = Certificate.createCriteria().list(params) {
            type{
                eq("typeName", "DFC")
            }
            or {
                company {
                    ilike("companyName", "%${params.search}%")
                }
                
                purpose {
                   ilike("purposeDescription", "%${params.search}%")
                }

                    ilike("certificateDescription", "%${params.search}%")
                    ilike("certificateCurrencyForeign", "%${params.search}%")
                    ilike("certificateOrNumber", "%${params.search}%")
                    ilike("certificateTecNumber", "%${params.search}%")
                    ilike("certificatePlace", "%${params.search}%")
            }
            order("id", "desc")

        }

        def count = entryCriteria.totalCount
        render(view:'index3', model:[ 'results':entryCriteria, 'resultCount' : count])
    } 

    def index2(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def coeCertificate = Certificate.createCriteria().list(params) {
            order("id", "desc")
            type{
                eq("typeName", "COE")
            }
            
        }
        def count = coeCertificate.totalCount
        render(view:'index2', model:[ 'results':coeCertificate, 'resultCount' : count])
    } 

    def index3(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def dfcCertificate = Certificate.createCriteria().list(params) {
            order("id", "desc")
            type{
                eq("typeName", "DFC")
            }
        }
        def count = dfcCertificate.totalCount
        render(view:'index3', model:[ 'results':dfcCertificate, 'resultCount' : count])
    } 


    def show(Long id) {
        respond certificateService.get(id)
    }

    def save(Certificate certificate) {
        if (certificate == null) {
            notFound()
            return
        }

        try {
            certificate.certificateDateCreated = new Date()
            certificate.type = Type.first()
            certificateService.save(certificate)
        } catch (ValidationException e) {
            respond certificate.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'certificate.label', default: 'Certificate'), certificate.id])
                redirect action: "index" 
            }
            '*' { respond certificate, [status: CREATED] }
        }
    }

    def save2(Certificate certificate) {
        if (certificate == null) {
            notFound()
            return
        }

        try {
            certificate.certificateDateCreated = new Date()
            certificate.certificateAquisitionTecNumber = '-'
            certificate.type = Type.get(2)
            certificateService.save(certificate)
        } catch (ValidationException e) {
            respond certificate.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'certificate.label', default: 'Certificate'), certificate.id])
                redirect action: "index2" 
            }
            '*' { respond certificate, [status: CREATED] }
        }
    }

    def save3(Certificate certificate) {
        if (certificate == null) {
            notFound()
            return
        }

        try {
            certificate.certificateDateCreated = new Date()
            certificate.certificateAquisitionTecNumber = '-'
            certificate.type = Type.get(3)
            certificateService.save(certificate)
        } catch (ValidationException e) {
            respond certificate.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'certificate.label', default: 'Certificate'), certificate.id])
                redirect action: "index3" 
            }
            '*' { respond certificate, [status: CREATED] }
        }
    }

    def search = {
        render(view:'search')
    }

    def searchResults4 = {
        params.max = params.max ?: 10
        def entryCriteria = Certificate.createCriteria().list(params) {
            and {
                company {
                    ilike("companyName", "%${params.company}%")
                }
                type {
                    ilike("typeName", "%${params.type}%")
                }

                def fromdate = Date.parse('yyyy-MM-dd', params.from)
                def fromto = Date.parse('yyyy-MM-dd', params.to)

                between("certificateDateReleased", fromdate , fromto)
            }
        }
        def count = entryCriteria.totalCount
        render(view:'search', model:[ 'results':entryCriteria, 'resultCount' : count])
    }



    def search2 = {
        render(view:'search2')
    }

    def searchResults5 = {
        params.max = params.max ?: 10
        def entryCriteria = Certificate.createCriteria().list(params) {
            or {
                company {
                    ilike("companyName", "%${params.search}%")
                }
                
                    ilike("certificateDescription", "%${params.search}%")
                    ilike("certificateCurrencyForeign", "%${params.search}%") 
                    ilike("certificateTecNumber", "%${params.search}%") 
            }
            and {
                type {
                    ilike("typeName", "%${params.type}%")
                }
            }
        }
        def count = entryCriteria.totalCount
        render(view:'search2', model:[ 'results': entryCriteria, 'resultCount' : count])
    }

    def edit(Long id) {
        respond certificateService.get(id)
    }

    def update(Certificate certificate) {
        if (certificate == null) {
            notFound()
            return
        }

        try {
            certificateService.save(certificate)
        } catch (ValidationException e) {
            respond certificate.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'certificate.label', default: 'Certificate'), certificate.id])
                redirect action: "index" 
            }
            '*'{ respond certificate, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        certificateService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'certificate.label', default: 'Certificate'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'certificate.label', default: 'Certificate'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
