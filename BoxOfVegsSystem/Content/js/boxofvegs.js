/*==================================
    Wow- animation reveal on scroll
====================================*/
$(function () {
    new WOW().init();
});
/*==================================
                Navgation
====================================*/
$(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() < 50) {
            $("#bov-usr-nav").removeClass("boxofveg-top-nav");
        } else {
            $("#bov-usr-nav").addClass("boxofveg-top-nav");
        }
    });
});
/*==================================
Add and remove active class on click
====================================*/
$(function () {
    $('.nav-item a').filter(function () {
        return this.href == location.href
    }).parent().addClass('active').siblings().removeClass('active')
});
/*==================================
                Logo
====================================*/
/* change logo on mouse hover*/
$(function () {
    $(".logo").hover(function () {
        $(this).attr("src", "../Content/images/whitelogo.png");
    },
        function () {
            $(this).attr("src", "../Content/images/logo.png");
        })
});
/*==================================
         owl carousel slider
====================================*/
$(function () {
    //owl carousel categories slider
    $("#bov-slide-carousel").owlCarousel({
        items: 1,
        dots: false,
        nav: true,
        navText: ['<i class="far fa-arrow-alt-circle-left d-flex align-items-center"></i>', '<i class="far fa-arrow-alt-circle-right d-flex align-items-center"></i>'],
        autoplay: true,
        loop: true,
        smartSpeed: 450,
        autoplayHoverPause: true,
        animateIn: 'flipInX',
        animateOut: 'slideOutDown'
    });
    // magnific popup- it opens up the image by clicking on it
    $(".img-block").magnificPopup({
        //child items selector
        delegate: 'a',
        type: 'image',
        gallery: {
            enabled: true
        }
    });
});
/*==================================
            scrolling up
====================================*/
$(window).scroll(function () {
    var height = $(window).scrollTop();
    if (height > 100) {
        $("#scroll-up").fadeIn();
    } else {
        $("#scroll-up").fadeOut();
    }
});
$(function () {
    $("a.smooth-scroll").click(function () {
        event.preventDefault();
        $("html,body").animate({
            scrollTop: 0
        }, 1250, "easeInOutExpo");
    });
});
/*==============================================
    shop sidebar fixed position open and close
===============================================*/
(function ($) {
    function mediaSize() {
        if (window.matchMedia('(min-width:1200px)').matches) {
            $('#bov-shop-layout #bov-shop-sidebar ').removeClass('fixed')
            $('#bov-shop-layout #bov-shop-sidebar ').removeAttr("style");
            $('#sidebar-close-btn').hide()
            $('#show-sidebar').hide()
            $('.shop-products-top .col-4.text-right.hide-show').hide()
            $('#bov-shop-layout .sidebar-background').hide()
        } else {
            $('#bov-shop-layout #bov-shop-sidebar ').addClass('fixed')
            $('#bov-shop-layout .sidebar-background').hide()
            $('#sidebar-close-btn').show()
            $('#show-sidebar').show()
            $('.shop-products-top .col-4.text-right.hide-show').show()
        }
    };
    mediaSize();
    window.addEventListener('resize', mediaSize, false);
})(jQuery);
// sidebar show hide button controls
function sidebarBtnControl() {
    $('#show-sidebar').on('click', function (event) {
        event.preventDefault();
        $('#bov-shop-layout #bov-shop-sidebar').css({
            left: '0',
            visibility: 'visible'
        });
        $('#bov-shop-layout .sidebar-background').css({
            display: 'block'
        });
    });
    $('#sidebar-close-btn').on('click', function (envent) {
        event.preventDefault();
        $('#bov-shop-layout #bov-shop-sidebar').css({
            left: '-100%',
            visibility: 'hidden'
        });
        $('#bov-shop-layout .sidebar-background').css({
            display: 'none'
        });
    });
}
sidebarBtnControl()
/*==================================
            product rating
====================================*/
$(function () {
    $("#product-rating").rateYo({
        rating: 5,
        numStars: 5,
        maxValue: 5,
        halfstar: true,
        starWidth: "13px"
    });
    $(".user-rated").rateYo({
        rating: 5,
        numStars: 5,
        maxValue: 5,
        halfstar: true,
        starWidth: "13px"
    });
    $("#add-rate").rateYo({
        rating: 5,
        numStars: 5,
        maxValue: 5,
        halfstar: true,
        starWidth: "15px"
    });
});
/*==================================
            shop detail zoom
====================================*/
$('#product-detail .product-img-block').zoom({})
/*==================================
    Admin Panel sidebar toggle
====================================*/
$(function () {
    //Toggle side navigation
    $("#sidebarToggler").on('click', function (e) {
        e.preventDefault();
        $("#sidebar-content-wrapper").toggleClass("toggled");
        $("#admin-footer").toggleClass("toggled");
        $(".sidebar").toggleClass("toggled");
    });
});
/*==================================
    Bootstrap data tables
====================================*/
$(function () {
    $("#datatable").DataTable({
        "pagingType": "full_numbers",
        "oLanguage": {
            "oPaginate": {
                "sFirst": "<<",
                "sPrevious": "<",
                "sNext": ">",
                "sLast": ">>"
            }

        }
    });
});
/*==================================
    display image preview on change
====================================*/
function onchangeUrl(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#image-prev').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}