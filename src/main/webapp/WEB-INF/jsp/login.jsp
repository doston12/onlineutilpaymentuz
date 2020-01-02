<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="${cp}/css/login/loginStyle.css">
    </head>
    <body style="background-image: url('${cp}/images/2background4.jpg')">
        <form method="POST" action="/reports">
            <div id="inputs">
                <div class="IdInput">
                    <img src="${cp}/images/loginIcon.png">
                    <input id="loginInput" type="text" name="login" autofocus placeholder="Login">
                </div>
                <div class="IdInput">
                    <img src="${cp}/images/passwordIcon.png">
                    <input id="passwordInput" type="password" name="password" placeholder="Password">
                </div>
                <div class="IdInputButton">
                    <button id="submitButtonInput" type="submit" name="submitButton">OK</button>
                </div>
            </div>
        </form>
    </body>
</html>