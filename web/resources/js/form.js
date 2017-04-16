/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function check_username()
{
	var name = document.getElementById("username");
	var checkname = /^[a-zA-Z0-9]+(([\_\-][a-zA-Z 0-9])?[a-zA-Z0-9]*)*$/;
	if (name.value == '') {
        name.setCustomValidity('Please input username');
		name.focus();
    }
    else if (!name.value.match(checkname)|| name.value.length<6 || name.value.length>20){
        name.setCustomValidity('the length is 6 to 20, no space, no special character!');
		name.focus();
    }
    else {
       name.setCustomValidity('');
    }
    return true;
}

function check_pass()
{
	var pass = document.getElementById("password");
	var checkpass = [];
		checkpass[0] = /^\S{6,30}$/g;
		checkpass[1] = /.*[a-z].*/g;
		checkpass[2] = /.*[A-Z].*/g;
		checkpass[3] = /.*\d.*/g;
		checkpass[4] = /.*[^A-Za-z0-9\s].*/g;
		
	if (pass.value == '') {
        pass.setCustomValidity('Please input password');
		pass.focus();
		return false;
    }
	for(var i=0; i<checkpass.length; i++)
	{
		if(!pass.value.match(checkpass[i]) || pass.value.length < 6 || pass.value.length > 30)
		{
			pass.setCustomValidity('the length is 6 to 30, at least 1 lowercase letter, 1 uppercase letter, 1 special character!');
			pass.focus();
			return false;
		}
	}
	pass.setCustomValidity('');
	return true;
}

function check_fullname()
{
	var hoten = document.getElementById("fullname");
	var checkhoten = [];
		checkhoten[0] = /\s{2,}/g;
		checkhoten[1] = /^\s/g;
		checkhoten[2] = /[^A-Za-z A Á À Ả Ã Ạ Â Ấ Ầ Ẫ Ẩ Ậ Ă Ắ Ằ Ẳ Ẵ Ặ I Í Ì Ỉ Ĩ Ị U Ú Ù Ủ Ũ Ụ Ư Ứ Ừ Ử Ữ Ự E É È Ẻ Ẽ Ẹ Ê Ế Ề Ể Ễ Ệ O Ó Ò Ỏ Õ Ọ Ô Ố Ồ Ổ Ỗ Ộ Ơ Ớ Ờ Ở Ỡ Ợ Đ a á à ả ã ạ â ấ ầ ẩ ẫ ậ ă ắ ằ ẳ ẵ ặ i í ì ỉ ĩ ị u ú ù ủ ũ ụ ư ứ ừ ử ữ ự e é è ẻ ẽ ẹ ê ế ề ể ễ ệ o ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ đ]+/g;
	hoten.setCustomValidity('');
		
	if (hoten.value == '') {
        hoten.setCustomValidity('Please input your fullname');
		hoten.focus();
		return false;
    }
	for(var i=0; i<checkhoten.length; i++)
	{
		if(hoten.value.match(checkhoten[i]))
		{
			hoten.setCustomValidity('no more than 2 spaces, no special characters, no number');
			hoten.focus();
			return false;
		}
	}
	if(hoten.value.length < 2 ||hoten.value.length >50)
		{
			hoten.setCustomValidity('the length is 2 to 50 character');
			hoten.focus();
			return false;
		}
	hoten.setCustomValidity('');
	return true;
}
function check_email() {
	var email = document.getElementById("email");
	var checkmail = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    if (email.value == '') {
        email.setCustomValidity('Please input email');
		email.focus();
    }
    else if (!email.value.match(checkmail)){
        email.setCustomValidity('Wrong email format!');
		email.focus();
    }
    else {
       email.setCustomValidity('');
    }
    return true;
}

function check_phone()
{
	var phone = document.getElementById("phone");
	var checkphone = /^((\+\d{2,3}))(\s)([1-9])\d{8,9}$/g;
	phone.setCustomValidity('');
	if (phone.value == '') {
        phone.setCustomValidity('Please input your phone number');
		phone.focus();
    }
    else if (!phone.value.match(checkphone)|| phone.value.length<10 || phone.value.length>15){
        phone.setCustomValidity('Appropriate phone format is +84 968621423');
		phone.focus();
    }
    else {
       phone.setCustomValidity('');
    }
    return true;
}
function check_age()
{
	var phone = document.getElementById("age");
	var checkphone = /^\d+$/;
	phone.setCustomValidity('');
	if (phone.value == '') {
        phone.setCustomValidity('Please input age');
		phone.focus();
    }
    else if (!phone.value.match(checkphone)|| phone.value.length<2 || phone.value.length>2){
        phone.setCustomValidity('Number only');
		phone.focus();
    }
    else {
       phone.setCustomValidity('');
    }
    return true;
}
function check_address()
{
	var name = document.getElementById("address");
	
	if (name.value == '') {
        name.setCustomValidity('Please input address');
		name.focus();
    }
    else if (name.value.length<6 || name.value.length>20){
        name.setCustomValidity('the length is 6 to 20');
		name.focus();
    }
    else {
       name.setCustomValidity('');
    }
    return true;
}

function check_form(){
    check_username();
    check_pass();
    check_address();
    check_age();
    check_email();
    check_fullname();
    check_phone();
    
}