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

            <div class="ui secondary pointing menu">
              <a class="item active"><h3>Delivery Report</h3></a>
            </div>

            
            <form class="ui form" action="${createLink(controller:'delivery', action: 'searchReport')}" method="post">
              <div class="ui fluid action input">
                <input type="text" placeholder="Type Company..." name="company" id="company" value="${params.company}">
                    <input type="text" placeholder="Type Date From" name="from" id="from" class="from" value="${params.from}">
                    <input type="text" placeholder="Type Date To" name="to" id="to" class="to" value="${params.to}">
                <button class="ui button"  type="submit" name="submit" value="Search"><i class="search icon"></i></button>
              </div>
            </form>
            
                <table class='ui celled red table'>
                  <tr>
                    <th>ID</th>
                    <th>RECEIVER</th>
                    <th>COMPANY</th>
                    <th>BUREAU</th>
                    <th>DATE</th>
                    <th>REMARKS</th>
                  </tr>
                  <tbody>
                  <g:each in="${report}" var="tec">
                    <tr>
                      <td><center><div style='width: 80px;word-wrap:break-word;'>${tec.control}</div></center></td>
                      <td><div style='width: 200px;word-wrap:break-word;'>${tec.receiver}</div></td>
                      <td><div style='width: 350px;word-wrap:break-word;'>${tec.company}</div></td>
                      <td><center>${tec.bureau}</center></td>
                      <td><center><div style='width: 70px;word-wrap:break-word;'>${tec.date}</div></center></td>
                      <td><center>${tec.remarks}</center></td>
                    </tr>
                  </g:each>
                </tbody>
                  <tfoot><tr><th colspan="8">
                    <g:jasperReport jasper="DELIVER" format="PDF" buttonPosition="hide">
                                <input type="hidden" name="PARAM_COMPANY" value="${params.company}" />
                                <input type="hidden" name="PARAM_FROM" value="${params.from}" />
                                <input type="hidden" name="PARAM_TO" value="${params.to}" />
                  </g:jasperReport>
                    <div class="ui right floated pagination menu">
                         <g:paginate controller="Delivery" action="searchResults" total="${reportCount  ?: 0 }" params="${params}"/>
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



