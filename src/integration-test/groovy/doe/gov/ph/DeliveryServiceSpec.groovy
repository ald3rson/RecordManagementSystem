package doe.gov.ph

import grails.test.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class DeliveryServiceSpec extends Specification {

    DeliveryService deliveryService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Delivery(...).save(flush: true, failOnError: true)
        //new Delivery(...).save(flush: true, failOnError: true)
        //Delivery delivery = new Delivery(...).save(flush: true, failOnError: true)
        //new Delivery(...).save(flush: true, failOnError: true)
        //new Delivery(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //delivery.id
    }

    void "test get"() {
        setupData()

        expect:
        deliveryService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Delivery> deliveryList = deliveryService.list(max: 2, offset: 2)

        then:
        deliveryList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        deliveryService.count() == 5
    }

    void "test delete"() {
        Long deliveryId = setupData()

        expect:
        deliveryService.count() == 5

        when:
        deliveryService.delete(deliveryId)
        sessionFactory.currentSession.flush()

        then:
        deliveryService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Delivery delivery = new Delivery()
        deliveryService.save(delivery)

        then:
        delivery.id != null
    }
}
