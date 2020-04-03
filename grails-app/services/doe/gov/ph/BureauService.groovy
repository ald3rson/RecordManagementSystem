package doe.gov.ph

import grails.gorm.services.Service

@Service(Bureau)
interface BureauService {

    Bureau get(Serializable id)

    List<Bureau> list(Map args)

    Long count()

    void delete(Serializable id)

    Bureau save(Bureau bureau)

}