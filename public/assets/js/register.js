var validate = function(){
    $('#username-message').html("");
    $('#password-message').html("");
    $('#retype-message').html("");
    $('#birthday-message').html("");
    $('#captcha-message').html("");

    var username = $('#txtUsername').val();
    if (username.length < 4 || username.length > 32) {
        $('#username-message').html("Tên đăng nhập gồm 4-32 kí tự!");
    } else if (!username.match(/^[A-Za-z0-9_]{4,32}$/)) {
        $('#username-message').html("Tên đăng nhập chỉ bao gồm chữ, số và dấu _");
    } else if ($('#txtPassword').val().length < 4 || $('#txtPassword').val().length > 32) {
        $('#password-message').html("Mật khẩu gồm 4-32 kí tự!");
    } else if ($('#txtRetype').val().length == 0) {
        $('#retype-message').html("Chưa nhập lại mật khẩu!");
    } else if ($('#password').val().indexOf($('#retype').val())===-1 || $('#retype').val().indexOf($('#password').val())===-1) {
        $('#retype-message').html("Nhập lại mật khẩu không trùng khớp!");
    } else if ($('#txtName').val().length === 0) {
        $('#name-message').html("Chưa nhập họ tên!");
    } else if ($('#txtName').val().length > 50) {
        $('#name-message').html("Họ tên tối đa 50 kí tự!");
    } else if ($('#txtEmail').val().length === 0) {
        $('#email-message').html("Chưa nhập email!");
    } else if ($('#txtEmail').val().length > 50) {
        $('#email-message').html("Email tối đa 50 kí tự!");
    } else {
        $('#registerForm').submit();
    }
            // if (!isCaptchaEmpty()) {isValid = false};
}

function isValidUsername() {
    var username = $('#txtUsername').val();
    if (username.length < 4 || username.length > 32) {
        $('#username-message').html("Tên đăng nhập gồm 4-32 kí tự!");
        return false;
    } else if (!username.match(/^[A-Za-z0-9_]{4,32}$/)) {
        $('#username-message').html("Tên đăng nhập chỉ bao gồm chữ, số và dấu _");
        return false;
    } else {
        return true;
    }
}

function isValidPassword() {
    if ($('#txtPassword').val().length < 4 || $('#txtPassword').val().length > 32) {
        $('#password-message').html("Mật khẩu gồm 4-32 kí tự!");
        return false;
    } else if ($('#txtRetype').val().length == 0) {
        $('#retype-message').html("Chưa nhập lại mật khẩu!");
        return false;
    } else if ($('#password').val().indexOf($('#retype').val())===-1 || $('#retype').val().indexOf($('#password').val())===-1) {
        $('#retype-message').html("Nhập lại mật khẩu không trùng khớp!");
        return false;
    } else {
        return true;
    }
}

function isValidName() {
    if ($('#txtName').val().length === 0) {
        $('#name-message').html("Chưa nhập họ tên!");
        return false;
    } else if ($('#txtName').val().length > 50) {
        $('#name-message').html("Họ tên tối đa 50 kí tự!");
        return false;
    } else {
        return true;
    }
}

function isValidEmail() {
    if ($('#txtEmail').val().length === 0) {
        $('#email-message').html("Chưa nhập email!");
        return false;
    } else if ($('#txtEmail').val().length > 50) {
        $('#email-message').html("Email tối đa 50 kí tự!");
        return false;
    } else {
        return true;
    }
}

function isValidDOB() {
    var dob = $('#txtDOB').val();
    var data = dob.split("/");
    if (isNaN(Date.parse(data[2] + "-" + data[1] + "-" + data[0]))) {
        $('#birthday-message').html("Ngày sinh không hợp lệ!");
        return false;
    } else {
        return true;
    }
}

function isCaptchaEmpty() {
    if(grecaptcha.getResponse().length === 0) {
        $('#captcha-message').html("Chưa nhập captcha!");
        return false;
    } else {
        return true; 
    }
}