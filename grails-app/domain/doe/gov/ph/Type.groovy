package doe.gov.ph

class Type {

	String typeName
	Date typeDateCreated

    static constraints = {
    	typeName blank: false
		typeDateCreated blank: false
    }

    @Override
    String toString() {
        return typeName
    }
}
