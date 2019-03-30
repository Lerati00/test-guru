
document.addEventListener('turbolinks:load', function() {
    var passwordConfirmationSelect = document.querySelector('#user_password_confirmation');

    if (passwordConfirmationSelect) { 
        passwordConfirmationSelect.addEventListener('input', matchPasswordConfirmation) 
    } else {
    }
});

function matchPasswordConfirmation () {
    passwordConfirmation = document.getElementById('user_password_confirmation')
    password = document.getElementById('user_password')

    if (!passwordConfirmation.value){
        passwordConfirmation.classList.remove('match-not')
        passwordConfirmation.classList.remove('match-up')
    } else if (passwordConfirmation.value != password.value) {
        passwordConfirmation.classList.remove('match-up')
        passwordConfirmation.classList.add('match-not')
    } else if ((passwordConfirmation.value == password.value) ){
        passwordConfirmation.classList.remove('match-not')
        passwordConfirmation.classList.add('match-up')      
    }  
    
}