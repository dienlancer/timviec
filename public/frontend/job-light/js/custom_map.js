(function($){
  "use strict";
  
  // Preloader 
	jQuery(window).on('load', function() {
		jQuery("#status").fadeOut();
		jQuery("#preloader").delay(350).fadeOut("slow");
	});
  
	// on ready function
	jQuery(document).ready(function($) {
	var $this = $(window);


	//show hide login form js
	$('#search_button').on("click", function(e) {
		$('#search_open').slideToggle();
		e.stopPropagation(); 
	});

	$(document).on("click", function(e){
		if(!(e.target.closest('#search_open'))){	
			$("#search_open").slideUp();   		
		}
   });
   
   // ===== Scroll to Top ==== 
$(window).scroll(function() {
    if ($(this).scrollTop() >= 100) {       
        $('#return-to-top').fadeIn(200);   
    } else {
        $('#return-to-top').fadeOut(200);  
    }
});
$('#return-to-top').on('click', function() {     
    $('body,html').animate({
        scrollTop : 0                
    }, 500);
});
   
   //------------------------ OWL JS Start --------------------//  
   $(document).ready(function(){                  
    $('.company-box-slider').owlCarousel({
      loop: true,
      margin: 10,
      autoplay:true,
      responsiveClass: true,
      smartSpeed: 1200,
      navText : ['Trước','Sau'],
      responsive: {
        0: {
          items: 1,
          nav: true
        },
        600: {
          items: 1,
          nav: true
        },
        1000: {
          items: 1,
          nav: true,
          loop: true,
          margin: 20
        }
      }
    })
  })            
   $(document).ready(function(){
    $(".banner").owlCarousel({
      autoplay:true,                    
      loop:true,
      margin:0,                        
      nav:false,            
      mouseDrag: true,
      touchDrag: true,                                
      responsiveClass:true,
      responsive:{
        0:{
          items:1
        },
        600:{
          items:1
        },
        1000:{
          items:1
        }
      }
    })
  })            
    $(document).ready(function() {
    $('.recruitment-related').owlCarousel({
      loop:true,
      margin: 10,
      autoplay:false,
      responsiveClass: true,
      smartSpeed: 1200,
      navText : ['<i class="fas fa-arrow-circle-left" aria-hidden="true"></i>','<i class="fas fa-arrow-circle-right" aria-hidden="true"></i>'],
      responsive: {
        0: {
          items: 1,
          nav: true
        },
        600: {
          items: 1,
          nav: true
        },
        1000: {
          items: 1,
          nav: true,
          loop: true,
          margin: 20
        }
      }
    })
  })             
   $(document).ready(function() {
    $('.attractive-recruitment').owlCarousel({
      loop:true,
      margin: 10,
      autoplay:false,
      responsiveClass: true,
      smartSpeed: 1200,
      navText : ['<i class="fas fa-arrow-circle-left" aria-hidden="true"></i>','<i class="fas fa-arrow-circle-right" aria-hidden="true"></i>'],
      responsive: {
        0: {
          items: 1,
          nav: true
        },
        600: {
          items: 1,
          nav: true
        },
        1000: {
          items: 1,
          nav: true,
          loop: true,
          margin: 20
        }
      }
    })
  })        
  $(document).ready(function() {
    $('.main-recruitment').owlCarousel({
      loop:true,
      margin: 10,
      autoplay:false,
      responsiveClass: true,
      smartSpeed: 1200,
      navText : ['<i class="fas fa-arrow-circle-left" aria-hidden="true"></i>','<i class="fas fa-arrow-circle-right" aria-hidden="true"></i>'],
      responsive: {
        0: {
          items: 1,
          nav: true
        },
        600: {
          items: 1,
          nav: true
        },
        1000: {
          items: 1,
          nav: true,
          loop: true,
          margin: 20
        }
      }
    })
  })          
  $(document).ready(function() {
    $('.main-category-article').owlCarousel({
      loop:true,
      margin: 10,
      autoplay:false,
      responsiveClass: true,
      smartSpeed: 1200,
      navText : ['<i class="fas fa-arrow-circle-left" aria-hidden="true"></i>','<i class="fas fa-arrow-circle-right" aria-hidden="true"></i>'],
      responsive: {
        0: {
          items: 1,
          nav: true
        },
        600: {
          items: 1,
          nav: true
        },
        1000: {
          items: 1,
          nav: true,
          loop: true,
          margin: 20
        }
      }
    })
  })          
   $(document).ready(function(){                  
    $('.high-salary-recruitment').owlCarousel({
      loop: true,
      margin: 10,
      autoplay:true,
      responsiveClass: true,
      smartSpeed: 1200,
      navText : ['<i class="fas fa-arrow-circle-left" aria-hidden="true"></i>','<i class="fas fa-arrow-circle-right" aria-hidden="true"></i>'],
      responsive: {
        0: {
          items: 1,
          nav: true
        },
        600: {
          items: 1,
          nav: true
        },
        1000: {
          items: 1,
          nav: true,
          loop: true,
          margin: 20
        }
      }
    })
  })   
   $(document).ready(function(){                 
    $('.interested-recruitment').owlCarousel({
      loop: true,
      margin: 10,
      autoplay:true,
      responsiveClass: true,
      smartSpeed: 1200,
      navText : ['<i class="fas fa-arrow-circle-left" aria-hidden="true"></i>','<i class="fas fa-arrow-circle-right" aria-hidden="true"></i>'],
      responsive: {
        0: {
          items: 1,
          nav: true
        },
        600: {
          items: 1,
          nav: true
        },
        1000: {
          items: 1,
          nav: true,
          loop: true,
          margin: 20
        }
      }
    })
  })                
   $(document).ready(function() {
              $('.jp_tittle_slider_content_wrapper .owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
				autoplay:true,
                responsiveClass: true,
				navText : ['<i class="fa fa-chevron-left" aria-hidden="true"></i>','<i class="fa fa-chevron-right" aria-hidden="true"></i>'],
				animateOut: 'bounceInDown',
				animateIn: 'bounceInDown',
                responsive: {
                  0: {
                    items: 1,
                    nav: true
                  },
                  600: {
                    items: 1,
                    nav: true
                  },
                  1000: {
                    items: 1,
                    nav: true,
                    loop: true,
                    margin: 20
                  }
                }
              })
            })
			
      
			
			$(document).ready(function() {
              $('.jp_hiring_slider_wrapper .owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
				autoplay:true,
                responsiveClass: true,
				smartSpeed: 1200,
				navText : ['<i class="fas fa-arrow-circle-left" aria-hidden="true"></i>','<i class="fas fa-arrow-circle-right" aria-hidden="true"></i>'],
                responsive: {
                  0: {
                    items: 1,
                    nav: true
                  },
                  600: {
                    items: 2,
                    nav: true
                  },
                  1000: {
                    items: 4,
                    nav: true,
                    loop: true,
                    margin: 20
                  }
                }
              })
            })
			// Featured Products Js
				/*$('.ss_featured_products .owl-carousel').owlCarousel({
					loop:true,
					margin:0,
					nav:true,
					autoplay:true,
					navText:["PREV" , "NEXT"],
					dots:true,
					smartSpeed: 1200,
					responsive:{
						0:{
							items:1
						},
						600:{
							items:1
						},
						1000:{
							items:1
						}
					}
				});*/
				
				
				$(document).ready(function() {
              $('.jp_spotlight_slider_wrapper .owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
				autoplay:true,
                responsiveClass: true,
				smartSpeed: 1200,
				navText : ['<i class="fas fa-arrow-circle-left" aria-hidden="true"></i>','<i class="fas fa-arrow-circle-right" aria-hidden="true"></i>'],
                responsive: {
                  0: {
                    items: 1,
                    nav: true
                  },
                  600: {
                    items: 1,
                    nav: true
                  },
                  1000: {
                    items: 1,
                    nav: true,
                    loop: true,
                    margin: 20
                  }
                }
              })
            })
			
      $(document).ready(function() {
              $('.employer-top-box .owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
        autoplay:true,
                responsiveClass: true,
        smartSpeed: 1200,
        navText : ['<i class="fas fa-arrow-circle-left" aria-hidden="true"></i>','<i class="fas fa-arrow-circle-right" aria-hidden="true"></i>'],
                responsive: {
                  0: {
                    items: 1,
                    nav: true
                  },
                  600: {
                    items: 1,
                    nav: true
                  },
                  1000: {
                    items: 1,
                    nav: true,
                    loop: true,
                    margin: 20
                  }
                }
              })
            })

			$(document).ready(function() {
              $('.jp_best_deal_slider_wrapper .owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
				autoplay:true,
                responsiveClass: true,
				smartSpeed: 1200,
				navText : ['<i class="fas fa-arrow-circle-left" aria-hidden="true"></i>','<i class="fas fa-arrow-circle-right" aria-hidden="true"></i>'],
                responsive: {
                  0: {
                    items: 1,
                    nav: true
                  },
                  600: {
                    items: 1,
                    nav: true
                  },
                  1000: {
                    items: 1,
                    nav: true,
                    loop: true,
                    margin: 20
                  }
                }
              })
            })
			
			$(document).ready(function() {
              $('.jp_client_slider_wrapper .owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
				autoplay:true,
                responsiveClass: true,
				smartSpeed: 1200,
				navText : ['<i class="fas fa-arrow-circle-left" aria-hidden="true"></i>','<i class="fas fa-arrow-circle-right" aria-hidden="true"></i>'],
                responsive: {
                  0: {
                    items: 1,
                    nav: true
                  },
                  600: {
                    items: 1,
                    nav: true
                  },
                  1000: {
                    items: 1,
                    nav: true,
                    loop: true,
                    margin: 20
                  }
                }
              })
            })
			
			//------------------------ OWL JS End--------------------//
			
			
	//-------------------------------------------------------
    // counter-section
    //-------------------------------------------------------
	
    $('.jp_counter_main_wrapper').on('inview', function(event, visible, visiblePartX, visiblePartY) {
        if (visible) {
            $(this).find('.timer').each(function () {
                var $this = $(this);
                $({ Counter: 0 }).animate({ Counter: $this.text() }, {
                    duration: 2000,
                    easing: 'swing',
                    step: function () {
                        $this.text(Math.ceil(this.Counter));
                    }
                });
            });
            $(this).off('inview');
        }
    });
   
   
   
	
	});
})();   