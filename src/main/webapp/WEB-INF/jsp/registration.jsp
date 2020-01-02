<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Registration</title>
        <link rel="stylesheet" type="text/css" href="${cp}/css/registration/registrationStyle.css">
        <script type="text/javascript" src="${cp}/js/registration/registration.js"></script>
        <script type="text/javascript" src="${cp}/js/registration/jquery.js"></script>
    </head>
    <body style="  background-image: url('${cp}/images/2background4.jpg')">
        <div id="form">
            <div id="heading">
                <h3>Registration</h3>
            </div>
            <div id="inputs">
                <div id="fullname">
                    <div id="user">
                        <img id="userShape" src="${cp}/images/male.png">
                        <div id="selectImage">
                            <button type="button" id="buttonUpload" onclick="upload_image()">UPLOAD IMAGE</button>
                            <input type="file" name="picturePath" accept="jpg,png,gif" id="imageFile" onchange="set_image()" style="display: none;">
                        </div>
                    </div>
                    <div id="genders">
                        <div id="m" onclick="selectingGender('male')">
                            <input type="radio" name="gender" value="male" checked><span>Male</span>
                        </div>
                        <div id="f" onclick="selectingGender('female')">
                            <input type="radio" name="gender" value="female"><span>Female</span>
                        </div>
                    </div>
                    <input class="formin" type="text" name="f_name" placeholder="First Name*" required>
                    <input class="formin" type="text" name="l_name" placeholder="Last Name*" required>
                    <input class="formin" type="text" name="m_name" placeholder="Middle Name*" required>
                </div>
                <div id="email">
                    <input class="formin" type="text" name="email" placeholder="Email Address">
                </div>
                <div id="passport">
                    <input class="formin" type="text" name="passport" placeholder="Passport*" required>
                </div>
                <div id="birthdate">
                    <input type="date" name="birthdate" placeholder="Bithdate*" required>
                    <span>Birth Date</span>
                </div>
                <div id="login">
                    <input class="formin" type="text" name="login" placeholder="Login*" required>
                </div>
                <div id="password">
                    <input class="formin" type="text" name="password" placeholder="Password*" required>
                </div>
                <div id="okButton">
                    <a href="/reports">
                        <img src="${cp}/images/ok.png" id="submitButton">
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>