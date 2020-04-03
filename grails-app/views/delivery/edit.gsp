<%@ page import="doe.gov.ph.City" %>
<%@ page import="doe.gov.ph.Remarks" %>
<%@ page import="doe.gov.ph.Bureau" %>
<%@ page import="doe.gov.ph.Delivery" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'delivery.label', default: 'Delivery')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.2.1.min.js"/>
        <asset:javascript src="semantic.min.js"/>
        <asset:javascript src="flatpickr.js"/>
        <asset:stylesheet src="semantic.min.css"/>
        <asset:stylesheet src="flatpickr.min.css"/>
    </head>
    <body>
        <div class="ui container">
        <a href="#list-delivery" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="ui secondary pointing menu">
              <a class="item active"><h3>Edit Delivery</h3></a>
            </div>

            
           <g:form resource="${this.delivery}" method="PUT">
           <div class="ui form">
                <div class="field">
                        <input type="text" placeholder="Control Number" name="control" value="${delivery.control}">
                </div>
                <div class="field">
                        <input type="text" placeholder="Receiver" name="receiver" value="${delivery.receiver}">
                </div>
                <div class="field">
                        <input type="text" placeholder="Company" name="company" value="${delivery.company}">
                </div>
                <div class="form-group">
                            <select class="ui fluid search dropdown" id="city" name="city" >
                              <option value="${delivery.city}">Select City ...</option>
                              <g:each in="${City.list()}">
                                  <option value="${it.cityName}">${it.cityName}</option>
                              </g:each>
                            </select>
                </div>
                <div class="form-group">
                            <select class="ui fluid search dropdown" id="bureau" name="bureau">
                              <option value="${delivery.bureau}">Select Bureau...</option>
                              <g:each in="${Bureau.list()}">
                                  <option value="${it.bureauName}">${it.bureauName}</option>
                              </g:each>
                            </select>
                      </div>
                <div class="field">
                        <input type="text" placeholder="Date Received" name="date" class="flatpickrtime" value="${delivery.date}">
                      </div>
                <div class="field">
                        <input type="text" placeholder="Time Received" name="time" id="time" value="${delivery.time}">
                      </div>
                <div class="field">
                        <input type="text" placeholder="Date Released" name="released" class="flatpickrtime" value="${delivery.released}">
                </div>
                <div class="form-group">
                            <select class="ui fluid search dropdown" id="remarks" name="remarks" >
                              <option value="${delivery.remarks}">Select Remarks ...</option>
                              <g:each in="${Remarks.list()}">
                                  <option value="${it.remarksName}">${it.remarksName}</option>
                              </g:each>
                            </select>
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
          dateFormat: "m/d/Y",
          defaultHour: 12,
          defaultMinute: 0
          });

          flatpickr("#time", {
          enableTime: true,
          noCalendar: true, 
          time_24hr: true, 
          dateFormat: "H:i",
          });

      </script>
    </body>
</html>
