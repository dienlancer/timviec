@extends("frontend.master")
@section("content")
<?php 
$seo=getSeo();
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
							<div class="banner-title">ĐĂNG NHẬP</div>
							<div>
								<ul class="banner-main">
									<li><a href="javascript:void(0);">Trang chủ</a> <i class="fa fa-angle-right"></i></li>
									
									<li>Đăng nhập</li>
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
<div class="container">
	<div class="row">
		<div class="col-lg-6">
			<div class="register-bl">
				<div class="row">
					<div class="col-lg-4">
						<div class="profile-candidate"><i class="far fa-address-book"></i></div>
					</div>
					<div class="col-lg-8">
						<div class="register-candidate">ĐĂNG NHẬP ỨNG VIÊN</div>
						<ul class="gara">
							<li>
								<div class="register-li">
									<div class="nicotin"><i class="fas fa-arrow-circle-right"></i></div>
									<div class="margin-left-5">+ 1,500,000 công việc được cập nhật thường xuyên</div>
								</div>								
							</li>
							<li>
								<div class="register-li">
									<div class="nicotin"><i class="fas fa-arrow-circle-right"></i></div>
									<div class="margin-left-5">Ứng tuyển công việc yêu thích HOÀN TOÀN MIỄN PHÍ</div>
								</div>								
							</li>
							<li>
								<div class="register-li">
									<div class="nicotin"><i class="fas fa-arrow-circle-right"></i></div>
									<div class="margin-left-5">Hiển thị thông tin hồ sơ với nhà tuyển dụng hàng đầu</div>
								</div>								
							</li>
							<li>
								<div class="register-li">
									<div class="nicotin"><i class="fas fa-arrow-circle-right"></i></div>
									<div class="margin-left-5">Nhận bản tin công việc phù hợp định kỳ</div>
								</div>								
							</li>
						</ul>
						<div class="register-pipi"><a href="<?php echo route('frontend.index.candidateLogin'); ?>">ĐĂNG NHẬP ỨNG VIÊN</a></div>
					</div>
				</div>				
			</div>
		</div>
		<div class="col-lg-6">
			<div class="register-bl">
				<div class="row">
					<div class="col-lg-4">
						<div class="profile-employer"><i class="far fa-address-book"></i></div>
					</div>
					<div class="col-lg-8">
						<div class="register-employer">ĐĂNG NHẬP NHÀ TUYỂN DỤNG</div>
						<ul class="gara">
							<li>
								<div class="register-li">
									<div class="nicotin"><i class="fas fa-arrow-circle-right"></i></div>
									<div class="margin-left-5">+ 3,500,000 ứng viên tiếp cận thông tin tuyển dụng</div>
								</div>								
							</li>
							<li>
								<div class="register-li">
									<div class="nicotin"><i class="fas fa-arrow-circle-right"></i></div>
									<div class="margin-left-5">Không giới hạn tương tác với ứng viên qua hệ thống nhắn tin nội bộ miễn phí</div>
								</div>								
							</li>
							<li>
								<div class="register-li">
									<div class="nicotin"><i class="fas fa-arrow-circle-right"></i></div>
									<div class="margin-left-5">Quảng cáo thông minh giúp tin tuyển dụng được phủ rộng trên toàn bộ hệ thống</div>
								</div>								
							</li>
							<li>
								<div class="register-li">
									<div class="nicotin"><i class="fas fa-arrow-circle-right"></i></div>
									<div class="margin-left-5">Quảng cáo công ty trên Fanpage số 1 về việc làm - tuyển dụng</div>
								</div>								
							</li>
						</ul>
						<div class="register-lata"><a href="<?php echo route('frontend.index.employerLogin'); ?>">ĐĂNG NHẬP NHÀ TUYỂN DỤNG</a></div>
					</div>
				</div>				
			</div>
		</div>
	</div>
</div>
@endsection()               