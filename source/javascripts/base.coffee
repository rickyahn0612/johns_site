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

  $("#owl-demo").owlCarousel({
    navigation : true
  })
