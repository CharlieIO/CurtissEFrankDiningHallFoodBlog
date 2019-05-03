"use strict";
// window.$ = window.jQuery = require('jquery'); // not sure if you need this at all
// window.Bootstrap = require('bootstrap');
console.log()
var blog_posts = (function() {
    var comment = function(Arg) {
      var event_detail = Arg.detail[2].responseText;
      console.log(event_detail)
      $("#comments li").append(event_detail);
      $("#commentbox")[0].value = "";
    //   location.href.pathname;
    };

    return {
        init: function() {
          $("form[data-remote]").on("ajax:success", comment);
        }
    };

})();

$(blog_posts.init);

$(window).on('load', function() {
    var scrollup = (function() {
        jQuery(".scrollToTop").fadeIn(1000);
        jQuery(".scrollToTop").click(function() {
            jQuery('html, body').animate({scrollTop : 0}, 50);
        });  
    })();
});

// $(window).on('load', function() {
//     var wrap = (function(){
//         $('.identity, .navbar-link_in, .navbar-link_up').wrapAll('<div class="wrapper"/>')
//     })();
// });


$(window).on('load', function() {
    var noticeButton = (function() {

        function sleep (time) {
            return new Promise((resolve) => setTimeout(resolve, time));
        }

        if ($('.message').css('display') == 'none') {
            $('.message').fadeIn(2000);
            $('.message').fadeOut(2000);
            sleep(4000).then(() => {
                document.getElementById("notice").remove(".message");
            });
        }

        else if ($('.message_warning').css('display') == 'none') {
            $('.message_warning').fadeIn(2000);
            $('.message_warning').fadeOut(2000);
            sleep(4000).then(() => {
                document.getElementById("notice").remove(".message_warning");
            });
        };
    })();
});

$(window).on('load', function() {
    var newblogbutton = (function() {
        if (document.getElementById("newbutton")) {
            document.getElementById("newbutton").onclick = function () {
                location.href = "/blog_posts/new";
            };
        }

        if (document.getElementById("headertitle")) {
            document.getElementById("headertitle").onclick = function () {
                location.href = "/blog_posts/";
            };
        };

        // if (document.getElementsByTagName("input")) {
        //     document.getElementsByTagName("input").onclick = function () {
        //         window.location.reload(true);
        //     };
        // };
    })();
});


window.onscroll = function() {scrollStat()};

function scrollStat() {
  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  var scrolled = (winScroll / height) * 100;
  document.getElementById("myBar").style.width = scrolled + "%";
}
// $(noticeButton);
// $(scrollup);

// console.log()
// $(document).ready(function() {
//     // $(window).scroll(function(){
//     //     if ($(this).scrollTop() > 1) {
//     //         $(".scrollToTop").fadeIn(1000)
//     //     } 
//     //     else {
//     //         $(".scrollToTop").fadeOut(1000);
//     //     }
//     // });

//     //Click event to scroll to top
//     $(".scrollToTop").click(function(){
//         $('html, body').animate({scrollTop : 0},500);
//         return false;
//     });
// })();

