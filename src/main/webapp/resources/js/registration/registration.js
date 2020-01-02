function selectingGender(gender) {
  var element = document.getElementById("userShape"),
      path = "";

  path = gender == 'male' ? '../resources/images/male.png' : '../resources/images/female.png';
  element.src = path;
}

function checkInputs() {

}

function upload_image() {
  var element = document.getElementById('imageFile');
  element.click();
}

function set_image() {
  var input = document.getElementById('imageFile'),
      fReader  = new FileReader();

  fReader.readAsDataURL(input.files[0]);
  fReader.onloadend = function(event){
    var userPic = document.getElementById('userShape').src = event.target.result;
  }
}

function call_ajax() {
    $.ajax({
        type: "POST",
        url: "user_registration",
        data: {
            submitButton : "registration",
            gender : document.getElementsByName('gender')[0].value,
            f_name : document.getElementsByName('f_name')[0].value,
            l_name : document.getElementsByName('l_name')[0].value,
            m_name : document.getElementsByName('m_name')[0].value,
            email : document.getElementsByName('email')[0].value,
            passport: document.getElementsByName('passport')[0].value,
            birthdate : document.getElementsByName('birthdate')[0].value,
            login : document.getElementsByName('login')[0].value,
            password : document.getElementsByName('password')[0].value
        },
        success: function (resp) {
            console.log(resp);
        }
    });
}