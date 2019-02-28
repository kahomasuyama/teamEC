<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="./css/yellow.css">
		<title>ログイン画面</title>
		<script>
			function goLoginAction()
			{
				document.getElementById("form").action="LoginAction";
			}
			function goCreateUserAction()
			{
				document.getElementById("form").action="CreateUserAction";
			}
			function goResetPassword()
			{
				document.getElementById("form").action="ResetPasswordAction";
			}
		</script>
	</head>
	<body>

		<jsp:include page="header.jsp"/>

		<h1 class="pageTitle">ログイン画面</h1>

		<s:if test="!loginIdErrorMsgList.isEmpty()">
			<div class="errorMsgBox">
				<s:iterator value="loginIdErrorMsgList"><s:property /><br></s:iterator>
			</div>
		</s:if>
		<s:if test="!passwordErrorMsgList.isEmpty()">
			<div class="errorMsgBox">
				<s:iterator value="passwordErrorMsgList"><s:property /><br></s:iterator>
			</div>
		</s:if>
		<s:if test="!errorMsgList.isEmpty()">
			<div class="errorMsgBox">
				<s:iterator value="errorMsgList"><s:property /><br></s:iterator>
			</div>
		</s:if>
		<s:form id="form" action="LoginAction">
			<table class="inputTable horizonTable">
				<tr>
					<th scope="row"><s:label value="ユーザーID"/></th>
					<s:if test="#session.savedLoginId">
						<td><s:textfield name="loginId" class="txt" placeholder="ユーザーID" value='%{#session.saveLoginId}' autocomplete="off"/></td>
					</s:if>
					<s:else>
						<td><s:textfield name="loginId" class="txt" placeholder="ユーザーID" autocomplete="off"/></td>
					</s:else>
				</tr>
				<tr>
					<th scope="row"><s:label value="パスワード"/></th>
					<td><s:password name="password" class="txt" placeholder="パスワード" autocomplete="off"/></td>
				</tr>
			</table>
			<div class="userIdCheckBox">
				<s:if test="#session.savedLoginId">
					<s:checkbox name="savedLoginId" checked="checked"/>
				</s:if>
				<s:else>
					<s:checkbox name="savedLoginId"/>
				</s:else>
				<s:label value="ユーザーID保存" class="id"/><br>
			</div>
			<div class="button_box">
				<s:submit value="ログイン" class="button" onclick="goLoginAction();"/>
			</div>
		</s:form>

		<div class="button_box">
			<s:form action="CreateUserAction">
				<s:submit value="新規ユーザー登録" class="button"/>
			</s:form>
		</div>
		<div class="button_box">
			<s:form action="ResetPasswordAction">
				<s:submit value="パスワード再設定" class="button"/>
			</s:form>
		</div>

	</body>
</html>
