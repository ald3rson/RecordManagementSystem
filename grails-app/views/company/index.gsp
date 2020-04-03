<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.2.1.min.js"/>
        <asset:javascript src="semantic.min.js"/>
        <asset:stylesheet src="semantic.min.css"/>
    </head>
    <body>
        <div class="ui container">
        <a href="#list-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="ui secondary pointing menu">
              <a class="item active"><h3>Company List</h3></a>
              <div class="right menu">
                <a class="ui item"><button onclick="myFunction()" class="positive ui button">Create</button></a>
              </div>
            </div>

            <form class="ui form" action="${createLink(controller:'company', action: 'searchResults')}" method="post">
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
                    <th>NAME</th>
                    <th>ADDRESS</th>
                    <th>NUMBER</th>
                    <th>ACTION</th>
                  </tr>
                  <tbody>
                  <g:each in="${companyList}" var="tec">
                    <tr>
                      <td><center><div style='width: 50px;word-wrap:break-word;'>${tec.id}</div></center></td>
                      <td><div style='width: 300px;word-wrap:break-word;'>${tec.companyName}</div></td>
                      <td><div style='width: 300px;word-wrap:break-word;'>${tec.companyAddress}</div></td>
                      <td><div style='width: 300px;word-wrap:break-word;'>${tec.companyNumber}</div></td>
                      <td><center><g:link action="show" id="${tec.id}"><i class="big orange write square icon"></i></g:link></center></td>

                    </tr>
                  </g:each>
                </tbody>
                  <tfoot><tr><th colspan="8">
                    <div class="ui right floated pagination menu">
                         <g:paginate total="${companyCount ?: 0}" params="${params}"/>
                    </div>
                  </th></tr></tfoot>
                </table>
    
%{-- CREATE MODAL FOR COMPANY --}%

            <div id="myModal" class="ui small modal">
                <i class="close icon"></i>
                <div class="header">Create Company</div>
                <div class="ui form">
                      <form action="${createLink(controller:'company', action: 'save')}" method="post">
                        <fieldset class="form">
                            <f:with bean="company">
                              <div class="field">
                                <input type="text" placeholder="Company Name" name="companyName">
                              </div>
                              <div class="field">
                                <input type="text" placeholder="Company Address" name="companyAddress">
                              </div>
                              <div class="field">
                                <input type="text" placeholder="Company Number" name="companyNumber" >
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
<script>

  function myFunction() {
    $('.ui.small.modal').modal('show');
  }
  $('#flash').hide().delay(800).fadeIn(800).delay(4000).fadeOut(800);

</script>
</body>
</html>