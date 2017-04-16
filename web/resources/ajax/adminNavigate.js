/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    //menu.jsp
    $('#leftBar .lb li').on('click', '.p', function () {
        $.ajax({
            type: "GET",
            url: "indexProduct.jsp",

            cache: false,

            success: function (html) {

                $("#rightContent").html(html);

            },
            error: function (xhr, ajaxOptions, thrownError) {
                if (xhr.status == 404) {
                    alert(thrownError);
                }
            },
            complete: function (html) {




            }
        });

    });

    $('#leftBar .lb li').on('click', '.b', function () {
        $.ajax({
            type: "GET",
            url: "indexBrand.jsp",

            cache: false,

            success: function (html) {

                $("#rightContent").html(html);

            },
            error: function (xhr, ajaxOptions, thrownError) {
                if (xhr.status == 404) {
                    alert(thrownError);
                }
            },
            complete: function (html) {




            }
        });

    });

    $('#leftBar .lb li').on('click', '.c', function () {
        $.ajax({
            type: "GET",
            url: "indexCategory.jsp",

            cache: false,

            success: function (html) {

                $("#rightContent").html(html);

            },
            error: function (xhr, ajaxOptions, thrownError) {
                if (xhr.status == 404) {
                    alert(thrownError);
                }
            },
            complete: function (html) {




            }
        });

    });

    $('#leftBar .lb li').on('click', '.r', function () {
        $.ajax({
            type: "GET",
            url: "indexReceipt.jsp",

            cache: false,

            success: function (html) {

                $("#rightContent").html(html);

            },
            error: function (xhr, ajaxOptions, thrownError) {
                if (xhr.status == 404) {
                    alert(thrownError);
                }
            },
            complete: function (html) {




            }
        });

    });
    $('#leftBar .lb li').on('click', '.u', function () {
        $.ajax({
            type: "GET",
            url: "indexUser.jsp",

            cache: false,

            success: function (html) {

                $("#rightContent").html(html);

            },
            error: function (xhr, ajaxOptions, thrownError) {
                if (xhr.status == 404) {
                    alert(thrownError);
                }
            },
            complete: function (html) {




            }
        });

    });
    $('#leftBar .lb li').on('click', '.f', function () {
        $.ajax({
            type: "GET",
            url: "indexFeedback.jsp",

            cache: false,

            success: function (html) {

                $("#rightContent").html(html);

            },
            error: function (xhr, ajaxOptions, thrownError) {
                if (xhr.status == 404) {
                    alert(thrownError);
                }
            },
            complete: function (html) {




            }
        });

    });

    //indexfeedback.jsp
    var typingTimer;
    var doneTypingInterval = 2000;
    var input;
    var id;
    $('#feedback').on('keyup', '#rep', function () {

        clearTimeout(typingTimer);
        typingTimer = setTimeout(doneTyping, doneTypingInterval);

        input = $(this).val();


        if (!/^[a-zA-Z\s]+$/.test(input)) {
            $("#inputerr").text("*Input your reply(letters only)*");
        } else {
            //reply
            $(this).closest('tr').find("#repcontent").text(input);
        }

        //id
        var $row = $(this).parents('tr');
        id = $row.find('#fid').html();





    });

    //on keydown, clear the countdown 
    $('#feedback').on('keydown', function () {
        clearTimeout(typingTimer);
    });
//                
    function doneTyping() {
        if (!/^[a-zA-Z\s]+$/.test(input)) {
            $("#inputerr").text("*Input your reply(letters only)*");
        } else {
            $.ajax({

                type: "POST",
                url: "../AdminFeedbackServlet",
                data: {dataString: input, id: id},
                cache: false,
                success: function (html) {
                    $.ajax({
                        type: "GET",
                        url: "indexFeedback.jsp",

                        cache: false,

                        success: function (html) {

                            $("#rightContent").html(html);

                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            if (xhr.status == 404) {
                                alert(thrownError);
                            }
                        },
                        complete: function (html) {




                        }
                    });

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status == 404) {
                        alert(thrownError);
                    }
                }
            });


        }
        input = "";
        id = "";
    }



    //indexReceitp.jsp
    $("#receipt tr:not(:first-child)").click(function (e) {
        var id = $(this).find("#rid").html();
        if (e.target.type == "checkbox") {


            $.ajax({
                type: "POST",
                url: "../AdminReceiptServlet",
                data: {dataString: id, action: "update"},
                cache: false,
                success: function (html) {
                    alert("confirm successfully");
                    $.ajax({
                        type: "GET",
                        url: "indexReceipt.jsp",

                        cache: false,

                        success: function (html) {

                            $("#rightContent").html(html);

                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            if (xhr.status == 404) {
                                alert(thrownError);
                            }
                        },
                        complete: function (html) {




                        }
                    });

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status == 404) {
                        alert(thrownError);
                    }
                }
            });
            // stop the bubbling to prevent firing the row's click event
            e.stopPropagation();
        } else {


            $.ajax({
                type: "POST",
                url: "../AdminReceiptServlet",
                data: {dataString: id, action: "display"},
                cache: false,
                success: function (html) {
                    $("#receiptdetail").html(html).fadeIn();

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status == 404) {
                        alert(thrownError);
                    }
                }
            });
        }
    });
});