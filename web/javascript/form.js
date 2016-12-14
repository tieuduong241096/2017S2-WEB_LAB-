// JavaScript Document
onload = function() {
	var button = document.getElementById("button_res");
	var button1 = document.getElementById("btntop");
	var repass = document.getElementById("repass");

	genCode();
	button1.disabled = true;
	button.disabled = true;
}
function check_form()
{

	check_date();
	
	
}
function genCode() {
/*
Yeu cau security code:
-Gom 6 ky tu, chi gom chu thuong, chu hoa va so, khong ky tu dac biet.
-Co it nhat 1 chu thuong, 1 chu hoa va 1 so.
*/
	var re = [], digit = [], x = [], valid = false, digitStr;
	
	re[0] = /^[A-Za-z\d]{6}$/g;
	re[1] = /.*[a-z].*/g;
	re[2] = /.*[A-Z].*/g;
	re[3] = /.*\d.*/g;
	
	while(!valid) {
		valid = true;
		
		digit[0] = 65 + Math.round(Math.random()*(90-65));
		digit[1] = 97 + Math.round(Math.random()*(122-97));
		digit[2] = 48 + Math.round(Math.random()*(57-48));

		x[0] = Math.round(Math.random()*digit.length);
		x[1] = Math.round(Math.random()*digit.length);
		x[2] = Math.round(Math.random()*digit.length);
		x[3] = Math.round(Math.random()*digit.length);	
		x[4] = Math.round(Math.random()*digit.length);
		x[5] = Math.round(Math.random()*digit.length);	

		digitStr = String.fromCharCode(digit[x[0]], digit[x[1]], digit[x[2]], digit[x[3]], digit[x[4]],digit[x[5]]);

		for(var i in re) {
			if(!digitStr.match(re[i])) valid = false;
		}
	}
	
	recode.innerHTML = digitStr;
}



function check_username()
{
	var name = document.getElementById("username");
	var checkname = /^[a-zA-Z0-9]+(([\_\-][a-zA-Z 0-9])?[a-zA-Z0-9]*)*$/;
	if (name.value == '') {
        name.setCustomValidity('Bạn chưa nhập tài khoản');
		name.focus();
    }
    else if (!name.value.match(checkname)|| name.value.length<6 || name.value.length>20){
        name.setCustomValidity('Tài khoản từ 6 -> 20 ký tự,ko có khoảng trắng và ký tự đặc biệt!');
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
        pass.setCustomValidity('Bạn chưa nhập mật khẩu');
		pass.focus();
		return false;
    }
	for(var i=0; i<checkpass.length; i++)
	{
		if(!pass.value.match(checkpass[i]) || pass.value.length < 6 || pass.value.length > 30)
		{
			pass.setCustomValidity('Mật khẩu từ 6 đến 30 ký tự,có ít nhất 1 chữ thường,1 chữ hoa,1 số và 1 ký tự đặc biệt!');
			pass.focus();
			return false;
		}
	}
	pass.setCustomValidity('');
	return true;
}

function check_repass()
{
	var pass = document.getElementById("password");
	var repass = document.getElementById("repass");
	if (repass.value == '') {
        repass.setCustomValidity('Bạn chưa nhập lại mật khẩu');
		repass.focus();
    }
	else if(repass.value != pass.value) {
			repass.setCustomValidity('Bạn nhập lại mật khẩu ko đúng');
			repass.focus();
		}
		else {
			repass.setCustomValidity('');
		}
    return true;
}

function check_fullname()
{
	var hoten = document.getElementById("hoten");
	var checkhoten = [];
		checkhoten[0] = /\s{2,}/g;
		checkhoten[1] = /^\s/g;
		checkhoten[2] = /[^A-Za-z A Á À Ả Ã Ạ Â Ấ Ầ Ẫ Ẩ Ậ Ă Ắ Ằ Ẳ Ẵ Ặ I Í Ì Ỉ Ĩ Ị U Ú Ù Ủ Ũ Ụ Ư Ứ Ừ Ử Ữ Ự E É È Ẻ Ẽ Ẹ Ê Ế Ề Ể Ễ Ệ O Ó Ò Ỏ Õ Ọ Ô Ố Ồ Ổ Ỗ Ộ Ơ Ớ Ờ Ở Ỡ Ợ Đ a á à ả ã ạ â ấ ầ ẩ ẫ ậ ă ắ ằ ẳ ẵ ặ i í ì ỉ ĩ ị u ú ù ủ ũ ụ ư ứ ừ ử ữ ự e é è ẻ ẽ ẹ ê ế ề ể ễ ệ o ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ đ]+/g;
	hoten.setCustomValidity('');
		
	if (hoten.value == '') {
        hoten.setCustomValidity('Bạn chưa nhập họ và tên');
		hoten.focus();
		return false;
    }
	for(var i=0; i<checkhoten.length; i++)
	{
		if(hoten.value.match(checkhoten[i]))
		{
			hoten.setCustomValidity('Họ tên từ 2 đến 50 ký tự, ko có 2 khoảng trắng liên tiếp, ko có ký hiệu đặc biệt, ko số');
			hoten.focus();
			return false;
		}
	}
	if(hoten.value.length < 2 ||hoten.value.length >50)
		{
			hoten.setCustomValidity('Họ tên từ 2 đến 50 ký tự, ko có 2 khoảng trắng liên tiếp, ko có ký hiệu đặc biệt, ko số');
			hoten.focus();
			return false;
		}
	hoten.setCustomValidity('');
	return true;
}

function check_date()
{
	var birth = document.getElementById("ngaysinh");
	var year = new Date(birth.value).getFullYear();
	var thisYear = new Date().getFullYear();


	birth.setCustomValidity('');
	if(birth.checkValidity() == false){
        birth.setCustomValidity('Bạn nhập ngày sinh không đúng');
		birth.focus();
	}

if (thisYear - year < 14)
	{
        birth.setCustomValidity('Bạn nhỏ hơn 14 tuổi');
		birth.focus();
    }
if (thisYear - year > 100)
	{
        birth.setCustomValidity('Bạn quá tuổi rồi');
		birth.focus();
    }
}

function check_email() {
	var email = document.getElementById("email");
	var checkmail = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
    if (email.value == '') {
        email.setCustomValidity('Bạn chưa nhập email');
		email.focus();
    }
    else if (!email.value.match(checkmail)){
        email.setCustomValidity('Bạn nhập sai kiểu email');
		email.focus();
    }
    else {
       email.setCustomValidity('');
    }
    return true;
}

function check_phone()
{
	var phone = document.getElementById("dienthoai");
	var checkphone = /^((\+\d{2,3}))(\s)([1-9])\d{8,9}$/g;
	phone.setCustomValidity('');
	if (phone.value == '') {
        phone.setCustomValidity('Bạn chưa nhập điện thoại');
		phone.focus();
    }
    else if (!phone.value.match(checkphone)|| phone.value.length<10 || phone.value.length>15){
        phone.setCustomValidity('Số điện thoại có dạng: +84 968621423');
		phone.focus();
    }
    else {
       phone.setCustomValidity('');
    }
    return true;
}

function check_cmnd()
{
	var cmnd = document.getElementById("cmnd");
	var checkcmnd = /^[0-9]+$/g;
	cmnd.setCustomValidity('');
	if (cmnd.value == '') {
        cmnd.setCustomValidity('Bạn chưa nhập số CMND');
		cmnd.focus();
    }
    else if (!cmnd.value.match(checkcmnd)|| cmnd.value.length<9 || cmnd.value.length>12){
        cmnd.setCustomValidity('Số CMND từ 9->12 số,ko có khoảng trắng!');
		cmnd.focus();
    }
    else {
       cmnd.setCustomValidity('');
    }
    return true;
}

function check_diachi()
{
	var diachi = document.getElementById("diachi");
	var checkdiachi = [];
		checkdiachi[0] = /\s{2,}/g;
		checkdiachi[1] = /^\s/g;
		checkdiachi[2] = /[^A-Za-z0-9 A Á À Ả Ã Ạ Â Ấ Ầ Ẫ Ẩ Ậ Ă Ắ Ằ Ẳ Ẵ Ặ I Í Ì Ỉ Ĩ Ị U Ú Ù Ủ Ũ Ụ Ư Ứ Ừ Ử Ữ Ự E É È Ẻ Ẽ Ẹ Ê Ế Ề Ể Ễ Ệ O Ó Ò Ỏ Õ Ọ Ô Ố Ồ Ổ Ỗ Ộ Ơ Ớ Ờ Ở Ỡ Ợ Đ a á à ả ã ạ â ấ ầ ẩ ẫ ậ ă ắ ằ ẳ ẵ ặ i í ì ỉ ĩ ị u ú ù ủ ũ ụ ư ứ ừ ử ữ ự e é è ẻ ẽ ẹ ê ế ề ể ễ ệ o ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ đ / -]+/g;
	diachi.setCustomValidity('');
	
	for(var i=0; i<checkdiachi.length; i++)
	{
		if(diachi.value.match(checkdiachi[i])|| diachi.length <10 || diachi.length >300)
		{
			diachi.setCustomValidity('Địa chỉ từ 10 đến 300 ký tự, không có 2 khoảng trắng liên tiếp');
			diachi.focus();
			return false;
		}
	}
	diachi.setCustomValidity('');
	return true;
}

function check_code(){
	var code = document.getElementById("code");
	var recode = document.getElementById("recode");
	if (code.value == '') {
        code.setCustomValidity('Bạn chưa nhập mã kiểm tra');
		code.focus();
    }
	else if(code.value != recode.innerHTML) {
			code.setCustomValidity('Bạn nhập mã kiểm tra ko đúng');
			code.focus();
		}
		else {
			code.setCustomValidity('');
		}
    return true;
}

function checkbox() {
//Checkbox: check vao check box thi moi hien ra nut submit cho nguoi dung bam submit.
	var box = document.getElementById("box");
	var button = document.getElementById("button_res");
	if(box.checked) {
		button.disabled = false;	
	} else {
		button.disabled = true;	
	}
}

function check_submit(){
	
	var email = document.getElementById("email").value;
	var cmnd = document.getElementById("cmnd").value;
	var username = document.getElementById("username").value;
	var txt = "";
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
		  	txt = xhttp.responseText;
			if(txt!="") alert(txt);	
		}
	};
	xhttp.open("POST", "User_Register_Check.asp", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("username="+username+"&email="+email+"&cmnd="+cmnd);
	//xhttp.send("username=vandong&email=dfdf@dfdfdf.com&cmnd=123123123123");
	//xhttp.send();
}

function check_passnew()
{
	var pass = document.getElementById("passwordnew");
	var checkpass = [];
		checkpass[0] = /^\S{6,30}$/g;
		checkpass[1] = /.*[a-z].*/g;
		checkpass[2] = /.*[A-Z].*/g;
		checkpass[3] = /.*\d.*/g;
		checkpass[4] = /.*[^A-Za-z0-9\s].*/g;
		
	if (pass.value == '') {
        pass.setCustomValidity('Bạn chưa nhập mật khẩu');
		pass.focus();
		return false;
    }
	for(var i=0; i<checkpass.length; i++)
	{
		if(!pass.value.match(checkpass[i]) || pass.value.length < 6 || pass.value.length > 30)
		{
			pass.setCustomValidity('Mật khẩu từ 6 đến 30 ký tự,có ít nhất 1 chữ thường,1 chữ hoa,1 số và 1 ký tự đặc biệt!');
			pass.focus();
			return false;
		}
	}
	pass.setCustomValidity('');
	return true;
}

function check_repassnew()
{
	var pass = document.getElementById("passwordnew");
	var repass = document.getElementById("repasswordnew");
	if (repass.value == '') {
        repass.setCustomValidity('Bạn chưa nhập lại mật khẩu');
		repass.focus();
    }
	else if(repass.value != pass.value) {
			repass.setCustomValidity('Bạn nhập lại mật khẩu ko đúng');
			repass.focus();
		}
		else {
			repass.setCustomValidity('');
		}
    return true;
}


function check_submit1(){
	alert("Bạn đã cập nhật thông tin thành công !");	
}

function check_submit3(){
	alert("Bạn đã thay đổi mật khẩu thành công !");	
}

function check_submit2(){
	alert("Bạn đã đăng nhập thành công !");	
}