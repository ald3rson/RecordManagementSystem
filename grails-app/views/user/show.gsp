<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.2.1.min.js"/>
    </head>
    <body>
        <div class="ui container">
        <a href="#list-delivery" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="ui secondary pointing menu">
              <a class="item active"><h3>Show User</h3></a>
            </div>
            <table class='ui celled red table'>
                <tbody>
                  <tr>
                    <th>Labels</th>
                    <th>Values</th>
                  </tr>
                  <tr>
                    <td>Name</td>
                    <td>${user.username}</td>
                  </tr>
                  <tr>
                    <td>First Name</td>
                    <td>${user.firstName}</td>
                  </tr>
                  <tr>
                    <td>Last Name</td>
                    <td>${user.lastName}</td>
                  </tr>
                 <tr>
                    <td>Division Name</td>
                    <td>${user.divisionName}</td>
                  </tr>
                                    <tr>
                    <td>Account Locked</td>
                    <td>${user.accountLocked}</td>
                  </tr>
                  <tr>
                    <td>Password Expired</td>
                    <td>${user.passwordExpired}</td>
                  </tr>
                  <tr>
                    <td>Account Expired</td>
                    <td>${user.accountExpired}</td>
                  </tr>
                </tbody>
            </table>
            <sec:ifAnyGranted roles="ROLE_SUPER">
            <g:form resource="${this.user}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
            </sec:ifAnyGranted>
        </div>
        </div>
    </body>
</html>
