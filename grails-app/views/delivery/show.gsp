<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'delivery.label', default: 'Delivery')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.2.1.min.js"/>
    </head>
    <body>
        <div class="ui container">
        <a href="#list-delivery" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="ui secondary pointing menu">
              <a class="item active"><h3>Show Delivery</h3></a>
            </div>
                <table class='ui celled red table'>
                <tbody>

                  <tr>
                    <th>Labels</th>
                    <th>Values</th>
                  </tr>
                  <tr>
                    <td>Control Number</td>
                    <td>${delivery.control}</td>
                  </tr>
                  <tr>
                    <td>Receiver</td>
                    <td>${delivery.receiver}</td>
                  </tr>
                 <tr>
                    <td>Company</td>
                    <td>${delivery.company}</td>
                  </tr>
                  <tr>
                    <td>Bureau</td>
                    <td>${delivery.bureau}</td>
                  </tr>
                  <tr>
                    <td>City</td>
                    <td>${delivery.city}</td>
                  </tr>
                  <tr>
                    <td>Date Received</td>
                    <td>${delivery.date}</td>
                  </tr>
                  <tr>
                    <td>Time Received</td>
                    <td>${delivery.time}</td>
                  </tr>
                  <tr>
                    <td>Date Released</td>
                    <td>${delivery.released}</td>
                  </tr>
                  <tr>
                    <td>Remarks</td>
                    <td>${delivery.remarks}</td>
                  </tr>
      
                </tbody>
            </table>
            <g:form resource="${this.delivery}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.delivery}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
        </div>
    </body>
</html>