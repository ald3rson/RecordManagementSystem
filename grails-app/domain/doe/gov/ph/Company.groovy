package doe.gov.ph

class Company {

	String companyName
	String companyAddress
	String companyNumber
	Date companyDateCreated

    // static belongsTo = [ certificate : Certificate ]

    static constraints = {
    	companyName blank: false
    	companyDateCreated blank: false
    }

    @Override
    String toString() {
        return companyName
    }
}
