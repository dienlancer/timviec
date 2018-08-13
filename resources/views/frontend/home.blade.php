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
			<h2>Tìm kiếm công việc!</h2>
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
				$ddlJob        =cmsSelectboxCategory("job_id", 'selected2', @$source_job, @$job_id,'','Ngành nghề');
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
							$new_job_fullname=truncateString(@$value['fullname'],999999999) ;
							$new_job_employer=truncateString(@$value['employer_fullname'],999999999);
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
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						@include("frontend.top-high-salary")	
					</div>				
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="cc_featured_product_main_wrapper">
							<div class="jp_hiring_heading_wrapper jp_job_post_heading_wrapper">
								<h2>Công việc hiện tại</h2>
							</div>
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#attractive" aria-controls="attractive" role="tab" data-toggle="tab">Việc làm hấp dẫn</a></li>
								<li role="presentation"><a href="#high_salary" aria-controls="high_salary" role="tab" data-toggle="tab">Việc làm lương cao</a></li>
								<li role="presentation"><a href="#interested" aria-controls="interested" role="tab" data-toggle="tab">Việc làm được quan tâm</a></li>
							</ul>							
						</div>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="attractive">
								@include("frontend.recruitment-attractive")								
							</div>
							<div role="tabpanel" class="tab-pane fade" id="high_salary">
								@include("frontend.recruitment-high-salary")									
							</div>
							<div role="tabpanel" class="tab-pane fade" id="interested">
								@include("frontend.recruitment-interested")									
							</div>
						</div>														
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="jp_register_section_main_wrapper">
							<div class="jp_regis_left_side_box_wrapper">
								<div class="jp_regis_left_side_box">
									<img src="{{asset('public/frontend/job-light/images/content/regis_icon.png')}}" alt="icon" />
									<h4>Tôi là nhà tuyển dụng</h4>
									<p>Signed in companies are able to post new<br> job offers, searching for candidate...</p>
									<ul>
										<li><a href="<?php echo route('frontend.index.employerRegister'); ?>"><i class="fa fa-plus-circle"></i> &nbsp;ĐĂNG KÝ NHÀ TUYỂN DỤNG</a></li>
									</ul>
								</div>
							</div>
							<div class="jp_regis_right_side_box_wrapper">
								<div class="jp_regis_right_img_overlay"></div>
								<div class="jp_regis_right_side_box">
									<img src="{{asset('public/frontend/job-light/images/content/regis_icon2.png')}}" alt="icon" />
									<h4>Tôi là ứng viên</h4>
									<p>Signed in companies are able to post new<br> job offers, searching for candidate...</p>
									<ul>
										<li><a href="<?php echo route('frontend.index.candidateRegister'); ?>"><i class="fa fa-plus-circle"></i> &nbsp;ĐĂNG KÝ ỨNG VIÊN</a></li>
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
							@include("frontend.recruitment-quicked")		
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							@include("frontend.recruitment-by-job")		
						</div>
					</div>
				</div>				
			</div>
		</div>
	</div>
</div>
<!-- jp first sidebar Wrapper End -->
<!-- jp counter Wrapper Start -->
<?php 
$data_job=App\RecruitmentModel::whereRaw('status=1')->select('id')->get()->toArray();
$data_candidate=App\CandidateModel::whereRaw('status=1')->select('id')->get()->toArray(); 
$data_profile=App\ProfileModel::whereRaw('status=1')->select('id')->get()->toArray();
$data_employer=App\EmployerModel::whereRaw('status=1')->select('id')->get()->toArray();
?>
<div class="jp_counter_main_wrapper">
	<div class="container">
		<div class="gc_counter_cont_wrapper">
			<div class="count-description">
				<span class="timer"><?php echo count(@$data_job); ?></span><i class="fa fa-plus"></i>
				<h5 class="con1">Công việc</h5>
			</div>
		</div>
		<div class="gc_counter_cont_wrapper2">
			<div class="count-description">
				<span class="timer"><?php echo count(@$data_candidate); ?></span><i class="fa fa-plus"></i>
				<h5 class="con2">Ứng viên</h5>
			</div>
		</div>
		<div class="gc_counter_cont_wrapper3">
			<div class="count-description">
				<span class="timer"><?php echo count(@$data_profile); ?></span><i class="fa fa-plus"></i>
				<h5 class="con3">Đơn ứng tuyển</h5>
			</div>
		</div>
		<div class="gc_counter_cont_wrapper4">
			<div class="count-description">
				<span class="timer"><?php echo count(@$data_employer); ?></span><i class="fa fa-plus"></i>
				<h5 class="con4">Công ty</h5>
			</div>
		</div>
	</div>
</div>
<!-- jp counter Wrapper End -->
<!-- jp Best deals Wrapper Start -->
<div class="jp_best_deals_main_wrapper">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
				<div class="jp_best_deal_slider_main_wrapper">
					<div class="jp_best_deal_heading_wrapper">
						<h2>Offering the best Deals</h2>
					</div>
					<div class="jp_best_deal_slider_wrapper">
						<div class="owl-carousel owl-theme">
							<div class="item">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="jp_best_deal_main_cont_wrapper">
											<div class="jp_best_deal_icon_sec">
												<i class="flaticon-magnifying-glass"></i>
											</div>
											<div class="jp_best_deal_cont_sec">
												<h4><a href="#">Search a Jobs</a></h4>
												<p>Proin gravida nibh vel velit auctr akshay Aenean sollicitudin...</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="jp_best_deal_main_cont_wrapper jp_best_deal_main_cont_wrapper1">
											<div class="jp_best_deal_icon_sec">
												<i class="flaticon-users"></i>
											</div>
											<div class="jp_best_deal_cont_sec">
												<h4><a href="#">Apply a Good Job</a></h4>
												<p>Proin gravida nibh vel velit auctr akshay Aenean sollicitudin...</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="jp_best_deal_main_cont_wrapper jp_best_deal_main_cont_wrapper2">
											<div class="jp_best_deal_icon_sec">
												<i class="flaticon-shield"></i>
											</div>
											<div class="jp_best_deal_cont_sec">
												<h4><a href="#">Job Security</a></h4>
												<p>Proin gravida nibh vel velit auctr akshay Aenean sollicitudin...</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="jp_best_deal_main_cont_wrapper jp_best_deal_main_cont_wrapper2">
											<div class="jp_best_deal_icon_sec">
												<i class="flaticon-notification"></i>
											</div>
											<div class="jp_best_deal_cont_sec">
												<h4><a href="#">Job Notifications</a></h4>
												<p>Proin gravida nibh vel velit auctr akshay Aenean sollicitudin...</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="jp_best_deal_main_cont_wrapper">
											<div class="jp_best_deal_icon_sec">
												<i class="flaticon-magnifying-glass"></i>
											</div>
											<div class="jp_best_deal_cont_sec">
												<h4><a href="#">Search a Jobs</a></h4>
												<p>Proin gravida nibh vel velit auctr akshay Aenean sollicitudin...</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="jp_best_deal_main_cont_wrapper jp_best_deal_main_cont_wrapper1">
											<div class="jp_best_deal_icon_sec">
												<i class="flaticon-users"></i>
											</div>
											<div class="jp_best_deal_cont_sec">
												<h4><a href="#">Apply a Good Job</a></h4>
												<p>Proin gravida nibh vel velit auctr akshay Aenean sollicitudin...</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="jp_best_deal_main_cont_wrapper jp_best_deal_main_cont_wrapper2">
											<div class="jp_best_deal_icon_sec">
												<i class="flaticon-shield"></i>
											</div>
											<div class="jp_best_deal_cont_sec">
												<h4><a href="#">Job Security</a></h4>
												<p>Proin gravida nibh vel velit auctr akshay Aenean sollicitudin...</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="jp_best_deal_main_cont_wrapper jp_best_deal_main_cont_wrapper2">
											<div class="jp_best_deal_icon_sec">
												<i class="flaticon-notification"></i>
											</div>
											<div class="jp_best_deal_cont_sec">
												<h4><a href="#">Job Notifications</a></h4>
												<p>Proin gravida nibh vel velit auctr akshay Aenean sollicitudin...</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="row">
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="jp_best_deal_main_cont_wrapper">
											<div class="jp_best_deal_icon_sec">
												<i class="flaticon-magnifying-glass"></i>
											</div>
											<div class="jp_best_deal_cont_sec">
												<h4><a href="#">Search a Jobs</a></h4>
												<p>Proin gravida nibh vel velit auctr akshay Aenean sollicitudin...</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="jp_best_deal_main_cont_wrapper jp_best_deal_main_cont_wrapper1">
											<div class="jp_best_deal_icon_sec">
												<i class="flaticon-users"></i>
											</div>
											<div class="jp_best_deal_cont_sec">
												<h4><a href="#">Apply a Good Job</a></h4>
												<p>Proin gravida nibh vel velit auctr akshay Aenean sollicitudin...</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="jp_best_deal_main_cont_wrapper jp_best_deal_main_cont_wrapper2">
											<div class="jp_best_deal_icon_sec">
												<i class="flaticon-shield"></i>
											</div>
											<div class="jp_best_deal_cont_sec">
												<h4><a href="#">Job Security</a></h4>
												<p>Proin gravida nibh vel velit auctr akshay Aenean sollicitudin...</p>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
										<div class="jp_best_deal_main_cont_wrapper jp_best_deal_main_cont_wrapper2">
											<div class="jp_best_deal_icon_sec">
												<i class="flaticon-notification"></i>
											</div>
											<div class="jp_best_deal_cont_sec">
												<h4><a href="#">Job Notifications</a></h4>
												<p>Proin gravida nibh vel velit auctr akshay Aenean sollicitudin...</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				@include("frontend.candidate-featured")		
			</div>
		</div>
	</div>
</div>
<!-- jp Best deals Wrapper End -->
<!-- jp Client Wrapper Start -->
<div class="jp_client_slider_main_wrapper">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="jp_first_client_slider_wrapper">
					<div class="jp_first_client_slider_img_overlay"></div>
					<div class="jp_client_heading_wrapper">
						<h2>What Clients Say?</h2>
					</div>
					<div class="jp_client_slider_wrapper">
						<div class="owl-carousel owl-theme">
							<div class="item">
								<div class="jp_client_slide_show_wrapper">
									<div class="jp_client_slider_img_wrapper">
										<img src="{{asset('public/frontend/job-light/images/content/client_slider_img.jpg')}}" alt="client_img" />
									</div>
									<div class="jp_client_slider_cont_wrapper">
										<p>“Sollicitudin, lorem quis bibendum en auctor, aks consequat ipsum, nec a sagittis sem nibh id elit. Duis sed odo nibh vulputate Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin”</p>
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-o"></i><span>~ Jeniffer Doe &nbsp;<b>(Ui Designer)</b></span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="jp_client_slide_show_wrapper">
									<div class="jp_client_slider_img_wrapper">
										<img src="{{asset('public/frontend/job-light/images/content/client_slider_img.jpg')}}" alt="client_img" />
									</div>
									<div class="jp_client_slider_cont_wrapper">
										<p>“Sollicitudin, lorem quis bibendum en auctor, aks consequat ipsum, nec a sagittis sem nibh id elit. Duis sed odo nibh vulputate Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin”</p>
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-o"></i><span>~ Jeniffer Doe &nbsp;<b>(Ui Designer)</b></span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="jp_client_slide_show_wrapper">
									<div class="jp_client_slider_img_wrapper">
										<img src="{{asset('public/frontend/job-light/images/content/client_slider_img.jpg')}}" alt="client_img" />
									</div>
									<div class="jp_client_slider_cont_wrapper">
										<p>“Sollicitudin, lorem quis bibendum en auctor, aks consequat ipsum, nec a sagittis sem nibh id elit. Duis sed odo nibh vulputate Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin”</p>
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-o"></i><span>~ Jeniffer Doe &nbsp;<b>(Ui Designer)</b></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- jp Client Wrapper End -->
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
@endsection()               