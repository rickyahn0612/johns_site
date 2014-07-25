(function() {
  $(function() {
    $('body').fadeIn(1000, function() {
      return $('.banner_content h2').animate({
        'bottom': 480,
        'opacity': 1
      }, function() {
        return $('.banner_content h1').animate({
          'bottom': 420,
          'opacity': 1
        }, function() {
          return $('.banner_content #line').animate({
            'top': 50,
            'opacity': 1
          }, function() {
            return $('.banner_content p').animate({
              'bottom': 340,
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
    $("#free_agent_btn").click(function() {
      var post_data, proceed, tournament_type, user_email, user_message, user_name, user_phone;
      tournament_type = $('select#tournament').val();
      user_name = $("input[name=name]").val();
      user_email = $("input[name=email]").val();
      user_phone = $("input[name=phone]").val();
      user_message = $("textarea[name=message]").val();
      proceed = true;
      if (tournament_type === "Select") {
        $("select#tournament").css("border-color", "red");
        proceed = false;
      }
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
          userMessage: user_message
        };
        $.post("free_agent_form.php", post_data, (function(response) {
          var output;
          if (response.type === "error") {
            output = "<div class=\"error\">" + response.text + "</div>";
          } else {
            output = "<div class=\"success\">" + response.text + "</div>";
            $("#freeagent_form input").val("");
            $("#freeagent_form textarea").val("");
          }
          $("#result").hide().html(output).slideDown();
        }), "json");
      }
    });
    return $("#contact_form input, #contact_form textarea").keyup(function() {
      $("#contact_form input, #contact_form textarea").css("border-color", "");
      $("#result").slideUp();
    });
  });

}).call(this);
