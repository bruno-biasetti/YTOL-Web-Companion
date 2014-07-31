//JavaScript Document

$(document).on('ready page:load', function() {
	
	var ytolAppMain = {
		
		navDrawerWidth : 0,
		
		setupBodyHeight : function(){
			$('body').height($('html').height());
		},
		
		initNavDrawer : function(){
			/*Nav Init State*/
			this.navDrawerWidth = $('ul#nav-drawer-container').width();
			$('ul#nav-drawer-container').css('left', (this.navDrawerWidth*-1)+'px');
			$('div#nav-layer').hide();
			$('div#nav-drawer').addClass('nav-draw-closed');
			$('div#nav-drawer').css('display', 'none');
			
			/*Click Action Event*/
			$('div#action-bar li#call-nav-drawer a').click(function(event) {
				event.preventDefault();
				
				if ( $('div#nav-drawer').hasClass('nav-draw-closed') ){
					ytolAppMain.openNavDrawer();
				}else{
					ytolAppMain.closeNavDrawer();
				}
				
			});
			
			/*Arrow Controller*/
			this.navDrawLevelCtrl();
		},
		
		openNavDrawer : function(){
			$('div#nav-drawer').removeClass('nav-draw-closed');
			$('div#nav-drawer').addClass('nav-draw-open');
			$('div#nav-drawer').css('display', 'block');
			
			$('div#nav-layer').fadeIn('fast');
			
			$('ul#nav-drawer-container').animate({"left": "0px"}, "fast");
		},
		
		closeNavDrawer : function(){
			$('div#nav-drawer').removeClass('nav-draw-open');
			$('div#nav-drawer').addClass('nav-draw-closed');
			
			$('div#nav-layer').fadeOut('fast');
			
			$('ul#nav-drawer-container').animate({"left": (this.navDrawerWidth*-1)+"px"}, "fast", function() {
				$('div#nav-drawer').css('display', 'none');
			});
			
		},
		
		navDrawLevelCtrl : function(){
			$('ul#nav-drawer-container a.arrow-ctrl').each(function() {
				$(this).click(function(event) {
					event.preventDefault();

					var childList = $(this).parent('li').find('ul.sub-level:eq(0)');

					if ( childList.hasClass('closed') ){
						$(this).removeClass('arrow-down');
						$(this).addClass('arrow-up');
						ytolAppMain.navDrawLevelCtrlOpen(childList);
					}else{
						$(this).removeClass('arrow-up');
						$(this).addClass('arrow-down');
						ytolAppMain.navDrawLevelCtrlClose(childList);
					}
				});
			});
		},
		
		navDrawLevelCtrlOpen : function(childList){
			childList.slideDown('fast', function() {
				childList.removeClass('closed');
				childList.addClass('open');
			});
		},
		
		navDrawLevelCtrlClose : function(childList){
			childList.slideUp('fast', function() {
				childList.removeClass('open');
				childList.addClass('closed');
			});
			
		},
		
		setupNotifications : function(){
			var noticeTxt = $.trim($('.notice').text());
			if ( noticeTxt.length == 0 ) {
				$('.notice').hide()
			}else{
				$('.notice').delay(2000).fadeOut('slow');
			};
			
			var alertTxt = $.trim($('.alert').text());
			if ( alertTxt.length == 0 ) { 
				$('.alert').hide()
			}else{
				$('.alert').delay(2000).fadeOut('slow');
			};
		},
		
		setupActionList : function(){
			var hasActionList = $('.list-item-actions').length;
			if ( hasActionList > 0 ){
				$('.list-item-actions').hide();
				
				$('.circle-icon').click(function() {
					if ( $(this).hasClass('circle-uncheck') ){
						$(this).removeClass('circle-uncheck');
						$(this).addClass('circle-check');
						
						$(this).parent('li').find('.list-item-actions').slideDown('fast');
						
					}else{
						$(this).removeClass('circle-check');
						$(this).addClass('circle-uncheck');
						
						$(this).parent('li').find('.list-item-actions').slideUp('fast');
						
					};
				});
			};
		},
		
		setupMariaVideo : function(){
			var hasVideo = $('#video-container').length;
			if ( hasVideo > 0 ){
				$('#video-container').text("");
				$('#video-container').html('<iframe width="100%" height="auto" src="//www.youtube-nocookie.com/embed/z4yGHPRbjow?rel=0" frameborder="0" allowfullscreen></iframe>');
			};
		},
		
		setupLoadClick : function(){
			$('#load-click').hide();
			
			$('#nav-drawer a').click(function() {
				if ( !$(this).hasClass('arrow-ctrl') ){
					$('#load-click').show();
				};
			});
			
			$('#container-wrapper a').click(function() {
				$('#load-click').show();
			});
		},
		
		init : function(){
			this.setupBodyHeight();
			this.initNavDrawer();
			this.setupNotifications();
			this.setupActionList();
			this.setupMariaVideo();
			this.setupLoadClick();
		}
		
	};
	
	ytolAppMain.init();	
	
	document.addEventListener("page:restore", function() {
		ytolAppMain.setupLoadClick();
	});
	
});