<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
        <asset:javascript src="jquery-3.2.1.min.js"/>
        <asset:javascript src="semantic.min.js"/>
        <asset:stylesheet src="semantic.min.css"/>

    <g:layoutHead/>
</head>
<body>

    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="ui fluid container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${createLink(action: 'index')}">
                    <i class="fa doe-icon">
                        <asset:image src="doe1.png"/>
                    </i>
                </a>
            </div>

            <div class="navbar-collapse collapse" aria-expanded="false" style="...">

                <ul class="nav navbar-nav navbar-right">
                    <sec:ifAnyGranted roles="ROLE_SUPER">

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hello <sec:username /><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <g:link controller="user" action="show" id="${sec.loggedInUserInfo(field: 'id')}">Profile</g:link>
                               <g:link controller='logout'>Logout</g:link>
                            </ul>
                        </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <g:link controller="user" action="index">User</g:link>
                    </li>
                </ul>  
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <g:link action="index">Home</g:link>
                    </li>
                    </sec:ifAnyGranted>
                </ul>                
                <ul class="nav navbar-nav navbar-right">
                    <sec:ifAnyGranted roles="ROLE_USER">

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hello <sec:username /><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <g:link controller="user" action="show" id="${sec.loggedInUserInfo(field: 'id')}">Profile</g:link>
                               <g:link controller='logout'>Logout</g:link>
                            </ul>
                        </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <g:link controller="delivery" action="report">Report<span class="caret"></span></g:link>
                    </li>
                </ul>                 
                <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Library<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <g:link controller="delivery" action="index">Delivery</g:link>
                                <g:link controller="city" action="index">City</g:link>
                                <g:link controller="bureau" action="index">Bureau</g:link>
                                <g:link controller="remarks" action="index">Remarks</g:link>
                            </ul>
                        </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="${createLink(action: 'index')}" class="dropdown-toggle" aria-expanded="false">Home</span></a>
                    </li>
                    </sec:ifAnyGranted>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <sec:ifAnyGranted roles="ROLE_ADMIN">

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hello <sec:username /><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <g:link controller="user" action="show" id="${sec.loggedInUserInfo(field: 'id')}">Profile</g:link>
                               <g:link controller='logout'>Logout</g:link>
                            </ul>
                        </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Library<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <g:link controller="company" action="index">Company</g:link>
                                <g:link controller="purpose" action="index">Purpose</g:link>
                                <g:link controller="type" action="index">Type</g:link>
                            </ul>
                        </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Reports<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <g:link controller="certificate" action="search">Company</g:link>
                                <g:link controller="certificate" action="search2">Description</g:link>
                            </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Certificate<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <g:link controller="certificate" action="index">TEC List</g:link>
                                <g:link controller="certificate" action="index2">COE List</g:link>
                                <g:link controller="certificate" action="index3">DFC List</g:link>
                            </ul>
                        </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <g:link action="index">Home</g:link>
                    </li>
                    </sec:ifAnyGranted>
                </ul>
            </div>
        </div>
    </div>

    <g:layoutBody/>
</div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>
</body>
</html>
