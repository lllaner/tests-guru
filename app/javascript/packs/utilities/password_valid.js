document.addEventListener('turbolinks:load', function(){
  var control = document.getElementById('user_password_confirmation')

  if(control) { control.addEventListener('click', validatePassword) }
})

function validatePassword() {
  var newPass = document.getElementById('user_password')
  var confirmPass = document.getElementById('user_password_confirmation')

  confirmPass.onkeyup = function () {
    if(confirmPass.value == ""){
      newPass.className = 'bg-light'
      confirmPass.className = 'bg-light'
    } else if(newPass.value == confirmPass.value) {
      newPass.className = 'bg-success'
      confirmPass.className = 'bg-success'
    } else {
      newPass.className = 'bg-danger'
      confirmPass.className = 'bg-danger'
    }
  }
}
