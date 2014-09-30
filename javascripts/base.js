(function() {
  $(function() {
    var adjSize, iedetect;
    $('body').fadeIn(1000, function() {
      return $('.banner-content-container #banner-main-header').animate({
        'top': 0,
        'opacity': 1
      }, function() {
        return $('.banner-content-container p').animate({
          'top': 0,
          'opacity': 1
        }, function() {
          return $('.banner-content-container .button-container a.btn-success').animate({
            'right': 0,
            'opacity': 1
          }, function() {
            return $('.banner-content-container .button-container a.btn-primary').animate({
              'left': 0,
              'opacity': 1
            });
          });
        });
      });
    });
    $('ul.main_nav li').mouseenter(function() {
      return $(this).addClass('active');
    });
    $('ul.main_nav li').mouseleave(function() {
      return $(this).removeClass('active');
    });
    $('.social_media li').mouseenter(function() {
      $(this).find('.fa-facebook').animate({
        'color': '#4964A1'
      }, 500);
      $(this).find('.fa-twitter').animate({
        'color': '#55ACEE'
      }, 500);
      $(this).find('.fa-instagram').animate({
        'color': '#AA8167'
      }, 500);
      return $(this).find('.fa-youtube').animate({
        'color': '#DF2826'
      }, 500);
    });
    $('.social_media li').mouseleave(function() {
      return $(this).find('.fa').animate({
        'color': '#fffff'
      }, 500);
    });
    $(".anchor_link").click(function() {
      var target;
      if (location.pathname.replace(/^\//, "") === this.pathname.replace(/^\//, "") && location.hostname === this.hostname) {
        target = $(this.hash);
        target = (target.length ? target : $("[name=" + this.hash.slice(1) + "]"));
        if (target.length) {
          $("html,body").animate({
            scrollTop: target.offset().top
          }, 1000);
          return false;
        }
      }
    });
    $('#tournament').change(function() {
      var bformContainer, formContainer, registrationType;
      registrationType = $('select#tournament').find(":selected").text();
      formContainer = $('#form-container-last');
      bformContainer = $('#form-binfo ');
      if (registrationType === "Winter Registration") {
        formContainer.show();
        return bformContainer.show();
      } else {
        formContainer.hide();
        return bformContainer.hide();
      }
    });
    return;
    $("#submit_btn").click(function() {
      var post_data, proceed, user_email, user_message, user_name, user_phone;
      user_name = $("input[name=name]").val();
      user_email = $("input[name=email]").val();
      user_phone = $("input[name=phone]").val();
      user_message = $("textarea[name=message]").val();
      proceed = true;
      if (user_name === "") {
        $("input[name=name]").css("border-color", "red");
        proceed = false;
      }
      if (user_email === "") {
        $("input[name=email]").css("border-color", "red");
        proceed = false;
      }
      if (user_phone === "") {
        $("input[name=phone]").css("border-color", "red");
        proceed = false;
      }
      if (user_message === "") {
        $("textarea[name=message]").css("border-color", "red");
        proceed = false;
      }
      if (proceed) {
        post_data = {
          userName: user_name,
          userEmail: user_email,
          userPhone: user_phone,
          userMessage: user_message
        };
        $.post("contact_me_test.php", post_data, (function(response) {
          var output;
          if (response.type === "error") {
            output = "<div class=\"error\">" + response.text + "</div>";
          } else {
            output = "<div class=\"success\">" + response.text + "</div>";
            $("#contact_form input").val("");
            $("#contact_form textarea").val("");
          }
          $("#result").hide().html(output).slideDown();
        }), "json");
      }
    });
    $("#contact_form input, #contact_form textarea").keyup(function() {
      $("#contact_form input, #contact_form textarea").css("border-color", "");
      $("#result").slideUp();
    });
    iedetect = function(v) {
      var r;
      r = RegExp("msie" + (!isNaN(v) ? "\\s" + v : ""), "i");
      return r.test(navigator.userAgent);
    };
    if (screen.width < 800 || iedetect(8) || iedetect(7) || "ontouchstart" in window) {
      (adjSize = function() {
        var $height, $width;
        $width = $(window).width();
        $height = $(window).height();
        $("#container").css({
          "background-image": "url(poster.jpg)",
          "background-size": "cover",
          width: $width + "px",
          height: $height + "px"
        });
        $("video").hide();
      })();
      $(window).resize(adjSize);
    } else {
      $(".banner_content iframe").on("loadedmetadata", function() {
        var $aspectRatio, $height, $vidheight, $vidwidth, $width;
        $width = void 0;
        $height = void 0;
        $vidwidth = this.videoWidth;
        $vidheight = this.videoHeight;
        $aspectRatio = $vidwidth / $vidheight;
        (adjSize = function() {
          var $adjRatio, $boxRatio, $vid;
          $width = $(window).width();
          $height = $(window).height();
          $boxRatio = $width / $height;
          $adjRatio = $aspectRatio / $boxRatio;
          $("#container").css({
            width: $width + "px",
            height: $height + "px"
          });
          if ($boxRatio < $aspectRatio) {
            $vid = $("#container video").css({
              width: $width * $adjRatio + "px"
            });
          } else {
            $vid = $("#container video").css({
              width: $width + "px"
            });
          }
        })();
        $(window).resize(adjSize);
      });
    }
  });

  $(window).scroll(function() {
    var state, winScroll;
    winScroll = $(window).scrollTop();
    if (winScroll > 90) {
      $('#fixed_header').slideDown();
      $('#fixed_header .logo').animate({
        'font-size': '19px'
      }, 500);
    }
    if (winScroll < 90) {
      $('#fixed_header').slideUp();
      state = false;
    }
    if (winScroll > 800) {
      return $('#uparrow').fadeIn(1000);
    } else {
      return $('#uparrow').fadeOut(1000);
    }
  });

}).call(this);
