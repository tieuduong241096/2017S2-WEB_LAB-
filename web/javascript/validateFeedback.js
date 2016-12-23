/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function checkTitle() {
    var fullname = document.getElementById("title").value;


    var checkfullname = [];
    checkfullname[0] = /\s{2,}/g;
    checkfullname[1] = /^\s/g;
    checkfullname[2] = /[^A-Za-z A Á À Ả Ã Ạ Â Ấ Ầ Ẫ Ẩ Ậ Ă Ắ Ằ Ẳ Ẵ Ặ I Í Ì Ỉ Ĩ Ị U Ú Ù Ủ Ũ Ụ Ư Ứ Ừ Ử Ữ Ự E É È Ẻ Ẽ Ẹ Ê Ế Ề Ể Ễ Ệ O Ó Ò Ỏ Õ Ọ Ô Ố Ồ Ổ Ỗ Ộ Ơ Ớ Ờ Ở Ỡ Ợ Đ a á à ả ã ạ â ấ ầ ẩ ẫ ậ ă ắ ằ ẳ ẵ ặ i í ì ỉ ĩ ị u ú ù ủ ũ ụ ư ứ ừ ử ữ ự e é è ẻ ẽ ẹ ê ế ề ể ễ ệ o ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ đ]+/g;


    if (fullname == '') {
        document.getElementById("err4").innerHTML = "Please input your title";
        return false;
    } else if (fullname.length < 6 || fullname.length > 50)
    {
        document.getElementById("err4").innerHTML = "6 to 50 characters required";
        return false;
    }
    for (var i = 0; i < checkfullname.length; i++)
    {
        if (fullname.match(checkfullname[i]))
        {
            document.getElementById("err4").innerHTML = "no more than 1 spaces, no special characters, no number";
            return false;
        }

    }

    document.getElementById("err4").innerHTML = "";
    return true;
}
function checkContent() {
    var content = document.getElementById("content").value;


    var checkcontent = [];
    checkcontent[0] = /\s{2,}/g;
    checkcontent[1] = /^\s/g;
    checkcontent[2] = /[^A-Za-z A Á À Ả Ã Ạ Â Ấ Ầ Ẫ Ẩ Ậ Ă Ắ Ằ Ẳ Ẵ Ặ I Í Ì Ỉ Ĩ Ị U Ú Ù Ủ Ũ Ụ Ư Ứ Ừ Ử Ữ Ự E É È Ẻ Ẽ Ẹ Ê Ế Ề Ể Ễ Ệ O Ó Ò Ỏ Õ Ọ Ô Ố Ồ Ổ Ỗ Ộ Ơ Ớ Ờ Ở Ỡ Ợ Đ a á à ả ã ạ â ấ ầ ẩ ẫ ậ ă ắ ằ ẳ ẵ ặ i í ì ỉ ĩ ị u ú ù ủ ũ ụ ư ứ ừ ử ữ ự e é è ẻ ẽ ẹ ê ế ề ể ễ ệ o ó ò ỏ õ ọ ô ố ồ ổ ỗ ộ ơ ớ ờ ở ỡ ợ đ]+/g;


    if (content == '') {
        document.getElementById("err5").innerHTML = "Please input your content";
        return false;
    } else if (content.length < 6 || content.length > 300)
    {
        document.getElementById("err5").innerHTML = "6 to 300 characters required";
        return false;
    }
    for (var i = 0; i < checkcontent.length; i++)
    {
        if (content.match(checkcontent[i]))
        {
            document.getElementById("err5").innerHTML = "no more than 1 spaces, no special characters, no number";
            return false;
        }

    }

    document.getElementById("err5").innerHTML = "";
    return true;
}
