<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bureau.label', default: 'Bureau')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.2.1.min.js"/>
        <asset:javascript src="semantic.min.js"/>
        <asset:stylesheet src="semantic.min.css"/>
    </head>
    <body>
        <div class="ui container">
        <a href="#list-bureau" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="ui secondary pointing menu">
              <a class="item active"><h3>Edit Bureau</h3></a>
            </div>
            <g:form resource="${this.bureau}" method="PUT">
                <div class="ui form">
                <div class="field">
                        <input type="text" placeholder="Bureau Name" name="bureauName" value="${bureau.bureauName}">
                </div>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
                </div>
            </g:form>
        </div>
        </div>
    </body>
</html>