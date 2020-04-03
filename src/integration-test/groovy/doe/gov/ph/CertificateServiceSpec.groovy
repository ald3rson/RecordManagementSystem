package doe.gov.ph

import grails.test.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class CertificateServiceSpec extends Specification {

    CertificateService certificateService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Certificate(...).save(flush: true, failOnError: true)
        //new Certificate(...).save(flush: true, failOnError: true)
        //Certificate certificate = new Certificate(...).save(flush: true, failOnError: true)
        //new Certificate(...).save(flush: true, failOnError: true)
        //new Certificate(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //certificate.id
    }

    void "test get"() {
        setupData()

        expect:
        certificateService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Certificate> certificateList = certificateService.list(max: 2, offset: 2)

        then:
        certificateList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        certificateService.count() == 5
    }

    void "test delete"() {
        Long certificateId = setupData()

        expect:
        certificateService.count() == 5

        when:
        certificateService.delete(certificateId)
        sessionFactory.currentSession.flush()

        then:
        certificateService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Certificate certificate = new Certificate()
        certificateService.save(certificate)

        then:
        certificate.id != null
    }
}
