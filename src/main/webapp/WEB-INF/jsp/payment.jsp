<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />
<!DOCTYPE html>
<html>
    <head>
        <title>Payment</title>
        <link rel="stylesheet" type="text/css" href="${cp}/css/payment/paymentStyle.css">
        <script type="text/javascript" src="${cp}/js/payment/payment.js"></script>
        <script type="text/javascript" src="${cp}/js/additional_libraries/jquery.js"></script>
    </head>
    <body onload="get_data_from_servlet('get_services')">
        <div id="myForm">
            <div id="heading">
                <h3>Payment</h3>
            </div>
            <div id="inputForm">
                <div id="inputs">
                    <div id="selection">
                        <div>
                            <h5>Select operation type</h5>
                        </div>
                        <select name="utilityOperation"></select>
                    </div>
                    <div id="serial">
                        <input class="numberField" type="number" name="utilitySerial" placeholder="Enter your utility serial" required="required">
                    </div>
                    <!-- begin of card info inputs -->
                    <div id="cardInfo">
                        <h5>Fill card info</h5>
                        <div id="inputCardInfo">
                            <div class="cardInputs">
                                <input onkeyup="check_length_of_number(value)" class="numberField" id="cardSerialId" type="text" name="cardSerial" placeholder="Enter card serial number" required="required" />
                            </div>
                            <div class="cardInputs">
                                <input class="numberField" type="number" name="cardPassword" placeholder="Enter card password" required="required">
                            </div>
                        </div>
                    </div>
                    <!-- end of card info inputs -->
                    <!-- begin of money inputs -->
                    <div id="moneyInput">
                        <h5>Amount of mount</h5>
                        <div class="moneyAmount">
                            <input class="numberField" id="enteredMoneyAmount" type="number" name="amount" placeholder="Enter money amount you want to pay" required="required">
                        </div>
                    </div>
                    <!-- end of money inputs -->

                    <!-- begin of button ok -->
                    <div id="buttonInput">
                        <img id="submitButton" src="${cp}/images/ok.png" onclick="get_data_from_servlet('get_proper_card')">
                    </div>
                    <!-- end of button ok -->
                </div>
            </div>
        </div>
        <!-- begin of animation div -->
        <div id="confirm" style="display: none;">
            <div id="item">
                <h4>Confirm your payment detail</h4>
            </div>
            <div id="details">
                <div id="myAnimation">
                    <div id="card">
                        <img src="${cp}/images/card.png">
                        <h5 id="serial1Part"></h5>
                        <h5 id="serial2Part"></h5>
                        <h5 id="serial3Part"></h5>
                        <h5 id="serial4Part"></h5>
                    </div>
                    <div id="notEnoughIcon" style="display: none;">
                        <img src="${cp}/images/noEnoughMoney.png">
                    </div>
                    <div id="terminal">
                        <img src="${cp}/images/terminal.png">
                        <div id="messageInTerminal"></div>
                    </div>
                </div>
                <div id="cardBalanceInfo">
                    <h5 id="moneyInCard">Card balance: </h5>
                    <h5 id="paidMoney">Payment amount: </h5>
                </div>
            </div>
            <div id="confirmButtons">
                <input id="confirmButton" type="button" value="Confirm" onclick="Iconfirm(document.getElementById('moneyInCard').innerHTML.substr(14))">
                <input id="backButton" type="button" value="Back" onclick="confirm('2', null)">
            </div>
        </div>
        <!-- end of animation div -->

    </body>
</html>