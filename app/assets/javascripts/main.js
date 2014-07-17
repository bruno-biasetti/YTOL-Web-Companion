//JavaScript Document

$(document).on('ready page:load', function() {
	
	var ytolAppMain = {
		
		navDrawerWidth : 0,
		
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
			if ( noticeTxt.length == 0 ) { $('.notice').hide() };
			
			var alertTxt = $.trim($('.alert').text());
			if ( alertTxt.length == 0 ) { $('.alert').hide() };
		},
		
		init : function(){
			this.initNavDrawer();
			this.setupNotifications();
		}
		
	};
	
	ytolAppMain.init();
	
});
