package doe.gov.ph

import doe.gov.ph.User
import doe.gov.ph.Role
import doe.gov.ph.UserRole

class BootStrap {

    def init = { servletContext ->

  //   	def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		// def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
  //   def superAdminRole = new Role(authority: 'ROLE_SUPER').save(flush: true)
  //   	def testUser = new User(username: 'alderson', password: 'hehehe', firstName: 'Alderson', lastName: 'Napolitano', divisionName: 'ITD').save(flush: true)
  //   	def testUser2 = new User(username: 'rmd', password: 'password', firstName: 'Alderson', lastName: 'Napolitano', divisionName: 'RMD').save(flush: true)
  //     def testUser3 = new User(username: 'rmd2', password: 'passwordrmd2', firstName: 'Alderson', lastName: 'Napolitano', divisionName: 'RMD').save(flush: true)
  //      def testUser4 = new User(username: 'sonny', password: 'hehehe123', firstName: 'Alderson', lastName: 'Napolitano', divisionName: 'ITD').save(flush: true)

		// UserRole.create testUser, adminRole, true
		// UserRole.create testUser2, adminRole, true
  //   UserRole.create testUser3, userRole, true
  //   UserRole.create testUser4, superAdminRole, true

    }
    def destroy = {
    }
}




