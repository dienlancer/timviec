@extends("frontend.master")
@section("content")
<?php 
$seo=getSeo();
$setting= getSettingSystem();
$width=$setting['product_width']['field_value'];
$height=$setting['product_height']['field_value'];  
$seo_title="";
if(!empty(@$title)){
	$seo_title=@$title;
}else{	
	$seo_title=@$seo["title"];
}
$seo_meta_description="";
if(!empty(@$meta_description)){
	$seo_meta_description=@$meta_description;
}else{
	$seo_meta_description=@$seo["meta_description"];
}
?>
<h1 style="display: none;"><?php echo @$seo_title; ?></h1>
<h2 style="display: none;"><?php echo @$seo_meta_description; ?></h2>
<?php 
$data_banner=getBanner('re-log');
$items=$data_banner['items'];
if(count(@$items) > 0){
	?>
	<div class="box-meal">
		<div>
			<script type="text/javascript" language="javascript">
				jQuery(document).ready(function(){
					jQuery(".banner").owlCarousel({
						autoplay:true,                    
						loop:true,
						margin:0,                        
						nav:false,            
						mouseDrag: true,
						touchDrag: true,                                
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
				foreach ($items as $key => $value) {
					$featured_img=asset('upload/'.$value['image']);
					?>
					<div><img src="<?php echo $featured_img; ?>"></div>
					<?php   	
				}                   
				?>
			</div>
		</div>  
		<div class="single-cat-title">
			<div class="company-real-man">
				<div class="container">
					<div class="col-lg-12">        			
						<div class="jp_tittle_heading_wrapper">
							<div class="jp_tittle_heading">
								<h2><?php echo @$item['fullname']; ?></h2>
							</div>
							<div class="jp_tittle_breadcrumb_main_wrapper">
								<div class="jp_tittle_breadcrumb_wrapper">
									<ul itemscope="" itemtype="http://schema.org/BreadcrumbList">
										<li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
											<a itemscope="" itemtype="http://schema.org/Thing" itemprop="item" href="<?php echo route('frontend.index.getHome'); ?>">
												<span itemprop="name">Trang chủ</span>
											</a>   
											<i class="fa fa-angle-right"></i>                         			
											<meta itemprop="position" content="1">
										</li>
										<li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
											<a itemscope="" itemtype="http://schema.org/Thing" itemprop="item" href="javascript:void(0);">
												<span itemprop="name">Tuyển dụng</span>
											</a>     
											<i class="fa fa-angle-right"></i>                       			
											<meta itemprop="position" content="2">
										</li>
										<li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
											<a itemscope="" itemtype="http://schema.org/Thing" itemprop="item" href="<?php echo route('frontend.index.index',[@$alias]) ?>">
												<span itemprop="name"><?php echo @$title; ?></span>
											</a>	
											<i class="fa fa-angle-right"></i>					
											<meta itemprop="position" content="3">
										</li>      				
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>        	
		</div>
	</div>
	<?php
}
if(count(@$item) > 0){
	$logo='';
	if(!empty($item['logo'])){
		$logo=asset('upload/'.$width.'x'.$height.'-'.$item['logo']);
	}else{
		$logo=asset('upload/no-logo.png');
	}
	?>
	<div class="box-company">				
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="jp_cs_com_info_wrapper">
						<div class="jp_cs_com_info_img">
							<img src="<?php echo $logo; ?>" alt="<?php echo @$item['fullname']; ?>">
						</div>
						<div class="jp_cs_com_info_img_cont">
							<h2 class="company-title"><?php echo @$item['fullname']; ?></h2>
							<p><b>Người liên hệ</b> : <?php echo @$item['contacted_name'] ?> - <b>Điện thoại liên lạc</b> : <?php echo @$item['contacted_phone'] ?></p>
							<h3 class="company-address"><i class="fa fa-map-marker"></i> &nbsp;&nbsp;<?php echo @$item['address']; ?></h3>
						</div>
						<div class="clr"></div>
						<div class="company-authentication">
							<center>
								<?php 
								if((int)@$item['status_authentication'] > 0){
									?>
									<img src="<?php echo asset('upload/ok.png'); ?>" width="150">
									<?php
								}else{
									?>
									<img src="<?php echo asset('upload/no-ok.png'); ?>" width="150">
									<?php
								}
								?>
							</center>
						</div>
					</div>
				</div>				
			</div>			
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="jp_listing_left_sidebar_wrapper">
					<div class="jp_job_des">
						<div class="company-heading">
							<div>SƠ LƯỢC CÔNG TY</div>
						</div>
						<div class="margin-top-30">
							<?php echo @$item['intro']; ?>
						</div>
						<ul>
							<li><i class="fa fa-globe"></i>&nbsp;&nbsp; <a target="_blank" href="<?php echo 'https://'.@$item['website']; ?>"><?php echo @$item['website']; ?></a></li>
							<li><i class="fa fa-file-pdf-o"></i>&nbsp;&nbsp; <a target="_blank" href="javascript:void(0);">Download tài liệu</a></li>

						</ul>
					</div>
					<!--<div class="jp_job_res">
						<div class="company-heading">
							<div>NHIỆM VỤ CÔNG TY</div>
						</div>
						<div class="margin-top-30">Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur aliquet quam id
						dui posuere blandit.</div>						
					</div>
					<div class="jp_job_res jp_job_qua">
						<div class="company-heading">
							<div>QUẢN LÝ CHẤT LƯỢNG</div>
						</div>
						<div class="margin-top-30">Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur aliquet quam id
						dui posuere blandit.</div>				
					</div>-->
				</div>
				<div class="jp_listing_related_heading_wrapper">
					<h2>Related Jobs</h2>
					<div class="jp_listing_related_slider_wrapper">
						<div class="owl-carousel owl-theme">
							<div class="item">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="jp_job_post_main_wrapper_cont jp_job_post_grid_main_wrapper_cont">
											<div class="jp_job_post_main_wrapper">
												<div class="row">
													<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
														<div class="jp_job_post_side_img">
															<img src="{{asset('')}} images/content/job_post_img1.jpg" alt="post_img" />
														</div>
														<div class="jp_job_post_right_cont jp_cl_job_cont">
															<h4>COMERA JOB PORT</h4>
															<p>MARKETING JOB</p>
															<ul>
																<li><i class="fa fa-map-marker"></i>&nbsp; Caliphonia, PO 455001</li>
															</ul>
															<h5>145 ACTIVE JOBS</h5>
														</div>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
														<div class="jp_job_post_right_btn_wrapper">
															<ul>
																<li><a href="#">Follow</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jp_job_post_keyword_wrapper">
												<ul>
													<li><i class="fa fa-tags"></i>Keywords :</li>
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
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="jp_job_post_main_wrapper_cont jp_job_post_grid_main_wrapper_cont">
											<div class="jp_job_post_main_wrapper">
												<div class="row">
													<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
														<div class="jp_job_post_side_img">
															<img src="images/content/job_post_img2.jpg" alt="post_img" />
														</div>
														<div class="jp_job_post_right_cont jp_cl_job_cont">
															<h4>COMERA JOB PORT</h4>
															<p>MARKETING JOB</p>
															<ul>
																<li><i class="fa fa-map-marker"></i>&nbsp; Caliphonia, PO 455001</li>
															</ul>
															<h5>145 ACTIVE JOBS</h5>
														</div>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
														<div class="jp_job_post_right_btn_wrapper">
															<ul>
																<li><a href="#">Follow</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jp_job_post_keyword_wrapper">
												<ul>
													<li><i class="fa fa-tags"></i>Keywords :</li>
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
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="jp_job_post_main_wrapper_cont jp_job_post_grid_main_wrapper_cont">
											<div class="jp_job_post_main_wrapper">
												<div class="row">
													<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
														<div class="jp_job_post_side_img">
															<img src="images/content/job_post_img3.jpg" alt="post_img" />
														</div>
														<div class="jp_job_post_right_cont jp_cl_job_cont">
															<h4>COMERA JOB PORT</h4>
															<p>MARKETING JOB</p>
															<ul>
																<li><i class="fa fa-map-marker"></i>&nbsp; Caliphonia, PO 455001</li>
															</ul>
															<h5>145 ACTIVE JOBS</h5>
														</div>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
														<div class="jp_job_post_right_btn_wrapper">
															<ul>
																<li><a href="#">Follow</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jp_job_post_keyword_wrapper">
												<ul>
													<li><i class="fa fa-tags"></i>Keywords :</li>
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
							<div class="item">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="jp_job_post_main_wrapper_cont jp_job_post_grid_main_wrapper_cont">
											<div class="jp_job_post_main_wrapper">
												<div class="row">
													<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
														<div class="jp_job_post_side_img">
															<img src="images/content/job_post_img1.jpg" alt="post_img" />
														</div>
														<div class="jp_job_post_right_cont jp_cl_job_cont">
															<h4>COMERA JOB PORT</h4>
															<p>MARKETING JOB</p>
															<ul>
																<li><i class="fa fa-map-marker"></i>&nbsp; Caliphonia, PO 455001</li>
															</ul>
															<h5>145 ACTIVE JOBS</h5>
														</div>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
														<div class="jp_job_post_right_btn_wrapper">
															<ul>
																<li><a href="#">Follow</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jp_job_post_keyword_wrapper">
												<ul>
													<li><i class="fa fa-tags"></i>Keywords :</li>
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
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="jp_job_post_main_wrapper_cont jp_job_post_grid_main_wrapper_cont">
											<div class="jp_job_post_main_wrapper">
												<div class="row">
													<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
														<div class="jp_job_post_side_img">
															<img src="images/content/job_post_img2.jpg" alt="post_img" />
														</div>
														<div class="jp_job_post_right_cont jp_cl_job_cont">
															<h4>COMERA JOB PORT</h4>
															<p>MARKETING JOB</p>
															<ul>
																<li><i class="fa fa-map-marker"></i>&nbsp; Caliphonia, PO 455001</li>
															</ul>
															<h5>145 ACTIVE JOBS</h5>
														</div>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
														<div class="jp_job_post_right_btn_wrapper">
															<ul>
																<li><a href="#">Follow</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jp_job_post_keyword_wrapper">
												<ul>
													<li><i class="fa fa-tags"></i>Keywords :</li>
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
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="jp_job_post_main_wrapper_cont jp_job_post_grid_main_wrapper_cont">
											<div class="jp_job_post_main_wrapper">
												<div class="row">
													<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
														<div class="jp_job_post_side_img">
															<img src="images/content/job_post_img3.jpg" alt="post_img" />
														</div>
														<div class="jp_job_post_right_cont jp_cl_job_cont">
															<h4>COMERA JOB PORT</h4>
															<p>MARKETING JOB</p>
															<ul>
																<li><i class="fa fa-map-marker"></i>&nbsp; Caliphonia, PO 455001</li>
															</ul>
															<h5>145 ACTIVE JOBS</h5>
														</div>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
														<div class="jp_job_post_right_btn_wrapper">
															<ul>
																<li><a href="#">Follow</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jp_job_post_keyword_wrapper">
												<ul>
													<li><i class="fa fa-tags"></i>Keywords :</li>
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
							<div class="item">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="jp_job_post_main_wrapper_cont jp_job_post_grid_main_wrapper_cont">
											<div class="jp_job_post_main_wrapper">
												<div class="row">
													<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
														<div class="jp_job_post_side_img">
															<img src="images/content/job_post_img1.jpg" alt="post_img" />
														</div>
														<div class="jp_job_post_right_cont jp_cl_job_cont">
															<h4>COMERA JOB PORT</h4>
															<p>MARKETING JOB</p>
															<ul>
																<li><i class="fa fa-map-marker"></i>&nbsp; Caliphonia, PO 455001</li>
															</ul>
															<h5>145 ACTIVE JOBS</h5>
														</div>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
														<div class="jp_job_post_right_btn_wrapper">
															<ul>
																<li><a href="#">Follow</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jp_job_post_keyword_wrapper">
												<ul>
													<li><i class="fa fa-tags"></i>Keywords :</li>
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
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="jp_job_post_main_wrapper_cont jp_job_post_grid_main_wrapper_cont">
											<div class="jp_job_post_main_wrapper">
												<div class="row">
													<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
														<div class="jp_job_post_side_img">
															<img src="images/content/job_post_img2.jpg" alt="post_img" />
														</div>
														<div class="jp_job_post_right_cont jp_cl_job_cont">
															<h4>COMERA JOB PORT</h4>
															<p>MARKETING JOB</p>
															<ul>
																<li><i class="fa fa-map-marker"></i>&nbsp; Caliphonia, PO 455001</li>
															</ul>
															<h5>145 ACTIVE JOBS</h5>
														</div>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
														<div class="jp_job_post_right_btn_wrapper">
															<ul>
																<li><a href="#">Follow</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jp_job_post_keyword_wrapper">
												<ul>
													<li><i class="fa fa-tags"></i>Keywords :</li>
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
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="jp_job_post_main_wrapper_cont jp_job_post_grid_main_wrapper_cont">
											<div class="jp_job_post_main_wrapper">
												<div class="row">
													<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
														<div class="jp_job_post_side_img">
															<img src="images/content/job_post_img3.jpg" alt="post_img" />
														</div>
														<div class="jp_job_post_right_cont jp_cl_job_cont">
															<h4>COMERA JOB PORT</h4>
															<p>MARKETING JOB</p>
															<ul>
																<li><i class="fa fa-map-marker"></i>&nbsp; Caliphonia, PO 455001</li>
															</ul>
															<h5>145 ACTIVE JOBS</h5>
														</div>
													</div>
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
														<div class="jp_job_post_right_btn_wrapper">
															<ul>
																<li><a href="#">Follow</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="jp_job_post_keyword_wrapper">
												<ul>
													<li><i class="fa fa-tags"></i>Keywords :</li>
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
					</div>
				</div>				
			</div>
			<div class="col-lg-4">
				<div class="jp_rightside_career_wrapper">
					<div class="jp_rightside_career_heading">
						<h4>TỔNG QUAN</h4>
					</div>
					<div class="jp_rightside_career_main_content">
						<div class="margin-top-15">
							<center>
								<div class="jp_jop_overview_img">
									<center><img src="<?php echo $logo; ?>" alt="<?php echo @$item['fullname']; ?>"></center>
								</div>
							</center>
						</div>							
						<?php 
						$data_job=App\RecruitmentModel::whereRaw('employer_id=?',[(int)@$item['id']])->select('id')->get()->toArray();				
						?>
						<div class="jp_job_post_right_overview_btn margin-top-15">
							<center>
								<ul>
									<li><a href="javascript:void(0);"><?php echo count(@$data_job); ?> công việc</a></li>
								</ul>
							</center>
						</div>	
						<hr/>
						<div class="jp_listing_overview_list_outside_main_wrapper">
							<div class="jp_listing_overview_list_main_wrapper">
								<div class="jp_listing_list_icon">
									<i class="fa fa-map-marker"></i>
								</div>
								<div class="jp_listing_list_icon_cont_wrapper">
									<ul>
										<li>Địa chỉ:</li>
										<li><?php echo @$item['address']; ?></li>
									</ul>
								</div>
								<div class="clr"></div>
							</div>	
							<div class="jp_listing_overview_list_main_wrapper jp_listing_overview_list_main_wrapper2">
								<div class="jp_listing_list_icon">
									<i class="far fa-user"></i>
								</div>
								<div class="jp_listing_list_icon_cont_wrapper">
									<ul>
										<li>Người liên hệ:</li>
										<li><?php echo @$item['contacted_name']; ?></li>
									</ul>
								</div>
								<div class="clr"></div>
							</div>	
							<div class="jp_listing_overview_list_main_wrapper jp_listing_overview_list_main_wrapper2">
								<div class="jp_listing_list_icon">
									<i class="fas fa-phone"></i>
								</div>
								<div class="jp_listing_list_icon_cont_wrapper">
									<ul>
										<li>Điện thoại liên lạc:</li>
										<li><?php echo @$item['contacted_phone']; ?></li>
									</ul>
								</div>
								<div class="clr"></div>
							</div>						
							<div class="jp_listing_overview_list_main_wrapper jp_listing_overview_list_main_wrapper2">
								<div class="jp_listing_list_icon">
									<i class="fa fa-envelope"></i>
								</div>
								<div class="jp_listing_list_icon_cont_wrapper">
									<ul>
										<li>Email:</li>
										<li><?php echo @$item['email']; ?></li>
									</ul>
								</div>
								<div class="clr"></div>
							</div>							
							<div class="jp_listing_right_bar_btn_wrapper">
								<div class="jp_listing_right_bar_btn">
									<ul>
										<li><a href="javascript:void(0);"><i class="fa fa-plus-circle"></i> &nbsp;FACEBOOK</a></li>
										<li><a href="javascript:void(0);"><i class="fa fa-plus-circle"></i> &nbsp;CHIA SẼ</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php
}
?>
<!--<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="margin-top-15">
				<ul itemscope="" itemtype="http://schema.org/BreadcrumbList" class="ul-breadcrumb">
					<li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
						<a itemscope="" itemtype="http://schema.org/Thing" itemprop="item" href="<?php echo route('frontend.index.getHome'); ?>">
							<span itemprop="name">Trang chủ</span>
						</a>
						<span class="soech">/</span>
						<meta itemprop="position" content="1">
					</li>
					<li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
						<a itemscope="" itemtype="http://schema.org/Thing" itemprop="item" href="javascript:void(0);">
							<span itemprop="name">Tuyển dụng</span>
						</a>
						<span class="soech">/</span>
      					<meta itemprop="position" content="2">
      				</li>
					<li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
						<a itemscope="" itemtype="http://schema.org/Thing" itemprop="item" href="<?php echo route('frontend.index.index',[@$alias]) ?>">
							<span itemprop="name"><?php echo @$title; ?></span>
						</a>						
      					<meta itemprop="position" content="3">
      				</li>      				
      			</ul>
			</div>
			<div class="source-recruitment-box margin-top-15">
				<div class="employer-title"><?php echo @$title; ?></div>
			</div>
			<?php 
			if(count(@$item) > 0){
				$logo='';
				if(!empty($item['logo'])){
					$logo=asset('upload/'.$width.'x'.$height.'-'.$item['logo']);
				}else{
					$logo=asset('upload/no-logo.png');
				}
				?>
				<div class="source-recruitment-box source-recruitment-main margin-top-15">
					<div class="row">
						<div class="col-lg-3">							
							<div class="box-employer-detail-logo"><center><img src="<?php echo $logo; ?>"></center></div>
							<div class="margin-top-40 margin-bottom-15">
								<center>
								<?php 
								if((int)@$item['status_authentication'] > 0){
									?>
									<img src="<?php echo asset('upload/ok.png'); ?>">
									<?php
								}else{
									?>
									<img src="<?php echo asset('upload/no-ok.png'); ?>">
									<?php
								}
								?>
								</center>
							</div>
						</div>
						<div class="col-lg-9">
							<div class="margin-top-10">
								<span class="lazasa"><b>Địa chỉ&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$item['address']; ?></span>
							</div>
							<?php 
							if(!empty(@$item['website'])){
								?>
								<div class="margin-top-10">
								<span class="lazasa"><b>Website&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$item['website']; ?></span>
								</div>
								<?php
							}
							?>	
							<div class="margin-top-10 vidola">
								<?php echo @$item['intro']; ?>
							</div>						
						</div>
					</div>
				</div>
				<?php
			}
			?>			
			<div class="source-recruitment-box margin-top-15">				
				<?php 
				if(count(@$items) > 0){					
					?>
					<form name="frm" method="POST" enctype="multipart/form-data" class="source-recruitment-main">
						<input type="hidden" name="filter_page" value="1">        
						{{ csrf_field() }}
						<?php 
						$k=0;
						foreach ($items as $key => $value) {
							$fullname= truncateString(@$value['fullname'],70);
							$duration=datetimeConverterVn(@$value['duration']);
							$employer_name=truncateString(@$value['employer_fullname'],9999);
							$logo='';
							if(!empty(@$value['logo'])){
								$logo=asset('upload/'.$width.'x'.$height.'-'.@$value['logo']);
							}else{
								$logo=asset('upload/no-logo.png');
							}
							$source_province=DB::table('province')
							->join('recruitment_place','province.id','=','recruitment_place.province_id')							
							->where('recruitment_place.recruitment_id',(int)@$value['id'])
							->select(								
								'province.fullname',
								'province.alias'								
							)
							->groupBy(								
								'province.fullname',
								'province.alias'								
							)
							->orderBy('province.id', 'desc')						
							->get()
							->toArray();	 
							$data_province=convertToArray($source_province);					
							$province_text='';
							foreach ($data_province as $key_province => $value_province) {
								$province_text.='<span class="margin-left-5"><a title="'.@$value_province['fullname'].'" href="'.route('frontend.index.index',[@$value_province['alias']]).'">'.@$value_province['fullname'].'</a></span>&nbsp;/';
							}
							$province_text=substr($province_text,0,strlen(@$province_text)-1);
							$hot_gif='';
							if((int)@$value['status_hot'] == 1){
								$hot_gif= '&nbsp;<img src="'.asset('upload/hot.gif').'" width="40" />';
							}
							if($k%3 == 0){								
								echo '<div class="row">';
							}
							?>
							<div class="col-lg-4">
								<div class="box-source-recruitment">
									<div class="row">
										<div class="col-xs-4">
											<div class="padding-left-10"><a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['employer_alias']]); ?>"><img alt="<?php echo @$value['employer_fullname']; ?>" src="<?php echo @$logo; ?>"></a></div>
										</div>
										<div class="col-xs-8">
											<div class="ribi"><a title="<?php echo @$value['fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><?php echo @$fullname; ?></a></div>
											<div class="khaly"><a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['employer_alias']]); ?>"><?php echo @$employer_name; ?></a></div>
											<div class="source-recruitment-bill"><i class="far fa-money-bill-alt"></i><span class="margin-left-5"><?php echo @$value['salary_name']; ?></span></div>
											<div>
												<i class="fas fa-map-marker-alt"></i><?php echo @$province_text; ?>
											</div>
											<div>
												Ngày hết hạn&nbsp;:&nbsp;<?php echo @$duration; ?>
											</div>
										</div>
									</div>
								</div>
							</div>
							<?php
							$k++;
							if($k%3==0 || $k == count(@$items)){
								echo '</div>';
							} 
						}
						?>
						<div class="row"><div class="col-lg-12"><?php echo @$pagination->showPagination(); ?></div></div>
					</form>				
					<?php
				}
				?>				
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-8">
			@include("frontend.recruitment-content-left")
			@include("frontend.recruitment-content-left-2")
			@include("frontend.recruitment-content-left-3")
		</div>
		<div class="col-lg-4">
			@include("frontend.recruitment-content-right")
			@include("frontend.recruitment-search-advance")
			@include("frontend.recruitment-province")
			@include("frontend.recruitment-top-employer")			
		</div>
	</div>
</div>-->
@endsection()               

