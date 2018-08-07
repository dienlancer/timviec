@extends("frontend.master")
@section("content")
<?php 
$seo=getSeo();
$source_province=App\ProvinceModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
$source_scale=App\ScaleModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
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
<h1 style="display: none;"><?php echo @$seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo @$seo["meta_description"]; ?></h2>
<div class="wrapper-register">
	<!-- jp register wrapper start -->
	<div class="register_section">
		<!-- register_form_wrapper -->
		<div class="register_tab_wrapper">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<form name="frm-register-employer" method="POST" enctype="multipart/form-data">
							{{ csrf_field() }}
							<div role="tabpanel">							
								<ul id="tabOne" class="nav register-tabs">
									<li class="active"><a href="#contentOne-1" data-toggle="tab">personal account <br> <span>i am looking for a job</span></a>
									</li>								
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade in active register_left_form" id="contentOne-1">
										<div class="jp_regiter_top_heading">
											<p>Fields with * are mandetory </p>
										</div>
										<div class="row">
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="email" value="" placeholder="Email">
											</div>
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="fullname" value="" placeholder="Tên công ty">
											</div>
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="password" name="password" value="" placeholder="Mật khẩu">
											</div>
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="password" name="password_confirmed" value="" placeholder="Xác nhận mật khẩu">
											</div>
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="address" value="" placeholder="Địa chỉ">
											</div>
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12 custom_input">
												<input type="text" name="phone" value="" placeholder="Điện thoại">
											</div>
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<?php 
												$ddlProvince=cmsSelectboxCategory("province_id","selected2",$source_province,@$data['province_id'],'','Chọn tỉnh thành');
												echo $ddlProvince;
												?>												
											</div>
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<?php 
												$ddlScale=cmsSelectboxCategory("scale_id","vacca",$source_scale,@$data['scale_id'],'','Chọn quy mô công ty');
												echo $ddlScale;
												?>
											</div>
											<div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<input type="text" name="field-name" value="" placeholder="Sơ lược công ty">
											</div>
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="fax" value="" placeholder="Fax">
											</div>
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<div class="ex-website">
													<div><input type="text" name="website" value="" placeholder="Website">	</div>
													<div class="margin-left-15 lili">Ví dụ : www.pnj.com.vn</div>
												</div>												
											</div>	
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="contacted_name" value="" placeholder="Tên người liên hệ">
											</div>
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="contacted_phone" value="" placeholder="Điện thoại người liên hệ">
											</div>										
											<div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="check-box text-center">
													<input type="checkbox" name="shipping-option" id="account-option_1"> &ensp;
													<label for="account-option_1">I agreed to the <a href="#" class="check_box_anchr">Terms and Conditions</a> governing the use of jobportal</label>
												</div>
											</div>
										</div>
										<div class="login_btn_wrapper register_btn_wrapper login_wrapper ">
											<a href="#" class="btn btn-primary login_btn"> register </a>
										</div>
										<div class="login_message">
											<p>Already a member? <a href="#"> Login Here </a> </p>
										</div>
									</div>							
								</div>
								<p class="btm_txt_register_form">In case you are using a public/shared computer we recommend that you logout to prevent any un-authorized access to your account</p>
							</div>
						</form>						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jp register wrapper end -->
	<div class="clr"></div>
</div>
@endsection()