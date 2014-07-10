(function() {
  $(function() {
    return $('body').fadeIn(1000, function() {
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
  });

}).call(this);
