var base_url = window.location.origin + '';

header();
footer();

$(function(){
	backToTop();

	/* navbar fly shadow */
	$(window).on('scroll', function () {
		var elem = 'header.parent';
		var act = 'fly';
		if($(window).width() <= 991){
			if ($(this).scrollTop() > 30) {
				if (!$(elem).hasClass(act)) { $(elem).addClass(act); }
			} else {
				if ($(elem).hasClass(act)) { $(elem).removeClass(act); }
			}
		}else{
			$(elem).removeClass(act);
		}
	});

	/*tawk to*/
	var tawk =
	'<!--Start of Tawk.to Script-->' +
	'<script type="text/javascript">' +
	'var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();' +
	'(function(){' +
	'var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];' +
	's1.async=true;' +
	's1.src="https://embed.tawk.to/5a377882f4461b0b4ef89517/default";' +
	's1.charset="UTF-8";' +
	's1.setAttribute("crossorigin","*");' +
	's0.parentNode.insertBefore(s1,s0);' +
	'})();' +
	'</script>' +
	'<!--End of Tawk.to Script-->';

	$("body").append(tawk);
});

function r_setCookie(cname,cvalue,exdays="1") {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = "TULISAN_" + cname + "=" + cvalue + ";" + expires + ";path=/";
}

function r_getCookie(cname) {
    var name = "TULISAN_" + cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function header(){
	var active_page = "home-route";
	var html =
	'<!--div class="row"-->' +
		'<nav class="navbar navbar-default plain">' +
		    '<!-- Brand and toggle get grouped for better mobile display -->' +
		    '<div class="navbar-header">' +
		    	'<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#syncard-nav" aria-expanded="false">' +
			        '<span class="sr-only">Toggle navigation</span>' +
			        '<span class="icon-bar"></span>' +
			        '<span class="icon-bar"></span>' +
			        '<span class="icon-bar"></span>' +
		    	'</button>' +
		    	'<div class="navbar-brand hidden-lg hidden-md hidden-sm col-xs-10">' +
		    		'<a href="' + base_url + '"><img class="smallImg" src="' + base_url + '/assets/PICS/tulisan.png" /></a>' +
				'</div>' +
		    '</div>' +

		    '<!-- Collect the nav links, forms, and other content for toggling -->' +
		    '<div class="collapse navbar-collapse" id="syncard-nav">' +
		    	'<div class="navbar-shortcut">' +
					'<div class="link">' +
						'<a href="' + base_url + '/page/findUs.html">FIND A STORE</a> |' +
						'<a href="' + base_url + '/page/media.html">MEDIA</a> |' +
						'<a href="' + base_url + '/page/cart.html" id="cart_icon"><span class="fa fa-shopping-cart"></span></a> |';

						if(r_getCookie('user_name') != ""){
							var res = r_getCookie('user_name');
							if(res.length > 7){
								res = res.substring(0, 5) + '...';
							}

							html = html + '<a href="' + base_url + '/page/profile.html">' + res + '</a>';
						}else{
							html = html + '<a href="' + base_url + '/page/login.html">LOGIN</a>';
						}
					html = html +
					'</div>' +
					'<div class="form">' +
				    	'<form class="form-inline" id="searchForm">' +
				        	'<div class="input-group">' +
				        		'<input type="text" class="form-control" placeholder="Search">' +
					        	'<span class="input-group-btn">' +
					        		'<button type="submit" class="btn btn-default">SEARCH</button>' +
					        	'</span>' +
				        	'</div>' +
				   		'</form>' +
					'</div>' +
				'</div>' +
		    	'<div class="col-md-8 col-md-offset-2 hidden-xs navbar-brand-custom">' +
			    	'<div class="navbar-brand"><img src="' + base_url + '/assets/PICS/tulisan.png" /></div>' +
			    	'<div class="clearfix"></div>' +
				'</div>' +
				'<div class="col-md-8 col-md-offset-2">' +
					'<div id="navbar-custom" class="row">' +
						'<ul class="nav navbar-nav main-menu fontserif">' +
					        '<li><a id="home-route" href="' + base_url + '"><span>HOME</span></a></li>' +
					        '<li><a id="shop-route" href="' + base_url + '/page/shop.html"><span>SHOP</span></a></li>' +
					        '<li><a id="story-route" href="' + base_url + '/page/story.html"><span>STORIES</span></a></li>' +
					        '<li><a id="blog-route" href="' + base_url + '/page/blog.html" target="_blank"><span>BLOG</span></a></li>' +
					        '<li><a id="video-route" href="' + base_url + '/page/videos.html"><span>VIDEOS</span></a></li>' +
					        '<li><a id="chatter-route" href="' + base_url + '/page/chatter.html"><span>CHATTER</span></a></li>' +
					        '<li><a id="about-route" href="' + base_url + '/page/about.html"><span>ABOUT</span></a></li>' +
					        '<li><a id="contact-route" href="' + base_url + '/page/contact.html"><span>CONTACT</span></a></li>' +
					    '</ul>' +
					'</div>' +
				'</div>' +
		  	'</div>' +
		'</nav>' +
	'<!--/div--><!-- /.navbar-collapse -->';

	//breadcrum
	var breadcrumbHtml = "";
	var breadcrumb = "";
	var page = window.location.href;
		page = page.substring(page.lastIndexOf("/")+ 1);
		page = (page.match(/[^.]+(\.[^?#]+)?/) || [])[0];

	if(page != null && page.length > 0){
		switch(page){
			case "story.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / story";
				active_page = "story-route";
			break;
			case "storydetail.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / <a href='" + base_url + "/page/story.html'>story</a> / <span id='custom-bread-detail'>detail</span>";
				active_page = "story-route";
			break;
			case "blog.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / blog";
				active_page = "blog-route";
			break;
			case "blogDetail.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / <a href='" + base_url + "/page/blog.html'>blog</a> / <span id='custom-bread-detail'>detail</span>";
				active_page = "blog-route";
			break;
			case "chatter.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / chatter";
				active_page = "chatter-route";
			break;
			case "chatterDetail.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / <a href='" + base_url + "/page/chatter.html'>chatter</a> / <span id='custom-bread-detail'>detail</span>";
				active_page = "chatter-route";
			break;
			case "videos.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / videos";
				active_page = "video-route";
			break;
			case "videoDetail.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / <a href='" + base_url + "/page/videos.html'>videos</a> / <span id='custom-bread-detail'>detail</span>";
				active_page = "video-route";
			break;
			case "media.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / media";
				active_page = "Media";
			break;
			case "privacyPolicy.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / privacy policy";
				active_page = "Privacy Policy";
			break;
			case "about.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / about";
				active_page = "about-route";
			break;
			case "location.html":
			case "findUs.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / store locator";
				active_page = "contact-route";
			break;
			case "contact.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / contact us";
				active_page = "contact-route";
			break;
			case "shop.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / shop";
				active_page = "shop-route";
			break;
			case "shopDetail.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / <a href='" + base_url + "/page/shop.html'>shop</a> / <span id='custom-bread-detail'>detail</span>";
				active_page = "shop-route";
			break;
			case "chart.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / cart";
				active_page = "shop-route";
			break;
			case "checkout.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / <a href='" + base_url + "/page/shop.html'>shop</a> / <span id='custom-bread-detail'>checkout</span>";
				active_page = "shop-route";
			break;
			case "orderView.html":
				breadcrumb = "<a href='" + base_url + "'>Home</a> / <a href='" + base_url + "/page/shop.html'>shop</a> / <span id='custom-bread-detail'>order</span>";
				active_page = "shop-route";
			break;
		}

		breadcrumbHtml =
		'<div class="row">' +
			'<div class="col-md-8 col-md-offset-2">' +
				'<div class="breadcrumb"><p class="fontserifs">' + breadcrumb + '</p></div>' +
			'</div>' +
		'</div>';
	}

	$("header.parent").html(html);
	$("header.parent").after(breadcrumbHtml);
	$("header.parent .main-menu a").removeClass('active');
	$("header.parent .main-menu a#" + active_page).addClass('active');
	$("#cart_icon").removeClass('active');

	if(r_getCookie("TULISAN_USER_CART_STATUS") == "active") $("#cart_icon").addClass('active');

	//search activator
	$('#searchForm').unbind().on('submit', function(e) {
		e.preventDefault();
		window.location.href = base_url + "/page/shop.html?keyword=" + $('#searchForm input').val();
	});
}

function footer(){
	var html 	 = "";

	/* CONFIG */
	var shortcut = [
		{ "head": "ABOUT", "head_link": "#", "body": [
			{ "caption": "Shop", 	"link": base_url + "/page/shop.html" },
			{ "caption": "Stories", "link": base_url + "/page/story.html" },
			{ "caption": "Blog"	, 	"link": base_url + "/page/blog.html" },
			{ "caption": "About", 	"link": base_url + "/page/about.html" },
			{ "caption": "Store", 	"link": base_url + "/page/location.html" },
			{ "caption": "Media", 	"link": base_url + "/page/media.html" },
		]},
		{ "head": "SUPPORT", "head_link": "#", "body": [
			{ "caption": "Product Care", "link": "#", "custom": "care" },
			{ "caption": "Contact Us", 	 "link": base_url + "/page/contact.html" },
			{ "caption": "Login"	, 	 "link": "#" },
		]},
		{ "head": "SHOP", "head_link": "#", "body": [
			{ "caption": "By Product", 	"link": base_url + "/page/shop.html" },
			{ "caption": "By Color", 	"link": base_url + "/page/shop.html" },
			{ "caption": "By Story"	, 	"link": base_url + "/page/shop.html" },
		]},
		{ "head": "LEGAL", "head_link": "#", "body": [
			{ "caption": "Store / Privacy Policy", 	"link": base_url + "/page/privacyPolicy.html" },
			{ "caption": "Refund Policy", 	"link": base_url + "/page/refundPolicy.html" },
		]},
	];

	var data = getData('support', 'systemFetch');
	    data = data.feedData;

	var socmed = [
		{ "icon": "instagram", 	 		"link": data.instagram },
		{ "icon": "facebook-official", 	"link": data.facebook },
		{ "icon": "twitter", 	 		"link": data.twitter },
		{ "icon": "pinterest-p", 		"link": data.pinterest },
		{ "icon": "youtube", 			"link": data.youtube },
	];

	var d = new Date();
	var n = d.getFullYear();
	var license = "Copyright © 2010-" + n + " PT Tulisan Susunan Tinta. All Rights Reserved.";

	/*===========================================================================================*/
	/*===========================================================================================*/
	/* GENERATOR */

	html = '<div class="col-md-8 col-md-offset-2 div-normalize">';

	/* shortcut generator */
	if(shortcut != null && shortcut.length > 0){
		html = html + '<div class="row shortcut">';

		for(var loop=0; loop<shortcut.length; loop++){
			html = html +
			'<div class="col-md-3 col-sm-6 shortcut-box">' +
				'<div class="head"><a href="' + shortcut[loop].head_link + '"><b>' + shortcut[loop].head + '</b></a></div>';

			var body = shortcut[loop].body;
			for(var look=0; look<body.length; look++){
				if(body[look].custom == undefined) html = html +'<div class="body"><a href="' + body[look].link + '">' + body[look].caption + '</a></div>';
				else html = html +'<div class="body"><a href="#" data-toggle="modal" data-target="#produtCare">' + body[look].caption + '</a></div>';
			}

			html = html + '</div>';
		}

		html = html +
			'<div class="clearfix"></div>' +
		'</div>';
	}

	/* socmed generator */
	if(socmed != null && socmed.length > 0){
		html = html +
		'<div class="row socmed">' +
			'<div class="col-md-6 socmed-box">' +
				'<p>' +
					'<b>KEEP UP TO DATE</b> <br>' +
					'Stay up to date with all the latest news and <br>' +
					'special offers from Tulisan' +
				'</p>' +
			'</div>' +
			'<div class="col-md-6 socmed-box">';

		for(var loop=0; loop<socmed.length; loop++){
			html = html + '<a href="' + socmed[loop].link + '"><span class="fa fa-' + socmed[loop].icon + '"></span></a>';
		}

		html = html +
			'</div>' +
			'<div class="clearfix"></div>' +
		'</div>';
	}

	html = html +
			'<div class="license"><p>' + license + '</p></div>' +
		'</div>' +
		'<div class="clearfix"></div>' +
	'</div>';

	html = html + '<a href="#" id="back-to-top" title="Back to top"><span class="fa fa-arrow-up fa-2x"></span></a>';

	html = html +
	'<!-- Modal -->' +
	'<div id="produtCare" class="modal fade" role="dialog">' +
	  '<div class="modal-dialog">' +

	    '<!-- Modal content-->' +
	    '<div class="modal-content">' +
	      '<div class="modal-header">' +
	        '<button type="button" class="close" data-dismiss="modal">&times;</button>' +
	        '<h4 class="modal-title">Care Instructions</h4>' +
	      '</div>' +
	      '<div class="modal-body">' +
	        '<p class="justify">' +
	        	'Handle with Care<br/>' +
				'To protect the artwork, handle our totes and organizers with extra care. When needed, wipe clean with a damp cloth. We do not recommend machine washing, using soap or dry cleaning these items as these actions will damage the products.' +
				'<br/><br/>' +
				'Care for Home and Apparel<br/>' +
				'All of our home products and apparel collections are delicate. For best results, we recommend washing home goods and apparel inside out in cold water. Lay flat to dry and avoid exposure to direct sunlight. Use a warm iron as needed (inside out).' +
			'</p>' +
	      '</div>' +
	      '<div class="modal-footer">' +
	        '<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>' +
	      '</div>' +
	    '</div>' +

	  '</div>' +
	'</div>';

	$("footer.parent").html(html);

}

function toTitleCase(str)
{
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
}

function backToTop(){
	if ($('#back-to-top').length) {
	    var scrollTrigger = 100, // px
	        backToTop = function () {
	            var scrollTop = $(window).scrollTop();
	            if (scrollTop > scrollTrigger) {
	                $('#back-to-top').addClass('show');
	            } else {
	                $('#back-to-top').removeClass('show');
	            }
	        };
	    backToTop();
	    $(window).on('scroll', function () {
	        backToTop();
	    });
	    $('#back-to-top').on('click', function (e) {
	        e.preventDefault();
	        $('html,body').animate({
	            scrollTop: 0
	        }, 700);
	    });
	}
}


//==============================================================================
// loader
var $container = $('.container');
var $status = $('#status');
var $progress = $('progress');

var supportsProgress = $progress[0] &&
  // IE does not support progress
  $progress[0].toString().indexOf('Unknown') === -1;

var loadedImageCount, imageCount;

$(function(){
	  // $container.imagesLoaded()
	  //   .progress( onProgress )
	  //   .always( onAlways );
	  // // reset progress counter
	  // imageCount = $container.find('img').length;
	  // resetProgress();
	  // updateProgress( 0 );
});

function resetProgress() {
  $status.css({ opacity: 1 });
  loadedImageCount = 0;
  if ( supportsProgress ) {
    $progress.attr( 'max', imageCount );
  }
}

function updateProgress( value ) {
  if ( supportsProgress ) {
    $progress.attr( 'value', value );
  } else {
    // if you don't support progress elem
    $status.text( value + ' / ' + imageCount );
  }
}

// triggered after each item is loaded
function onProgress( imgLoad, image ) {
  // change class if the image is loaded or broken
  var $item = $( image.img ).parent();
  $item.removeClass('is-loading');
  if ( !image.isLoaded ) {
    $item.addClass('is-broken');
  }
  // update progress element
  loadedImageCount++;
  updateProgress( loadedImageCount );
}

// hide status when done
function onAlways() {
  $status.css({ opacity: 0 });
}

/* maps */
function openMaps(plc,lng,lat){
	var url = "https://www.google.com/maps/place/" + plc + "/@" + lat + "," + lng;
	window.open(url);
}

/* tab */
function tabChange(elem){
	target = $(elem).attr('t-target');
	$(".tab-button, .tab-container").removeClass('active');
	$(elem).addClass('active');
	$(target).addClass('active');
}

function tabWizardChange(elem){
	target = $(elem).attr('t-target');
	$(".tab-button, .tab-container").removeClass('active');
	$(elem).addClass('active');
	$(target).addClass('active');

	switch(target){
		case "#2" : $("[t-target='#1']").addClass('active'); break;
		case "#3" : $("[t-target='#1'], [t-target='#2'], [t-target-disabled='#0']").addClass('active'); break;
	}
}

// currency
function currencyFormat(num, curr = 'Rp. ') {
    var p = num;
    return curr + p.split("").reverse().reduce(function(acc, num, i, orig) {
        return  num=="-" ? acc : num + (i && !(i % 3) ? "," : "") + acc;
    }, "");
}

//country list option
function listOption(data){
	var html  = "";
	var state = "";
	for(var loop=0; loop<data.length; loop++){
		state = (data[loop].value == "ID") ? "selected" : "";
		html += '<option value="' + data[loop].value + '" ' + state + '>' + data[loop].caption + '</option>';
	}

	return html;
}

/* =============================================================================================== */
/* time converter */
function timeSince(date) {
	var seconds = Math.floor((new Date() - date) / 1000);
	var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	if (seconds < 5){
		return "Just now";
	}else if (seconds < 60){
		return seconds + " seconds ago";
	}
	else if (seconds < 3600) {
		minutes = Math.floor(seconds/60)
		if(minutes > 1)
			return minutes + " minutes ago";
		else
			return "1 minute ago";
	}
	else if (seconds < 86400) {
		hours = Math.floor(seconds/3600)
		if(hours > 1)
			return hours + " hours ago";
		else
			return "1 hour ago";
	}
	//2 days and no more
	else if (seconds < 172800) {
		days = Math.floor(seconds/86400)
		if(days > 1)
			return days + " days ago";
		else
			return "1 day ago";
	}
	else{

		//return new Date(time).toLocaleDateString();
		return date.getDate().toString() + " " + months[date.getMonth()] + ", " + date.getFullYear();
	}
}

/* local request management */
/* =============================================================================================== */
function getData(group, target, page="1", keyword=""){
	var data = null;
	$.ajax({
		url: base_url + '/data/router.php?session=requestData&group=' + group + '&target=' + target,
		type: 'post',
		dataType: 'json',
		async: false,
		data: { page : page, keyword: keyword },
		success: function(result){
			console.log(result);
			data = result;
		},
		complete: function(xhr,status) {  },
		error: function(xhr,status,error) { console.log(xhr); }
	});

	return data;
}
