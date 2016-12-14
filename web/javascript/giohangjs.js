
DisplayNotice         = true;
MinimumOrder          = 0.00;
MinimumOrderPrompt    = 'Vui lòng chọn số lượng sản phẩm ít nhất là 1';
PaymentProcessor      = '';
AppendItemNumToOutput = true;
HiddenFieldsToCheckout = false;

strSorry  = "Giỏ Hàng của bạn đã đầy. Vui lòng tiến hành thanh toán.";
strAdded  = " vừa được thêm vào Giỏ Hàng.";
strRemove = "Nhấn 'Ok' để bỏ sản phẩm ra khỏi Giỏ Hàng.";
strRButton= "Xóa";
strErrQty = "Nhập sai số lượng sản phẩm.";

//Thêm sản phẩm vào Giỏ Hàng

function AddToCart(thisForm) {
   var iNumberOrdered = 0;
   var bAlreadyInCart = false;
   var notice = "";
   iNumberOrdered = GetCookie("NumberOrdered");

   if ( iNumberOrdered == null )
      iNumberOrdered = 0;

   if ( thisForm.ID_NUM == null )
      strID_NUM = "";
   else
      strID_NUM = thisForm.ID_NUM.value;

   if ( thisForm.QUANTITY == null )
      strQUANTITY = "1";
   else
      strQUANTITY = thisForm.QUANTITY.value;

   if ( thisForm.PRICE == null )
      strPRICE = "0.00";
   else
      strPRICE = thisForm.PRICE.value;

   if ( thisForm.NAME == null )
      strNAME = "";
   else
      strNAME = thisForm.NAME.value;

	// Lưu thông tin sản phẩm vào cookie
	
   for ( i = 1; i <= iNumberOrdered; i++ ) {
      NewOrder = "Order." + i;
      database = "";
      database = GetCookie(NewOrder);

      Token0 = database.indexOf("|", 0);
      Token1 = database.indexOf("|", Token0+1);
      Token2 = database.indexOf("|", Token1+1);

      fields = new Array;
      fields[0] = database.substring( 0, Token0 ); //Mã SP
      fields[1] = database.substring( Token0+1, Token1 ); //Tên SP
      fields[2] = database.substring( Token1+1, Token2 ); //Số lượng SP
      fields[3] = database.substring( Token2+1, database.length ); //Đơn giá SP

      if ( fields[0] == strID_NUM &&
           fields[2] == strPRICE  &&
           fields[3] == strNAME
         ) {
         bAlreadyInCart = true;
         dbUpdatedOrder = strID_NUM    + "|" +
                          (parseInt(strQUANTITY)+parseInt(fields[1]))  + "|" +
                          strPRICE     + "|" +
                          strNAME;
         strNewOrder = "Order." + i;
         DeleteCookie(strNewOrder, "/");
         SetCookie(strNewOrder, dbUpdatedOrder, null, "/");
         notice = strQUANTITY + " " + strNAME + strAdded;
         break;
      }
   }

//Tự động tăng số lượng sản phẩm khi sản phẩm đã có trong Giỏ Hàng

   if ( !bAlreadyInCart ) {
      iNumberOrdered++;

      if ( iNumberOrdered > 12 )
         alert( strSorry );
      else {
         dbUpdatedOrder = strID_NUM    + "|" + 
                          strQUANTITY  + "|" +
                          strPRICE     + "|" +
                          strNAME;

         strNewOrder = "Order." + iNumberOrdered;
         SetCookie(strNewOrder, dbUpdatedOrder, null, "/");
         SetCookie("NumberOrdered", iNumberOrdered, null, "/");
         notice = strQUANTITY + " " + strNAME + strAdded;
      }
   }

   if ( DisplayNotice )
      alert(notice);
}

//Lấy giá trị từ cookie

function getCookieVal (offset) {
   var endstr = document.cookie.indexOf (";", offset);

   if ( endstr == -1 )
      endstr = document.cookie.length;
   return(unescape(document.cookie.substring(offset, endstr)));
}

//Set cookie time

function FixCookieDate (date) {
   var base = new Date(0);
   var skew = base.getTime();

   date.setTime (date.getTime() - skew);
}

//Lấy cookie

function GetCookie (name) {
   var arg = name + "=";
   var alen = arg.length;
   var clen = document.cookie.length;
   var i = 0;

   while ( i < clen ) {
      var j = i + alen;
      if ( document.cookie.substring(i, j) == arg ) return(getCookieVal (j));
      i = document.cookie.indexOf(" ", i) + 1;
      if ( i == 0 ) break;
   }

   return(null);
}

//Chỉnh sửa cookie

function SetCookie (name,value,expires,path,domain,secure) {
   document.cookie = name + "=" + escape (value) +
                     ((expires) ? "; expires=" + expires.toGMTString() : "") +
                     ((path) ? "; path=" + path : "") +
                     ((domain) ? "; domain=" + domain : "") +
                     ((secure) ? "; secure" : "");
}

//Xóa cookie

function DeleteCookie (name,path,domain) {
   if ( GetCookie(name) ) {
      document.cookie = name + "=" +
                        ((path) ? "; path=" + path : "") +
                        ((domain) ? "; domain=" + domain : "") +
                        "; expires=Thu, 01-Jan-70 00:00:01 GMT";
   }
}

//Xóa sản phẩm khỏi giỏ hàng

function RemoveFromCart(RemOrder) {
   if ( confirm( strRemove ) ) {
      NumberOrdered = GetCookie("NumberOrdered");
      for ( i=RemOrder; i < NumberOrdered; i++ ) {
         NewOrder1 = "Order." + (i+1);
         NewOrder2 = "Order." + (i);
         database = GetCookie(NewOrder1);
         SetCookie (NewOrder2, database, null, "/");
      }
      NewOrder = "Order." + NumberOrdered;
      SetCookie ("NumberOrdered", NumberOrdered-1, null, "/");
      DeleteCookie(NewOrder, "/");
      location.href=location.href;
   }
}

//Thay đổi số lượng sản phẩm

function ChangeQuantity(OrderItem,NewQuantity) {
   if ( isNaN(NewQuantity) ) {
      alert( strErrQty );
   } else {
      NewOrder = "Order." + OrderItem;
      database = "";
      database = GetCookie(NewOrder);

      Token0 = database.indexOf("|", 0);
      Token1 = database.indexOf("|", Token0+1);
      Token2 = database.indexOf("|", Token1+1);

      fields = new Array;
      fields[0] = database.substring( 0, Token0 ); //Mã SP
      fields[1] = database.substring( Token0+1, Token1 ); //Tên SP
      fields[2] = database.substring( Token1+1, Token2 ); //Số lượng SP
      fields[3] = database.substring( Token2+1, database.length ); //Đơn giá SP

      dbUpdatedOrder = fields[0] + "|" +
                       NewQuantity + "|" +
                       fields[2] + "|" +
                       fields[3];
      strNewOrder = "Order." + OrderItem;
      DeleteCookie(strNewOrder, "/");
      SetCookie(strNewOrder, dbUpdatedOrder, null, "/");
      location.href=location.href;      
   }
}


QueryString.keys = new Array();
QueryString.values = new Array();
function QueryString(key) {
   var value = null;
   for (var i=0;i<QueryString.keys.length;i++) {
      if (QueryString.keys[i]==key) {
         value = QueryString.values[i];
         break;
      }
   }
   return value;
} 

//Lấy giá trị từ cookie value

function QueryString_Parse() {
   var query = window.location.search.substring(1);
   var pairs = query.split("&"); for (var i=0;i<pairs.length;i++) {
      var pos = pairs[i].indexOf('=');
      if (pos >= 0) {
         var argname = pairs[i].substring(0,pos);
         var value = pairs[i].substring(pos+1);
         QueryString.keys[QueryString.keys.length] = argname;
         QueryString.values[QueryString.values.length] = value;
      }
   }
}

//Quản lý Giỏ hàng

function ManageCart() {
   var iNumberOrdered = 0;    
   var fTotal         = 0;    
   var strTotal       = ""; 
   var strOutput      = "";  

   iNumberOrdered = GetCookie("NumberOrdered");
   if ( iNumberOrdered == null )
      iNumberOrdered = 0;
	  
	  //Header của Bảng Giỏ Hàng

      strOutput = "<TABLE id='bang_giohang' style='padding:2%'><TR>" +
                  "<TD style='padding-top:1%;padding-bottom:1%;width:10%'><B>Mã Sản Phẩm</B></TD>" +
                  "<TD style='padding-top:1%;padding-bottom:1%;width:10%'><B>Tên Sản Phẩm</B></TD>" +
                  "<TD style='padding-top:1%;padding-bottom:1%;width:10%'><B>Số Lượng</B></TD>" +
                  "<TD style='padding-top:1%;padding-bottom:1%;width:10%'><B>Đơn Giá</B></TD>" +
                  "<TD style='padding-top:1%;padding-bottom:1%;width:10%'><B>Xóa</B></TD></TR>";
				 
	//Kiểm tra nếu Giỏ Hàng trống

   if ( iNumberOrdered == 0 ) {
      strOutput += "<TR><TD COLSPAN=5 ><CENTER><BR><B id='test'>Giỏ Hàng của bạn hiện đang trống</B><BR><BR></CENTER></TD></TR>";
   }
   
   //Thêm dữ liệu sản phẩm vào Giỏ Hàng

   for ( i = 1; i <= iNumberOrdered; i++ ) {
      NewOrder = "Order." + i;
      database = "";
      database = GetCookie(NewOrder);

      Token0 = database.indexOf("|", 0);
      Token1 = database.indexOf("|", Token0+1);
      Token2 = database.indexOf("|", Token1+1);

      fields = new Array;
      fields[0] = database.substring( 0, Token0 ); //Mã SP
      fields[1] = database.substring( Token0+1, Token1 ); //Tên SP
      fields[2] = database.substring( Token1+1, Token2 ); //Số lượng SP
      fields[3] = database.substring( Token2+1, database.length ); //Đơn giá SP         

      fTotal     += (parseInt(fields[1]) * parseFloat(fields[2]) );
      strTotal    = fTotal;

      strOutput += "<TR><TD><INPUT style='border:none;text-align:center;width:55%' TYPE=TEXT NAME=TenSP VALUE=\""  + fields[0] +"\"></TD>";
	  strOutput += "<TD>"  + fields[3] + "</TD>";
      strOutput += "<TD><INPUT style='border:none;text-align:center;width:40%' TYPE=TEXT NAME=Q SIZE=2 VALUE=\"" + fields[1] + "\" onChange=\"ChangeQuantity("+i+", this.value);\"></TD>";
      strOutput += "<TD>" + fields[2] + " VNĐ/cái</TD>";
      strOutput += "<TD><input type=image src=\"./img/xoa_giohang.png\" value=\" "+strRButton+" \" onClick=\"RemoveFromCart("+i+")\"></TD></TR>";

   }

   strOutput += "<TR><TD COLSPAN=5  style='padding-top:5%;padding-bottom:1%;margin-right:10%;width:100%'><B>TỔNG CỘNG: " + strTotal + " VNĐ</B></TD>";
   strOutput += "</TR></TABLE>";
   g_TotalCost = (fTotal);

   document.write(strOutput);
   document.close();
}


var g_TotalCost = 0;
function ValidateCart( theForm ) {
 
   if ( MinimumOrder > 0 ) {
      if ( g_TotalCost < MinimumOrder ) {
         alert( MinimumOrderPrompt );
         return false;
      }
   }

   return true;
}

