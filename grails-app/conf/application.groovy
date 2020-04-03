

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'doe.gov.ph.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'doe.gov.ph.UserRole'
grails.plugin.springsecurity.authority.className = 'doe.gov.ph.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.databinding.dateFormats = ['yyyy-MM-dd']
jasper.dir.reports = 'reports'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/jasper/**',      access: ['ROLE_ADMIN', 'ROLE_USER', 'ROLE_SUPER']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]



// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'doe.gov.ph.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'doe.gov.ph.UserRole'
grails.plugin.springsecurity.authority.className = 'doe.gov.ph.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['ROLE_ADMIN', 'ROLE_USER', 'ROLE_SUPER']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['ROLE_ADMIN', 'ROLE_USER', 'ROLE_SUPER']],
	[pattern: '/index.gsp',      access: ['ROLE_ADMIN', 'ROLE_USER', 'ROLE_SUPER']],
	[pattern: '/jasper/**',      access: ['ROLE_ADMIN', 'ROLE_USER', 'ROLE_SUPER']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

