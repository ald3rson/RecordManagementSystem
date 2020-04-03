<%@ page import="doe.gov.ph.Role" %>
<%@ page import="doe.gov.ph.UserRole" %>



<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'remarks.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:javascript src="jquery-3.2.1.min.js"/>
        <asset:javascript src="semantic.min.js"/>
        <asset:stylesheet src="semantic.min.css"/>
    </head>
    <body>
        <div class="ui container">
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="ui secondary pointing menu">
              <a class="item active"><h3>Edit User</h3></a>
            </div>
                <g:form resource="${this.user}" method="PUT">
                    <div class="ui form">
                 <div class="field">
                        <input type="text" placeholder="User Name" name="username" value="${user.username}">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="First Name" name="firstName" value="${user.firstName}">
                      </div>
                      <div class="field">
                        <input type="text" placeholder="Last Name" name="lastName" value="${user.lastName}">

                      </div>
                      <div class="field">
                        <input type="text" placeholder="Division Name" name="divisionName" value="${user.divisionName}">
                      </div>
                      <div class="field">
                        <input type="password" placeholder="Password" name="password" value="${user.password}">
                      </div>
                      <div class="form-group">
                            <select class="ui fluid search dropdown" id="userRole" name="userRole">
                              <option>Select Role ...</option>
                              <g:each in="${Role.list()}">
                                  <option value="${it.id}">${it.authority}</option>
                              </g:each>
                            </select>
                      </div>
                      <div class="ui toggle checkbox">
                        <input type="checkbox" placeholder="Account Locked" name="accountLocked" value="${user.accountLocked}">
                        <label>Account Locked</label>
                      </div>
                      <div class="ui toggle checkbox">
                        <input type="checkbox" placeholder="Password Expired" name="passwordExpired" value="${user.passwordExpired}">
                        <label>Password Expired</label>
                      </div>
                      <div class="ui toggle checkbox">
                        <input type="checkbox" placeholder="Account Expired" name="accountExpired" value="${user.accountExpired}">
                        <label>Account Expired</label>
                      </div>
                    <fieldset class="buttons">
                        <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </fieldset>
                </g:form>
        </div>
    </div>
    </body>
</html>
