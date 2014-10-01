$ ->

  $('body').fadeIn(1000, ->
  	$('.banner-content-container #banner-main-header').animate({'top': 0, 'opacity': 1}, ->
      $('.banner-content-container p').animate({'top': 0, 'opacity': 1}, ->
        $('.banner-content-container .button-container a.btn-success').animate({'right': 0,  'opacity': 1}, ->
          $('.banner-content-container .button-container a.btn-primary').animate({'left': 0, 'opacity': 1})

        )
      )
    )
  )

  $("#free_agent_btn").click ->
    
    #get input field values
    tournament_type = $("select#tournament").val()
    user_name = $("input[name=name]").val()
    user_email = $("input[name=email]").val()
    user_phone = $("input[name=phone]").val()
    preferred_date = $("select#choice1").val()
    user_message = $("textarea[name=message]").val()
    
    #simple validation at client's end
    #we simply change border color to red if empty field using .css()
    proceed = true
    content = "Tournament Type:" + " " + tournament_type + "\n \n" + "------------------------------------------" + "\n \n" + "Name:" + " " + user_name + "\n \n" + "------------------------------------------" + "\n \n" + "Email:" + " " + user_email + "\n \n" + "------------------------------------------" + "\n \n" + "Phone:" + " " + user_phone + "\n \n" + "------------------------------------------" + "\n \n" + "Choice 1:" + " " + preferred_date + "\n \n"
    textArea = $("textarea[name=message]").val(content)
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
    if choice1 is "Choose"
      $("select#choice1").css "border-color", "red"
      proceed = false
    if choice1 is "Choose"
      $("select#choice2").css "border-color", "red"
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
          $("#free-agent-form-container").fadeOut (e) ->
            $("#form-success-message").fadeIn()
            return
        return
      ), "json"
    return




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

  $(".anchor_link").click ->
    if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
      target = $(@hash)
      target = (if target.length then target else $("[name=" + @hash.slice(1) + "]"))
      if target.length
        $("html,body").animate
          scrollTop: target.offset().top
        , 1000
        false


  $('#tournament').change ->
    registrationType = $('select#tournament').find(":selected").text()
    formContainer = $('#form-container-last')
    bformContainer = $('#form-binfo ')
    
    if registrationType == "Winter Registration"
      formContainer.show()
      bformContainer.show()
    else
      formContainer.hide()
      bformContainer.hide()


  return

  # $("#submit_btn").click ->
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












  # $("#free_agent_btn").click ->
    
  #   #get input field values
  #   tournament_type = $('select#tournament').val();
  #   user_name = $("input[name=name]").val()
  #   user_email = $("input[name=email]").val()
  #   user_phone = $("input[name=phone]").val()
  #   user_message = $("textarea[name=message]").val()
    
  #   #simple validation at client's end
  #   #we simply change border color to red if empty field using .css()
  #   proceed = true
  #   if tournament_type is "Select"
  #     $("select#tournament").css "border-color", "red"
  #     proceed = false
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
  #       userMessage: user_message

      
  #     #Ajax post data to server
  #     $.post "free_agent_form.php", post_data, ((response) ->
        
  #       #load json data from server and output message     
  #       if response.type is "error"
  #         output = "<div class=\"error\">" + response.text + "</div>"
  #       else
  #         output = "<div class=\"success\">" + response.text + "</div>"
          
  #         #reset values in all input fields
  #         $("#freeagent_form input").val ""
  #         $("#freeagent_form textarea").val ""
  #       $("#result").hide().html(output).slideDown()
  #       return
  #     ), "json"
  #   return


  # #reset previously set border colors and hide all message on .keyup()
  # $("#contact_form input, #contact_form textarea").keyup ->
  #   $("#contact_form input, #contact_form textarea").css "border-color", ""
  #   $("#result").slideUp()
  #   return  
  # IE detect
  iedetect = (v) ->
    r = RegExp("msie" + ((if not isNaN(v) then ("\\s" + v) else "")), "i")
    r.test navigator.userAgent
  
  # For mobile screens, just show an image called 'poster.jpg'. Mobile
  # screens don't support autoplaying videos, or for IE.
  if screen.width < 800 or iedetect(8) or iedetect(7) or "ontouchstart" of window
    (adjSize = -> # Create function called adjSize
      $width = $(window).width() # Width of the screen
      $height = $(window).height() # Height of the screen
      
      # Resize image accordingly
      $("#container").css
        "background-image": "url(poster.jpg)"
        "background-size": "cover"
        width: $width + "px"
        height: $height + "px"

      
      # Hide video
      $("video").hide()
      return
    )() # Run instantly
    
    # Run on resize too
    $(window).resize adjSize
  else
    
    # Wait until the video meta data has loaded
    $(".banner_content iframe").on "loadedmetadata", ->
      $width = undefined # Width and height of screen
      $height = undefined
      $vidwidth = @videoWidth # Width of video (actual width)
      $vidheight = @videoHeight # Height of video (actual height)
      $aspectRatio = $vidwidth / $vidheight # The ratio the video's height and width are in
      (adjSize = -> # Create function called adjSize
        $width = $(window).width() # Width of the screen
        $height = $(window).height() # Height of the screen
        $boxRatio = $width / $height # The ratio the screen is in
        $adjRatio = $aspectRatio / $boxRatio # The ratio of the video divided by the screen size
        
        # Set the container to be the width and height of the screen
        $("#container").css
          width: $width + "px"
          height: $height + "px"

        if $boxRatio < $aspectRatio # If the screen ratio is less than the aspect ratio..
          # Set the width of the video to the screen size multiplied by $adjRatio
          $vid = $("#container video").css(width: $width * $adjRatio + "px")
        else
          
          # Else just set the video to the width of the screen/container
          $vid = $("#container video").css(width: $width + "px")
        return
      )() # Run function immediately
      
      # Run function also on window resize.
      $(window).resize adjSize
      return

  return


$(window).scroll ->
  winScroll = $(window).scrollTop()
  if winScroll > 90 
    $('#fixed_header').slideDown()
    $('#fixed_header .logo').animate({'font-size': '19px'}, 500)
  if winScroll < 90 
    $('#fixed_header').slideUp()
    state = false
  if winScroll > 800
    $('#uparrow').fadeIn(1000);
  else
    $('#uparrow').fadeOut(1000);    
