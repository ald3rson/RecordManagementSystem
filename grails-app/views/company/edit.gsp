<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.2.1.min.js"/>
    </head>
    <body>
        <div class="ui container">
        <a href="#list-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="ui secondary pointing menu">
              <a class="item active"><h3>Edit Company</h3></a>
            </div>
            <g:form resource="${this.company}" method="PUT">
                <div class="ui form">
                <div class="field">
                        <input type="text" placeholder="Company Name" name="companyName" value="${company.companyName}">
                </div>
                <div class="field">
                        <input type="text" placeholder="Company Address" name="companyAddress" value="${company.companyAddress}">
                </div>
                <div class="field">
                        <input type="text" placeholder="Company Number" name="companyNumber" value="${company.companyNumber}">
                </div>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
        </div>
    </body>
</html>
