package doe.gov.ph

import grails.test.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class BureauServiceSpec extends Specification {

    BureauService bureauService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Bureau(...).save(flush: true, failOnError: true)
        //new Bureau(...).save(flush: true, failOnError: true)
        //Bureau bureau = new Bureau(...).save(flush: true, failOnError: true)
        //new Bureau(...).save(flush: true, failOnError: true)
        //new Bureau(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //bureau.id
    }

    void "test get"() {
        setupData()

        expect:
        bureauService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Bureau> bureauList = bureauService.list(max: 2, offset: 2)

        then:
        bureauList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        bureauService.count() == 5
    }

    void "test delete"() {
        Long bureauId = setupData()

        expect:
        bureauService.count() == 5

        when:
        bureauService.delete(bureauId)
        sessionFactory.currentSession.flush()

        then:
        bureauService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Bureau bureau = new Bureau()
        bureauService.save(bureau)

        then:
        bureau.id != null
    }
}
