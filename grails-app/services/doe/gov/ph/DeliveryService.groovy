package doe.gov.ph

import grails.gorm.services.Service

@Service(Delivery)
interface DeliveryService {

    Delivery get(Serializable id)

    List<Delivery> list(Map args)

    Long count()

    void delete(Serializable id)

    Delivery save(Delivery delivery)

}