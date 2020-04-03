<%@ page import="doe.gov.ph.Company" %>
<%@ page import="doe.gov.ph.Purpose" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'certificate.label', default: 'Certificate')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
              <a class="item active"><h3>DFC Certificate List</h3></a>
              <div class="right menu">
                <a class="ui item"><button onclick="myFunction()" class="positive ui button">Create</button></a>
              </div>
            </div>

            <form class="ui form" action="${createLink(controller:'certificate', action: 'searchResults3')}" method="post">
              <div class="ui fluid action input">
                <input type="text" placeholder="Search..." name="search" id="search" value="${params.search}">
                <button class="ui button"  type="submit" name="submit" value="Search"><i class="search icon"></i></button>
              </div>
            </form>

                <g:if test="${flash.message}">
                    <div class="ui mini message" role="status" id="flash">${flash.message}</div>
                </g:if>
                <table class='ui celled red table'>
                  <tr>
                    <th>ID</th>
                    <th>COMPANY</th>
                    <th>NATURE</th>
                    <th>TEC #</th>
                    <th>DESCRIPTION</th>
                    <th>FOREIGN CUR</th>
                    <th>DATE CREATED</th>
                    <th>ACTION</th>
                  </tr>
                  <tbody>
                  <g:each in="${results}" var="tec">
                    <tr>
                      <td><center><div style='width: 40px;word-wrap:break-word;'>${tec.id}</div></center></td>
                      <td><div style='width: 200px;white-space:nowrap;overflow: hidden;text-overflow: ellipsis'>${tec.company}</div></td>
                      <td><center><div style='width: 40px;word-wrap:break-word;'>${tec.type}</div></center></td>
                      <td><center><div style='width: 40px;white-space:nowrap;overflow: hidden;text-overflow: ellipsis'>${tec.certificateTecNumber}</div></center></td>
                      <td><div style='width: 300px;white-space:nowrap;overflow: hidden;text-overflow: ellipsis'>${tec.certificateDescription}</div></td>
                      <td><div style='width: 100px;text-align:right;white-space:nowrap;overflow: hidden;text-overflow: ellipsis'>${tec.certificateCurrencyForeign}</div></td>
                      <td><center><div style='width: 80px;white-space:nowrap;overflow: hidden;text-overflow: ellipsis'>${tec.certificateDateCreated}</div></center></td>
                      <td><center><g:link action="show" id="${tec.id}"><i class="big orange write square icon"></i></g:link></center></td>

                    </tr>
                  </g:each>
                </tbody>
                  <tfoot><tr><th colspan="8">
                    <div class="ui right floated pagination menu">
                         <g:paginate total="${resultCount ?: 0}" params="${params}"/>
                    </div>
                  </th></tr></tfoot>
                </table>


%{-- MODAL of COE CREATE CERTIFICATE --}%
        <div id="myModal" class="ui small modal">
              <i class="close icon"></i>
              <div class="header">Create DFC Certificate</div>
            <div class="ui form">
            <form action="${createLink(controller:'certificate', action: 'save3')}" method="post" >
                <fieldset class="form">
                    <f:with bean="certificate">
                      <div class="form-group">
                            <select class="ui fluid search dropdown" id="purpose" name="purpose">
                              <option>Select Nature of Application ...</option>
                              <g:each in="${Purpose.list()}">
                                  <option value="${it.id}">${it.purposeDescription}</option>
                              </g:each>
                            </select>
                      </div>
                      <div class="field">
                        <input type="text" placeholder="TEC Number" name="certificateTecNumber">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Aquisition TEC Number" name="certificateAquisitionTecNumber">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="TEC Date" name="certificateTecDateIssued" class="flatpickrtime">

                      </div>
                      <div class="field">
                        <input type="text" placeholder="Date Released" name="certificateDateReleased" class="flatpickrtime">
                      </div>
                      <div class="field">
                         <textarea row="2" id="certificateDescription" name="certificateDescription" placeholder="Description"></textarea>
                      </div>
                      <div class="form-group">
                            <select class="ui fluid search dropdown" id="company" name="company">
                              <option>Select Company ...</option>
                              <g:each in="${Company.list()}">
                                  <option value="${it.id}">${it.companyName}</option>
                              </g:each>
                            </select>
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Foreign Currency.." name="certificateCurrencyForeign">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Duty" name="certificateDuty">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Tax" name="certificateTax">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Total" name="certificateCurrencyPeso">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="OR Number" name="certificateOrNumber">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Place" name="certificatePlace">
                      </div>
                    </f:with>
                      <div>
                        <button class="ui primary button" type="submit" name="create" class="save2" value="Create" id="create2" >Save</button>
                      </div>
                </fieldset>
            </form>
          </div>
        </div>
            
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

          $('#flash').hide().delay(800).fadeIn(800).delay(4000).fadeOut(800);

      </script>
    </body>
</html>