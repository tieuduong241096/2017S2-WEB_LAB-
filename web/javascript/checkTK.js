// JavaScript Document

onload = function() {
	var button1 = document.getElementById("btntop");
	var button = document.getElementById("button_res");
	button1.disabled = true;
	genCode();
	button.disabled = true;
	
}

function checkTK() {
//Search box: nhập vào ô tìm kiếm mới click đc button
	var name = document.getElementById("search-keyword");
	var button1 = document.getElementById("btntop");
	
	name.setCustomValidity('');
	
	if(name.value) 
	{
		button1.disabled = false;	
	} 
	else {
		button1.disabled = true;
	}
	return true;
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

function check_username1(namebox)
{
	var name = document.getElementById("username1");
	namebox.setCustomValidity('');
	if (name.value == '') {
        namebox.setCustomValidity('Bạn chưa nhập tài khoản');
		name.focus();
    }
    return true;
}

function check_password1(passbox)
{
	var pass = document.getElementById("password1");
	passbox.setCustomValidity('');
	if (pass.value == '') {
        passbox.setCustomValidity('Bạn chưa nhập mật khẩu');
		pass.focus();
    }
    return true;
}

function check_tieude(tieudebox)
{
	var tieude = document.getElementById("tieude");
	var checktieude = [];
		checktieude[0] = /\s{2,}/g;
		checktieude[1] = /^\s/g;
		checktieude[2] = /[^A-Za-z0-9 A Á À Ả Ã Ạ Â Ấ Ầ Ẫ Ẩ Ậ Ă Ắ Ằ Ẳ Ẵ Ặ I Í Ì Ỉ Ĩ Ị U Ú Ù Ủ Ũ Ụ Ư Ứ Ừ Ử Ữ Ự E É È Ẻ Ẽ Ẹ Ê Ế Ề Ể Ễ Ệ O Ó Ò Ỏ Õ Ọ Ô Ố Ồ Ổ Ỗ Ộ Ơ Ớ Ờ Ở Ỡ Ợ Đ a á à ả ã ạ â ấ ầ ẩ ẫ ậ ă ắ ằ ẳ ẵ ặ i í ì ỉ ĩ ị u ú ù ủ ũ ụ ư ứ ừ ử ữ ự e é è ẻ ẽ ẹ ê ế ề ể ễ ệ o ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ đ]+/g;
	tieudebox.setCustomValidity('');
	if (tieude.value == '') {
        tieudebox.setCustomValidity('Bạn chưa nhập tiêu đề');
		tieude.focus();
		return false;
    }
	
	for(var i=0; i<checktieude.length; i++)
	{
		if(tieude.value.match(checktieude[i])|| tieude.length <10 || tieude.length >300)
		{
			tieudebox.setCustomValidity('Tiêu đề từ 10 đến 300 ký tự, không có 2 khoảng trắng liên tiếp');
			tieude.focus();
			return false;
		}
	}
	tieudebox.setCustomValidity('');
	return true;
}

function check_noidung(noidungbox)
{
	var noidung = document.getElementById("NoiDungGopY");
	var checkhoidap = [];
		checkhoidap[0] = /\s{2,}/g;
		checkhoidap[1] = /^\s/g;
		checkhoidap[2] = /[^A-Za-z A Á À Ả Ã Ạ Â Ấ Ầ Ẫ Ẩ Ậ Ă Ắ Ằ Ẳ Ẵ Ặ I Í Ì Ỉ Ĩ Ị U Ú Ù Ủ Ũ Ụ Ư Ứ Ừ Ử Ữ Ự E É È Ẻ Ẽ Ẹ Ê Ế Ề Ể Ễ Ệ O Ó Ò Ỏ Õ Ọ Ô Ố Ồ Ổ Ỗ Ộ Ơ Ớ Ờ Ở Ỡ Ợ Đ a á à ả ã ạ â ấ ầ ẩ ẫ ậ ă ắ ằ ẳ ẵ ặ i í ì ỉ ĩ ị u ú ù ủ ũ ụ ư ứ ừ ử ữ ự e é è ẻ ẽ ẹ ê ế ề ể ễ ệ o ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ đ]+/g;
	noidungbox.setCustomValidity('');
	if (noidung.value == '') {
        noidungbox.setCustomValidity('Bạn chưa nhập nội dung hỏi');
		noidung.focus();
		return false;
    }
	
	for(var i=0; i<checkhoidap.length; i++)
	{
		if(noidung.value.match(checkhoidap[i])|| noidung.length <20 || noidung.length >300)
		{
			noidungbox.setCustomValidity('Nội dung từ 20 đến 300 ký tự, không có 2 khoảng trắng liên tiếp, ko ký tự đặc biệt');
			noidung.focus();
			return false;
		}
	}
	noidungbox.setCustomValidity('');
	return true;
}

