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
}
