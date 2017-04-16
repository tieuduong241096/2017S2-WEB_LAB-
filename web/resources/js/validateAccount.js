/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function checkUsername() {
    var username = document.getElementById("username").value;
    var checkname = /^[a-zA-Z0-9]+(([\_\-][a-zA-Z 0-9])?[a-zA-Z0-9]*)*$/;

    if (username.match(/^\s*$/)) {

        document.getElementById("err1").innerHTML = "Please input your user name";
        return false;

    } else if (!username.match(checkname) || username.length < 6 || username.length > 20) {
        document.getElementById("err1").innerHTML = "6 to 20 characters required, no space, no special character";
        return false;
    }

    document.getElementById("err1").innerHTML = "";
    return true;
}

function checkPassword() {
    var password = document.getElementById("password").value;


    if (password == '') {

        document.getElementById("err2").innerHTML = "Please input your password!";
        return false;
    }
    var checkpass = [];
    checkpass[0] = /^\S{6,30}$/g;
    checkpass[1] = /.*[a-z].*/g;
    checkpass[2] = /.*[A-Z].*/g;
    checkpass[3] = /.*\d.*/g;
    checkpass[4] = /.*[^A-Za-z0-9\s].*/g;


    for (var i = 0; i < checkpass.length; i++)
    {
        if (!password.match(checkpass[i]) || password.length < 6 || password.length > 30)
        {
            document.getElementById("err2").innerHTML = "6 to 30 characters required, at least 1 lowercase letter, 1 uppercase letter, 1 special character, 1 number!";
            return false;

        }
    }
    document.getElementById("err2").innerHTML = "";
    return true;
}
function checkPassword_login() {
    var password = document.getElementById("password1").value;


    if (password == '') {

        document.getElementById("err9").innerHTML = "Please input your password!";
        return false;
    }
    var checkpass = [];
    checkpass[0] = /^\S{6,30}$/g;
    checkpass[1] = /.*[a-z].*/g;
    checkpass[2] = /.*[A-Z].*/g;
    checkpass[3] = /.*\d.*/g;
    checkpass[4] = /.*[^A-Za-z0-9\s].*/g;


    for (var i = 0; i < checkpass.length; i++)
    {
        if (!password.match(checkpass[i]) || password.length < 6 || password.length > 30)
        {
            document.getElementById("err9").innerHTML = "6 to 30 characters required, at least 1 lowercase letter, 1 uppercase letter, 1 special character, 1 number!";
            return false;

        }
    }
    document.getElementById("err9").innerHTML = "";
    return true;
}

function checkEmail() {
    var email = document.getElementById("email").value;
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    if (email === '') {

        document.getElementById("err3").innerHTML = "Please input your email!";
        return false;

    } else if (!email.match(re)) {
        document.getElementById("err3").innerHTML = "Invalid email format!";
        return false;
    }
    document.getElementById("err3").innerHTML = "";
    return true;
}
function checkEmail_login() {
    var email = document.getElementById("email1").value;
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    if (email === '') {

        document.getElementById("err8").innerHTML = "Please input your email!";
        return false;

    } else if (!email.match(re)) {
        document.getElementById("err8").innerHTML = "Invalid email format!";
        return false;
    }
    document.getElementById("err8").innerHTML = "";
    return true;
}

function checkFullname() {
    var fullname = document.getElementById("fullname").value;


    var checkhoten = [];
    checkhoten[0] = /\s{2,}/g;
    checkhoten[1] = /^\s/g;
    checkhoten[2] = /[^A-Za-z A Á À Ả Ã Ạ Â Ấ Ầ Ẫ Ẩ Ậ Ă Ắ Ằ Ẳ Ẵ Ặ I Í Ì Ỉ Ĩ Ị U Ú Ù Ủ Ũ Ụ Ư Ứ Ừ Ử Ữ Ự E É È Ẻ Ẽ Ẹ Ê Ế Ề Ể Ễ Ệ O Ó Ò Ỏ Õ Ọ Ô Ố Ồ Ổ Ỗ Ộ Ơ Ớ Ờ Ở Ỡ Ợ Đ a á à ả ã ạ â ấ ầ ẩ ẫ ậ ă ắ ằ ẳ ẵ ặ i í ì ỉ ĩ ị u ú ù ủ ũ ụ ư ứ ừ ử ữ ự e é è ẻ ẽ ẹ ê ế ề ể ễ ệ o ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ đ]+/g;


    if (fullname == '') {
        document.getElementById("err4").innerHTML = "Please input your fullname";
        return false;
    } else if (fullname.length < 2 || fullname.length > 50)
    {
        document.getElementById("err4").innerHTML = "2 to 50 characters required";
        return false;
    }
    for (var i = 0; i < checkhoten.length; i++)
    {
        if (fullname.match(checkhoten[i]))
        {
            document.getElementById("err4").innerHTML = "no more than 1 spaces, no special characters, no number";
            return false;
        }

    }

    document.getElementById("err4").innerHTML = "";
    return true;
}

function checkAge() {
    var age = document.getElementById("age").value;
    if (age == '') {

        document.getElementById("err5").innerHTML = "Please input your age!";
        return false;

    } else if (!age.match(/^\d+$/) || age.length !== 2 || age < 18 || age > 30) {
        document.getElementById("err5").innerHTML = "age from 18 to 30 only";

    } else {
        document.getElementById("err5").innerHTML = "";
        return true;
    }
    return false;
}

function checkAddress() {
    var address = document.getElementById("address").value;

    if (address === "") {

        document.getElementById("err6").innerHTML = "Please input your address!";

    }
    var checkdiachi = [];
    checkdiachi[0] = /\s{2,}/g;
    checkdiachi[1] = /^\s/g;
    checkdiachi[2] = /[^A-Za-z0-9 A Á À Ả Ã Ạ Â Ấ Ầ Ẫ Ẩ Ậ Ă Ắ Ằ Ẳ Ẵ Ặ I Í Ì Ỉ Ĩ Ị U Ú Ù Ủ Ũ Ụ Ư Ứ Ừ Ử Ữ Ự E É È Ẻ Ẽ Ẹ Ê Ế Ề Ể Ễ Ệ O Ó Ò Ỏ Õ Ọ Ô Ố Ồ Ổ Ỗ Ộ Ơ Ớ Ờ Ở Ỡ Ợ Đ a á à ả ã ạ â ấ ầ ẩ ẫ ậ ă ắ ằ ẳ ẵ ặ i í ì ỉ ĩ ị u ú ù ủ ũ ụ ư ứ ừ ử ữ ự e é è ẻ ẽ ẹ ê ế ề ể ễ ệ o ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ đ / -]+/g;


    for (var i = 0; i < checkdiachi.length; i++)
    {
        if (address.match(checkdiachi[i]) || address.length < 10 || address.length > 300)
        {
            document.getElementById("err6").innerHTML = "10 to 300 characters required, no more than 1 space, no special characters";
            return false;
        }
    }
    document.getElementById("err6").innerHTML = "";
    return true;

}

function checkPhone() {
    var phone = document.getElementById("phone").value;
    var checkphone = /^(?=\d{10,11}$)(098|097|096|0169|0168|0167|0166|0165|0164|0163|0162|091|094|0123|0124|0125|0127|0129|090|093|0120|0121|0122|0126|0128|092|0188|0993|0994|0995|0996|099|095)\d+/;

    if (phone === '') {

        document.getElementById("err7").innerHTML = "Please input your phone number!";
        return false;
    } else if (phone.length < 10 || phone.length > 15) {
        document.getElementById("err7").innerHTML = "10 to 15 numbers required";
        return false;
    } else if (!phone.match(checkphone)) {
        document.getElementById("err7").innerHTML = "Appropriate phone carriers are Viettel, Vinaphone, Mobifone, Vietnamobile, Beeline,S fone";
        return false;
    }
    document.getElementById("err7").innerHTML = "";
    return true;
}

