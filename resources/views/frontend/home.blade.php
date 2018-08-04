@extends("frontend.master")
@section("content")
<?php 
$seo=getSeo();
$setting= getSettingSystem();
$width=$setting['product_width']['field_value'];
$height=$setting['product_height']['field_value'];  
$article_width=$setting['article_width']['field_value'];
$article_height=$setting['article_height']['field_value'];  
?>
<!-- map Wrapper Start -->
<div class="jp_map_indx_wrapper">
	<div id="map"></div>
	<div class="jp_slider_form_main_wrapper">
		<div class="jp_main_slider_heading_wrapper">
			<h2>Find Your Job!</h2>
		</div>
		<form action="<?php echo route('frontend.index.searchRecruitment'); ?>" method="POST" name="frm-search-job">
			{{ csrf_field() }}
			<div class="jp_slider_form_input">
				<input type="text" placeholder="Nhập tên công việc , vị trí">
			</div>
			<div class="jp_slider_form_location_wrapper">
				<i class="fa fa-dot-circle-o first_icon"></i>
				<?php                             	
				$source_province=App\ProvinceModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
				$ddlProvince=cmsSelectboxCategory("province_id","selected2",$source_province,@$province_id,'','Tỉnh thành');
				echo $ddlProvince;
				?>	
				<i class="fa fa-angle-down second_icon"></i>
			</div>
			<div class="jp_slider_form_location_wrapper">
				<i class="fa fa-th-large first_icon"></i>
				<?php 
				$source_job=App\JobModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
				$ddlJob        =cmsSelectboxCategory("job_id", '', @$source_job, @$job_id,'','Ngành nghề');
				echo $ddlJob;
				?>	
				<i class="fa fa-angle-down second_icon"></i>
			</div>
			<div class="jp_slider_form_location_wrapper">
				<i class="fa fa-line-chart first_icon"></i>
				<?php                             	
				$source_experience=App\ExperienceModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
				$ddlExperience=cmsSelectboxCategory("experience_id","",$source_experience,@$experience_id,'','Kinh nghiệm làm việc');
				echo $ddlExperience;
				?>	
				<i class="fa fa-angle-down second_icon"></i>
			</div>
			<div class="jp_slider_form_location_wrapper">
				<i class="fa fa-money first_icon"></i>
				<?php 
				$source_salary=App\SalaryModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
				$ddlSalary        =cmsSelectboxCategory("salary_id", 'vacca', @$source_salary, @$salary_id,'','Chọn mức lương');
				echo $ddlSalary;
				?>                
				<i class="fa fa-angle-down second_icon"></i>
			</div>
			<div class="jp_slider_form_btn_wrapper">
				<ul>
					<li><a href="javascript:void(0);" onclick="document.forms['frm-search-job'].submit();"><i class="fa fa-search"></i>&nbsp; TÌM KIẾM</a></li>
				</ul>
			</div>
		</form>                        
	</div>
</div>
<!-- map Wrapper End -->
<!-- jp tittle slider Wrapper Start -->
<?php 
$query_new_job=DB::table('recruitment')
->join('employer','recruitment.employer_id','=','employer.id')
->join('salary','recruitment.salary_id','=','salary.id');
$query_new_job->where('recruitment.status',1);
$query_new_job->where('recruitment.status_employer',1);
$query_new_job->where('recruitment.status_new',1);
$source_new_job=$query_new_job->select(
	'recruitment.id',
	'recruitment.fullname',
	'recruitment.alias',
	'recruitment.duration',
	'recruitment.status_hot',
	'salary.fullname as salary_name',
	'employer.fullname as employer_fullname',
	'employer.alias as employer_alias',
	'employer.logo'
)
->groupBy(
	'recruitment.id',
	'recruitment.fullname',
	'recruitment.alias',
	'recruitment.duration',
	'recruitment.status_hot',
	'salary.fullname',
	'employer.fullname',
	'employer.alias',
	'employer.logo'
)
->orderBy('recruitment.id', 'desc')
->take(63)
->get()
->toArray();		
if(count(@$source_new_job) > 0){
	$data_new_job=convertToArray(@$source_new_job);	
	?>
	<div class="jp_tittle_slider_main_wrapper" style="float:left; width:100%; margin-top:30px;">
		<div class="container">
			<div class="jp_tittle_name_wrapper">
				<div class="jp_tittle_name">
					<h3>CÔNG VIỆC MỚI NHẤT</h3>
					<h4>TRONG THÁNG</h4>
				</div>
			</div>
			<div class="jp_tittle_slider_wrapper">
				<div class="jp_tittle_slider_content_wrapper">
					<div class="owl-carousel owl-theme">
						<?php 
						$k=0;
						foreach ($data_new_job as $key => $value) {												
							$new_job_fullname=truncateString(@$value['fullname'],30) ;
							$new_job_employer=truncateString(@$value['employer_fullname'],30);
							$new_job_duration=datetimeConverterVn(@$value['duration']);
							$new_job_logo='';
							if(!empty(@$value['logo'])){
								$new_job_logo=asset('upload/'.$width.'x'.$height.'-'.@$value['logo']);
							}else{
								$new_job_logo=asset('upload/no-logo.png');
							}
							$new_job_hot_gif='';
							if((int)@$value['status_hot'] == 1){
								$new_job_hot_gif= '&nbsp;<img src="'.asset('upload/hot.gif').'" width="40" />';
							}
							if($k%3 == 0){
								echo '<div class="item">';
							}								
							?>
							<div class="jp_tittle_slides_one">
								<div class="jp_tittle_side_img_wrapper">
									<a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['employer_alias']]); ?>"><img src="<?php echo @$new_job_logo; ?>" alt="<?php echo @$new_job_employer; ?>" /></a>
								</div>
								<div class="jp_tittle_side_cont_wrapper">
									<h4><a title="<?php echo @$value['fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><?php echo @$new_job_fullname; ?></a></h4>
									<p><a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['employer_alias']]); ?>"><?php echo @$new_job_employer; ?></a></p>
								</div>
							</div>							
							<?php
							$k++;
							if($k%3==0 || $k == count(@$data_new_job)){
								echo '</div>';
							} 
						}
						?>								
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php
}
?>
<!-- jp tittle slider Wrapper End -->
<!-- jp first sidebar Wrapper Start -->
<div class="jp_first_sidebar_main_wrapper">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
				<div class="row">
					<?php 
					$query_top_hiring=DB::table('employer');					
					$query_top_hiring->where('employer.status',1);
					$query_top_hiring->where('employer.status_authentication',1);					
					$source_top_hiring=$query_top_hiring->select(
						'employer.id',
						'employer.fullname',
						'employer.alias',						
						'employer.logo'
					)
					->groupBy(
						'employer.id',
						'employer.fullname',
						'employer.alias',						
						'employer.logo'
					)
					->orderBy('employer.id', 'desc')
					->take(63)
					->get()
					->toArray();
					if(count(@$source_top_hiring) > 0){
						$data_top_hiring=convertToArray(@$source_top_hiring);
						?>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="jp_hiring_slider_main_wrapper">
								<div class="jp_hiring_heading_wrapper">
									<h2>Top Hiring Companies</h2>
								</div>
								<div class="jp_hiring_slider_wrapper">
									<div class="owl-carousel owl-theme">
										<?php 
										foreach ($data_top_hiring as $key => $value) {
											$employer_logo='';
											if(!empty(@$value['logo'])){
												$employer_logo=asset('upload/'.$width.'x'.$height.'-'.$value['logo']);
											}else{
												$employer_logo=asset('upload/no-logo.png');
											}
											$employer_fullname=truncateString($value['fullname'],9999) ;
											?>
											<div class="item">
												<div class="jp_hiring_content_main_wrapper">
													<div class="jp_hiring_content_wrapper">
														<a href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><img src="<?php echo @$employer_logo; ?>" alt="<?php echo @$value['fullname']; ?>" /></a>
														<h4><a href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><?php echo @$employer_fullname; ?></a></h4>
														<p>(NewYork)</p>
														<div class="opening"><center><a href="javascript:void(0);">4 Opening</a></center></div>															
													</div>
												</div>
											</div>
											<?php
										}
										?>										
									</div>
								</div>
							</div>
						</div>
						<?php
					}
					?>					
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="cc_featured_product_main_wrapper">
							<div class="jp_hiring_heading_wrapper jp_job_post_heading_wrapper">
								<h2>Recent Jobs</h2>
							</div>
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#attractive" aria-controls="attractive" role="tab" data-toggle="tab">Việc làm hấp dẫn</a></li>
								<li role="presentation"><a href="#high_salary" aria-controls="high_salary" role="tab" data-toggle="tab">Việc làm lương cao</a></li>
							</ul>							
						</div>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="attractive">
								<div class="ss_featured_products">
									<?php 
									$query_attractive_job=DB::table('recruitment')
									->join('employer','recruitment.employer_id','=','employer.id')
									->join('salary','recruitment.salary_id','=','salary.id');
									$query_attractive_job->where('recruitment.status',1);
									$query_attractive_job->where('recruitment.status_employer',1);
									$query_attractive_job->where('recruitment.status_attractive',1);
									$source_attractive_job=$query_attractive_job->select(
										'recruitment.id',
										'recruitment.fullname',
										'recruitment.alias',
										'recruitment.duration',
										'recruitment.status_hot',
										'salary.fullname as salary_name',
										'employer.fullname as employer_fullname',
										'employer.alias as employer_alias',
										'employer.logo'
									)
									->groupBy(
										'recruitment.id',
										'recruitment.fullname',
										'recruitment.alias',
										'recruitment.duration',
										'recruitment.status_hot',
										'salary.fullname',
										'employer.fullname',
										'employer.alias',
										'employer.logo'
									)
									->orderBy('recruitment.id', 'desc')
									->take(10)
									->get()
									->toArray();
									if(count(@$source_attractive_job) > 0){
										echo "<pre>".print_r($source_attractive_job,true)."</pre>";
										?>
										<div class="owl-carousel owl-theme">
											<?php 
											$k=0;
											$t=0;
											$data_attractive_job=convertToArray(@$source_attractive_job);
											foreach ($data_attractive_job as $key => $value) {
												$hot_attractive_fullname=truncateString(@$value['fullname'],9999) ;
												$hot_attractive_employer=truncateString(@$value['employer_fullname'],9999);
												$hot_attractive_duration=datetimeConverterVn(@$value['duration']);
												$hot_attractive_hot_gif='';
												if((int)@$value['status_hot'] == 1){
													$hot_attractive_hot_gif= '&nbsp;<img src="'.asset('upload/hot.gif').'" width="40" />';
												}
												$hot_attractive_logo='';
												if(!empty(@$value['logo'])){
													$hot_attractive_logo=asset('upload/'.$width.'x'.$height.'-'.@$value['logo']);
												}else{
													$hot_attractive_logo=asset('upload/no-logo.png');
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
												$data_province=convertToArray(@$source_province);					
												$province_text='';
												foreach ($data_province as $key_province => $value_province) {
													$province_text.='<span class="margin-left-15"><a href="'.route('frontend.index.index',[@$value_province['alias']]).'">'.@$value_province['fullname'].'</a></span>';
												}
												if($k%2 == 0){
													$t++;
													echo '<div class="item" data-hash="page'.(int)@$t.'">';
												}
												?>
												<div class="jp_job_post_main_wrapper_cont jp_job_post_main_wrapper_cont2">
													<div class="jp_job_post_main_wrapper">
														<div class="row">
															<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
																<div class="jp_job_post_side_img">
																	<a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['employer_alias']]); ?>"><img src="<?php echo @$hot_attractive_logo; ?>" alt="<?php echo @$hot_attractive_employer; ?>" /></a>
																</div>
																<div class="jp_job_post_right_cont">
																	<h4><a title="<?php echo @$value['fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><?php echo @$hot_attractive_fullname; ?></a></h4>
																	<p><a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['employer_alias']]); ?>"><?php echo @$hot_attractive_employer; ?></a></p>
																	<ul>
																		<li><i class="fa fa-cc-paypal"></i>&nbsp; $12K - 15k P.A.</li>
																		<li><i class="fa fa-map-marker"></i>&nbsp; <?php echo @$province_text; ?></li>
																	</ul>
																</div>
															</div>
															<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
																<div class="jp_job_post_right_btn_wrapper">
																	<ul>
																		<li><a href="#"><i class="fa fa-heart-o"></i></a></li>
																		<li><a href="#">Part Time</a></li>
																		<li><a href="#">Apply</a></li>
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
												<?php
												$k++;
												if($k%2==0 || $k == count(@$data_attractive_job)){
													echo '</div>';
												} 	
											}		
											?>
										</div>
										<?php										 
									}		
									?>																										
								</div>
								<?php 
								if(count(@$source_attractive_job) > 0){
									$total_page=ceil(count(@$source_attractive_job)/2);
									?>
									<div class="video_nav_img_wrapper">
										<div class="video_nav_img">
											<ul>
												<?php 
												for ($i=1; $i <= $total_page; $i++) { 
													?>
													<li><a class="button secondary url owl_nav" href="#page<?php echo (int)@$i; ?>"><?php echo (int)@$i; ?></a></li>	
													<?php
												}
												?>																						
											</ul>
										</div>
									</div>	
									<?php
								}
								?>								
							</div>
							<div role="tabpanel" class="tab-pane fade" id="high_salary">
								<div class="ss_featured_products">
									<?php 
									$query_high_salary_job=DB::table('recruitment')
									->join('employer','recruitment.employer_id','=','employer.id')
									->join('salary','recruitment.salary_id','=','salary.id');
									$query_high_salary_job->where('recruitment.status',1);
									$query_high_salary_job->where('recruitment.status_employer',1);
									$query_high_salary_job->where('recruitment.status_high_salary',1);
									$source_high_salary_job=$query_high_salary_job->select(
										'recruitment.id',
										'recruitment.fullname',
										'recruitment.alias',
										'recruitment.duration',
										'recruitment.status_hot',
										'salary.fullname as salary_name',
										'employer.fullname as employer_fullname',
										'employer.alias as employer_alias',
										'employer.logo'
									)
									->groupBy(
										'recruitment.id',
										'recruitment.fullname',
										'recruitment.alias',
										'recruitment.duration',
										'recruitment.status_hot',
										'salary.fullname',
										'employer.fullname',
										'employer.alias',
										'employer.logo'
									)
									->orderBy('recruitment.id', 'desc')
									->take(10)
									->get()
									->toArray();
									if(count(@$source_high_salary_job) > 0){
										$data_high_salary_job=convertToArray(@$source_high_salary_job);
										foreach ($data_high_salary_job as $key => $value) {
											$hot_high_salary_fullname=truncateString(@$value['fullname'],9999) ;
											$hot_high_salary_employer=truncateString(@$value['employer_fullname'],9999);
											$hot_high_salary_duration=datetimeConverterVn(@$value['duration']);
											$hot_high_salary_hot_gif='';
											if((int)@$value['status_hot'] == 1){
												$hot_high_salary_hot_gif= '&nbsp;<img src="'.asset('upload/hot.gif').'" width="40" />';
											}
											$hot_high_salary_logo='';
											if(!empty(@$value['logo'])){
												$hot_high_salary_logo=asset('upload/'.$width.'x'.$height.'-'.@$value['logo']);
											}else{
												$hot_high_salary_logo=asset('upload/no-logo.png');
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
											$data_province=convertToArray(@$source_province);					
											$province_text='';
											foreach ($data_province as $key_province => $value_province) {
												$province_text.='<span class="margin-left-15"><a href="'.route('frontend.index.index',[@$value_province['alias']]).'">'.@$value_province['fullname'].'</a></span>';
											}
											?>
											<div class="jp_job_post_main_wrapper_cont jp_job_post_main_wrapper_cont2">
												<div class="jp_job_post_main_wrapper">
													<div class="row">
														<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
															<div class="jp_job_post_side_img">
																<a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['employer_alias']]); ?>"><img src="<?php echo @$hot_high_salary_logo; ?>" alt="<?php echo @$hot_high_salary_employer; ?>" /></a>
															</div>
															<div class="jp_job_post_right_cont">
																<h4><a title="<?php echo @$value['fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><?php echo @$hot_high_salary_fullname; ?></a></h4>
																<p><a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['employer_alias']]); ?>"><?php echo @$hot_high_salary_employer; ?></a></p>
																<ul>
																	<li><i class="fa fa-cc-paypal"></i>&nbsp; $12K - 15k P.A.</li>
																	<li><i class="fa fa-map-marker"></i>&nbsp; <?php echo @$province_text; ?></li>
																</ul>
															</div>
														</div>
														<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
															<div class="jp_job_post_right_btn_wrapper">
																<ul>
																	<li><a href="#"><i class="fa fa-heart-o"></i></a></li>
																	<li><a href="#">Part Time</a></li>
																	<li><a href="#">Apply</a></li>
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
											<?php	
										}		
									}		
									?>																										
								</div>		
							</div>
						</div>														
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="jp_register_section_main_wrapper">
							<div class="jp_regis_left_side_box_wrapper">
								<div class="jp_regis_left_side_box">
									<img src="{{asset('public/frontend/job-light/images/content/regis_icon.png')}}" alt="icon" />
									<h4>I’m an EMPLOYER</h4>
									<p>Signed in companies are able to post new<br> job offers, searching for candidate...</p>
									<ul>
										<li><a href="#"><i class="fa fa-plus-circle"></i> &nbsp;REGISTER AS COMPANY</a></li>
									</ul>
								</div>
							</div>
							<div class="jp_regis_right_side_box_wrapper">
								<div class="jp_regis_right_img_overlay"></div>
								<div class="jp_regis_right_side_box">
									<img src="{{asset('public/frontend/job-light/images/content/regis_icon2.png')}}" alt="icon" />
									<h4>I’m an candidate</h4>
									<p>Signed in companies are able to post new<br> job offers, searching for candidate...</p>
									<ul>
										<li><a href="#"><i class="fa fa-plus-circle"></i> &nbsp;REGISTER AS COMPANY</a></li>
									</ul>
								</div>
								<div class="jp_regis_center_tag_wrapper">
									<p>OR</p>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div class="jp_first_right_sidebar_main_wrapper">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="jp_add_resume_wrapper">
								<div class="jp_add_resume_img_overlay"></div>
								<div class="jp_add_resume_cont">
									<img src="{{asset('public/frontend/job-light/images/content/resume_logo.png')}}" alt="logo" />
									<h4>Get Best Matched Jobs On your Email. Add Resume NOW!</h4>
									<ul>
										<li><a href="#"><i class="fa fa-plus-circle"></i> &nbsp;ADD RESUME</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="jp_spotlight_main_wrapper">
								<div class="spotlight_header_wrapper">
									<h4>Job Spotlight</h4>
								</div>
								<div class="jp_spotlight_slider_wrapper">
									<div class="owl-carousel owl-theme">
										<div class="item">
											<div class="jp_spotlight_slider_img_Wrapper">
												<img src="{{asset('public/frontend/job-light/images/content/spotlight_img.jpg')}}" alt="spotlight_img" />
											</div>
											<div class="jp_spotlight_slider_cont_Wrapper">
												<h4>HTML Developer (1 - 2 Yrs Exp.)</h4>
												<p>Webstrot Technology Ltd.</p>
												<ul>
													<li><i class="fa fa-cc-paypal"></i>&nbsp; $12K - 15k P.A.</li>
													<li><i class="fa fa-map-marker"></i>&nbsp; Caliphonia, PO 455001</li>
												</ul>
											</div>
											<div class="jp_spotlight_slider_btn_wrapper">
												<div class="jp_spotlight_slider_btn">
													<ul>
														<li><a href="#"><i class="fa fa-plus-circle"></i> &nbsp;ADD RESUME</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="item">
											<div class="jp_spotlight_slider_img_Wrapper">
												<img src="{{asset('public/frontend/job-light/images/content/spotlight_img.jpg')}}" alt="spotlight_img" />
											</div>
											<div class="jp_spotlight_slider_cont_Wrapper">
												<h4>HTML Developer (1 - 2 Yrs Exp.)</h4>
												<p>Webstrot Technology Ltd.</p>
												<ul>
													<li><i class="fa fa-cc-paypal"></i>&nbsp; $12K - 15k P.A.</li>
													<li><i class="fa fa-map-marker"></i>&nbsp; Caliphonia, PO 455001</li>
												</ul>
											</div>
											<div class="jp_spotlight_slider_btn_wrapper">
												<div class="jp_spotlight_slider_btn">
													<ul>
														<li><a href="#"><i class="fa fa-plus-circle"></i> &nbsp;ADD RESUME</a></li>
													</ul>
												</div>
											</div>
										</div>
										<div class="item">
											<div class="jp_spotlight_slider_img_Wrapper">
												<img src="{{asset('public/frontend/job-light/images/content/spotlight_img.jpg')}}" alt="spotlight_img" />
											</div>
											<div class="jp_spotlight_slider_cont_Wrapper">
												<h4>HTML Developer (1 - 2 Yrs Exp.)</h4>
												<p>Webstrot Technology Ltd.</p>
												<ul>
													<li><i class="fa fa-cc-paypal"></i>&nbsp; $12K - 15k P.A.</li>
													<li><i class="fa fa-map-marker"></i>&nbsp; Caliphonia, PO 455001</li>
												</ul>
											</div>
											<div class="jp_spotlight_slider_btn_wrapper">
												<div class="jp_spotlight_slider_btn">
													<ul>
														<li><a href="#"><i class="fa fa-plus-circle"></i> &nbsp;ADD RESUME</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="jp_rightside_job_categories_wrapper">
								<div class="jp_rightside_job_categories_heading">
									<h4>Jobs by Category</h4>
								</div>
								<div class="jp_rightside_job_categories_content">
									<ul>
										<li><i class="fa fa-caret-right"></i> <a href="#">Graphic Designer <span>(214)</span></a></li>
										<li><i class="fa fa-caret-right"></i> <a href="#">Engineering Jobs <span>(514)</span></a></li>
										<li><i class="fa fa-caret-right"></i> <a href="#">Mainframe Jobs <span>(554)</span></a></li>
										<li><i class="fa fa-caret-right"></i> <a href="#">Legal Jobs <span>(457)</span></a></li>
										<li><i class="fa fa-caret-right"></i> <a href="#">IT Jobs <span>(1254)</span></a></li>
										<li><i class="fa fa-caret-right"></i> <a href="#">R&D Jobs <span>(554)</span></a></li>
										<li><i class="fa fa-caret-right"></i> <a href="#">Government Jobs <span>(350)</span></a></li>
										<li><i class="fa fa-caret-right"></i> <a href="#">PSU Jobs <span>(221)</span></a></li>
										<li><i class="fa fa-plus-circle"></i> <a href="#">View All Categories</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="jp_rightside_career_wrapper">
								<div class="jp_rightside_career_heading">
									<h4>Career Advice</h4>
								</div>
								<div class="jp_rightside_career_main_content">
									<div class="jp_rightside_career_content_wrapper">
										<div class="jp_rightside_career_img">
											<img src="{{asset('public/frontend/job-light/images/content/career_img1.jpg')}}" alt="career_img" />
										</div>
										<div class="jp_rightside_career_img_cont">
											<h4>Job Seekeks OCT - 2017</h4>
											<p><i class="fa fa-calendar-o"></i> &nbsp;20 OCT, 2017</p>
										</div>
									</div>
									<div class="jp_rightside_career_content_wrapper">
										<div class="jp_rightside_career_img">
											<img src="{{asset('public/frontend/job-light/images/content/career_img2.jpg')}}" alt="career_img" />
										</div>
										<div class="jp_rightside_career_img_cont">
											<h4>Job Seekeks OCT - 2017</h4>
											<p><i class="fa fa-calendar-o"></i> &nbsp;20 OCT, 2017</p>
										</div>
									</div>
									<div class="jp_rightside_career_content_wrapper">
										<div class="jp_rightside_career_img">
											<img src="{{asset('public/frontend/job-light/images/content/career_img3.jpg')}}" alt="career_img" />
										</div>
										<div class="jp_rightside_career_img_cont">
											<h4>Job Seekeks OCT - 2017</h4>
											<p><i class="fa fa-calendar-o"></i> &nbsp;20 OCT, 2017</p>
										</div>
									</div>
									<div class="jp_rightside_career_btn">
										<a href="#"><i class="fa fa-plus-circle"></i> View All</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="jp_rightside_job_categories_wrapper">
								<div class="jp_rightside_job_categories_heading">
									<h4>Jobs by Category</h4>
								</div>
								<div class="jp_rightside_job_categories_content">
									<ul>
										<li><i class="fa fa-caret-right"></i> <a href="#">Graphic Designer <span>(214)</span></a></li>
										<li><i class="fa fa-caret-right"></i> <a href="#">Engineering Jobs <span>(514)</span></a></li>
										<li><i class="fa fa-caret-right"></i> <a href="#">Mainframe Jobs <span>(554)</span></a></li>
										<li><i class="fa fa-caret-right"></i> <a href="#">Legal Jobs <span>(457)</span></a></li>
										<li><i class="fa fa-caret-right"></i> <a href="#">IT Jobs <span>(1254)</span></a></li>
										<li><i class="fa fa-plus-circle"></i> <a href="#">View All Categories</a></li>
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
<!-- jp first sidebar Wrapper End -->
@endsection()               