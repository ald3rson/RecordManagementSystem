package doe.gov.ph

class Delivery {

	String control
	String bureau
	String remarks
	String city
	String time
	String receiver
	String company
	String date
	String released

    static mapping = {
    	cache true
    	version false
    }

    static constraints = {
        control unique: true
    	remarks nullable : true
    	date nullable : true
    	released nullable : true
    	bureau nullable : true
    	city nullable : true
    	time nullable : true
    	receiver nullable : true
    	company nullable : true
    }
}