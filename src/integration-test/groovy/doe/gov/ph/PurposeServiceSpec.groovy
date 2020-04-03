package doe.gov.ph

import grails.test.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PurposeServiceSpec extends Specification {

    PurposeService purposeService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Purpose(...).save(flush: true, failOnError: true)
        //new Purpose(...).save(flush: true, failOnError: true)
        //Purpose purpose = new Purpose(...).save(flush: true, failOnError: true)
        //new Purpose(...).save(flush: true, failOnError: true)
        //new Purpose(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //purpose.id
    }

    void "test get"() {
        setupData()

        expect:
        purposeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Purpose> purposeList = purposeService.list(max: 2, offset: 2)

        then:
        purposeList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        purposeService.count() == 5
    }

    void "test delete"() {
        Long purposeId = setupData()

        expect:
        purposeService.count() == 5

        when:
        purposeService.delete(purposeId)
        sessionFactory.currentSession.flush()

        then:
        purposeService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Purpose purpose = new Purpose()
        purposeService.save(purpose)

        then:
        purpose.id != null
    }
}
