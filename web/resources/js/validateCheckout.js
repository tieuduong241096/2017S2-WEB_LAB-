/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

