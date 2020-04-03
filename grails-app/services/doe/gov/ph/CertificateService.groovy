package doe.gov.ph

import grails.gorm.services.Service

@Service(Certificate)
interface CertificateService {

    Certificate get(Serializable id)

    List<Certificate> list(Map args)

    Long count()

    void delete(Serializable id)

    Certificate save(Certificate certificate)

}