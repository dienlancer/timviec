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
							<li><a href="<?php echo route('frontend.index.index',['cam-nang-nghe-nghiep']); ?>"><span><i class="fas fa-users"></i></span><span class="margin-left-5">Cẩm nang nghề nghiệp</span> </a></li>
						</ul>
					</div>					
				</div>
			</div>			
		</div>
		<div class="container padding-top-30 padding-bottom-30">
			<div class="row">
				<div class="col-lg-3"><a href="<?php echo url('/'); ?>"><img src="<?php echo asset('upload/'.$seo['logo_frontend']);?>" alt='<?php echo @$seo["alt_logo"]; ?>' /></a></div>
				<div class="col-lg-9">
					<form action="<?php echo route('frontend.index.searchRecruitment'); ?>" method="POST" name="frm-search-job">
						{{ csrf_field() }}
						<div class="tim-cong-viec"><input type="text" name="q" value="<?php echo @$q; ?>" class="kiem-cong-viec" placeholder="Nhập tên công việc..."></div>
						<div class="tim-cong-viec">
							<?php 
							$source_job=App\JobModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
							$ddlJob        =cmsSelectboxCategory("job_id", 'vacca selected2', @$source_job, @$job_id,'','Chọn ngành nghề');
							echo $ddlJob;
							?>							
						</div>
						<div class="tim-cong-viec">
							<?php 
							/* begin province */
							$source_province=App\ProvinceModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
							$ddlProvince=cmsSelectboxCategory("province_id","vacca selected2",$source_province,@$province_id,'','Chọn tỉnh thành');
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



