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