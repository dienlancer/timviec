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
    <!--srart theme style -->
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/animate.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/bootstrap.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/font-awesome.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/fonts.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/reset.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/owl.carousel.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/owl.theme.default.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/flaticon.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/style.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend/job-light/css/responsive.css')}}" />
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
        <div class="jp_slide_img_overlay"></div>
        <div class="gc_main_menu_wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 hidden-xs hidden-sm full_width">
                        <div class="gc_header_wrapper">
                            <div class="gc_logo">
                                <a href="index.html"><img src="{{asset('public/frontend/job-light/images/header/logo.png')}}" alt="Logo" title="Job Pro" class="img-responsive"></a>
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
                                    <li class="has-mega gc_main_navigation"><a href="#" class="gc_main_navigation">Trang chủ</a></li>
                                    <li class="has-mega gc_main_navigation"><a href="#" class="gc_main_navigation">Nhà tuyển dụng</a></li>
                                    <li class="parent gc_main_navigation"><a href="#" class="gc_main_navigation">Ứng viên</a></li>									
                                    <li class="gc_main_navigation parent"><a href="contact.html" class="gc_main_navigation">Liên hệ</a></li>
                                </ul>
                            </div>
                            <!-- mainmenu end -->
                            <!-- mobile menu area start -->
                            <header class="mobail_menu">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6">
                                            <div class="gc_logo">
                                                <a href="index.html"><img src="{{asset('public/frontend/job-light/images/header/logo.png')}}" alt="Logo" title="Grace Church"></a>
                                            </div>
                                        </div>
                                        <div class="col-xs-6 col-sm-6">
                                            <div class="cd-dropdown-wrapper">
                                                <a class="house_toggle" href="#0">
													<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 31.177 31.177" style="enable-background:new 0 0 31.177 31.177;" xml:space="preserve" width="25px" height="25px"><g><g><path class="menubar" d="M30.23,1.775H0.946c-0.489,0-0.887-0.398-0.887-0.888S0.457,0,0.946,0H30.23    c0.49,0,0.888,0.398,0.888,0.888S30.72,1.775,30.23,1.775z" fill="#ffffff"/></g><g><path class="menubar" d="M30.23,9.126H12.069c-0.49,0-0.888-0.398-0.888-0.888c0-0.49,0.398-0.888,0.888-0.888H30.23    c0.49,0,0.888,0.397,0.888,0.888C31.118,8.729,30.72,9.126,30.23,9.126z" fill="#ffffff"/></g><g><path class="menubar" d="M30.23,16.477H0.946c-0.489,0-0.887-0.398-0.887-0.888c0-0.49,0.398-0.888,0.887-0.888H30.23    c0.49,0,0.888,0.397,0.888,0.888C31.118,16.079,30.72,16.477,30.23,16.477z" fill="#ffffff"/></g><g><path class="menubar" d="M30.23,23.826H12.069c-0.49,0-0.888-0.396-0.888-0.887c0-0.49,0.398-0.888,0.888-0.888H30.23    c0.49,0,0.888,0.397,0.888,0.888C31.118,23.43,30.72,23.826,30.23,23.826z" fill="#ffffff"/></g><g><path class="menubar" d="M30.23,31.177H0.946c-0.489,0-0.887-0.396-0.887-0.887c0-0.49,0.398-0.888,0.887-0.888H30.23    c0.49,0,0.888,0.398,0.888,0.888C31.118,30.78,30.72,31.177,30.23,31.177z" fill="#ffffff"/></g></g></svg>
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
                                                        <li class="has-children">
                                                            <a href="#">Home</a>

                                                            <ul class="cd-secondary-dropdown is-hidden">
                                                                <li class="go-back"><a href="#0">Menu</a></li>
                                                                <li>
                                                                    <a href="index.html">Home1</a>
                                                                </li>
                                                                <!-- .has-children -->

                                                                <li>
                                                                    <a href="index_II.html">Home2</a>
                                                                </li>
																<li>
                                                                    <a href="index_map.html">Home3</a>
                                                                </li>
                                                                <!-- .has-children -->

                                                            </ul>
                                                            <!-- .cd-secondary-dropdown -->
                                                        </li>
                                                        <!-- .has-children -->


                                                        <li class="has-children">
                                                            <a href="#">Job</a>

                                                            <ul class="cd-secondary-dropdown is-hidden">
                                                                <li class="go-back"><a href="#0">Menu</a></li>
                                                                <li>
                                                                    <a href="listing_left.html">Listing-Left</a>
                                                                </li>
                                                                <!-- .has-children -->

                                                                <li>
                                                                    <a href="listing_right.html">Listing-Right</a>
                                                                </li>
                                                                <!-- .has-children -->

                                                                <li>
                                                                    <a href="listing_single.html">Listing-Single</a>
                                                                </li>
                                                                <!-- .has-children -->


                                                            </ul>
                                                            <!-- .cd-secondary-dropdown -->
                                                        </li>
                                                        <!-- .has-children -->
                                                        <li class="has-children">
                                                            <a href="#">candidates</a>

                                                            <ul class="cd-secondary-dropdown is-hidden">
                                                                <li class="go-back"><a href="#0">Menu</a></li>
																<li><a href="company_listing.html">Company-Listing</a></li>
																<li><a href="company_listing_single.html">Company-Single</a></li>
																<li><a href="candidate_listing.html">candidate-Listing</a></li>
																<li><a href="candidate_profile.html">candidate-Profile</a></li>
                                                                <!-- .has-children -->

                                                            </ul>
                                                            <!-- .cd-secondary-dropdown -->
                                                        </li>
                                                        <!-- .has-children -->
														<li class="has-children">
                                                            <a href="#">Pages</a>

                                                            <ul class="cd-secondary-dropdown is-hidden">
                                                                <li class="go-back"><a href="#0">Menu</a></li>
                                                                <li><a href="about.html">About-Us</a></li>
																<li><a href="404 error.html">404</a></li>
																<li><a href="add_postin.html">Add-Posting</a></li>
																<li><a href="login.html">Login</a></li>
																<li><a href="register.html">Register</a></li>
																<li><a href="pricing.html">Pricing</a></li>
                                                                <!-- .has-children -->

                                                            </ul>
                                                            <!-- .cd-secondary-dropdown -->
                                                        </li>
                                                        <li class="has-children">
                                                            <a href="#">Blog</a>

                                                            <ul class="cd-secondary-dropdown is-hidden">
                                                                <li class="go-back"><a href="#0">Menu</a></li>
                                                                <li>
                                                                    <a href="blog_left.html">Blog-Left</a>
                                                                </li>
                                                                <!-- .has-children -->

                                                                <li>
                                                                    <a href="blog_right.html">Blog-Right</a>
                                                                </li>
                                                                <!-- .has-children -->

                                                                <li>
                                                                    <a href="blog_single_left.html">Blog-Single-Left</a>
                                                                </li>
                                                                <!-- .has-children -->

                                                                <li>
                                                                    <a href="blog_single_right.html">Blog-Single-Left</a>
                                                                </li>
                                                                <!-- .has-children -->

                                                            </ul>
                                                            <!-- .cd-secondary-dropdown -->
                                                        </li>
                                                        <!-- .has-children -->
                                                        <!-- .has-children -->
                                                        <li>
                                                            <a href="contact.html">Contact</a>
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
                                <li><a href="register.html"><i class="fa fa-user"></i>&nbsp; SIGN UP</a></li>
                                <li><a href="login.html"><i class="fa fa-sign-in"></i>&nbsp; LOGIN</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="jp_banner_heading_cont_wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="jp_job_heading_wrapper">
                            <div class="jp_job_heading">
                                <h1><span>3,000+</span> Browse Jobs</h1>
                                <p>Find Jobs, Employment & Career Opportunities</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="jp_header_form_wrapper">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <input type="text" placeholder="Keyword e.g. (Job Title, Description, Tags)">
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                <div class="jp_form_location_wrapper">
                                    <i class="fa fa-dot-circle-o first_icon"></i><select>
								<option>Select Location</option>
								<option>Select Location</option>
								<option>Select Location</option>
								<option>Select Location</option>
								<option>Select Location</option>
							</select><i class="fa fa-angle-down second_icon"></i>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                <div class="jp_form_exper_wrapper">
                                    <i class="fa fa-dot-circle-o first_icon"></i><select>
								<option>Experience</option>
								<option>Experience</option>
								<option>Experience</option>
								<option>Experience</option>
								<option>Experience</option>
							</select><i class="fa fa-angle-down second_icon"></i>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                <div class="jp_form_btn_wrapper">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-search"></i> Search</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="jp_banner_main_jobs_wrapper">
                            <div class="jp_banner_main_jobs">
                                <ul>
                                    <li><i class="fa fa-tags"></i> Trending Keywords :</li>
                                    <li><a href="#">ui designer,</a></li>
                                    <li><a href="#">developer,</a></li>
                                    <li><a href="#">senior</a></li>
                                    <li><a href="#">it company,</a></li>
                                    <li><a href="#">design,</a></li>
                                    <li><a href="#">call center</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="jp_banner_jobs_categories_wrapper">
            <div class="container">
                <div class="jp_top_jobs_category_wrapper jp_job_cate_left_border jp_job_cate_left_border_bottom">
                    <div class="jp_top_jobs_category">
                        <i class="fa fa-code"></i>
                        <h3><a href="#">Developer</a></h3>
                        <p>(240 jobs)</p>
                    </div>
                </div>
                <div class="jp_top_jobs_category_wrapper jp_job_cate_left_border_bottom">
                    <div class="jp_top_jobs_category">
                        <i class="fa fa-laptop"></i>
                        <h3><a href="#">Technology</a></h3>
                        <p>(504 jobs)</p>
                    </div>
                </div>
                <div class="jp_top_jobs_category_wrapper jp_job_cate_left_border_bottom">
                    <div class="jp_top_jobs_category">
                        <i class="fa fa-bar-chart"></i>
                        <h3><a href="#">Accounting</a></h3>
                        <p>(2250 jobs)</p>
                    </div>
                </div>
                <div class="jp_top_jobs_category_wrapper jp_job_cate_left_border_res">
                    <div class="jp_top_jobs_category">
                        <i class="fa fa-medkit"></i>
                        <h3><a href="#">Medical</a></h3>
                        <p>(202 jobs)</p>
                    </div>
                </div>
                <div class="jp_top_jobs_category_wrapper">
                    <div class="jp_top_jobs_category">
                        <i class="fa fa-university"></i>
                        <h3><a href="#">Government</a></h3>
                        <p>(1457 jobs)</p>
                    </div>
                </div>
                <div class="jp_top_jobs_category_wrapper">
                    <div class="jp_top_jobs_category">
                        <i class="fa fa-th-large"></i>
                        <h3><a href="#">All Jobs</a></h3>
                        <p>(2000+ jobs)</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header Wrapper End -->
	@yield("content")
	@include("frontend.footer")	
	<!--main js file start-->
    <script src="{{asset('public/frontend/job-light/js/jquery_min.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/bootstrap.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/jquery.menu-aim.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/jquery.countTo.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/jquery.inview.min.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/owl.carousel.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/modernizr.js')}}"></script>
    <script src="{{asset('public/frontend/job-light/js/custom.js')}}"></script>
    <!--main js file end-->
</body>
</html>



