<%@ page import="doe.gov.ph.Role" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.2.1.min.js"/>
        <asset:javascript src="semantic.min.js"/>
        <asset:javascript src="flatpickr.js"/>
        <asset:stylesheet src="semantic.min.css"/>
        <asset:stylesheet src="flatpickr.min.css"/>
    </head>
    <body>
        <div class="ui container">
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="ui secondary pointing menu">
              <a class="item active"><h3>User List</h3></a>
              <div class="right menu">
                <a class="ui item"><button onclick="myFunction()" class="positive ui button">Create</button></a>
              </div>
            </div>

            <form class="ui form" action="${createLink(controller:'user', action: 'searchResults')}" method="post">
              <div class="ui fluid action input">
                <input type="text" placeholder="Search..." name="search" id="search" value="${params.search}">
                <button class="ui button"  type="submit" name="submit" value="Search"><i class="search icon"></i></button>
              </div>
            </form>

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table class='ui celled red table'>
              <tr>
                <th>ID</th>
                <th>USERNAME</th>
                <th>FIRST NAME</th>
                <th>LAST NAME</th>
                <th>DIVISION</th>
                <th>ENABLED</th>
                <th>ACTION</th>
              </tr>
              <tbody>
              <g:each in="${userList}" var="tec">
                <tr>
                  <td>${tec.id}</td>
                  <td><center><strong>${tec.username}</strong></center></td>
                  <td><center>${tec.firstName}</center></td>
                  <td><center>${tec.lastName}</center></td>
                  <td><center>${tec.divisionName}</center></td>
                  <td><center>${tec.enabled}</center></td>
                  <td><center><g:link action="show" id="${tec.id}"><i class="big orange write square icon"></i></g:link></center></td>

                </tr>
              </g:each>
            </tbody>
              <tfoot><tr><th colspan="8">
                <div class="ui right floated pagination menu">
                     <g:paginate total="${userCount ?: 0}" params="${params}"/>
                </div>
              </th></tr></tfoot>
            </table>

    <div id="myModal" class="ui small modal">
              <i class="close icon"></i>
              <div class="header">Create User</div>
            <div class="ui form">
            <form action="${createLink(controller:'user', action: 'save')}" method="post" >
                <fieldset class="form">
                    <f:with bean="user">
                      <div class="field">
                        <input type="text" placeholder="User Name" name="username">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="First Name" name="firstName">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Last Name" name="lastName">

                      </div>
                      <div class="field">
                        <input type="text" placeholder="Division Name" name="divisionName">
                      </div>
                      <div class="field">
                        <input type="password" placeholder="Password" name="password">
                      </div>
                      <div class="form-group">
                            <select class="ui fluid search dropdown" id="Role" name="Role">
                              <option>Select Role ...</option>
                              <g:each in="${Role.list()}">
                                  <option value="${it.id}">${it.authority}</option>
                              </g:each>
                            </select>
                      </div>
                      <div class="ui toggle checkbox">
                        <input type="checkbox" placeholder="Account Locked" name="accountLocked">
                        <label>Account Locked</label>
                      </div>
                      <div class="ui toggle checkbox">
                        <input type="checkbox" placeholder="Password Expired" name="passwordExpired">
                        <label>Password Expired</label>
                      </div>
                      <div class="ui toggle checkbox">
                        <input type="checkbox" placeholder="Account Expired" name="accountExpired">
                        <label>Account Expired</label>
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
      </script>
    </body>
</html>
