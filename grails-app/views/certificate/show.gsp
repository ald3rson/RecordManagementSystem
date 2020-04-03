<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'certificate.label', default: 'Certificate')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.2.1.min.js"/>
    </head>
    <body>
        <div class="ui container">
        <a href="#list-certificate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="ui secondary pointing menu">
              <a class="item active"><h3>Show Certificate</h3></a>
            </div>
            <table class='ui celled red table'>
                <tbody>
                  <tr>
                    <th>Labels</th>
                    <th>Values</th>
                  </tr>
                  <tr>
                    <td>Nature</td>
                    <td>${certificate.purpose}</td>
                  </tr>
                 <tr>
                    <td>Company</td>
                    <td>${certificate.company}</td>
                  </tr>
                  <tr>
                    <td>Tec Number</td>
                    <td>${certificate.certificateTecNumber}</td>
                  </tr>
                  <tr>
                    <td>Description</td>
                    <td>${certificate.certificateDescription}</td>
                  </tr>
                    <td>Peso Currency</td>
                    <td>${certificate.certificateCurrencyPeso}</td>
                  </tr>
                  <tr>
                    <td>Foreign Currency</td>
                    <td>${certificate.certificateCurrencyForeign}</td>
                  </tr>
                  <tr>
                    <td>Duty</td>
                    <td>${certificate.certificateDuty}</td>
                  </tr>
                  <tr>
                    <td>Place</td>
                    <td>${certificate.certificatePlace}</td>
                  </tr>
                  <tr>
                    <td>Aquisition Tec Number</td>
                    <td>${certificate.certificateAquisitionTecNumber}</td>
                  </tr>
                      <tr>
                    <td>Tax</td>
                    <td>${certificate.certificateTax}</td>
                  </tr>
                      <tr>
                    <td>OR Number</td>
                    <td>${certificate.certificateOrNumber}</td>
                  </tr>
                  <tr>
                    <td>Type</td>
                    <td>${certificate.type}</td>
                  </tr>
                  <tr>
                    <td>Date Issued</td>
                    <td>${certificate.certificateTecDateIssued}</td>
                  </tr>
                  <tr>
                    <td>Date Released</td>
                    <td>${certificate.certificateDateReleased}</td>
                  </tr>
                  <tr>
                    <td>Date Created</td>
                    <td>${certificate.certificateDateCreated}</td>
                  </tr>
                </tbody>
            </table>
            <g:form resource="${this.certificate}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.certificate}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
        </div>
    </body>
</html>
