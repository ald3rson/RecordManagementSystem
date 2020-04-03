<%@ page import="doe.gov.ph.Company" %>
<%@ page import="doe.gov.ph.Purpose" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'Certificate.label', default: 'Certificate')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.2.1.min.js"/>
        <asset:javascript src="semantic.min.js"/>
        <asset:javascript src="flatpickr.js"/>
        <asset:stylesheet src="semantic.min.css"/>
        <asset:stylesheet src="flatpickr.min.css"/>
    </head>
    <body>
        <div class="ui container">
        <a href="#list-certificate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="ui secondary pointing menu">
              <a class="item active"><h3>Edit Certificate</h3></a>
            </div>

            
           <g:form resource="${this.certificate}" method="PUT">
           <div class="ui form">
                <div class="form-group">
                            <select class="ui fluid search dropdown" id="purpose" name="purpose">
                              <option value="${certificate.purpose}">Select Nature of Application ...</option>
                              <g:each in="${Purpose.list()}">
                                  <option value="${it.id}">${it.purposeDescription}</option>
                              </g:each>
                            </select>
                      </div>
                      <div class="field">
                        <input type="text" placeholder="TEC Number" name="certificateTecNumber" value="${certificate.certificateTecNumber}">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Aquisition TEC Number" name="certificateAquisitionTecNumber" value="${certificate.certificateAquisitionTecNumber}">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="TEC Date" name="certificateTecDateIssued" class="flatpickrtime" value="${certificate.certificateTecDateIssued}">

                      </div>
                      <div class="field">
                        <input type="text" placeholder="Date Released" name="certificateDateReleased" class="flatpickrtime" value="${certificate.certificateDateReleased}">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Description" name="certificateDescription" value="${certificate.certificateDescription}">
                      </div>
                      <div class="form-group">
                            <select class="ui fluid search dropdown" id="company" name="company">
                              <option value="${certificate.company}">Select Company ...</option>
                              <g:each in="${Company.list()}">
                                  <option value="${it.id}">${it.companyName}</option>
                              </g:each>
                            </select>
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Foreign Currency.." name="certificateCurrencyForeign" value="${certificate.certificateCurrencyForeign}">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Duty" name="certificateDuty" value="${certificate.certificateDuty}">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Tax" name="certificateTax"  value="${certificate.certificateTax}">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Total" name="certificateCurrencyPeso" value="${certificate.certificateCurrencyPeso}">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="OR Number" name="certificateOrNumber" value="${certificate.certificateOrNumber}">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Place" name="certificatePlace" value="${certificate.certificatePlace}">
                      </div>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
                </div>
            </g:form>
        </div>
        </div>
      <script>
        $('.ui.dropdown').dropdown();
        function myFunction() {
          $('.ui.small.modal').modal('show');
        }

  
          flatpickr(".flatpickr", {
            altInput: true,
            altFormat: "F j, Y "
          });

          flatpickr(".flatpickrtime", {
            enableTime: false,
          noCalendar: false,
          enableSeconds: false, 
          time_24hr: false, 
          dateFormat: "Y-m-d",
          defaultHour: 12,
          defaultMinute: 0
          });

      </script>
    </body>
</html>
