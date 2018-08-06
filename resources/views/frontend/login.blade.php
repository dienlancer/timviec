@extends("frontend.master")
@section("content")
<?php 
$seo=getSeo();
$employer_link='';
$employer_link='';
$candidate_text='';
$candidate_link='';
$login_register_link='';
$login_register_text='';
switch ($status) {
	case 'register':
	$employer_text='ĐĂNG KÝ NHÀ TUYỂN DỤNG';
	$employer_link=route('frontend.index.employerRegister');
	$candidate_text='ĐĂNG KÝ ỨNG VIÊN';
	$candidate_link=route('frontend.index.candidateRegister');
	$login_register_link=route('frontend.index.registerLogin',['login']);
	$login_register_text='ĐĂNG NHẬP';
	break;
	case 'login':
	$employer_text='ĐĂNG NHẬP NHÀ TUYỂN DỤNG';
	$employer_link=route('frontend.index.employerLogin');
	$candidate_text='ĐĂNG NHẬP ỨNG VIÊN';
	$candidate_link=route('frontend.index.candidateLogin');
	$login_register_link=route('frontend.index.registerLogin',['register']);
	$login_register_text='ĐĂNG KÝ';
	break;	
}
?>
<h1 style="display: none;"><?php echo @$seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo @$seo["meta_description"]; ?></h2>
<?php 
$data_banner=getBanner('re-log');
if(count(@$data_banner) > 0){
	$items_banner=$data_banner['items'];
	if(count(@$items_banner) > 0){		
		?>
		<div class="box-meal">
			<div>    
				<script type="text/javascript" language="javascript">
					$(document).ready(function(){
						$(".banner").owlCarousel({
							autoplay:true,                    
							loop:true,
							margin:0,                        
							nav:false,            
							mouseDrag: false,
							touchDrag: false,                                
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
						});

					});                
				</script>        
				<div class="owl-carousel banner owl-theme"> 
					<?php 
					foreach ($items_banner as $key => $value) {
						?>
						<div><img src="<?php echo asset('upload/'.@$value['image']); ?>"></div>
						<?php	
					}
					?>					
				</div>
			</div>  
			<div class="single-cat-title">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="banner-title">ĐĂNG KÝ</div>
							<div>
								<ul class="banner-main">
									<li><a href="#">Home</a> <i class="fa fa-angle-right"></i></li>
									<li><a href="#">Pages</a> <i class="fa fa-angle-right"></i></li>
									<li>Register</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php
	}
}
?>
@endsection()               