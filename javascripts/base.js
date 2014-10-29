(function() {
  $(function() {
    var adjSize, iedetect, tournamentType;
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
    tournamentType = $('select#tournament').val();
    $('select#tournament').change(function() {
      if ($(this).val() === 'Select') {
        $('#choice1').find('option').remove();
        $('#choice3').find('option').remove();
      }
      if ($(this).val() === 'October Free Play') {
        $('#choice1').find('option').remove();
        $('#choice1').append('<option value="First Choice">First Choice');
        $('#choice1').append('<option value="Monday Night / 5v5 Men / Coed ">Monday Night / 5v5 Men / Coed </option>');
        $('#choice1').append('<option value="Wednesday Night / 5v5 Men / Coed">Wednesday Night / 5v5 Men / Coed</option>');
        $('#choice3').find('option').remove();
        $('#choice3').append('<option value="Second Choice">Second Choice');
        $('#choice3').append('<option value="Monday Night / 5v5 Men / Coed ">Monday Night / 5v5 Men / Coed </option>');
        $('#choice3').append('<option value="Wednesday Night / 5v5 Men / Coed">Wednesday Night / 5v5 Men / Coed</option>');
      }
      if ($(this).val() === 'Fall Registration') {
        $('#choice1').find('option').remove();
        $('#choice1').append('<option value="First Choice">First Choice');
        $('#choice1').append('<option value="Monday Night / 5v5 Men ">Monday Night / 5v5 Men </option>');
        $('#choice1').append('<option value="Tuesday Night / 5v5 Coed">Tuesday Night / 5v5 Coed</option>');
        $('#choice1').append('<option value="Wednesday Night/ 5v5 Men">Wednesday Night/ 5v5 Men</option>');
        $('#choice3').find('option').remove();
        $('#choice3').append('<option value="Second Choice">Second Choice');
        $('#choice3').append('<option value="Monday Night / 5v5 Men ">Monday Night / 5v5 Men </option>');
        $('#choice3').append('<option value="Tuesday Night / 5v5 Coed">Tuesday Night / 5v5 Coed</option>');
        $('#choice3').append('<option value="Wednesday Night/ 5v5 Men">Wednesday Night/ 5v5 Men</option>');
        return $('#form-container-last').show();
      }
    });
    $("#free_agent_btn").click(function() {
      var content, post_data, preferred_date, proceed, textArea, tournament_type, user_email, user_message, user_name, user_phone;
      tournament_type = $("select#tournament").val();
      user_name = $("input[name=name]").val();
      user_email = $("input[name=email]").val();
      user_phone = $("input[name=phone]").val();
      preferred_date = $("select#choice1").val();
      preferred_date = $("select#choice3").val();
      user_message = $("textarea[name=message]").val();
      proceed = true;
      content = "Tournament Type:" + " " + tournament_type + "\n \n" + "------------------------------------------" + "\n \n" + "Name:" + " " + user_name + "\n \n" + "------------------------------------------" + "\n \n" + "Email:" + " " + user_email + "\n \n" + "------------------------------------------" + "\n \n" + "Phone:" + " " + user_phone + "\n \n" + "------------------------------------------" + "\n \n" + "Preferred Date 1:" + " " + preferred_date + "\n \n" + "\n \n" + "------------------------------------------" + "\n \n" + "Preferred Date 2:" + " " + preferred_date2 + "\n \n";
      textArea = $("textarea[name=message]").val(content);
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
      if (preferred_date === "Choose") {
        $("select#choice1").css("border-color", "red");
        proceed = false;
      }
      if (choice1 === "Choose") {
        $("select#choice2").css("border-color", "red");
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
            $("#free-agent-form-container").fadeOut(function(e) {
              $("#form-success-message").fadeIn();
            });
          }
        }), "json");
      }
    });
    $("#registration_submit_btn").click(function() {
      var content, day, form0, form1, form2, form3, form4, form5, form6, form7, form8, form9, formct, manager_name, player1, player2, player3, player4, player5, player6, player7, player8, post_data, proceed, team_name, textArea, tournament_type, user_email, user_message, user_phone;
      tournament_type = $("select#tournament").val();
      team_name = $("input[name=team_name]").val();
      manager_name = $("input[name=manager_name]").val();
      user_email = $("input[name=email]").val();
      user_phone = $("input[name=phone]").val();
      day = $("select#choice1").val();
      user_message = $("textarea[name=message]").val();
      player1 = $("input[name=player1]").val();
      player2 = $("input[name=player2]").val();
      player3 = $("input[name=player3]").val();
      player4 = $("input[name=player4]").val();
      player5 = $("input[name=player5]").val();
      player6 = $("input[name=player6]").val();
      player7 = $("input[name=player7]").val();
      player8 = $("input[name=player8]").val();
      form0 = $("input[name=formnameon]").val();
      form1 = $("input[name=form1]").val();
      form2 = $("input[name=form2]").val();
      form3 = $("input[name=form3]").val();
      formct = $("select#cctnumber").val();
      form4 = $("input[name=bfname]").val();
      form5 = $("input[name=blname]").val();
      form6 = $("input[name=address]").val();
      form7 = $("input[name=city]").val();
      form8 = $("input[name=state]").val();
      form9 = $("input[name=zip]").val();
      proceed = true;
      content = "Tournament Type:" + " " + tournament_type + "\n \n" + "------------------------------------------" + "\n \n" + "Manager Name:" + " " + manager_name + "\n \n" + "------------------------------------------" + "\n \n" + "Team Name:" + " " + team_name + "\n \n" + "------------------------------------------" + "\n \n" + "Manager Email:" + " " + user_email + "\n \n" + "------------------------------------------" + "\n \n" + "Manager Phone:" + " " + user_phone + "\n \n" + "Day:" + " " + day + "\n \n" + "------------------------------------------" + "\n \n" + "PLAYERS:" + "\n \n" + "1. " + player1 + "\n \n" + "2. " + player2 + "\n \n" + "3. " + player3 + "\n \n" + "4. " + player4 + "\n \n" + "5. " + player5 + "\n \n" + "6. " + player6 + "\n \n" + "7. " + player7 + "\n \n" + "8. " + player8 + "\n \n" + "------------------------------------------" + "\n \n" + "CC INFO:" + "\n \n" + form0 + "\n \n" + form1 + "\n \n" + form2 + "\n \n" + form3 + "\n \n" + formct + "\n \n" + "------------------------------------------" + "\n \n" + "BILLING INFO:" + "\n \n" + form4 + "\n \n" + form5 + "\n \n" + form6 + "\n \n" + form7 + "\n \n" + form8 + "\n \n" + form9;
      textArea = $("textarea[name=message]").val(content);
      if (tournament_type === "Select") {
        $("select#tournament").css("border-color", "red");
        proceed = false;
      }
      if (team_name === "") {
        $("input[name=team_name]").css("border-color", "red");
        proceed = false;
      }
      if (manager_name === "") {
        $("input[name=manager_name]").css("border-color", "red");
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
      if (player1 === "") {
        $("input[name=player1]").css("border-color", "red");
        proceed = false;
      }
      if (player2 === "") {
        $("input[name=player2]").css("border-color", "red");
        proceed = false;
      }
      if (player3 === "") {
        $("input[name=player3]").css("border-color", "red");
        proceed = false;
      }
      if (player4 === "") {
        $("input[name=player4]").css("border-color", "red");
        proceed = false;
      }
      if (player5 === "") {
        $("input[name=player5]").css("border-color", "red");
        proceed = false;
      }
      if (proceed) {
        post_data = {
          userName: team_name,
          managerName: manager_name,
          userEmail: user_email,
          userMessage: user_message
        };
        $.post("registration_form.php", post_data, (function(response) {
          var output;
          if (response.type === "error") {
            output = "<div class=\"error\">" + response.text + "</div>";
          } else {
            output = "<div class=\"success\">" + response.text + "</div>";
            $("#team-registration-form").fadeOut(function(e) {
              $("#form-success-message").fadeIn();
            });
            $("#contact_form input").val("");
            $("#contact_form textarea").val("");
            $("#contact_form select").val("");
            $("#contact_form select").val("");
            $("#form-binfo input").val("");
            $("#form-container-last input").val("");
            $("#form-container-last select").val("");
          }
        }), "json");
        $("html, body").animate({
          scrollTop: 0
        }, "slow");
      }
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
      if (registrationType === "Fall Registration") {
        formContainer.show();
        return bformContainer.show();
      } else {
        formContainer.hide();
        return bformContainer.hide();
      }
    });
    return;
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
