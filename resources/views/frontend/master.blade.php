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
if(isset($title) && !empty($title)){
	$seo_title=$title;
}else{	
	$seo_title=$seo["title"];
}

$seo_meta_description="";
if(isset($meta_description) && !empty($meta_description)){
	$seo_meta_description=$meta_description;
}else{
	$seo_meta_description=$seo["meta_description"];
}

$seo_meta_keyword="";
if(isset($meta_keyword) && ! empty($meta_keyword)){
	$seo_meta_keyword=$meta_keyword;
}else{
	$seo_meta_keyword=$seo["meta_keyword"];
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
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">  
	<title><?php echo $seo_title; ?></title>
	<meta name="keywords" content="<?php echo $seo_meta_keyword; ?>">
	<meta name="description" content="<?php echo $seo_meta_description; ?>">	
	<meta name="author" content="<?php echo $seo_author; ?>">
	<meta name="copyright" content="<?php echo $seo_copyright; ?>">
	<meta name="robots" content="index, archive, follow, noodp">
	<meta name="googlebot" content="index,archive,follow,noodp">
	<meta name="msnbot" content="all,index,follow">
	<meta name="generator" content="<?php echo $seo_generator; ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="google-site-verification" content="<?php echo $seo_google_site_verification; ?>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta property="og:title" content="<?php echo $seo_title; ?>">
	<meta property="og:type" content="website">
	<meta property="og:description" content="<?php echo $seo_meta_description; ?>">
	<meta property="og:site_name" content="<?php echo $seo_title; ?>">
	<meta property="og:url" content="<?php echo $seo_page_url; ?>">
	<!-- begin google analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=<?php echo $seo_google_analytics; ?>"></script>
	<script language="javascript" type="text/javascript">
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', '<?php echo $seo_google_analytics; ?>');
	</script>
	<!-- end google analytics -->
	<link rel="shortcut icon" href="<?php echo $seo_favicon; ?>" type="image/x-icon">
	<link rel="icon" href="<?php echo $seo_favicon; ?>" type="image/x-icon">
	<script src="{{ asset('public/frontend/js/jquery-3.2.1.js') }}"></script>
	<!--begin bootstrap-->
	<script src="{{ asset('public/frontend/js/bootstrap.min.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/css/bootstrap.min.css') }}" />
	<!--end bootstrap-->
	<!-- begin jquery-ui -->
	<script src="{{ asset('public/frontend/jquery-ui/jquery-ui.min.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/jquery-ui/jquery-ui.css') }}" />
	<!-- end jquery-ui -->
	<!-- begin font-awesome -->
	<link rel="stylesheet" href="{{ asset('public/frontend/web-fonts-with-css/css/fontawesome-all.min.css') }}" />	
	<!-- end font-awesome -->	
	<!-- begin ddsmoothmenu -->
	<script src="{{ asset('public/frontend/js/ddsmoothmenu.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/css/ddsmoothmenu.css') }}" />
	<link rel="stylesheet" href="{{ asset('public/frontend/css/ddsmoothmenu-v2.css') }}" />
	<!-- end ddsmoothmenu -->
	<!-- begin slick slider -->
	<script src="{{ asset('public/frontend/slick/slick.min.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/slick/slick.css') }}" />
	<link rel="stylesheet" href="{{ asset('public/frontend/slick/slick-theme.css') }}" />
	<!-- end slick slider -->
	<!-- begin tab -->
	<link rel="stylesheet" href="{{ asset('public/frontend/css/tab.css') }}" />
	<!-- end tab-->
	<!-- begin bxslider -->
	<script src="{{ asset('public/frontend/bxslider/jquery.bxslider.min.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/bxslider/jquery.bxslider.min.css') }}" />  
	<!-- end bxslider -->
	<!-- begin owl_carousel -->
	<script src="{{ asset('public/frontend/owl-carousel-2/owl.carousel.min.js') }}"></script>
	<script src="{{ asset('public/frontend/owl-carousel-2/owl.carousel2.thumbs.min.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/owl-carousel-2/owl.carousel.min.css') }}" />
	<link rel="stylesheet" href="{{ asset('public/frontend/owl-carousel-2/owl.theme.min.css') }}" /> 
	<link rel="stylesheet" href="{{ asset('public/frontend/owl-carousel-2/themes.css') }}" />  
	<!-- end owl_carousel -->
	<!-- begin elevatezoom -->
	<script src="{{ asset('public/frontend/js/jquery.elevatezoom-3.0.8.min.js') }}"></script>  
	<!-- end elevatezoom -->
	<!-- begin accounting -->
	<script src="{{ asset('public/frontend/js/accounting.min.js') }}"></script>  
	<!-- end accounting -->
	<!-- begin pagination -->
	<!--<link rel="stylesheet" href="{{ asset('public/frontend/css/pagination.css') }}" />-->
	<!-- end pagination-->
	<!-- begin product -->
	<link rel="stylesheet" href="{{ asset('public/frontend/css/product.css') }}" />
	<!-- end product-->
	<!-- begin datatables -->	
	<script src="{{ asset('public/frontend/js/jquery.dataTables.min.js') }}"></script>    
	<link rel="stylesheet" href="{{ asset('public/frontend/css/jquery.dataTables.min.css') }}" />
	<script src="{{ asset('public/frontend/js/table-library.js') }}"></script>    
	<!-- end datatables -->
	<!-- begin youtube -->    
	<script src="{{ asset('public/frontend/js/jquery-modal-video.min.js') }}"></script>
	<script src="{{ asset('public/frontend/js/modal-video.min.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/css/modal-video.min.css') }}" />
	<!-- end youtube -->
	<!-- begin fancybox -->
	<script language="javascript" type="text/javascript" src="{{asset('public/frontend/js/jquery.fancybox.min.js')}}"                 ></script>
	<link href="{{asset('public/frontend/css/jquery.fancybox.min.css')}}" rel="stylesheet" type="text/css" />
	<!-- end fancybox -->
	<!-- begin ckeditor-->
	<script language="javascript" type="text/javascript" src="{{asset('public/frontend/ckeditor/ckeditor.js')}}"                 ></script>
	<script language="javascript" type="text/javascript" src="{{asset('public/frontend/ckfinder/ckfinder.js')}}"                 ></script>
	<!-- end ckeditor-->
	<!-- begin custom -->
	<link rel="stylesheet" href="{{ asset('public/frontend/css/menu-horizontal-right.css') }}" />
	<link rel="stylesheet" href="{{ asset('public/frontend/css/menu-horizontal-right-dmsp.css') }}" />
	<script language="javascript" type="text/javascript" src="{{asset('public/frontend/js/spinner.js')}}"                 ></script>
	<script src="{{ asset('public/frontend/js/custom.js') }}"></script>    
	<link rel="stylesheet" href="{{ asset('public/frontend/css/template.css') }}" />
	<!-- end custom -->
	<script type="text/javascript" language="javascript">
		ddsmoothmenu.init({
			mainmenuid: "smoothmainmenu", 
			orientation: "h", 
			classname: "ddsmoothmenu",
			contentsource: "markup" 
		});    
		$(document).ready(function(){        
			$(window).bind("scroll", function() {                        
				if ($(window).scrollTop() > 90) {					
					
				}
				else {					
					
				}
			});			
		});  
		var spinner = new Spinner();  		
	</script>	
</head>
<body>	
	<!-- begin fanpage -->
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.11&appId=206740246563578';
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
	<!-- end fanpage -->
	<header class="header">	
		<div class="top">
			<div class="container">
				<div class="row">
					<div class="col-lg-1">					
						<div class="tieplua">
							<a href="http://tieplua.info" target="_blank">Tiếp lửa</a>
						</div>	
					</div>	
					<div class="col-lg-2">						
						<span><i class="fas fa-phone-volume"></i></span>
						<span>Hotline:</span>	
						<span>04.35335527</span>
					</div>	
					<div class="col-lg-9">						
						<ul class="nipad">
							<li><a href="<?php echo url('/'); ?>"><span><i class="fas fa-home"></i></span><span class="margin-left-5">Trang chủ</span> </a></li>
							<li><a href="<?php echo url('/'); ?>"><span><i class="fas fa-user-circle"></i></span><span class="margin-left-5">Người tìm việc</span> </a></li>
							<li><a href="javascript:void(0);"><span><i class="far fa-address-card"></i></span><span class="margin-left-5">Nhà tuyển dụng</span> </a></li>
							<li><a href="javascript:void(0);"><span><i class="fas fa-users"></i></span><span class="margin-left-5">Góc nghề nghiệp</span> </a></li>
						</ul>
					</div>					
				</div>
			</div>			
		</div>
		<div class="container padding-top-30 padding-bottom-30">
			<div class="row">
				<div class="col-lg-3"><a href="<?php echo url('/'); ?>"><img src="<?php echo asset('/upload/logo.png'); ?>"></a></div>
				<div class="col-lg-9">
					<form action="" method="post" name="frm-search-job">
						<div class="tim-cong-viec"><input type="text" name="job_name" class="kiem-cong-viec" placeholder="Nhập tên công việc..."></div>
						<div class="tim-cong-viec">
							<select name="job" class="kiem-cong-viec">
								<option>Chọn ngành nghề</option>
								<option>Dầu khí</option>
								<option>Địa chất</option>
								<option>Dệt may</option>
								<option>Điện tử / Điện lạnh</option>
								<option>Du lịch / Nhà hàng / Khách sạn</option>
							</select>
						</div>
						<div class="tim-cong-viec">
							<?php 
							/* begin province */
							$source_province=App\ProvinceModel::whereRaw('status = ?',[1])->orderBy('fullname','asc')->select('id','fullname')->get()->toArray();
							$ddlProvince=cmsSelectboxCategory("province_id","vacca",$source_province,0,'','Chọn tỉnh thành');
							/* end province */
							echo $ddlProvince;
							?>							
						</div>
						<div class="tim-cong-viec btn-search-job">
							<a href="javascript:void(0);" onclick="document.forms['frm-search-job'].submit();">Tìm công việc</a>
						</div>
					</form>					
				</div>
			</div>
		</div>
	</header>
	@yield("content")
	@include("frontend.footer")
</body>
</html>



