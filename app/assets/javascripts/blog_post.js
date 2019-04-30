"use strict";
// window.$ = window.jQuery = require('jquery'); // not sure if you need this at all
// window.Bootstrap = require('bootstrap');
console.log()
var blog_posts = (function() {
    var comment = function(Arg) {
      var event_detail = Arg.detail[2].responseText;
      console.log(event_detail)
      $("#comments ul").append(event_detail);
      $("#commentbox")[0].value = "";
    };

    return {
        init: function() {
          $("form[data-remote]").on("ajax:success", comment);
        }
    };

})();
$(window).load(function() {
    var scrollup = (function() {
        
            
            // if (jQuery(this).scrollTop() < 100) {
            //     jQuery(".scrollToTop").fadeOut(0);
            // }

        // if (jQuery(this).scrollTop() >= 300) {
        jQuery(".scrollToTop").fadeIn(1000);
        jQuery(".scrollToTop").click(function() {
            jQuery('html, body').animate({scrollTop : 0}, 50);
        });
                // jQuery('html, body').animate({scrollTop : 0}, 500);
            
            // else {
            //     return false;
            // }
        // }
        
    })();
});
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
$(blog_posts.init);
