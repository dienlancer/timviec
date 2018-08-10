<div class="source-recruitment-box margin-top-15">
				<div class="source-recruitment-title">
					<i class="fas fa-suitcase"></i>
					<span class="margin-left-5">TUYỂN DỤNG TIÊU ĐIỂM</span>
				</div>
				<div class="margin-top-15 padding-left-15 padding-right-15 padding-bottom-15">
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
					->take(30)
					->get()
					->toArray();	
					if(count(@$source_new_job) > 0){
						$data_new_job=convertToArray(@$source_new_job);	
						?>
						<table class="cidu">
							<tr>
								<th width="40%">Vị trí tuyển dụng</th>
								<th width="30%">Khu vực</th>
								<th width="20%">Mức lương</th>
								<th width="10%">Hạn nộp HS</th>
							</tr>
							<?php 
							foreach ($data_new_job as $key => $value) {							
								$new_job_fullname=truncateString($value['fullname'],70) ;
								$new_job_employer=truncateString($value['employer_fullname'],40);
								$new_job_duration=datetimeConverterVn($value['duration']);
								$new_job_hot_gif='';
								if((int)@$value['status_hot'] == 1){
									$new_job_hot_gif= '&nbsp;<img src="'.asset('upload/hot.gif').'" width="40" />';
								}
								$new_job_source_province=DB::table('province')
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
								$new_job_data_province=convertToArray($new_job_source_province);					
								$new_job_province_text='';
								foreach ($new_job_data_province as $new_job_key_province => $new_job_value_province) {
									$new_job_province_text.='<div class="padding-top-5 padding-bottom-5 madrid"><a href="'.route('frontend.index.index',[$new_job_value_province['alias']]).'">'.$new_job_value_province['fullname'].'</a></div>';
								}
								?>
								<tr>
									<td>
										<div class="hot-job-name vivan-hd"><a title="<?php echo @$value['fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['alias']]); ?>"><?php echo @$new_job_fullname; ?></a><?php echo @$new_job_hot_gif; ?></div>
										<div class="hot-job-employer vivan-hd"><a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['employer_alias']]); ?>"><?php echo @$new_job_employer; ?></a></div>
									</td>
									<td><?php echo @$new_job_province_text; ?></td>
									<td><?php echo @$value['salary_name']; ?></td>
									<td><?php echo @$new_job_duration; ?></td>
								</tr>
								<?php
							}
							?>
						</table>	
						<?php
					}	
					?>
				</div>
			</div>