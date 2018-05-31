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
					<div>
						<?php echo @$item['description']; ?>
					</div>
					<h3 class="intro-recruitment">
						Yêu cầu
					</h3>
					<div>
						<?php echo @$item['requirement']; ?>
					</div>
					<h3 class="intro-recruitment">
						Quyền lợi
					</h3>
					<div>
						<?php echo @$item['benefit']; ?>
					</div>
				</div>				
			</div>	
		</div>
		<div class="col-lg-4">@include("frontend.main-sidebar")</div>
	</div>
</div>		
@endsection()

