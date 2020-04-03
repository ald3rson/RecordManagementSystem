package doe.gov.ph

import grails.gorm.services.Service

@Service(Remarks)
interface RemarksService {

    Remarks get(Serializable id)

    List<Remarks> list(Map args)

    Long count()

    void delete(Serializable id)

    Remarks save(Remarks remarks)

}