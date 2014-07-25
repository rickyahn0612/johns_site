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

  # $("#submit_btn_registration_form").click ->

  #   #get input field values
  #   user_name = $("input[name=name]").val()
  #   user_email = $("input[name=email]").val()
  #   user_phone = $("input[name=phone]").val()
  #   user_message = $("textarea[name=message]").val()
    
  #   #simple validation at client's end
  #   #we simply change border color to red if empty field using .css()
  #   proceed = true
  #   if user_name is ""
  #     $("input[name=name]").css "border-color", "red"
  #     proceed = false
  #   if user_email is ""
  #     $("input[name=email]").css "border-color", "red"
  #     proceed = false
  #   if user_phone is ""
  #     $("input[name=phone]").css "border-color", "red"
  #     proceed = false
  #   if user_message is ""
  #     $("textarea[name=message]").css "border-color", "red"
  #     proceed = false
    
  #   #everything looks good! proceed...
  #   if proceed
      
  #     #data to be sent to server
  #     post_data =
  #       userName: user_name
  #       userEmail: user_email
  #       userPhone: user_phone
  #       userMessage: user_message

      
  #     #Ajax post data to server
  #     $.post "contact_me_test.php", post_data, ((response) ->
        
  #       #load json data from server and output message     
  #       if response.type is "error"
  #         output = "<div class=\"error\">" + response.text + "</div>"
  #       else
  #         output = "<div class=\"success\">" + response.text + "</div>"
          
  #         #reset values in all input fields
  #         $("#contact_form input").val ""
  #         $("#contact_form textarea").val ""
  #       $("#result").hide().html(output).slideDown()
  #       return
  #     ), "json"
  #   return


  # #reset previously set border colors and hide all message on .keyup()
  # $("#contact_form input, #contact_form textarea").keyup ->
  #   $("#contact_form input, #contact_form textarea").css "border-color", ""
  #   $("#result").slideUp()
  #   return





























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












  $("#free_agent_btn").click ->
    
    #get input field values
    tournament_type = $('select#tournament').val();
    user_name = $("input[name=name]").val()
    user_email = $("input[name=email]").val()
    user_phone = $("input[name=phone]").val()
    user_message = $("textarea[name=message]").val()
    
    #simple validation at client's end
    #we simply change border color to red if empty field using .css()
    proceed = true
    if tournament_type is "Select"
      $("select#tournament").css "border-color", "red"
      proceed = false
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
        userMessage: user_message

      
      #Ajax post data to server
      $.post "free_agent_form.php", post_data, ((response) ->
        
        #load json data from server and output message     
        if response.type is "error"
          output = "<div class=\"error\">" + response.text + "</div>"
        else
          output = "<div class=\"success\">" + response.text + "</div>"
          
          #reset values in all input fields
          $("#freeagent_form input").val ""
          $("#freeagent_form textarea").val ""
        $("#result").hide().html(output).slideDown()
        return
      ), "json"
    return


  #reset previously set border colors and hide all message on .keyup()
  $("#contact_form input, #contact_form textarea").keyup ->
    $("#contact_form input, #contact_form textarea").css "border-color", ""
    $("#result").slideUp()
    return

