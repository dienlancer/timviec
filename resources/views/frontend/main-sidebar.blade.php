<div class="nhathongminhquata">
					<h3 class="menu-highlight">TÌM KIẾM VIỆC LÀM</h3>
					<div class="america">
						<form action="<?php echo route('frontend.index.searchRecruitment'); ?>" method="POST" name="frm-search-job-detail">
							{{ csrf_field() }}
							<?php 
							$source_job=App\JobModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
							$source_province=App\ProvinceModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
							$source_salary=App\SalaryModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
							$source_literacy=App\LiteracyModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();			
							$source_sex=App\SexModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();		
							$source_work=App\WorkModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();		
							$source_working_form=App\WorkingFormModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();		
							$source_experience=App\ExperienceModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();		
							$ddlJob        =cmsSelectboxCategory("job_id", 'vacca', @$source_job, @$job_id,'','Chọn ngành nghề');
							$ddlProvince        =cmsSelectboxCategory("province_id", 'vacca', @$source_province, @$province_id,'','Chọn tỉnh thành');
							$ddlSalary        =cmsSelectboxCategory("salary_id", 'vacca', @$source_salary, @$salary_id,'','Chọn mức lương');
							$ddlLiteracy        =cmsSelectboxCategory("literacy_id", 'vacca', @$source_literacy, @$literacy_id,'','Chọn trình độ học vấn');
							$ddlSex        =cmsSelectboxCategory("sex_id", 'vacca', @$source_sex, @$sex_id,'','Chọn giới tính');
							$ddlWork        =cmsSelectboxCategory("work_id", 'vacca', @$source_work, @$work_id,'','Chọn công việc');
							$ddlWorkingForm        =cmsSelectboxCategory("working_form_id", 'vacca', @$source_working_form, @$working_form_id,'','Chọn loại hình công việc');
							$ddlExperience        =cmsSelectboxCategory("experience_id", 'vacca', @$source_experience,@$experience_id ,'','Chọn kinh nghiệm');
							?>
							<div class="ritacruista"><input type="text" name="q" value="<?php echo @$q; ?>" class="vacca" placeholder="Nhập từ khóa"></div>					
							<div class="ritacruista"><?php echo $ddlJob; ?></div>
							<div class="ritacruista"><?php echo $ddlProvince; ?></div>						
							<div class="ritacruista"><?php echo $ddlSalary; ?></div>
							<div class="ritacruista"><?php echo $ddlLiteracy; ?></div>						
							<div class="ritacruista"><?php echo $ddlSex; ?></div>	
							<div class="ritacruista"><?php echo $ddlWork; ?></div>	
							<div class="ritacruista"><?php echo $ddlWorkingForm; ?></div>				
							<div class="ritacruista"><?php echo $ddlExperience; ?></div>	
							<div class="ritacruista margin-bottom-5">	
								<div class="vihamus-3">
									<a href="javascript:void(0);" onclick="document.forms['frm-search-job-detail'].submit();">
										<div class="narit">
											<div><i class="fas fa-search"></i></div>
											<div class="margin-left-5">Tìm kiếm</div>
										</div>								
									</a>
								</div>
							</div>				
						</form>							
					</div>
				</div>
				<?php 
				$query_quick_job=DB::table('recruitment')
				->join('employer','recruitment.employer_id','=','employer.id')
				->join('salary','recruitment.salary_id','=','salary.id')
				->join('experience','recruitment.experience_id','=','experience.id');
				$query_quick_job->where('recruitment.status',1);
				$query_quick_job->where('recruitment.status_employer',1);
				$query_quick_job->where('recruitment.status_quick',1);
				$source_quick_job=$query_quick_job->select(
					'recruitment.id',
					'recruitment.fullname',
					'recruitment.alias',
					'recruitment.duration',
					'recruitment.status_hot',
					'experience.fullname as experience_name',
					'salary.fullname as salary_name',
					'employer.fullname as employer_fullname',
					'employer.alias as employer_alias'
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
					'employer.alias'
				)
				->orderBy('recruitment.id', 'desc')
				->take(12)
				->get()
				->toArray();
				if(count($source_quick_job) > 0){
					$data_quick_job=convertToArray($source_quick_job);
					?>
					<div class="nhathongminhquata">
						<h3 class="menu-highlight">VIỆC LÀM TUYỂN GẤP</h3>
						<div class="ramadan">
							<?php 
							$k=0;
							foreach ($data_quick_job as $key => $value){
								$quick_job_fullname=truncateString($value['fullname'],40) ;
								$quick_job_employer=truncateString($value['employer_fullname'],40);
								$quick_job_duration=datetimeConverterVn($value['duration']);
								$quick_job_hot_gif='';
								if((int)@$value['status_hot'] == 1){
									$quick_job_hot_gif= '&nbsp;<img src="'.asset('upload/hot.gif').'" width="40" />';
								}
								$source_province3=DB::table('province')
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
								$data_province3=convertToArray($source_province3);					
								$province_text3='';
								foreach ($data_province3 as $key_province3 => $value_province3) {
									$province_text3.=$value_province3['fullname'].' ,';
								}
								$province_title3=mb_substr($province_text3, 0,mb_strlen($province_text3)-1);
								$province_text3=truncateString($province_title3,20);
								$class_quick_job='fackyou';
								if((int)$k == count($data_quick_job)-1){
									$class_quick_job='';
								}
								?>
								<div class="<?php echo $class_quick_job; ?> margin-top-10 padding-bottom-10">
									<div class="hot-job-name"><a title="<?php echo @$value['fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><?php echo $quick_job_fullname; ?></a><?php echo $quick_job_hot_gif; ?></div>
									<div class="hot-job-employer  margin-top-5"><a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['employer_alias']]); ?>"><?php echo $quick_job_employer; ?></a></div>
									<div class="margin-top-10">
										<div class="xibatuba">
											<div title="<?php echo $province_title3; ?>"><i class="fas fa-map-marker-alt"></i>&nbsp;<?php echo $province_text3; ?></div>
											<div class="margin-top-5"><i class="fas fa-dollar-sign"></i>&nbsp;<?php echo $value['salary_name']; ?></div>											
										</div>
										<div class="miranbaros">
											<div><i class="far fa-chart-bar"></i>&nbsp;<?php echo $value['experience_name']; ?></div>
											<div><i class="far fa-clock"></i>&nbsp;<?php echo $quick_job_duration; ?></div>
										</div>
										<div class="clr"></div>
									</div>
								</div>
									<?php
									$k++;
								}
								?>
								<div class="xem-tat-ca">
									<a href="<?php echo route('frontend.index.index',['viec-lam-tuyen-gap']); ?>">XEM TẤT CẢ</a>
								</div>
						</div>
					</div>
					<?php
				}				
				$data_employer_r=App\EmployerModel::whereRaw('status = 1')->select('id','fullname','alias','logo')->orderBy('id','desc')->take(9)->get()->toArray();
				if(count($data_employer_r) > 0){			
					?>
					<div class="nhathongminhquata">
						<h3 class="menu-highlight">NHÀ TUYỂN DỤNG HÀNG ĐẦU</h3>
						<div class="americaasia padding-bottom-5">
							<?php 
							$k=1;				
							foreach ($data_employer_r as $key => $value) {
								$employer_r_img='';
								if(!empty($value['logo'])){
									$employer_r_img=asset('upload/'.$width.'x'.$height.'-'.$value['logo']);
								}else{
									$employer_r_img=asset('upload/no-logo.png');
								}
								?>
								<div class="col-lg-4">
									<div class="employer-box margin-top-5">
										<a title="<?php echo $value['fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><img src="<?php echo $employer_r_img; ?>"></a>
									</div>
								</div>
								<?php 
								if($k%3 == 0 || $k==count($data_employer_r)){
									?>
									<div class="clr"></div>
									<?php
								}	
								$k++;							
							}							
							?>
						</div>
					</div>
					<?php	
				}
				$data_province_r=App\ProvinceModel::whereIn('alias',['ho-chi-minh','ha-noi','dong-nai','da-nang','binh-duong'])->select('id','fullname','alias')->orderBy('id','desc')->get()->toArray();
				if(count($data_province_r) > 0){
					?>
					<div class="nhathongminhquata">
						<h3 class="menu-highlight">VIỆC LÀM TẠI THÀNH PHỐ LỚN</h3>
						<ul class="lafata">
							<?php 
							foreach ($data_province_r as $key => $value) {								
								?>
								<li>
									<a href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>">
										<div class="hihu">
											<div><img src="<?php echo asset('upload/square-menu.jpg'); ?>"></div>
											<div class="margin-left-10">Việc làm tại <?php echo @$value['fullname']; ?></div>
										</div>																					
									</a>
								</li>
								<?php
							}
							?>							
						</ul>
					</div>							
					<?php
				}				
				?>					
				<div class="nhathongminhquata">
					<?php 
					$fanpage=getPage("right");							
					if(count($fanpage) > 0){								
						$intro=$fanpage["intro"];					
						echo $intro;		
					}
					?>		
				</div>
				<div class="nhathongminhquata">
					<?php 
					$source_hotline_r=getBanner('hotline-right');
					if(count($source_hotline_r) > 0){
						$items_hotline_r=$source_hotline_r['items'];
						foreach ($items_hotline_r as $key_hotline_r => $value_hotline_r) {
							?>
							<center><img src="<?php echo asset('upload/'.$value_hotline_r['image']) ; ?>"></center>
							<?php
						}
					}
					?>
				</div>	