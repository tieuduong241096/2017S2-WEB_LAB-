//Xu ly format gia tien hien thi tren cac trang

var e = document.getElementsByClassName("tien");

for(var i=0; e[i]; i++){
	e[i].innerHTML = Number(e[i].innerHTML).toLocaleString("vi-Vi", {style: "tien", currency: "VND", minimumFractionDigits: 0});
}