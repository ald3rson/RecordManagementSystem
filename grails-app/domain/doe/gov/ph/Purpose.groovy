package doe.gov.ph

class Purpose {

	String purposeDescription
	Date purposeDateCreated

    static constraints = {
    	purposeDescription blank: false
		purposeDateCreated blank: false
    }
        
    @Override
    String toString() {
        return purposeDescription
    }
}
