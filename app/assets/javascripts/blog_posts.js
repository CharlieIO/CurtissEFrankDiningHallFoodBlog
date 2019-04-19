"use strict";

var blog_posts = (function() {
    // make any additional "private" function or variables here
    // var vote = function(Arg) {
    //   var data = Arg.detail[0];
    //   console.log(data)
    //   $('#upcount').text(data.up);
    //   $('#downcount').text(data.down);
    // };
    // console.log()
    var comment = function(Arg) {
      var event_detail = Arg.detail[2].responseText;
      console.log(event_detail)
      $("#comments ul").append(event_detail);
      $("#commentbox")[0].value = "";
    };

    return {
        init: function() {
          // $("a[data-remote]").bind("ajax:success", vote);
          $("form[data-remote]").on("ajax:success", comment);
            //
            // do any initialization for javascript here
            //


        },
    };

})();
$(blog_posts.init);
