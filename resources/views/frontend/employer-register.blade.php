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
									<li><a href="javascript:void(0);">Trang chủ</a> <i class="fa fa-angle-right"></i></li>
									
									<li>Đăng ký</li>
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
									<li class="active"><a href="#contentOne-1" data-toggle="tab">Tài khoản nhà tuyển dụng</a>
									</li>								
								</ul>
								<div class="tab-content">
									<?php 
									if(count(@$msg) > 0){
										$type_msg='';					
										if((int)@$checked == 1){
											$type_msg='note-success';
										}else{
											$type_msg='note-danger';
										}
										?>
										<div class="note margin-top-15 margin-bottom-15 <?php echo $type_msg; ?>" >
											<ul>
												<?php 
												foreach (@$msg as $key => $value) {
													?>
													<li><?php echo $value; ?></li>
													<?php
												}
												?>                              
											</ul>	
										</div>      
										<?php
									}			
									?>
									<div class="tab-pane fade in active register_left_form" id="contentOne-1">										
										<div class="row">
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="email" value="<?php echo @$data['email']; ?>" placeholder="Email">
											</div>
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="fullname" value="<?php echo @$data['fullname']; ?>" placeholder="Tên công ty">
											</div>
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="password" name="password" value="<?php echo @$data['password']; ?>" placeholder="Mật khẩu">
											</div>
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="password" name="password_confirmed" value="<?php echo @$data['password_confirmed']; ?>" placeholder="Xác nhận mật khẩu">
											</div>
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="address" value="<?php echo @$data['address']; ?>" placeholder="Địa chỉ">
											</div>
											<!--Form Group-->
											<div class="form-group col-md-6 col-sm-6 col-xs-12 custom_input">
												<input type="text" name="phone" value="<?php echo @$data['phone']; ?>" placeholder="Điện thoại">
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
												$ddlScale=cmsSelectboxCategory("scale_id","",$source_scale,@$data['scale_id'],'','Chọn quy mô công ty');
												echo $ddlScale;
												?>
											</div>
											<div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">												<div class="slct"><p>Sơ lược công ty</p></div>
													<div>
														<textarea name="intro" placeholder="Nhập sơ lược công ty..."  class="summer-editor" rows="10" ><?php echo @$data['intro']; ?></textarea>
													</div>												
											</div>
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="fax" value="<?php echo @$data['fax']; ?>" placeholder="Fax">
											</div>
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<div class="ex-website">
													<div><input type="text" name="website" value="<?php echo @$data['website']; ?>" placeholder="Website">	</div>
													<div class="margin-left-15 lili">Ví dụ : www.pnj.com.vn</div>
												</div>												
											</div>	
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="contacted_name" value="<?php echo @$data['contacted_name']; ?>" placeholder="Tên người liên hệ">
											</div>
											<div class="form-group col-md-6 col-sm-6 col-xs-12">
												<input type="text" name="contacted_phone" value="<?php echo @$data['contacted_phone']; ?>" placeholder="Điện thoại người liên hệ">
											</div>																					
										</div>
										<div class="login_btn_wrapper register_btn_wrapper login_wrapper ">
											<a href="javascript:void(0);" onclick="document.forms['frm-register-employer'].submit();" class="btn btn-primary login_btn">Đăng ký</a>
										</div>
										<div class="login_message">
											<p>Bạn đã là thành viên chưa? <a href="<?php echo route('frontend.index.employerLogin'); ?>"> Đăng nhập tại đây </a> </p>
										</div>
									</div>							
								</div>								
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