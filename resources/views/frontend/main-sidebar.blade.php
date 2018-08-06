<?php 
$seo=getSeo();
$setting= getSettingSystem();
$width=$setting['product_width']['field_value'];
$height=$setting['product_height']['field_value'];  
$article_width=$setting['article_width']['field_value'];
$article_height=$setting['article_height']['field_value'];  
?>
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
		<?php 
		$query_quicked_job=DB::table('recruitment')
		->join('employer','recruitment.employer_id','=','employer.id')
		->join('salary','recruitment.salary_id','=','salary.id')
		->join('experience','recruitment.experience_id','=','experience.id');
		$query_quicked_job->where('recruitment.status',1);
		$query_quicked_job->where('recruitment.status_employer',1);
		$query_quicked_job->where('recruitment.status_quick',1);
		$source_quicked_job=$query_quicked_job->select(
			'recruitment.id',
			'recruitment.fullname',
			'recruitment.alias',
			'recruitment.duration',
			'recruitment.status_hot',
			'experience.fullname as experience_name',
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
			'experience.fullname',
			'salary.fullname',
			'employer.fullname',
			'employer.alias',
			'employer.logo'
		)
		->orderBy('recruitment.id', 'desc')
		->take(12)
		->get()
		->toArray();
		if(count(@$source_quicked_job) > 0){
			$data_quicked_job=convertToArray(@$source_quicked_job);
			?>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="jp_spotlight_main_wrapper">
					<div class="spotlight_header_wrapper">
						<h4>Việc làm tuyển gấp</h4>
					</div>
					<div class="jp_spotlight_slider_wrapper">
						<div class="owl-carousel owl-theme">
							<?php 
							foreach ($data_quicked_job as $key => $value) {
								$quicked_job_fullname=truncateString($value['fullname'],40) ;
								$quicked_job_employer=truncateString($value['employer_fullname'],40);
								$quicked_job_duration=datetimeConverterVn($value['duration']);
								$quicked_job_logo='';
								if(!empty(@$value['logo'])){
									$quicked_job_logo=asset('upload/'.$width.'x'.$height.'-'.@$value['logo']);
								}else{
									$quicked_job_logo=asset('upload/no-logo.png');
								}
								$quicked_job_hot_gif='';
								if((int)@$value['status_hot'] == 1){
									$quicked_job_hot_gif= '&nbsp;<img src="'.asset('upload/hot.gif').'" width="40" />';
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
								<div class="item">
									<div class="jp_spotlight_slider_img_Wrapper">
										<a href="<?php echo route('frontend.index.index',[@$value['employer_alias']]); ?>" title="<?php echo @$value['employer_fullname']; ?>"><img src="<?php echo @$quicked_job_logo; ?>" alt="<?php echo @$value['employer_fullname']; ?>" /></a>
									</div> 
									<div class="jp_spotlight_slider_cont_Wrapper">
										<h4><a href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>" title="<?php echo @$value['fullname']; ?>"><?php echo @$quicked_job_fullname; ?></a></h4>
										<p><a href="<?php echo route('frontend.index.index',[@$value['employer_alias']]); ?>" title="<?php echo @$value['employer_fullname']; ?>"><?php echo @$quicked_job_employer; ?></a></p>
										<ul>
											<li><i class="fa fa-cc-paypal"></i>&nbsp; <?php echo @$value['salary_name']; ?></li>
											<li><i class="fa fa-map-marker"></i>&nbsp; <?php echo @$province_text; ?></li>
										</ul>
									</div>
									<div class="jp_spotlight_slider_btn_wrapper">
										<div class="jp_spotlight_slider_btn">
											<ul>
												<li><a href="javascript:void(0);"><i class="fa fa-plus-circle"></i> &nbsp;ADD RESUME</a></li>
											</ul>
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
		$source_job_r=DB::table('job')
		->join('recruitment_job','job.id','=','recruitment_job.job_id')
		->join('recruitment','recruitment.id','=','recruitment_job.recruitment_id')
		->where('recruitment.status',1)
		->where('recruitment.status_employer',1)
		->select('job.id','job.fullname','job.alias',DB::raw('count(recruitment.id) as recruitment_quantity'))
		->groupBy('job.id','job.fullname','job.alias')
		->orderBy('job.id','asc')					
		->get()
		->toArray();
		if(count(@$source_job_r) > 0){
			$data_job_r=convertToArray($source_job_r);
			?>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="jp_rightside_job_categories_wrapper">
					<div class="jp_rightside_job_categories_heading">
						<h4>Việc làm theo ngành nghề</h4>
					</div>
					<div class="jp_rightside_job_categories_content">
						<ul>
							<?php 
							foreach ($data_job_r as $key => $value){
								?>
								<li><i class="fa fa-caret-right"></i> <a title="<?php echo @$value['fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><?php echo @$value['fullname']; ?> <span>(<?php echo @$value['recruitment_quantity']; ?>)</span></a></li>
								<?php
							}
							?>																						
						</ul>
					</div>
				</div>
			</div>
			<?php
		}
		$data_province_r=App\ProvinceModel::whereIn('alias',['ho-chi-minh','ha-noi','dong-nai','da-nang','binh-duong'])->select('id','fullname','alias')->orderBy('id','desc')->get()->toArray();
		if(count($data_province_r) > 0){
			?>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="jp_rightside_job_categories_wrapper">
					<div class="jp_rightside_job_categories_heading">
						<h4>Việc làm tại thành phố lớn</h4>
					</div>
					<div class="jp_rightside_job_categories_content">
						<ul>
							<?php 
							foreach ($data_province_r as $key => $value){
								?>
								<li><i class="fa fa-caret-right"></i> <a title="<?php echo @$value['fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><?php echo @$value['fullname']; ?></a></li>
								<?php
							}
							?>																						
						</ul>
					</div>
				</div>
			</div>
			<?php
		}
		?>																								
	</div>
</div>