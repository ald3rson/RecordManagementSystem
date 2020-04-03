<%@ page import="doe.gov.ph.City" %>
<%@ page import="doe.gov.ph.Remarks" %>
<%@ page import="doe.gov.ph.Bureau" %>
<%@ page import="doe.gov.ph.Delivery" %>
<% number = Delivery.last().control %>
<% String texter2 = number[-4..-1] %>
<% String texter1 = number[0..-5] %>
<%  texter3 = texter2 as int %>
<% texter4 = ++texter3 %>
<% texter5 = String.format("%04d", texter4) %>
<% texter6 = String.format("%04d", texter4) %>
<% texter7 = texter1 + texter6 %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'delivery.label', default: 'Delivery')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
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
              <a class="item active"><h3>Delivery List</h3></a>
              <div class="right menu">
                <a class="ui item"><button onclick="myFunction()" class="positive ui button">Create</button></a>
              </div>
            </div>

            <form class="ui form" action="${createLink(controller:'delivery', action: 'searchResults')}" method="post">
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
                    <th>RECEIVER</th>
                    <th>COMPANY</th>
                    <th>BUREAU</th>
                    <th>DATE</th>
                    <th>REMARKS</th>
                    <th>ACTION</th>
                  </tr>
                  <tbody>
                  <g:each in="${results}" var="tec">
                    <tr>
                      <td><center><div style='width: 80px;word-wrap:break-word;'>${tec.control}</div></center></td>
                      <td><div style='width: 200px;word-wrap:break-word;'>${tec.receiver}</div></td>
                      <td><div style='width: 350px;word-wrap:break-word;'>${tec.company}</div></td>
                      <td><center>${tec.bureau}</center></td>
                      <td><center><div style='width: 70px;word-wrap:break-word;'>${tec.date}</div></center></td>
                      <td><center>${tec.remarks}</center></td>
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

%{-- MODAL of COE CREATE DELIVERY --}%
        <div id="myModal" class="ui small modal">
              <i class="close icon"></i>
              <div class="header">Create Delivery</div>
            <div class="ui form">
            <form action="${createLink(controller:'delivery', action: 'save')}" method="post" >
                <fieldset class="form">
                    <f:with bean="delivery">
                      <div class="field">
                
                        <input type="text" placeholder="Control Number" name="control" value="<%= texter7 %>">
                
                      </div>
                      <div class="form-group">
                            <select class="ui fluid search dropdown" id="bureau" name="bureau">
                              <option>Select Bureau...</option>
                              <g:each in="${Bureau.list()}">
                                  <option value="${it.bureauName}">${it.bureauName}</option>
                              </g:each>
                            </select>
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Receiver" name="receiver">
                      </div>
                      <div class="form-group">
                            <select class="ui fluid search dropdown" id="city" name="city">
                              <option>Select City ...</option>
                              <g:each in="${City.list()}">
                                  <option value="${it.cityName}">${it.cityName}</option>
                              </g:each>
                            </select>
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Company" name="company">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Date Received" name="date" class="flatpickrtime">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Time Received" name="time" id="time">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Date Released" name="released" class="flatpickrtime">
                      </div>
                      <div class="form-group">
                            <select class="ui fluid search dropdown" id="remarks" name="remarks">
                              <option value="">Select Remarks ...</option>
                              <g:each in="${Remarks.list()}">
                                  <option value="${it.remarksName}">${it.remarksName}</option>
                              </g:each>
                            </select>
                      </div>
                    </f:with>
                      <div>
                        <button class="ui primary button" type="submit" name="create" class="save" value="Create" id="create" >Save</button>
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
          dateFormat: "m/d/Y",
          defaultHour: 12,
          defaultMinute: 0
          });

        $('#flash').hide().delay(800).fadeIn(800).delay(4000).fadeOut(800);

          flatpickr("#time", {
          enableTime: true,
          noCalendar: true, 
          time_24hr: true, 
          dateFormat: "H:i",
          });

      </script>
    </body>
</html>


