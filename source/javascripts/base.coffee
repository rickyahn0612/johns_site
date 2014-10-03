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

  tournamentType = $('select#tournament').val()
  

  $('select#tournament').change ->
    if $(this).val() == 'Select'
      $('#choice1').find('option').remove()
    if $(this).val() == 'October Free Play'
      $('#choice1').find('option').remove()
      $('#choice1').append('<option value="Monday Night / 5v5 men ">Monday Night / 5v5 men </option>')
      $('#choice1').append('<option value="Tuesday Night / 5v5 Coed">Tuesday Night / 5v5 Coed</option>')

    if $(this).val() == 'Winter Registration'
      $('#choice1').find('option').remove()
      $('#choice1').append('<option value="Monday Night / 5v5 men ">Monday Night / 5v5 men </option>')
      $('#choice1').append('<option value="Tuesday Night / 5v5 Coed">Tuesday Night / 5v5 Coed</option>')
      $('#choice1').append('<option value="Wednesday Night/ 5v5 Men">Wednesday Night/ 5v5 Men</option>')

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
    if preferred_date is "Choose"
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









  $("#registration_submit_btn").click ->
    
    #get input field values
    tournament_type = $("select#tournament").val()
    team_name = $("input[name=team_name]").val()
    manager_name = $("input[name=manager_name]").val()
    user_email = $("input[name=email]").val()
    user_phone = $("input[name=phone]").val()
    day = $("select#choice1").val()
    user_message = $("textarea[name=message]").val()
    player1 = $("input[name=player1]").val()
    player2 = $("input[name=player2]").val()
    player3 = $("input[name=player3]").val()
    player4 = $("input[name=player4]").val()
    player5 = $("input[name=player5]").val()
    player6 = $("input[name=player6]").val()
    player7 = $("input[name=player7]").val()
    player8 = $("input[name=player8]").val()
    form0 = $("input[name=formnameon]").val()
    form1 = $("input[name=form1]").val()
    form2 = $("input[name=form2]").val()
    form3 = $("input[name=form3]").val()
    formct = $("select#cctnumber").val()
    form4 = $("input[name=bfname]").val()
    form5 = $("input[name=blname]").val()
    form6 = $("input[name=address]").val()
    form7 = $("input[name=city]").val()
    form8 = $("input[name=state]").val()
    form9 = $("input[name=zip]").val()
    
    #simple validation at client's end
    #we simply change border color to red if empty field using .css()
    proceed = true
    content = "Tournament Type:" + " " + tournament_type + "\n \n" + "------------------------------------------" + "\n \n" + "Manager Name:" + " " + manager_name + "\n \n" + "------------------------------------------" + "\n \n" + "Team Name:" + " " + team_name + "\n \n" + "------------------------------------------" + "\n \n" + "Manager Email:" + " " + user_email + "\n \n" + "------------------------------------------" + "\n \n" + "Manager Phone:" + " " + user_phone + "\n \n" + "Day:" + " " + day + "\n \n" + "------------------------------------------" + "\n \n" + "PLAYERS:" + "\n \n" + "1. " + player1 + "\n \n" + "2. " + player2 + "\n \n" + "3. " + player3 + "\n \n" + "4. " + player4 + "\n \n" + "5. " + player5 + "\n \n" + "6. " + player6 + "\n \n" + "7. " + player7 + "\n \n" + "8. " + player8 + "\n \n" + "------------------------------------------" + "\n \n" + "CC INFO:" + "\n \n" + form0 + "\n \n" + form1 + "\n \n" + form2 + "\n \n" + form3 + "\n \n" + formct + "\n \n" + "------------------------------------------" + "\n \n" + "BILLING INFO:" + "\n \n" + form4 + "\n \n" + form5 + "\n \n" + form6 + "\n \n" + form7 + "\n \n" + form8 + "\n \n" + form9
    textArea = $("textarea[name=message]").val(content)
    if tournament_type is "Select"
      $("select#tournament").css "border-color", "red"
      proceed = false
    if team_name is ""
      $("input[name=team_name]").css "border-color", "red"
      proceed = false
    if manager_name is ""
      $("input[name=manager_name]").css "border-color", "red"
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
    if player1 is ""
      $("input[name=player1]").css "border-color", "red"
      proceed = false
    if player2 is ""
      $("input[name=player2]").css "border-color", "red"
      proceed = false
    if player3 is ""
      $("input[name=player3]").css "border-color", "red"
      proceed = false
    if player4 is ""
      $("input[name=player4]").css "border-color", "red"
      proceed = false
    if player5 is ""
      $("input[name=player5]").css "border-color", "red"
      proceed = false
    
    #everything looks good! proceed...
    if proceed
      
      #data to be sent to server
      post_data =
        userName: team_name
        managerName: manager_name
        userEmail: user_email
        userMessage: user_message

      
      #Ajax post data to server
      $.post "registration_form.php", post_data, ((response) ->
        
        #load json data from server and output message     
        if response.type is "error"
          output = "<div class=\"error\">" + response.text + "</div>"
        else
          output = "<div class=\"success\">" + response.text + "</div>"
          $("#team-registration-form").fadeOut (e) ->
            $("#form-success-message").fadeIn()
            return

          
          #reset values in all input fields
          $("#contact_form input").val ""
          $("#contact_form textarea").val ""
          $("#contact_form select").val ""
          $("#contact_form select").val ""
          $("#form-binfo input").val ""
          $("#form-container-last input").val ""
          $("#form-container-last select").val ""
        return
      ), "json"
      $("html, body").animate
        scrollTop: 0
      , "slow"
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
