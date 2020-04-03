package doe.gov.ph

import grails.gorm.services.Service

@Service(Purpose)
interface PurposeService {

    Purpose get(Serializable id)

    List<Purpose> list(Map args)

    Long count()

    void delete(Serializable id)

    Purpose save(Purpose purpose)

}