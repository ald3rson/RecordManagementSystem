package doe.gov.ph


class Certificate {

	Company company
	Purpose purpose
	Type type
	String certificateDescription
	String certificateCurrencyForeign
	String certificateDuty
	String certificateAquisitionTecNumber
	String certificateTax
	String certificateCurrencyPeso
	String certificateOrNumber
	String certificateTecNumber
	Date certificateTecDateIssued
	String certificatePlace
	Date certificateDateReleased
	Date certificateDateCreated

	// static hasMany = [ company : Company ]

    static constraints = {
    	certificateTecDateIssued nullable : true
    	certificateDateReleased nullable : true
    }

    static namedQueries = {
       todaysTec {
          def now = new Date().clearTime()
          type { eq ("typeName", "TEC") }
          between('certificateDateCreated', now, now+1)
       }
       todaysCoe {
          def now = new Date().clearTime()
          type { eq ("typeName", "COE") }
          between('certificateDateCreated', now, now+1)
       }
       todaysDfc {
          def now = new Date().clearTime()
          type { eq ("typeName", "DFC") }
          between('certificateDateCreated', now, now+1)
       }
   }
}
