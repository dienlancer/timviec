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
				$id=0;
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
						<div class=""></div>
						<div class="box-employer-logo"><center><img src="<?php echo @$logo; ?>"></center></div>
					</div>				
					<div class="col-lg-9">
						<h1 class="recruitment-title"><?php echo @$fullname; ?></h1>
						<h2 style="display: none;"><?php echo @$item['meta_description']; ?></h1>
						<div class="employer-title margin-top-10"><span><i class="far fa-building"></i></span><span class="margin-left-10"><?php echo @$data_employer['fullname']; ?></span></div>						
						
						<div class="margin-top-10 fiob">
							<span><b>Hạn nộp hồ sơ&nbsp;:</b></span>
							<span class="margin-left-10">							
								<?php 
								$duration=datetimeConverterVn($item['duration']);
								echo @$duration;
								?>
							</span>						
						</div>						
						<div class="margin-top-10">
							<div class="ex-website">
								<div class="vihamus-3">
									<?php 
									$arrUser=array();    
									if(Session::has("vmuser")){
										$arrUser=Session::get("vmuser");
									}   
									if(count(@$arrUser) == 0){
										?>
										<a href="javascript:void(0);" data-toggle="modal" data-target="#modal-alert-apply" >
											<div class="narit">
												<div><i class="far fa-edit"></i></div>
												<div class="margin-left-5">Nộp Hồ Sơ</div>
											</div>
										</a>
										<?php
									}else{									
										$source_candidate=\App\CandidateModel::whereRaw('trim(lower(email)) = ?',[trim(mb_strtolower(@$arrUser['email'],'UTF-8'))])->select('id','email')->get()->toArray();
										if(count($source_candidate)  == 0){
											?>
											<a href="javascript:void(0);" data-toggle="modal" data-target="#modal-alert-apply" >
												<div class="narit">
													<div><i class="far fa-edit"></i></div>
													<div class="margin-left-5">Nộp Hồ Sơ</div>
												</div>
											</a>
											<?php
										}else{
											?>
											<a href="<?php echo route("frontend.index.getFormApplied",[@$id]); ?>"   >
												<div class="narit">
													<div><i class="far fa-edit"></i></div>
													<div class="margin-left-5">Nộp Hồ Sơ</div>
												</div>
											</a>
											<?php
										}									
									}
									?>								
								</div>
								<div class="vihamus-3 margin-left-5">
									<?php 
									$arrUser=array();    
									if(Session::has("vmuser")){
										$arrUser=Session::get("vmuser");
									}   
									if(count(@$arrUser) == 0){
										?>
										<a href="javascript:void(0);" data-toggle="modal" data-target="#modal-alert-saved-recruitment" >
											<div class="narit">
												<div><i class="far fa-save"></i></div>
												<div class="margin-left-5">Lưu công việc</div>
											</div>
										</a>
										<?php
									}else{									
										$source_candidate=\App\CandidateModel::whereRaw('trim(lower(email)) = ?',[trim(mb_strtolower(@$arrUser['email'],'UTF-8'))])->select('id','email')->get()->toArray();
										if(count($source_candidate)  == 0){
											?>
											<a href="javascript:void(0);" data-toggle="modal" data-target="#modal-alert-saved-recruitment" >
												<div class="narit">
													<div><i class="far fa-save"></i></div>
													<div class="margin-left-5">Lưu công việc</div>
												</div>
											</a>
											<?php
										}else{
											?>
											<form enctype="multipart/form-data" name="frm-quicked-saved-recruitment" method="POST" action="<?php echo route('frontend.index.saveQuicklyRecruitment'); ?>">
												{{ csrf_field() }}			
												<input type="hidden" name="recruitment_id" value="<?php echo @$id; ?>">				
												<a href="javascript:void(0);" onclick="document.forms['frm-quicked-saved-recruitment'].submit();"   >
													<div class="narit">
														<div><i class="far fa-save"></i></div>
														<div class="margin-left-5">Lưu công việc</div>
													</div>
												</a>
											</form>											
											<?php
										}									
									}
									?>								
								</div>
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
								<span class="lazasa"><b>Kinh nghiệm&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$experience_name; ?></span>
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
								<span class="lazasa"><b>Trình độ&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$literacy_name; ?></span>
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
									<span class="lazasa"><b>Ngành nghề&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$job_name; ?></span>
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
									<span class="lazasa"><b>Tỉnh/thành phố&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$province_title; ?></span>
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
									<span class="lazasa"><b>Mức lương&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$data_salary['fullname']; ?></span>
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
									<span class="lazasa"><b>Giới tính&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$data_sex['fullname']; ?></span>
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
									<span class="lazasa"><b>Tính chất công việc&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$data_work['fullname']; ?></span>
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
									<span class="lazasa"><b>Hình thức làm việc&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$data_working_form['fullname']; ?></span>
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
									<span class="lazasa"><b>Người liên hệ&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$data_employer['contacted_name']; ?></span>
						</div>
						<div class="margin-top-10 vidola zinan">																					
									<span class="lazasa"><b>Địa chỉ công ty&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$data_employer['address']; ?></span>
						</div>
						<div class="margin-top-10 vidola zinan">																					
									<span class="lazasa"><b>Điện thoại liên lạc&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$data_employer['contacted_phone']; ?></span>
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
						<div class="nibota">
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
										$related_job_source_province=DB::table('province')
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
										$related_job_data_province=convertToArray($related_job_source_province);					
										$related_job_province_text='';
										foreach ($related_job_data_province as $related_job_key_province => $related_job_value_province) {
											$related_job_province_text.='<div class="padding-top-5 padding-bottom-5 madrid"><a href="'.route('frontend.index.index',[$related_job_value_province['alias']]).'">'.$related_job_value_province['fullname'].'</a></div>';
										}
										?>
										<tr>
											<td>
												<div class="hot-job-name vivan-hd"><a title="<?php echo @$value['fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['alias']]); ?>"><?php echo @$related_job_fullname; ?></a><?php echo @$related_job_hot_gif; ?></div>
												<div class="hot-job-employer vivan-hd"><a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['employer_alias']]); ?>"><?php echo @$related_job_employer; ?></a></div>
											</td>
											<td><?php echo @$related_job_province_text; ?></td>
											<td><?php echo @$value['salary_name']; ?></td>
											<td><?php echo @$related_job_duration; ?></td>
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
<!-- begin modal-alert-apply -->
<div class="modal fade modal-apply" id="modal-alert-apply" tabindex="-1" role="dialog" aria-labelledby="my-modal-apply">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header relative">
				<div class="dang-nhap">ĐĂNG NHẬP</div>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>        
			</div>
			<div class="modal-body">
				<form enctype="multipart/form-data" name="frm_apply" method="POST" >
					{{ csrf_field() }}			
					<input type="hidden" name="recruitment_id" value="<?php echo @$id; ?>">							
					<div class="note note-apply margin-bottom-5" style="display: none;" ></div>      
					<div>Email</div>
					<div class="margin-top-5"><input type="text" name="email" class="vacca" placeholder="Email" value=""></div>
					<div class="margin-top-15">Mật khẩu</div>
					<div class="margin-top-5"><input type="password" name="password" class="vacca" placeholder="Mật khẩu" value=""></div>
					<div class="margin-top-15">
						<a href="javascript:void(0);" class="btn-login" onclick="loginApply();" >Đăng nhập</a>
						<a href="<?php echo route('frontend.index.resetPassWrdCandidate'); ?>" class="btn-remember-password">Quên mật khẩu</a>
					</div>
				</form>				
			</div>      
		</div>
	</div>
</div>  
<!-- end modal-alert-apply -->
<!-- begin modal-alert-saved-recruitment -->
<div class="modal fade modal-apply" id="modal-alert-saved-recruitment" tabindex="-1" role="dialog" aria-labelledby="my-saved-recruitment">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header relative">
				<div class="dang-nhap">ĐĂNG NHẬP</div>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>        
			</div>
			<div class="modal-body">
				<form enctype="multipart/form-data" name="frm_saved_recruitment" method="POST">
					{{ csrf_field() }}			
					<input type="hidden" name="recruitment_id" value="<?php echo @$id; ?>">							
					<div class="note note-saved-profile margin-bottom-5" style="display: none;" ></div>      
					<div>Email</div>
					<div class="margin-top-5"><input type="text" name="email" class="vacca" placeholder="Email" value=""></div>
					<div class="margin-top-15">Mật khẩu</div>
					<div class="margin-top-5"><input type="password" name="password" class="vacca" placeholder="Mật khẩu" value=""></div>
					<div class="margin-top-15">
						<a href="javascript:void(0);" class="btn-login" onclick="loginSavedRecruitment();" >Đăng nhập</a>
						<a href="<?php echo route('frontend.index.resetPassWrdCandidate'); ?>" class="btn-remember-password">Quên mật khẩu</a>
					</div>
				</form>				
			</div>      
		</div>
	</div>
</div>  
<!-- end modal-alert-saved-recruitment -->
<script type="text/javascript" language="javascript">
	function loginApply(){
        var email=$('form[name="frm_apply"]').find('input[name="email"]').val();        
        var password=$('form[name="frm_apply"]').find('input[name="password"]').val();                  
        var recruitment_id=$('form[name="frm_apply"]').find('input[name="recruitment_id"]').val(); 
        var token=$('form[name="frm_apply"]').find('input[name="_token"]').val();                

        var dataItem = new FormData();
        dataItem.append('email',email);
        dataItem.append('password',password);                        
        dataItem.append('recruitment_id',recruitment_id);
        dataItem.append('_token',token);
        $.ajax({
            url: '<?php echo route("frontend.index.loginApply"); ?>',
            type: 'POST',
            data: dataItem,
            async: false,
            success: function (data) {                
               if(data.checked==1){    
               		alert(data.msg.success);                      
                    window.location.href = data.link_edit;                    
                }else{
                    showMsg('note-apply',data);  
                }
                spinner.hide();
            },
            error : function (data){
                spinner.hide();
            },
            beforeSend  : function(jqXHR,setting){
                spinner.show();
            },
            cache: false,
            contentType: false,
            processData: false
        });
    }
    function loginSavedRecruitment(){
        var email=$('form[name="frm_saved_recruitment"]').find('input[name="email"]').val();        
        var password=$('form[name="frm_saved_recruitment"]').find('input[name="password"]').val();                  
        var recruitment_id=$('form[name="frm_saved_recruitment"]').find('input[name="recruitment_id"]').val(); 
        var token=$('form[name="frm_saved_recruitment"]').find('input[name="_token"]').val();                

        var dataItem = new FormData();
        dataItem.append('email',email);
        dataItem.append('password',password);                        
        dataItem.append('recruitment_id',recruitment_id);
        dataItem.append('_token',token);
        $.ajax({
            url: '<?php echo route("frontend.index.loginSavedRecruitment"); ?>',
            type: 'POST',
            data: dataItem,
            async: false,
            success: function (data) { 
            	if(data.checked==1){
            		alert(data.msg.success);                      
            	}else{
            		alert(data.msg.error);                      
            	}
               window.location.href = data.link_edit;    
            },
            error : function (data){
                spinner.hide();
            },
            beforeSend  : function(jqXHR,setting){
                spinner.show();
            },
            cache: false,
            contentType: false,
            processData: false
        });
    }
</script>
@endsection()

