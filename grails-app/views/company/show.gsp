<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.2.1.min.js"/>
    </head>
    <body>
        <div class="ui container">
        <a href="#list-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="ui secondary pointing menu">
              <a class="item active"><h3>Show Company</h3></a>
            </div>

            <table class='ui celled red table'>
                <tbody>
                  <tr>
                    <th>Labels</th>
                    <th>Values</th>
                  </tr>
                  <tr>
                    <td>Name</td>
                    <td>${company.companyName}</td>
                  </tr>
                  <tr>
                    <td>Date Created</td>
                    <td>${company.companyDateCreated}</td>
                  </tr>
                  <tr>
                    <td>Address</td>
                    <td>${company.companyAddress}</td>
                  </tr>
                 <tr>
                    <td>Number</td>
                    <td>${company.companyNumber}</td>
                  </tr>
                </tbody>
            </table>
            <g:form resource="${this.company}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.company}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
        </div>
    </body>
</html>
