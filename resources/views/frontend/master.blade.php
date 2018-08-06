<?php 
$setting=getSettingSystem();
$seo=getSeo();
$telephone=$setting['telephone']['field_value'];
$email_to=$setting['email_to']['field_value'];
$facebook_url=$setting['facebook_url']['field_value'];
$twitter_url=$setting['twitter_url']['field_value'];
$google_plus=$setting['google_plus']['field_value'];
$youtube_url=$setting['youtube_url']['field_value'];
$instagram_url=$setting['instagram_url']['field_value'];
$pinterest_url=$setting['pinterest_url']['field_value'];   
$company=$setting['contacted_person']['field_value'];
$opened_time=$setting['opened_time']['field_value'];

$seo_title="";
if(!empty(@$title)){
	$seo_title=$title;
}else{	
	$seo_title=$seo["title"];
}

$seo_meta_keyword="";
if(!empty(@$meta_keyword)){
	$seo_meta_keyword=$meta_keyword;
}else{
	$seo_meta_keyword=$seo["meta_keyword"];
}

$seo_meta_description="";
if(!empty(@$meta_description)){
	$seo_meta_description=$meta_description;
}else{
	$seo_meta_description=$seo["meta_description"];
}

$seo_google_analytics=$seo["google_analytics"];
$seo_author=$seo["author"];
$seo_copyright=$seo["copyright"];
$seo_generator="Mã nguồn mở phát triển bởi tichtacso.com";
$seo_google_site_verification=$seo["google_site_verification"];
$seo_page_url=url('/');
$seo_favicon=asset('upload/'.$seo['favicon']);
$seo_logo_frontend=asset('upload/'.$seo['logo_frontend']);
$seo_alias="";
if(isset($alias)){
	$seo_alias=$alias;
}

?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Job Pro Responsive HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta name="description" content="Job Pro" />
    <meta name="keywords" content="Job Pro" />
    <meta name="author" content="" />
    <meta name="MobileOptimized" content="320" />  
    <script src="{{asset('public/frontend/job-light/js/jquery_min.js')}}"></script>  
    <!--srart theme style -->
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/animate.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/bootstrap.css')}}" />
    <link rel="stylesheet" href="{{ asset('public/frontend/fontawesome/css/all.min.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/fonts.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/reset.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/owl.carousel.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/owl.theme.default.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/flaticon.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/style_map.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/responsive_map.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/css/template.css')}}" />
    <!-- favicon links -->
    <link rel="shortcut icon" type="image/png" href="{{asset('public/frontend/job-light/images/header/favicon.ico')}}" />    
</head>
<body>		
	<!-- preloader Start -->
    <div id="preloader">
        <div id="status"><img src="{{asset('public/frontend/job-light/images/header/loadinganimation.gif')}}" id="preloader_image" alt="loader">
        </div>
    </div>
    <!-- Top Scroll End -->
    <!-- Header Wrapper Start -->
    <div class="jp_top_header_img_wrapper">
        <div class="gc_main_menu_wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 hidden-xs hidden-sm full_width">
                        <div class="gc_header_wrapper">
                            <div class="gc_logo">
                                <a href="index.html"><img src="{{asset('public/frontend/job-light/images/header/logo2.png')}}" alt="Logo" title="Job Pro" class="img-responsive"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-8 col-sm-12 col-xs-12 center_responsive">
                        <div class="header-area hidden-menu-bar stick" id="sticker">
                            <!-- mainmenu start -->
                            <div class="mainmenu">
                                <div class="gc_right_menu">
                                    <ul>
                                        <li id="search_button">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_3" x="0px" y="0px" viewBox="0 0 451 451" style="enable-background:new 0 0 451 451;" xml:space="preserve"><g><path id="search" d="M447.05,428l-109.6-109.6c29.4-33.8,47.2-77.9,47.2-126.1C384.65,86.2,298.35,0,192.35,0C86.25,0,0.05,86.3,0.05,192.3   s86.3,192.3,192.3,192.3c48.2,0,92.3-17.8,126.1-47.2L428.05,447c2.6,2.6,6.1,4,9.5,4s6.9-1.3,9.5-4   C452.25,441.8,452.25,433.2,447.05,428z M26.95,192.3c0-91.2,74.2-165.3,165.3-165.3c91.2,0,165.3,74.2,165.3,165.3   s-74.1,165.4-165.3,165.4C101.15,357.7,26.95,283.5,26.95,192.3z" fill="#23c0e9"/></g></svg>
                                        </li>
                                        <li>
                                            <div id="search_open" class="gc_search_box">
                                                <input type="text" placeholder="Search here">
                                                <button><i class="fa fa-search" aria-hidden="true"></i></button>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <ul class="float_left">
                                    <li class="has-mega gc_main_navigation"><a href="<?php echo route('frontend.index.getHome'); ?>" class="gc_main_navigation">Trang chủ</a></li>
                                    <li class="has-mega gc_main_navigation"><a href="<?php echo route('frontend.index.viewEmployerAccount'); ?>" class="gc_main_navigation">Nhà tuyển dụng</a></li>
                                    <li class="parent gc_main_navigation"><a href="<?php echo route('frontend.index.viewCandidateAccount'); ?>" class="gc_main_navigation">Ứng viên</a></li>
                                    <li class="gc_main_navigation parent"><a href="javascript:void(0);" class="gc_main_navigation">Góc nghề nghiệp</a></li>
                                </ul>
                            </div>
                            <!-- mainmenu end -->
                            <!-- mobile menu area start -->
                            <header class="mobail_menu">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6">
                                            <div class="gc_logo">
                                                <a href="index.html"><img src="{{asset('public/frontend/job-light/images/header/logo2.png')}}" alt="Logo" title="Grace Church"></a>
                                            </div>
                                        </div>
                                        <div class="col-xs-6 col-sm-6">
                                            <div class="cd-dropdown-wrapper">
                                                <a class="house_toggle" href="#0">
													<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 31.177 31.177" style="enable-background:new 0 0 31.177 31.177;" xml:space="preserve" width="25px" height="25px"><g><g><path class="menubar" d="M30.23,1.775H0.946c-0.489,0-0.887-0.398-0.887-0.888S0.457,0,0.946,0H30.23    c0.49,0,0.888,0.398,0.888,0.888S30.72,1.775,30.23,1.775z" fill="#23c0e9"/></g><g><path class="menubar" d="M30.23,9.126H12.069c-0.49,0-0.888-0.398-0.888-0.888c0-0.49,0.398-0.888,0.888-0.888H30.23    c0.49,0,0.888,0.397,0.888,0.888C31.118,8.729,30.72,9.126,30.23,9.126z" fill="#23c0e9"/></g><g><path class="menubar" d="M30.23,16.477H0.946c-0.489,0-0.887-0.398-0.887-0.888c0-0.49,0.398-0.888,0.887-0.888H30.23    c0.49,0,0.888,0.397,0.888,0.888C31.118,16.079,30.72,16.477,30.23,16.477z" fill="#23c0e9"/></g><g><path class="menubar" d="M30.23,23.826H12.069c-0.49,0-0.888-0.396-0.888-0.887c0-0.49,0.398-0.888,0.888-0.888H30.23    c0.49,0,0.888,0.397,0.888,0.888C31.118,23.43,30.72,23.826,30.23,23.826z" fill="#23c0e9"/></g><g><path class="menubar" d="M30.23,31.177H0.946c-0.489,0-0.887-0.396-0.887-0.887c0-0.49,0.398-0.888,0.887-0.888H30.23    c0.49,0,0.888,0.398,0.888,0.888C31.118,30.78,30.72,31.177,30.23,31.177z" fill="#23c0e9"/></g></g></svg>
													</a>
                                                <nav class="cd-dropdown">
                                                    <h2><a href="#">Job<span>Pro</span></a></h2>
                                                    <a href="#0" class="cd-close">Close</a>
                                                    <ul class="cd-dropdown-content">
                                                        <li>
                                                            <form class="cd-search">
                                                                <input type="search" placeholder="Search...">
                                                            </form>
                                                        </li>
                                                        <li >
                                                            <a href="<?php echo route('frontend.index.getHome'); ?>">Trang chủ</a>
                                                        </li>                                                        
                                                        <li >
                                                            <a href="<?php echo route('frontend.index.viewEmployerAccount'); ?>">Nhà tuyển dụng</a>
                                                        </li>                                                        
                                                        <li >
                                                            <a href="<?php echo route('frontend.index.viewCandidateAccount'); ?>">Ứng viên</a>
                                                        </li>                                                        														
                                                        <li>
                                                            <a href="javascript:void(0);">Liên hệ</a>
                                                        </li>

                                                    </ul>
                                                    <!-- .cd-dropdown-content -->



                                                </nav>
                                                <!-- .cd-dropdown -->

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- .cd-dropdown-wrapper -->
                            </header>
                        </div>
                    </div>
                    <!-- mobile menu area end -->
                    <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12 hidden-sm hidden-xs">
                        <div class="jp_navi_right_btn_wrapper">
                            <ul>
                                <li><a href="<?php echo route('frontend.index.register'); ?>"><i class="fa fa-user"></i>&nbsp; ĐĂNG KÝ</a></li>
                                <li><a href="<?php echo route('frontend.index.loginFe'); ?>"><i class="fa fa-sign-in"></i>&nbsp; ĐĂNG NHẬP</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header Wrapper End -->
	@yield("content")
	@include("frontend.footer")		
    <!--main js file start-->
    
    <script src="{{asset('public/frontend/job-light/js/bootstrap.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/jquery.menu-aim.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/jquery.countTo.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/jquery.inview.min.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/owl.carousel.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/modernizr.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/custom_map.js')}}"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDOogBL2cC0dSezucKzQGWxMIMmclqWNts&sensor=false"></script>
    <script type="text/javascript" language="javascript">
    var infowindow = null;
    $(document).ready(function() { initialize(); });

    function initialize() {

        var centerMap = new google.maps.LatLng(41.0793, -85.1394);

        var myOptions = {
            zoom: 6,
            center: centerMap,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            styles: [
                { elementType: 'geometry', stylers: [{ color: '#242f3e' }] },
                { elementType: 'labels.text.stroke', stylers: [{ color: '#242f3e' }] },
                { elementType: 'labels.text.fill', stylers: [{ color: '#746855' }] },
                {
                    featureType: 'administrative.locality',
                    elementType: 'labels.text.fill',
                    stylers: [{ color: '#d59563' }]
                },
                {
                    featureType: 'poi',
                    elementType: 'labels.text.fill',
                    stylers: [{ color: '#d59563' }]
                },
                {
                    featureType: 'poi.park',
                    elementType: 'geometry',
                    stylers: [{ color: '#263c3f' }]
                },
                {
                    featureType: 'poi.park',
                    elementType: 'labels.text.fill',
                    stylers: [{ color: '#6b9a76' }]
                },
                {
                    featureType: 'road',
                    elementType: 'geometry',
                    stylers: [{ color: '#38414e' }]
                },
                {
                    featureType: 'road',
                    elementType: 'geometry.stroke',
                    stylers: [{ color: '#212a37' }]
                },
                {
                    featureType: 'road',
                    elementType: 'labels.text.fill',
                    stylers: [{ color: '#9ca5b3' }]
                },
                {
                    featureType: 'road.highway',
                    elementType: 'geometry',
                    stylers: [{ color: '#746855' }]
                },
                {
                    featureType: 'road.highway',
                    elementType: 'geometry.stroke',
                    stylers: [{ color: '#1f2835' }]
                },
                {
                    featureType: 'road.highway',
                    elementType: 'labels.text.fill',
                    stylers: [{ color: '#f3d19c' }]
                },
                {
                    featureType: 'transit',
                    elementType: 'geometry',
                    stylers: [{ color: '#2f3948' }]
                },
                {
                    featureType: 'transit.station',
                    elementType: 'labels.text.fill',
                    stylers: [{ color: '#d59563' }]
                },
                {
                    featureType: 'water',
                    elementType: 'geometry',
                    stylers: [{ color: '#17263c' }]
                },
                {
                    featureType: 'water',
                    elementType: 'labels.text.fill',
                    stylers: [{ color: '#515c6d' }]
                },
                {
                    featureType: 'water',
                    elementType: 'labels.text.stroke',
                    stylers: [{ color: '#17263c' }]
                }
            ]
        }

        var map = new google.maps.Map(document.getElementById("map"), myOptions);

        setMarkers(map, sites);
        infowindow = new google.maps.InfoWindow({
            content: "loading..."
        });

        var bikeLayer = new google.maps.BicyclingLayer();
        bikeLayer.setMap(map);


    }

    var sites = [
        ['Warner Bros', 41.879, -87.624, 4, 'Warner Bros, 5400 N. Lakewood Avenue, Chicago'],
        ['Irving Homestead', 42.5000, -96.4003, 2, 'This is the Irving Homestead.'],
        ['Artis', 42.9634, -85.6681, 1, 'Artis, 101 Monroe Center St NW Grand Rapids'],
        ['Kansao', 39.0997, -94.5786, 3, 'Kansao, 4039 Euclid Ave Kansas City'],

        ['City Wyne', 41.0793, -85.1394, 8, 'City Wyne, 200 E. Berry St. Suite 470. Fort Wayne'],
        ['Microsolution', 39.9612, -82.9988, 7, 'Microsolution, 3870 Gateway Blvd Columbus'],
        ['Blue Berry', 38.6270, -90.1994, 5, 'Blue Berry, 12555 N Outer Forty Dr St. Louis'],
        ['Red Hat', 38.0406, -84.5037, 6, 'Red Hat, 2609 Red Leaf Dr, Lexington'],

        ['PlotHQ', 44.9778, -93.2650, 8, 'PlotHQ, 350 South 5th Street, Minneapolis'],
        ['Ivan Sol', 40.4406, -79.9959, 7, 'Ivan Sol, 4200 Fifth Avenue Pittsburgh'],
        ['Omni Soft', 41.2524, -95.9980, 5, 'Omni Soft, 19102 W St Omaha'],
        ['Canadian Firm', 43.6532, -79.3832, 6, 'Canadian Firm. PwC Tower 18 York Street, Suite 2600. Toronto']
    ];

    function setMarkers(map, markers) {

        for (var i = 0; i < markers.length; i++) {
            var sites = markers[i];
            var siteLatLng = new google.maps.LatLng(sites[1], sites[2]);
            var marker = new google.maps.Marker({
                position: siteLatLng,
                map: map,
                title: sites[0],
                zIndex: sites[3],
                html: sites[4]
            });

            var contentString = "Some content";

            google.maps.event.addListener(marker, "click", function() {
                infowindow.setContent(this.html);
                infowindow.open(map, this);
            });
        }
    }
    </script>

    <!--main js file end-->
</body>
</html>



