/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




$(document).ready(function () {



    //mac dinh
    $.ajax({
        type: "GET",
        url: "content.jsp",
        data: {category: null, brand: null},
        cache: false,

        success: function (html) {

            $("#dynamicContent").html(html);
            $("#dynamicContent").jscroll({

                loadingHtml: '<img src="resources/images/Loading.gif" style="margin-left:250px;" alt="Loading" />Loading...',
                padding: -80,
                autoTrigger: false,
                refresh: true,
                nextSelector: 'a.next-selector:last'

            });
            
            
        },
        error: function (xhr, ajaxOptions, thrownError) {
            if (xhr.status == 404) {
                alert(thrownError);
            }
        },
        complete: function (html) {

        }
    });
    //mac dinh
    $.ajax({
        type: "GET",
        url: "recommendItem.jsp",
        data: {category: null, brand: null},
        cache: false,
        success: function (html) {

            $("#recommendit").html(html);
            $("#recommendit").fadeIn('slow');
        },
        error: function (xhr, ajaxOptions, thrownError) {
            if (xhr.status == 404) {
                alert(thrownError);
            }
        },
        complete: function (html) {
            
        }
    });

    //click vao category
    $('.hihi li').on('click', '.menuidcategory', function () {
        var cat = $(this).data("id");
        
        if (cat !== null) {
            
            $.ajax({
                type: "GET",
                url: "content.jsp",
                data: {category: cat, p: 1, brand: null},
                cache: false,

                success: function (html) {
                    
                    
                    $("#dynamicContent").html(html);
                    $("#dynamicContent").jscroll({

                loadingHtml: '<img src="resources/images/Loading.gif" style="margin-left:250px;" alt="Loading" />Loading...',
                padding: -80,
                autoTrigger: true,
                refresh: true,
                nextSelector: 'a.next-selector:last'

            });
                   
                    

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status == 404) {
                        alert(thrownError);
                    }
                },
                complete: function (html) {
                    



                }
            });
        }

    });

    //click vao category(recommendit)
    $('.hihi li').on('click', '.menuidcategory', function () {
        var cat = $(this).data("id");
        if (cat !== null) {

            $.ajax({
                type: "GET",
                url: "recommendItem.jsp",
                data: {category: cat},
                cache: false,
                success: function (html) {

                    $("#recommendit").html(html);
                    $("#recommendit").fadeIn('slow');
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status == 404) {
                        alert(thrownError);
                    }
                },
                complete: function (html) {

                }
            });
        }

    });

    //click vào brand
    $('.nav-stacked').on('click', '.menuidbrand', function () {
        var bra = $(this).data("id");
        if (bra !== null) {

            $.ajax({
                type: "GET",
                url: "content.jsp",
                data: {brand: bra, p: 1, category: null},
                cache: false,

                success: function (html) {

                    $("#dynamicContent").html(html);
                    $("#dynamicContent").jscroll({

                loadingHtml: '<img src="resources/images/Loading.gif" style="margin-left:250px;" alt="Loading" />Loading...',
                padding: -80,
                autoTrigger: false,
                refresh: true,
                nextSelector: 'a.next-selector:last'

            });

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status == 404) {
                        alert(thrownError);
                    }
                },
                complete: function (html) {



                }
            });
        }

    });
    //click vào brand(recommend it)
    $('.nav-stacked').on('click', '.menuidbrand', function () {
        var bra = $(this).data("id");
        if (bra !== null) {

            $.ajax({
                type: "GET",
                url: "recommendItem.jsp",
                data: {brand: bra},
                cache: false,
                success: function (html) {

                    $("#recommendit").html(html);
                    $("#recommendit").fadeIn('slow');
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status == 404) {
                        alert(thrownError);
                    }
                },
                complete: function (html) {

                }
            });
        }

    });

    //click để xem detail
    $(document).on('click', '.menudetail', function () {
        var detail = $(this).data("id");
        if (detail != null) {
            $.ajax({
                type: "GET",
                url: "detail.jsp",
                data: {productid: detail},
                cache: false,
                success: function (html) {

                    $("#dynamicContent").html(html);
                    $("html, body").animate({
                        scrollTop: 390
                    }, 1000);

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status == 404) {
                        alert(thrownError);
                    }
                },
                complete: function (html) {

                }
            });
        }

    });

    $(".search").keyup(function () {
        var dataString = $(this).val();

        if (dataString == '')
            jQuery("#divResult").fadeOut();
        else if ($.isNumeric(dataString) || /^[a-zA-Z\s]+$/.test(dataString) == false) {
            $("#searcherr").text("*letters only*");
        } else {
            $("#searcherr").text("");
            $.ajax({
                type: "POST",
                url: "searchContent.jsp",
                data: {dataString: dataString},
                cache: false,
                success: function (html) {
                    $("#divResult").html(html).fadeIn();

                },
                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status == 404) {
                        alert(thrownError);
                    }
                }
            });
        }
        return false;
    });
    $(document).on("click", "#divResult", function (e) {
        var $clicked = $(e.target);
        var name = $clicked.find('#proid').text();

        $.ajax({
            type: "GET",
            url: "detail.jsp",
            data: {productid: name},
            cache: false,
            success: function (html) {

                $("#dynamicContent").html(html);
                $("html, body").animate({
                    scrollTop: 390
                }, 1000);
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
    $(document).on("click", function (e) {
        var $clicked = $(e.target);
        if (!$clicked.hasClass("search")) {
            jQuery("#divResult").fadeOut();
            $(".search").html('');
        }
    });



});