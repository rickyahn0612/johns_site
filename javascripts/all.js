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
    $("#submit_btn_registration_form").click(function() {
      var player1, player2, player3, player4, player5, post_data, proceed, team_manager, team_manager_email, team_manager_phone, team_name, tournament;
      tournament = $("#tournament_type").val();
      team_name = $("input[name=team_name]").val();
      team_manager = $("input[name=team_manager]").val();
      team_manager_email = $("input[name=team_manager_email]").val();
      team_manager_phone = $("input[name=team_manager_phone]").val();
      player1 = $("input[name=player1]").val();
      player2 = $("input[name=player2]").val();
      player3 = $("input[name=player3]").val();
      player4 = $("input[name=player4]").val();
      player5 = $("input[name=player5]").val();
      proceed = true;
      if (tournament === "") {
        $("#tournament_type").css("border-color", "red");
        proceed = false;
      }
      if (team_name === "") {
        $("input[name=team_name]").css("border-color", "red");
        proceed = false;
      }
      if (team_manager === "") {
        $("input[name=team_manager]").css("border-color", "red");
        proceed = false;
      }
      if (team_manager_email === "") {
        $("input[name=team_manager_email]").css("border-color", "red");
        proceed = false;
      }
      if (team_manager_phone === "") {
        $("input[name=team_manager_phone]").css("border-color", "red");
        proceed = false;
      }
      if (proceed) {
        post_data = {
          tournamentType: tournament,
          teamName: team_name,
          teamManager: team_manager,
          teamManagerEmail: team_manager_email,
          teamManagerPhone: team_manager_phone,
          player_1: player1,
          player_2: player2,
          player_3: player3,
          player_4: player4,
          player_5: player5
        };
        $.post("contact_me.php", post_data, (function(response) {
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
    return $("#contact_form input, #contact_form textarea").keyup(function() {
      $("#contact_form input, #contact_form textarea").css("border-color", "");
      $("#result").slideUp();
    });
  });

}).call(this);
