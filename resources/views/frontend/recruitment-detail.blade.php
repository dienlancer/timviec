@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<div class="container margin-top-15">
	<div class="row">
		<div class="col-lg-8">
			<div class="row">
				<?php 
				$setting= getSettingSystem();
				$width=$setting['product_width']['field_value'];
				$height=$setting['product_height']['field_value'];  
				if(count(@$item) > 0){		
					$id= (int)@$item["id"];
					$fullname = @$item["fullname"];	
					$count_view=(int)@$item['count_view'];
					$count_view++;
					$row				= App\RecruitmentModel::find((int)@$id); 
					$row->count_view=(int)@$count_view;
					$row->save();
					$count_view_text=number_format((int)@$count_view,0,",",".");		
					$data_employer=App\EmployerModel::find((int)@$item['employer_id'])->toArray();
					$logo='';
					if(!empty($data_employer['logo'])){
						$logo=asset('upload/'.$width.'x'.$height.'-'.$data_employer['logo']);
					}else{
						$logo=asset('upload/no-logo.png');
					}
					?>
					<div class="col-lg-3">
						<div class="box-employer-logo"><center><img src="<?php echo $logo; ?>"></center></div>
					</div>				
					<div class="col-lg-9">
						<h1 class="recruitment-title"><?php echo $fullname; ?></h1>
						<div class="employer-title margin-top-10"><span><i class="far fa-building"></i></span><span class="margin-left-10"><?php echo @$data_employer['fullname']; ?></span></div>						
						
						<div class="margin-top-10 fiob">
							<span><b>Hạn nộp hồ sơ&nbsp;:</b></span>
							<span class="margin-left-10">							
								<?php 
								$duration=datetimeConverterVn($item['duration']);
								echo $duration;
								?>
							</span>						
						</div>
						<div class="margin-top-10">
							<div class="vihamus-3">
								<a href="javascript:void(0);"   >
									<div class="narit">
										<div><i class="far fa-edit"></i></div>
										<div class="margin-left-5">Nộp Hồ Sơ</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<?php
				}
				?>	
			</div>		
			<div class="row">
				<div class="col-lg-12">
					<h3 class="intro-recruitment">
						Thông tin tuyển dụng
					</h3>
					<div class="row">
						<div class="col-lg-6">
							<div class="margin-top-10">
								<?php 				
								$experience_name='';
								$source_experience=App\ExperienceModel::find((int)@$item['experience_id']);
								if(count($source_experience) > 0){
									$data_experience=$source_experience->toArray();
									$experience_name=$data_experience['fullname'];
								}
								?>
								<span class="lazasa"><b>Kinh nghiệm&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo $experience_name; ?></span>
							</div>
							<div class="margin-top-10">
								<?php 				
								$literacy_name='';
								$source_literacy=App\LiteracyModel::find((int)@$item['literacy_id']);
								if(count($source_literacy) > 0){
									$data_literacy=$source_literacy->toArray();
									$literacy_name=$data_literacy['fullname'];
								}
								?>
								<span class="lazasa"><b>Trình độ&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo $literacy_name; ?></span>
							</div>
							<?php 
							$source_job=DB::table('job')
							->join('recruitment_job','job.id','=','recruitment_job.job_id')
							->where('recruitment_job.recruitment_id',(int)@$id)
							->select('job.fullname','job.alias')
							->groupBy('job.fullname','job.alias')
							->orderBy('job.id','asc')
							->get()
							->toArray();
							if(count($source_job) > 0){
								$data_job=convertToArray($source_job);
								$job_text='';
								foreach ($data_job as $key => $value) {
									$job_text.='<a href="'.route('frontend.index.index',[@$value['alias']]).'">'.@$value['fullname'].'</a>' .' ,';
								}
								$job_name=mb_substr($job_text, 0,mb_strlen($job_text)-1);
								?>
								<div class="margin-top-10">																
									<span class="lazasa"><b>Ngành nghề&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo $job_name; ?></span>
								</div>
								<?php
							}
							$source_province=DB::table('province')
							->join('recruitment_place','province.id','=','recruitment_place.province_id')							
							->where('recruitment_place.recruitment_id',(int)@$id)
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
							if(count(@$source_province) > 0){
								$data_province=convertToArray($source_province);					
								$province_text='';
								foreach ($data_province as $key => $value) {
									$province_text.='<a href="'.route('frontend.index.index',[@$value['alias']]).'">'.@$value['fullname'].'</a>' .' ,';
								}
								$province_title=mb_substr($province_text, 0,mb_strlen($province_text)-1);
								?>
								<div class="margin-top-10">																
									<span class="lazasa"><b>Tỉnh/thành phố&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo $province_title; ?></span>
								</div>
								<?php
							}																				
							?>	
							<div class="margin-top-10">																
								<span class="lazasa"><b>Số lượng tuyển&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$item['quantity']; ?></span>
							</div>						
						</div>
						<div class="col-lg-6">							
							<?php 				
							$salary_name='';
							$source_salary=App\SalaryModel::find((int)@$item['salary_id']);
							if(count($source_salary) > 0){
								$data_salary=$source_salary->toArray();
								$salary_name=$data_salary['fullname'];
								?>
								<div class="margin-top-10">																					
									<span class="lazasa"><b>Mức lương&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo $data_salary['fullname']; ?></span>
								</div>
								<?php
							}
							if((int)@$item['commission_from'] > 0 && (int)@$item['commission_to']){
								?>
								<div class="margin-top-10">																					
									<span class="lazasa"><b>Mức hoa hồng&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$item['commission_from'] ?>%&nbsp;-&nbsp;<?php echo @$item['commission_to']; ?>%</span>
								</div>
								<?php
							}
							$sex_name='';
							$source_sex=App\SexModel::find((int)@$item['sex_id']);
							if(count($source_sex) > 0){
								$data_sex=$source_sex->toArray();
								$sex_name=$data_sex['fullname'];
								?>
								<div class="margin-top-10">																					
									<span class="lazasa"><b>Giới tính&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo $data_sex['fullname']; ?></span>
								</div>
								<?php
							}
							
							$work_name='';
							$source_work=App\WorkModel::find((int)@$item['work_id']);
							if(count($source_work) > 0){
								$data_work=$source_work->toArray();
								$work_name=$data_work['fullname'];
								?>
								<div class="margin-top-10">																					
									<span class="lazasa"><b>Tính chất công việc&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo $data_work['fullname']; ?></span>
								</div>
								<?php
							}
							$working_form_name='';
							$source_working_form=App\WorkingFormModel::find((int)@$item['working_form_id']);
							if(count($source_working_form) > 0){
								$data_working_form=$source_working_form->toArray();
								$working_form_name=$data_working_form['fullname'];
								?>
								<div class="margin-top-10">																					
									<span class="lazasa"><b>Hình thức làm việc&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo $data_working_form['fullname']; ?></span>
								</div>
								<?php
							}
							?>									
						</div>
					</div>
					<h3 class="intro-recruitment">
						Mô tả công việc
					</h3>
					<div class="vidola zinan">
						<?php echo @$item['description']; ?>
					</div>
					<h3 class="intro-recruitment">
						Yêu cầu
					</h3>
					<div class="vidola zinan">
						<?php echo @$item['requirement']; ?>
					</div>
					<h3 class="intro-recruitment">
						Quyền lợi
					</h3>
					<div class="vidola zinan">
						<?php echo @$item['benefit']; ?>
					</div>
					<h3 class="intro-recruitment">
						Yêu cầu / Hình thức nộp hồ sơ
					</h3>
					<div class="vidola zinan">
						<?php echo @$item['requirement_profile']; ?>
					</div>
					<?php 
					$source_employer=App\EmployerModel::find((int)@$item['employer_id']);
					if(count(@$source_employer) > 0){
						$data_employer = @$source_employer->toArray();
						?>
						<h3 class="intro-recruitment">
							Thông tin liên hệ
						</h3>
						<div class="margin-top-10 vidola zinan">																					
									<span class="lazasa"><b>Người liên hệ&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo $data_employer['contacted_name']; ?></span>
						</div>
						<div class="margin-top-10 vidola zinan">																					
									<span class="lazasa"><b>Địa chỉ công ty&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo $data_employer['address']; ?></span>
						</div>
						<div class="margin-top-10 vidola zinan">																					
									<span class="lazasa"><b>Điện thoại liên lạc&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo $data_employer['contacted_phone']; ?></span>
						</div>
						<?php						
					}	
					?>					
				</div>				
			</div>	
			<?php 
			if(count(@$item) > 0){	
				$source_recruitment_job=App\RecruitmentJobModel::whereRaw('recruitment_id = ?',[(int)@$item['id']])->select('job_id')->get()->toArray();	
				if(count($source_recruitment_job) > 0){
					$source_job_id=array();
					foreach ($source_recruitment_job as $key => $value) {
						$source_job_id[]=$value['job_id'];					
					}			
					$query_related_job=DB::table('recruitment')
					->join('employer','recruitment.employer_id','=','employer.id')
					->join('salary','recruitment.salary_id','=','salary.id')
					->join('recruitment_job','recruitment.id','=','recruitment_job.recruitment_id');
					$query_related_job->where('recruitment.status',1);
					$query_related_job->where('recruitment.status_employer',1);
					$query_related_job->whereIn('recruitment_job.job_id',@$source_job_id);
					$query_related_job->where('recruitment.id','<>',(int)@$item['id']);
					$source_related_job=$query_related_job->select(
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
					->take(20)
					->get()
					->toArray();		
					if(count($source_related_job) > 0){
						$data_related_job=convertToArray($source_related_job);						
						?>
						<div class="relative">
							<div class="nikatasuzuki margin-top-15">
								<div class="tibolee-icon"><i class="far fa-folder-open"></i></div>
								<div class="tibolee">VIỆC LÀM TƯƠNG TỰ</div>
							</div>
							<hr class="ribiru">							
						</div>	
						<div class="row">
							<div class="col-lg-12">	
								<table class="cidu margin-top-15">
									<tr>
										<th width="40%">Vị trí tuyển dụng</th>
										<th width="30%">Khu vực</th>
										<th width="20%">Mức lương</th>
										<th width="10%">Hạn nộp HS</th>
									</tr>
									<?php 
									foreach ($data_related_job as $key => $value) {							
										$related_job_fullname=truncateString($value['fullname'],70) ;
										$related_job_employer=truncateString($value['employer_fullname'],40);
										$related_job_duration=datetimeConverterVn($value['duration']);
										$related_job_hot_gif='';
										if((int)@$value['status_hot'] == 1){
											$related_job_hot_gif= '&nbsp;<img src="'.asset('upload/hot.gif').'" width="40" />';
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
											$province_text.='<div class="padding-top-5 padding-bottom-5 madrid"><a href="'.route('frontend.index.index',[$value_province['alias']]).'">'.$value_province['fullname'].'</a></div>';
										}
										?>
										<tr>
											<td>
												<div class="hot-job-name vivan-hd"><a title="<?php echo $value['fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['alias']]); ?>"><?php echo $related_job_fullname; ?></a><?php echo $related_job_hot_gif; ?></div>
												<div class="hot-job-employer vivan-hd"><a title="<?php echo $value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['employer_alias']]); ?>"><?php echo $related_job_employer; ?></a></div>
											</td>
											<td><?php echo $province_text; ?></td>
											<td><?php echo $value['salary_name']; ?></td>
											<td><?php echo $related_job_duration; ?></td>
										</tr>
										<?php
									}
									?>
								</table>										
							</div>				
						</div>
						<?php						
					}						
				}				
			}
			?>			
		</div>
		<div class="col-lg-4">@include("frontend.main-sidebar")</div>
	</div>
</div>		
<?php

/*$query_related_job=DB::table('recruitment')
->join('employer','recruitment.employer_id','=','employer.id')
->join('salary','recruitment.salary_id','=','salary.id');
$query_related_job->where('recruitment.status',1);
$query_related_job->where('recruitment.status_employer',1);
$query_related_job->where('recruitment.status_attractive',1);
$source_related_job=$query_related_job->select(
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
->toArray();		*/
?>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			
		</div>
	</div>
</div>
@endsection()

