
function confirm(state, amountInCard) {

/*-------------------declare variables-------------------*/

  var noEnoughMoneyElement = document.getElementById('notEnoughIcon'),
      confirmButtonElement = document.getElementById('confirmButton'),
      element  = document.getElementById('confirm'),
      element1 = document.getElementById('myForm'),
      elementCardSerial = document.getElementById('cardSerialId').value,
      elementSerial1Part = document.getElementById('serial1Part'),
      elementSerial2Part = document.getElementById('serial2Part'),
      elementSerial3Part = document.getElementById('serial3Part'),
      elementSerial4Part = document.getElementById('serial4Part'),
      moneyInCard = document.getElementById('moneyInCard'),
      paidMoney = document.getElementById('paidMoney'),
      amount = document.getElementById('enteredMoneyAmount').value,
      cardElement = document.getElementById('card');


  moneyInCard.innerHTML = "Card balance: " + amountInCard;
  paidMoney.innerHTML = "Payment amount: " + amount;
  cardElement.style.right = "0px";
  noEnoughMoneyElement.style.display = "none";
  confirmButtonElement.style.display = "block";

/*-------------------set default values-------------------*/

  if(state == '1'){
    element1.style.opacity = "0.2";
    element1.style.transition = "opacity 1s";
    element.style.display = "block";
    setCardSerial();
  }
  else {
    element1.style.opacity = "1";
    element.style.display = "none";
  }

  function setCardSerial() {
    elementSerial1Part.innerHTML = elementCardSerial.substring(0,4);
    elementSerial2Part.innerHTML = elementCardSerial.substring(4,8);
    elementSerial3Part.innerHTML = elementCardSerial.substring(8,12);
    elementSerial4Part.innerHTML = elementCardSerial.substring(12,16);
  }

  if ((amountInCard - amount) < 0) {
    noEnoughMoneyElement.style.display = "block";
    confirmButtonElement.style.display = "none";
  }
}

function Iconfirm(amountInCard) {
  var element = document.getElementById('card'),
      amount = document.getElementById('enteredMoneyAmount').value,
      totalCardAmount = amountInCard,
      fromRight = 0;
  if ((totalCardAmount - amount) >= 0) {
    var val = setInterval(goingIntoTerminal, 8);
    get_data_from_servlet('payment');

  }

  function goingIntoTerminal() {
    element.style.right = fromRight + "px";
    fromRight+= 1;
    if (fromRight > 270) {
      window.clearInterval(val);
      document.getElementById('messageInTerminal').innerHTML = 'success';
    }
  }
}

function check_length_of_number(val) {
    if (val.length > 25) {
      inputElement.value = inputElement.value.substring(0,val.length-1);
    }
}

function get_data_from_servlet(query) {

    if (query == 'get_proper_card') {
        var operation_type = document.getElementsByName("utilityOperation")[0].value,
            serial = document.getElementsByName("utilitySerial")[0].value,
            c_serial = document.getElementsByName("cardSerial")[0].value,
            password = document.getElementsByName("cardPassword")[0].value,
            amount = document.getElementsByName("amount")[0].value;
        confirm('1', 100000);
        //call_my_ajax(query, operation_type, serial, c_serial, password, amount);
    }
    else if (query == 'get_services') {
            //var services = call_my_ajax(query, null, null, null, null, null);
        }
    else if (query == 'payment') {
        var operation_type = document.getElementsByName("utilityOperation")[0].value,
            serial = document.getElementsByName("utilitySerial")[0].value,
            c_serial = document.getElementsByName("cardSerial")[0].value,
            password = document.getElementsByName("cardPassword")[0].value,
            amount = document.getElementsByName("amount")[0].value;

        //call_my_ajax(query, operation_type, serial, c_serial, password, amount);
    }
    }


function get_response(url, resp) {
    var set = resp.split('&');

    if (url == 'get_services') {
        var elem = document.getElementsByName("utilityOperation")[0];

        for (var i = 0; i < set.length - 1; i++) {
            var options = document.createElement('option');
            options.value = set[i];
            options.innerHTML = set[i];
            elem.appendChild(options);
        }
    }
    else if(url == 'get_proper_card'){
        confirm('1', set[3]);
    }
}

function call_my_ajax(url, operation_type, u_serial, c_serial, c_password, amount){
    var date = new Date();
    var today = date.toLocaleDateString().split('.'),
        myToday = today[2] + "-" + today[1] + "-" + today[0];

    $.ajax({
           type: "POST",
           url: url,
           data: {
               submitButton: url,
               operation_type: operation_type,
               utility_serial: u_serial,
               card_serial: c_serial,
               card_password: c_password,
               amount: amount,
               date: myToday,
               time: date.toLocaleTimeString()
           },
           success: function(response) {
               get_response(url, response);
            }
       });
}

/*----------------<<< ajax request >>>----------------*/

