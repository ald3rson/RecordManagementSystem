<%@ page import="doe.gov.ph.Company" %>
<%@ page import="doe.gov.ph.Type" %>
<%@

def fromdate = Date.parse('yyyy-MM-dd', params.par_from)
def fromto = Date.parse('yyyy-MM-dd', params.par_to)

%>

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

            <div class="ui secondary pointing menu">
              <a class="item active"><h3>Search Certificate List</h3></a>
            </div>

            <form class="form" action="${createLink(controller:'certificate', action: 'searchResults4')}" method="post">
        
              <div class="ui  fluid action input">
                <select class="ui fluid search dropdown" id="company" name="company">
                  <option value="${params.company}">Select Company ...</option>
                    <g:each in="${Company.list()}">
                      <option value="${it.companyName}">${it.companyName}</option>
                    </g:each>
                </select>

                <select class="ui  search dropdown" id="type" name="type">
                  <option value="${params.type}">Select Type ...</option>
                    <g:each in="${Type.list()}">
                      <option value="${it.typeName}">${it.typeName}</option>
                    </g:each>
                </select>
                 <div class="ui icon input field">
                    <input type="text" placeholder="FROM" name="from" id="from" class="from" value="${params.from}">
                         <i class="add to calendar icon"></i>
                </div>
                <div class="ui icon input field">
                    <input type="text" placeholder="TO" name="to" id="to" class="to" value="${params.to}">
                         <i class="add to calendar icon"></i>
                </div>
                <button class="ui button"  type="submit" name="submit" value="Search"><i class="search icon"></i></button>
              </div>
            </form>
            
    <table class='ui celled red table'>
              <tr>
                <th>ID</th>
                <th>COMPANY</th>
                <th>NATURE</th>
                <th>TEC NO.</th>
                <th>DESCRIPTION</th>
                <th>FOREIGN CUR.</th>
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
                <g:jasperReport jasper="RMD" format="PDF" buttonPosition="hide">
                                <input type="hidden" name="PARAMETER_COMPANY" value="${params.company}" />
                                <input type="hidden" name="PARAMETER_FROM" value="${params.from}" />
                                <input type="hidden" name="PARAMETER_TO" value="${params.to}" />
                                <input type="hidden" name="PARAMETER_TYPE" value="${params.type}" />
                  </g:jasperReport>
                <div class="ui right floated pagination menu">
                     <g:paginate controller="Certificate" action="searchResults4" total="${resultCount  ?: 0 }" params="${params}"/>
                </div>
              </th></tr></tfoot>
    </table>
</div>


  <script>
        $('.ui.dropdown').dropdown();
        function myFunction() {
          $('.ui.small.modal').modal('show');
        }

          flatpickr(".from", {
          enableTime: false,
          noCalendar: false,
          enableSeconds: false, 
          time_24hr: false, 
          dateFormat: "Y-m-d",
          });

          flatpickr(".to", {
          enableTime: false,
          noCalendar: false,
          enableSeconds: false, 
          time_24hr: false, 
          dateFormat: "Y-m-d",
          });

      </script>
</body>
</html>



