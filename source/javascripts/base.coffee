$ ->
  $('body').fadeIn(1000, ->
  	$('.banner_content h2').animate({'bottom': 480, 'opacity': 1}, ->
      $('.banner_content h1').animate({'bottom': 420, 'opacity': 1}, ->
        $('.banner_content #line').animate({'top': 50,  'opacity': 1}, ->
          $('.banner_content p').animate({'bottom': 340, 'opacity': 1})

        )
      )
    )
  )
  $('ul.main_nav li').mouseenter ->
    $(@).addClass('active')

  $('ul.main_nav li').mouseleave ->
    $(@).removeClass('active')

  $('.social_media li').mouseenter ->
    $(@).find('.fa-facebook').animate({'color': '#4964A1'}, 500);
    $(@).find('.fa-twitter').animate({'color': '#55ACEE'}, 500);
    $(@).find('.fa-instagram').animate({'color': '#AA8167'}, 500);
    $(@).find('.fa-youtube').animate({'color': '#DF2826'}, 500);
  $('.social_media li').mouseleave ->
    $(@).find('.fa').animate({'color': '#fffff'}, 500);

  $("#submit_btn_registration_form").click ->

    #get input field values
    tournament = $("#tournament_type").val()
    team_name = $("input[name=team_name]").val()
    team_manager = $("input[name=team_manager]").val()
    team_manager_email = $("input[name=team_manager_email]").val()
    team_manager_phone = $("input[name=team_manager_phone]").val()
    player1 = $("input[name=player1]").val()
    player2 = $("input[name=player2]").val()
    player3 = $("input[name=player3]").val()
    player4 = $("input[name=player4]").val()
    player5 = $("input[name=player5]").val()
    
    #simple validation at client's end
    #we simply change border color to red if empty field using .css()
    proceed = true
    if tournament is ""
      $("#tournament_type").css "border-color", "red"
      proceed = false
    if team_name is ""
      $("input[name=team_name]").css "border-color", "red"
      proceed = false
    if team_manager is ""
      $("input[name=team_manager]").css "border-color", "red"
      proceed = false
    if team_manager_email is ""
      $("input[name=team_manager_email]").css "border-color", "red"
      proceed = false
    if team_manager_phone is ""
      $("input[name=team_manager_phone]").css "border-color", "red"
      proceed = false
    
    #everything looks good! proceed...
    if proceed
      
      #data to be sent to server
      post_data =
        tournamentType: tournament
        teamName: team_name
        teamManager: team_manager
        teamManagerEmail: team_manager_email
        teamManagerPhone: team_manager_phone
        player_1: player1
        player_2: player2
        player_3: player3
        player_4: player4
        player_5: player5
      
      #Ajax post data to server
      $.post "contact_me.php", post_data, ((response) ->
        
        #load json data from server and output message     
        if response.type is "error"
          output = "<div class=\"error\">" + response.text + "</div>"
        else
          output = "<div class=\"success\">" + response.text + "</div>"
          
          #reset values in all input fields
          $("#contact_form input").val ""
          $("#contact_form textarea").val ""
        $("#result").hide().html(output).slideDown()
        return
      ), "json"
    return


  #reset previously set border colors and hide all message on .keyup()
  $("#contact_form input, #contact_form textarea").keyup ->
    $("#contact_form input, #contact_form textarea").css "border-color", ""
    $("#result").slideUp()
    return


  $("#submit_btn").click ->
    
    #get input field values
    user_name = $("input[name=name]").val()
    user_email = $("input[name=email]").val()
    user_phone = $("input[name=phone]").val()
    user_message = $("textarea[name=message]").val()
    
    #simple validation at client's end
    #we simply change border color to red if empty field using .css()
    proceed = true
    if user_name is ""
      $("input[name=name]").css "border-color", "red"
      proceed = false
    if user_email is ""
      $("input[name=email]").css "border-color", "red"
      proceed = false
    if user_phone is ""
      $("input[name=phone]").css "border-color", "red"
      proceed = false
    if user_message is ""
      $("textarea[name=message]").css "border-color", "red"
      proceed = false
    
    #everything looks good! proceed...
    if proceed
      
      #data to be sent to server
      post_data =
        userName: user_name
        userEmail: user_email
        userPhone: user_phone
        userMessage: user_message

      
      #Ajax post data to server
      $.post "contact_me_test.php", post_data, ((response) ->
        
        #load json data from server and output message     
        if response.type is "error"
          output = "<div class=\"error\">" + response.text + "</div>"
        else
          output = "<div class=\"success\">" + response.text + "</div>"
          
          #reset values in all input fields
          $("#contact_form input").val ""
          $("#contact_form textarea").val ""
        $("#result").hide().html(output).slideDown()
        return
      ), "json"
    return


  #reset previously set border colors and hide all message on .keyup()
  $("#contact_form input, #contact_form textarea").keyup ->
    $("#contact_form input, #contact_form textarea").css "border-color", ""
    $("#result").slideUp()
    return

