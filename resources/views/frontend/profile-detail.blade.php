@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<?php 
$seo=getSeo();
$setting = getSettingSystem();

$arrUser=array();
$ssNameUser='vmuser';
$candidate=array();
$sex=array();
$marriage=array();
if(Session::has($ssNameUser)){
	$arrUser=Session::get($ssNameUser);
	$candidate=App\CandidateModel::find((int)@$arrUser['id'])->toArray();
	$sex=App\SexModel::find((int)@$candidate['sex_id'])->toArray();    
	$marriage=App\MarriageModel::find((int)@$candidate['marriage_id'])->toArray();
	$candidate['birthday']=datetimeConverterVn($candidate['birthday']);    
} 
$picture                =   "";
$product_width = $setting['product_width']['field_value'];
$product_height = $setting['product_height']['field_value'];  
if(count(@$candidate)>0){
	if(!empty(@$candidate["avatar"])){
		$picture        =   '<div class="margin-top-15"><img width="150" height="150" src="'.asset("/upload/" . $product_width . "x" . $product_height . "-".@$candidate["avatar"]).'"  /></div>';                        
	}        
}
$query=DB::table('profile')
->leftJoin('literacy','profile.literacy_id','=','literacy.id')
->leftJoin('experience','profile.experience_id','=','experience.id')
->leftJoin('rank as rank_present','profile.rank_present_id','=','rank_present.id')
->leftJoin('rank as rank_offered','profile.rank_offered_id','=','rank_offered.id')
->leftJoin('classification as w','profile.ms_word','=','w.id')
->leftJoin('classification as e','profile.ms_excel','=','e.id')
->leftJoin('classification as p','profile.ms_power_point','=','p.id')
->leftJoin('classification as o','profile.ms_outlook','=','o.id');
$query->where('profile.id',@$id);
$source_info=$query->select('profile.fullname'
	,'literacy.fullname as literacy_fullname'
	,'experience.fullname as experience_fullname'
	,'rank_present.fullname as rank_present_fullname'
	,'rank_offered.fullname as rank_offered_fullname'
	,'profile.salary'
	,'profile.career_goal'
	,'profile.ms_word'
	,'profile.ms_excel'
	,'profile.ms_power_point'
	,'profile.ms_outlook'
	,'w.fullname as ms_word_level'
	,'e.fullname as ms_excel_level'
	,'p.fullname as ms_power_point_level'
	,'o.fullname as ms_outlook_level'
	,'profile.other_software'
	,'profile.medal'
	,'profile.hobby'
	,'profile.talent'
	,'profile.status_search')
->groupBy('profile.fullname'
	,'literacy.fullname'
	,'experience.fullname'
	,'rank_present.fullname'
	,'rank_offered.fullname'
	,'profile.salary'
	,'profile.career_goal'
	,'profile.ms_word'
	,'profile.ms_excel'
	,'profile.ms_power_point'
	,'profile.ms_outlook'
	,'w.fullname'
	,'e.fullname'
	,'p.fullname'
	,'o.fullname'
	,'profile.other_software'
	,'profile.medal'
	,'profile.hobby'
	,'profile.talent'
	,'profile.status_search')	
->get()->toArray();	
$profile_detail=array();
$job_id=array();
$province_id=array();
$source_job=array();
$source_province=array();
$source_job_fullname=array();
$source_province_fullname=array();
$job_fullname='';
$province_fullname='';
$status_search='';
if(count($source_info) > 0){
	$source_info2=convertToArray($source_info);	
	$profile_detail=$source_info2[0];	
	$profile_detail['salary']=convertToTextPrice($profile_detail['salary']) . ' VNĐ/tháng';	
	if((int)@$profile_detail['status_search'] == 1){
		$status_search='Cho phép Nhà tuyển dụng tìm kiếm thông tin của bạn và chủ động liên hệ mời phỏng vấn';
	}else{
		$status_search='Không cho phép nhà tuyển dụng tìm kiếm. Hồ sơ này chỉ dùng để ứng tuyển';
	}		
	$source_profile_job=App\ProfileJobModel::whereRaw('profile_id = ?',[@$id])->select('id','profile_id','job_id')->get()->toArray();
	$source_profile_place=App\ProfilePlaceModel::whereRaw('profile_id = ?',[@$id])->select('id','profile_id','province_id')->get()->toArray();
	if(count($source_profile_job) > 0){
		foreach ($source_profile_job as $key => $value) {
			$job_id[]=$value['job_id'];
		}
		$source_job=App\JobModel::whereIn('id',@$job_id)->select('fullname')->get()->toArray();			
		if(count($source_job) > 0){
			foreach ($source_job as $key => $value) {
				$source_job_fullname[]=$value['fullname'];
			}
			$job_fullname=implode(' , ', $source_job_fullname);
		}
	}
	if(count($source_profile_place) > 0){
		foreach ($source_profile_place as $key => $value) {
			$province_id[]=$value['province_id'];
		}
		$source_province=App\ProvinceModel::whereIn('id',@$province_id)->select('fullname')->get()->toArray();	
		if(count($source_province) > 0){
			foreach ($source_province as $key => $value) {
				$source_province_fullname[]=$value['fullname'];
			}
			$province_fullname=implode(' , ', $source_province_fullname);
		}		
	}		
}

$disabled_status='';
$register_status='onclick="document.forms[\'frm\'].submit();"';
$inputID     =   '<input type="hidden" name="id"  value="'.@$id.'" />';
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>



<div class="container">
	<div class="row">			
		<div class="col-lg-9">
			<form name="frm" method="POST" enctype="multipart/form-data">
				{{ csrf_field() }}
				<?php echo $inputID; ?>
				<h1 class="dn-dk-h">Tạo Hồ Sơ Từng Bước</h1>				
				<div class="row">
					<div class="col-lg-3"><?php echo $picture; ?></div>
					<div class="col-lg-9">
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika">Họ tên</div> </div>
							<div class="col-lg-9"><div class="xika2"><b><?php echo @$candidate['fullname']; ?></b></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika">Giới tính</div></div>
							<div class="col-lg-9"><div class="xika2"><b><?php echo @$sex['fullname']; ?></b></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika">Ngày sinh</div></div>
							<div class="col-lg-9"><div class="xika2"><b><?php echo @$candidate['birthday']; ?></b></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika">Địa chỉ</div></div>
							<div class="col-lg-9"><div class="xika2"><b><?php echo @$candidate['address']; ?></b></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika">Số điện thoại</div></div>
							<div class="col-lg-9"><div class="xika2"><b><?php echo @$candidate['phone']; ?></b></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika">Email</div></div>
							<div class="col-lg-9"><div class="xika2"><b><?php echo @$candidate['email']; ?></b></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"></div>
							<div class="col-lg-9">
								<div class="fatanasa"><a href="<?php echo route('frontend.index.viewCandidateAccount'); ?>">Chỉnh sửa</a></div>
							</div>
						</div>			
					</div>
				</div>	
				<hr  />				
				<?php 
				if(count(@$msg) > 0){
					$type_msg='';					
					if((int)@$checked == 1){																	
						$type_msg='note-success';
					}else{
						$type_msg='note-danger';
					}
					?>
					<div class="note margin-top-15 <?php echo $type_msg; ?>" >
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
				<div class="row mia">
					<div class="col-lg-4"><h2 class="login-information">Thông tin chung</h2></div>
					<div class="col-lg-8"></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Tiêu đề hồ sơ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['fullname']; ?></div> </div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Trình độ cao nhất</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['literacy_fullname']; ?></div></div>
				</div>					
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Số năm kinh nghiệm</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['experience_fullname']; ?></div></div>
				</div>					
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Cấp bậc hiện tại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['rank_present_fullname']; ?></div></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Cấp bậc mong muốn</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['rank_offered_fullname']; ?></div></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Ngành nghề mong muốn</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$job_fullname; ?></div></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Mức lương mong muốn</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['salary']; ?></div></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Nơi làm việc mong muốn</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$province_fullname; ?></div></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Hôn nhân</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$marriage['fullname']; ?></div></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Hiện tại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$status_search; ?></div></div>
				</div>	
				<div class="row margin-top-10">
					<div class="col-lg-4"></div>
					<div class="col-lg-8">
						<div class="fatanasa"><a href="<?php echo route('frontend.index.getFormProfile',['edit',@$id]); ?>">Chỉnh sửa</a></div>
					</div>
				</div>				
				<hr  />		
				<div class="row mia">
					<div class="col-lg-4"><div class="rarakata"><h2 class="login-information">Mục tiêu nghề nghiệp</h2><div class="miakasaki margin-left-15">(Bắt buộc)</div></div></div>
					<div class="col-lg-8"></div>
				</div>
				<div class="note note_career_goal margin-top-15"  style="display: none;"></div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Mục tiêu</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8">
						<?php 
						$status_career_goal_edit='';
						$status_career_goal_save='';
						if(empty(@$profile_detail['career_goal'])){
							$status_career_goal_edit='display:none';
							$status_career_goal_save='display:block';
						}else{
							$status_career_goal_edit='display:block';
							$status_career_goal_save='display:none';
						}
						?>
						<div class="career_goal_edit" style="<?php echo $status_career_goal_edit; ?>">
							<div class="career_goal_txt"><?php echo @$profile_detail['career_goal']; ?></div>
							<div class="vihamus-3 margin-top-5">
								<a href="javascript:void(0);" onclick="showCareerGoalSave();"  >
									<div class="narit">
										<div><i class="far fa-edit"></i></div>
										<div class="margin-left-5">Chỉnh sửa</div>
									</div>
								</a>
							</div>
						</div>
						<div class="career_goal_save" style="<?php echo $status_career_goal_save; ?>">
							<div><textarea name="career_goal" placeholder="Nhập mục tiêu nghề nghiệp..." class="vacca summer-editor" rows="10" ><?php echo @$profile_detail['career_goal']; ?></textarea></div>
							<div>
								<div class="titanius">
									<div class="vihamus">
										<a href="javascript:void(0);" onclick="saveCareerGoal();" >
											<div class="narit">
												<div><i class="far fa-save"></i></div>
												<div class="margin-left-5">Lưu</div>
											</div>								
										</a>
									</div>							
									<div class="vihamus-2 margin-left-5">
										<a href="javascript:void(0);" onclick="noSaveCareerGoal();" >
											<div class="narit">
												<div><i class="far fa-times-circle"></i></div>
												<div class="margin-left-5">Không lưu</div>
											</div>								
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	
				<hr  />		
				<div class="row mia">
					<div class="col-lg-4"><div class="rarakata"><h2 class="login-information">Kinh nghiệm làm việc</h2><div class="miakasaki margin-left-15">(Bắt buộc)</div></div></div>
					<div class="col-lg-8"></div>
				</div>
				<div class="row mia">					
					<div class="col-lg-12">
						Hãy liệt kê những công việc, nhiệm vụ mà bạn đã từng đảm nhận và thực hiện. Chú ý liệt kê kinh nghiệm làm việc từ thời gian gần đây nhất trở về trước. 
					</div>
				</div>
				<div class="note note_experience margin-top-15"  style="display: none;"></div>
				<?php 
				$status_experience_job_edit='';
				$status_experience_job_save='';
				$source_profile_experience=App\ProfileExperienceModel::whereRaw('profile_id = ?',[@$id])->select()->get()->toArray();		
				if(count(@$source_profile_experience) == 0){
					$status_experience_job_edit='display:none';
					$status_experience_job_save='display:block';
				}else{
					$status_experience_job_edit='display:block';
					$status_experience_job_save='display:none';
				}
				?>
				<div class="experience_job_edit" style="<?php echo $status_experience_job_edit; ?>">
					<div class="experience_job_txt">
						<?php 
						if(count(@$source_profile_experience) > 0){
							foreach ($source_profile_experience as $key => $value) {
								$profile_experience_id=$value['id'];
								$profile_experience_company_name=$value['company_name'];
								$profile_experience_person_title=$value['person_title'];
								$profile_experience_time_from=$value['month_from'] . '/' . $value['year_from'];
								$profile_experience_time_to=$value['month_to'] . '/' .$value['year_to'];		
								$profile_experience_salary=convertToTextPrice($value['salary']);
								$currency='';
								switch ($value['currency']) {
									case 'vnd':			
									$currency='VNĐ';	
									break;
									case 'usd':
									$currency='USD';							
									break;
								}		
								$profile_experience_salary=@$profile_experience_salary.' '.@$currency.'/tháng';
								$profile_experience_job_description=@$value['job_description'];
								$profile_experience_achievement=@$value['achievement'];
								$profile_experience_profile_id=(int)@$value['profile_id'];
								?>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Công ty</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_experience_company_name; ?></div> </div>
								</div>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Chức danh</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_experience_person_title; ?></div> </div>
								</div>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Thời gian làm việc</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8">
										<div class="lunarnewyear">
											<div>Từ</div>
											<div class="margin-left-10"><?php echo @$profile_experience_time_from; ?></div>
											<div class="margin-left-10">Đến</div>
											<div class="margin-left-10"><?php echo @$profile_experience_time_to; ?></div>
										</div> 
									</div>
								</div>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Mức lương</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_experience_salary; ?></div> </div>
								</div>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Mô tả công việc</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_experience_job_description; ?></div> </div>
								</div>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Thành tích nổi bật</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_experience_achievement; ?></div> </div>
								</div>
								<div class="row mia">
									<div class="col-lg-4"></div>
									<div class="col-lg-8">
										<div class="vihamus-3">
											<a href="javascript:void(0);" onclick="deleteProfileExperience(<?php echo $profile_experience_id ?>);" >
												<div class="narit">
													<div><i class="far fa-times-circle"></i></div>
													<div class="margin-left-5">Xóa</div>
												</div>								
											</a>
										</div>
									</div>
								</div>
								<hr>
								<?php
							}
						}						
						?>
					</div>
					<div class="row mia">
						<div class="col-lg-4"></div>
						<div class="col-lg-8">
							<div class="vihamus-4">
								<a href="javascript:void(0);" onclick="addExperienceJob();" >
									<div class="narit">
										<div><i class="far fa-plus-square"></i></div>
										<div class="margin-left-5">Thêm kinh nghiệm làm việc</div>
									</div>								
								</a>
							</div>
						</div>
					</div>					
				</div>
				<div class="experience_job_save" style="<?php echo $status_experience_job_save; ?>">
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Công ty</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><input type="text"  name="company_name" class="vacca" placeholder="Tên công ty" value="" ></div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Chức danh</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><input type="text"  name="person_title" class="vacca" placeholder="Chức danh" value="" ></div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Thời gian làm việc</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8">
							<?php 
							$source_month=array();
							for($i=0;$i<=12;$i++){
								if($i==0){
									$source_month[]='Tháng';
								}else{
									$source_month[]=$i;
								}	
							}
							$arrDate    = date_parse_from_format('Y-m-d H:i:s', date("Y-m-d")) ;
							for ($i=1953; $i <= (int)@$arrDate['year']; $i++) { 
								$source_year[$i]=$i;
							}
							$source_year[0]='Năm';
							krsort($source_year);
							$ddlMonthFrom=cmsSelectbox(	"month_from"	,	"vacca"	,	$source_month	,	0	,	''	);
							$ddlYearFrom=cmsSelectbox(	"year_from"	,	"vacca"	,	$source_year	,	0	,	''	);
							$ddlMonthTo=cmsSelectbox(	"month_to"	,	"vacca"	,	$source_month	,	0	,	''	);
							$ddlYearTo=cmsSelectbox(	"year_to"	,	"vacca"	,	$source_year	,	0	,	''	);
							?>
							<div class="lunarnewyear">
								<div>Từ</div>
								<div class="margin-left-10"><?php echo $ddlMonthFrom; ?></div>
								<div class="margin-left-10"><?php echo $ddlYearFrom; ?></div>
								<div class="margin-left-10">Đến</div>
								<div class="margin-left-10"><?php echo $ddlMonthTo; ?></div>
								<div class="margin-left-10"><?php echo $ddlYearTo; ?></div>
							</div>
						</div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Mức lương</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8">
							<?php
							$source_currency=array(''=>'Vui lòng chọn đơn vị tiền tệ' , 'vnd'=>'VND','usd'=>'USD'); 
							$ddlCurrency=cmsSelectbox(	"currency"	,	"vacca"	,	$source_currency	,	''	,	''	);
							?>
							<div class="lunarnewyear">							
								<div ><?php echo $ddlCurrency; ?></div>				
								<div class="margin-left-10">
									<input type="text"  name="salary" class="vacca" onkeyup="PhanCachSoTien(this);"  placeholder="Nhập mức lương..." value="" >
								</div>			
							</div>
						</div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Mô tả công việc</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8">						
							<textarea name="job_description" placeholder="Nhập mô tả công việc..."  class="vacca summer-editor" rows="10" ></textarea>
						</div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Thành tích đạt được</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8">						
							<textarea name="achievement" placeholder="Nhập thành tích đạt được..."  class="vacca summer-editor" rows="10" ></textarea>
						</div>
					</div>
					<div class="row mia">
						<div class="col-lg-4"></div>
						<div class="col-lg-8">
							<div class="titanius">
								<div class="vihamus">
									<a href="javascript:void(0);" onclick="saveExperienceJob();" >
										<div class="narit">
											<div><i class="far fa-save"></i></div>
											<div class="margin-left-5">Lưu</div>
										</div>								
									</a>
								</div>							
								<div class="vihamus-2 margin-left-5">
									<a href="javascript:void(0);" onclick="noSaveExperienceJob();" >
										<div class="narit">
											<div><i class="far fa-times-circle"></i></div>
											<div class="margin-left-5">Không lưu</div>
										</div>								
									</a>
								</div>
							</div>
						</div>
					</div>							
				</div>			
				<hr  />
				<div class="row mia">
					<div class="col-lg-4"><div class="rarakata"><h2 class="login-information">Trình độ bằng cấp</h2><div class="miakasaki margin-left-15">(Bắt buộc)</div></div></div>
					<div class="col-lg-8"></div>
				</div>		
				<div class="row mia">					
					<div class="col-lg-12">
						Hãy liệt kê đầy đủ thông tin các bằng cấp/chứng chỉ mà bạn có (kể cả bằng cấp/ chứng chỉ đào tạo ngắn hạn) 
					</div>
				</div>	
				<div class="note note_graduation margin-top-15"  style="display: none;"></div>
				<?php 
				$status_graduation_edit='';
				$status_graduation_save='';
				$source_profile_graduation=DB::table('profile_graduation')
				->join('literacy','profile_graduation.literacy_id','=','literacy.id')
				->join('graduation','profile_graduation.graduation_id','=','graduation.id')
				->where('profile_graduation.profile_id',(int)@$id)
				->select(
					'profile_graduation.id',
					'literacy.fullname as literacy_name',
					'profile_graduation.training_unit',
					'profile_graduation.year_from',
					'profile_graduation.year_to',
					'profile_graduation.department',
					'graduation.fullname as graduation_name',
					'profile_graduation.degree'
				)
				->groupBy(
					'profile_graduation.id',
					'literacy.fullname',
					'profile_graduation.training_unit',
					'profile_graduation.year_from',
					'profile_graduation.year_to',
					'profile_graduation.department',
					'graduation.fullname',
					'profile_graduation.degree'
				)
				->orderBy('profile_graduation.id', 'asc')
				->get()->toArray();		
				$source_profile_graduation=convertToArray($source_profile_graduation);	
				if(count(@$source_profile_graduation) == 0){
					$status_graduation_edit='display:none';
					$status_graduation_save='display:block';
				}else{
					$status_graduation_edit='display:block';
					$status_graduation_save='display:none';
				}
				$source_literacy=App\LiteracyModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
				$source_graduation=App\GraduationModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
				$ddlLiteracy=cmsSelectboxCategory("literacy_id","vacca",$source_literacy,0,'','Chọn trình độ học vấn');
				$ddlGraduation=cmsSelectboxCategory("graduation_id","vacca",$source_graduation,0,'','Chọn Tốt nghiệp loại');
				$ddlGraduationYearFrom=cmsSelectbox(	"graduation_year_from"	,	"vacca"	,	$source_year	,	0	,	''	);						
				$ddlGraduationYearTo=cmsSelectbox(	"graduation_year_to"	,	"vacca"	,	$source_year	,	0	,	''	);
				?>
				<div class="graduation_edit" style="<?php echo $status_graduation_edit; ?>">
					<div class="graduation_txt">
						<?php 
						if(count(@$source_profile_graduation) > 0){
							foreach ($source_profile_graduation as $key => $value) {
								$profile_graduation_id=$value['id'];
								$profile_graduation_literacy_name=$value['literacy_name'];
								$profile_graduation_training_unit=$value['training_unit'];
								$profile_graduation_year_from= $value['year_from'];
								$profile_graduation_year_to=$value['year_to'];									
								$profile_graduation_department=@$value['department'];
								$profile_graduation_graduation_name=@$value['graduation_name'];			
								$profile_graduation_degree=@$value['degree'];				
								?>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Trình độ học vấn</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_graduation_literacy_name; ?></div> </div>
								</div>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Đơn vị đào tạo</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_graduation_training_unit; ?></div> </div>
								</div>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Thời gian</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8">
										<div class="lunarnewyear">
											<div>Từ</div>
											<div class="margin-left-10"><?php echo @$profile_graduation_year_from; ?></div>
											<div class="margin-left-10">Đến</div>
											<div class="margin-left-10"><?php echo @$profile_graduation_year_to; ?></div>
										</div> 
									</div>
								</div>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Chuyên ngành</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_graduation_department; ?></div> </div>
								</div>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Tốt nghiệp loại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_graduation_graduation_name; ?></div> </div>
								</div>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Ảnh bằng cấp</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8">
										<div class="xika2"><a target="_blank" href="<?php echo asset('upload/'.@$profile_graduation_degree); ?>">Tải về</a>			</div>																	
									</div>
								</div>							
								<div class="row mia">
									<div class="col-lg-4"></div>
									<div class="col-lg-8">
										<div class="vihamus-3">
											<a href="javascript:void(0);" onclick="deleteProfileGraduation(<?php echo $profile_graduation_id ?>);" >
												<div class="narit">
													<div><i class="far fa-times-circle"></i></div>
													<div class="margin-left-5">Xóa</div>
												</div>								
											</a>
										</div>
									</div>
								</div>
								<hr>
								<?php
							}
						}						
						?>
					</div>
					<div class="row mia">
						<div class="col-lg-4"></div>
						<div class="col-lg-8">
							<div class="vihamus-4">
								<a href="javascript:void(0);" onclick="addGraduation();" >
									<div class="narit">
										<div><i class="far fa-plus-square"></i></div>
										<div class="margin-left-5">Thêm trình độ bằng cấp</div>
									</div>								
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="graduation_save" style="<?php echo $status_graduation_save; ?>">
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Trình độ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><?php echo $ddlLiteracy; ?></div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Đơn vị đào tạo</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><input type="text"  name="training_unit" class="vacca" placeholder="Đơn vị đào tạo" value="" ></div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Thời gian</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8">
							<div class="lunarnewyear">															
								<div>Từ</div>								
								<div class="margin-left-10"><?php echo $ddlGraduationYearFrom; ?></div>
								<div class="margin-left-10">Đến</div>								
								<div class="margin-left-10"><?php echo $ddlGraduationYearTo; ?></div>
							</div>
						</div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Chuyên ngành</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><input type="text"  name="department" class="vacca" placeholder="Chuyên ngành" value="" ></div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Tốt nghiệp loại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><?php echo $ddlGraduation; ?></div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Tải ảnh bằng cấp</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><input type="file" name="degree" /></div>
					</div>
					<div class="row mia">
						<div class="col-lg-4"></div>
						<div class="col-lg-8">
							<div class="titanius">
								<div class="vihamus">
									<a href="javascript:void(0);" onclick="saveGraduation();" >
										<div class="narit">
											<div><i class="far fa-save"></i></div>
											<div class="margin-left-5">Lưu</div>
										</div>								
									</a>
								</div>							
								<div class="vihamus-2 margin-left-5">
									<a href="javascript:void(0);" onclick="noSaveGraduation();" >
										<div class="narit">
											<div><i class="far fa-times-circle"></i></div>
											<div class="margin-left-5">Không lưu</div>
										</div>								
									</a>
								</div>
							</div>
						</div>
					</div>				
				</div>
				<hr>
				<div class="note note_language margin-top-15"  style="display: none;"></div>
				<?php 
				$status_language_edit='';
				$status_language_save='';
				
				$source_profile_language=DB::table('profile_language')
				->join('language','profile_language.language_id','=','language.id')
				->join('language_level','profile_language.language_level_id','=','language_level.id')
				->join('classification as l','profile_language.listening','=','l.id')
				->join('classification as s','profile_language.speaking','=','s.id')
				->join('classification as r','profile_language.reading','=','r.id')
				->join('classification as w','profile_language.writing','=','w.id')
				->where('profile_language.profile_id',(int)@$id)
				->select(
					'profile_language.id',
					'language.fullname as language_name',					
					'language_level.fullname as language_level_name',
					'l.fullname as listening',
					's.fullname as speaking',
					'r.fullname as reading',
					'w.fullname as writing'				
				)
				->groupBy(
					'profile_language.id',
					'language.fullname',					
					'language_level.fullname',
					'l.fullname',
					's.fullname',
					'r.fullname',
					'w.fullname'		
				)
				->orderBy('profile_language.id', 'asc')
				->get()->toArray();		
				$source_profile_language=convertToArray($source_profile_language);

				if(count(@$source_profile_language) == 0){
					$status_language_edit='display:none';
					$status_language_save='display:block';
				}else{
					$status_language_edit='display:block';
					$status_language_save='display:none';
				}				
				$source_language=App\languageModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
				$source_language_level=App\languageLevelModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
				$source_classification=App\ClassificationModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();				
				$ddlLanguage=cmsSelectboxCategory("language_id","vacca",$source_language,0,'','Chọn ngoại ngữ');
				$ddlLanguageLevel=cmsSelectboxCategory("language_level_id","vacca",$source_language_level,0,'','Chọn trình độ');				
				?>
				<div class="language_edit" style="<?php echo $status_language_edit; ?>">
					<div class="language_txt">
						<?php 
						if(count(@$source_profile_language) > 0){
							foreach ($source_profile_language as $key => $value) {
								$profile_language_id=$value['id'];
								$profile_language_name=$value['language_name'];
								$profile_language_level_name=$value['language_level_name'];							
								$profile_listening=$value['listening'];
								$profile_speaking=$value['speaking'];
								$profile_reading=$value['reading'];
								$profile_writing=$value['writing'];
								?>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Ngoại ngữ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_language_name; ?></div> </div>
								</div>
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Trình độ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_language_level_name; ?></div> </div>
								</div>		
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Nghe</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_listening; ?></div> </div>
								</div>		
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Nói</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_speaking; ?></div> </div>
								</div>		
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Đọc</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_reading; ?></div> </div>
								</div>		
								<div class="row mia">
									<div class="col-lg-4" ><div class="xika"><div>Viết</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
									<div class="col-lg-8"><div class="xika2"><?php echo @$profile_writing; ?></div> </div>
								</div>										
								<div class="row mia">
									<div class="col-lg-4"></div>
									<div class="col-lg-8">
										<div class="vihamus-3">
											<a href="javascript:void(0);" onclick="deleteProfileLanguage(<?php echo $profile_language_id ?>);" >
												<div class="narit">
													<div><i class="far fa-times-circle"></i></div>
													<div class="margin-left-5">Xóa</div>
												</div>								
											</a>
										</div>
									</div>
								</div>
								<hr>
								<?php
							}
						}						
						?>
					</div>
					<div class="row mia">
						<div class="col-lg-4"></div>
						<div class="col-lg-8">
							<div class="vihamus-4">
								<a href="javascript:void(0);" onclick="addLanguage();" >
									<div class="narit">
										<div><i class="far fa-plus-square"></i></div>
										<div class="margin-left-5">Thêm trình độ ngoại ngữ</div>
									</div>								
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="language_save" style="<?php echo $status_language_save; ?>">
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Ngoại ngữ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><?php echo $ddlLanguage; ?></div>
					</div>					
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Trình độ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><?php echo $ddlLanguageLevel; ?></div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ></div>
						<div class="col-lg-8">
							<table class="language-tb">
								<tr>
									<th class="suzuritake"></th>
									<?php 
									foreach ($source_classification as $key => $value) {										
										$classification_name=$value['fullname'];
										?>
										<th class="suzuritake"><?php echo $classification_name; ?></th>
										<?php
									}
									?>									
								</tr>
								<tr>
									<td>Nghe</td>
									<?php 
									foreach ($source_classification as $key => $value) {
										$classification_id=$value['id'];
										$classification_name=$value['fullname'];
										?>
										<td><center><input type="radio" name="listening" value="<?php echo $classification_id; ?>"></center></td>
										<?php
									}
									?>									
								</tr>
								<tr>
									<td>Nói</td>
									<?php 
									foreach ($source_classification as $key => $value) {
										$classification_id=$value['id'];
										$classification_name=$value['fullname'];
										?>
										<td><center><input type="radio" name="speaking" value="<?php echo $classification_id; ?>"></center></td>
										<?php
									}
									?>		
								</tr>
								<tr>
									<td>Đọc</td>
									<?php 
									foreach ($source_classification as $key => $value) {
										$classification_id=$value['id'];
										$classification_name=$value['fullname'];
										?>
										<td><center><input type="radio" name="reading" value="<?php echo $classification_id; ?>"></center></td>
										<?php
									}
									?>		
								</tr>
								<tr>
									<td>Viết</td>
									<?php 
									foreach ($source_classification as $key => $value) {
										$classification_id=$value['id'];
										$classification_name=$value['fullname'];
										?>
										<td><center><input type="radio" name="writing" value="<?php echo $classification_id; ?>"></center></td>
										<?php
									}
									?>		
								</tr>
							</table>
						</div>
					</div>
					<div class="row mia">
						<div class="col-lg-4"></div>
						<div class="col-lg-8">
							<div class="titanius">
								<div class="vihamus">
									<a href="javascript:void(0);" onclick="saveLanguage();" >
										<div class="narit">
											<div><i class="far fa-save"></i></div>
											<div class="margin-left-5">Lưu</div>
										</div>								
									</a>
								</div>							
								<div class="vihamus-2 margin-left-5">
									<a href="javascript:void(0);" onclick="noSaveLanguage();" >
										<div class="narit">
											<div><i class="far fa-times-circle"></i></div>
											<div class="margin-left-5">Không lưu</div>
										</div>								
									</a>
								</div>
							</div>
						</div>
					</div>				
				</div>
				<hr  />	
				<?php 
				$status_office_edit='';
				$status_office_save='';
				if((int)@$profile_detail['ms_word'] == 0 || 
					(int)@$profile_detail['ms_excel'] == 0 ||
					(int)@$profile_detail['ms_power_point'] == 0 ||
					(int)@$profile_detail['ms_outlook'] == 0) 
				{
					$status_office_edit='display:none';
					$status_office_save='display:block';
				}else{
					$status_office_edit='display:block';
					$status_office_save='display:none';
				}
				?>
				<div class="note note_office margin-top-15"  style="display: none;"></div>
				<div class="office_edit" style="<?php echo $status_office_edit; ?>">
					<div class="office_txt">
						<div class="row mia">
							<div class="col-lg-4" ><div class="xika"><div>MS Word</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
							<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['ms_word_level']; ?></div> </div>
						</div>
						<div class="row mia">
							<div class="col-lg-4" ><div class="xika"><div>MS Excel</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
							<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['ms_excel_level']; ?></div> </div>
						</div>
						<div class="row mia">
							<div class="col-lg-4" ><div class="xika"><div>MS Power Point</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
							<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['ms_power_point_level']; ?></div> </div>
						</div>
						<div class="row mia">
							<div class="col-lg-4" ><div class="xika"><div>MS Outlook</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
							<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['ms_outlook_level']; ?></div> </div>
						</div>
						<div class="row mia">
							<div class="col-lg-4" ><div class="xika"><div>Phần mềm khác</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
							<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['other_software']; ?></div> </div>
						</div>
						<div class="row mia">
							<div class="col-lg-4" ><div class="xika"><div>Thành tích nổi bật</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
							<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['medal']; ?></div> </div>
						</div>						
					</div>
					<div class="row mia">
						<div class="col-lg-4"></div>
						<div class="col-lg-8">
							<div class="vihamus-3 margin-top-5">
								<a href="javascript:void(0);" onclick="showOfficeSave();"  >
									<div class="narit">
										<div><i class="far fa-edit"></i></div>
										<div class="margin-left-5">Chỉnh sửa</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="office_save" style="<?php echo $status_office_save; ?>">					
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Tin học văn phòng</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8">
							<table class="language-tb">
								<tr>
									<th class="suzuritake"></th>
									<?php 
									if(count(@$source_classification) > 0){
										foreach ($source_classification as $key => $value) {										
											$classification_name=$value['fullname'];
											?>
											<th class="suzuritake"><?php echo $classification_name; ?></th>
											<?php
										}
									}									
									?>									
								</tr>
								<tr>
									<td>MS Word</td>
									<?php 
									foreach ($source_classification as $key => $value) {
										$classification_id=$value['id'];
										$classification_name=$value['fullname'];
										if((int)@$profile_detail['ms_word'] == (int)@$classification_id){
											?>
											<td><center><input type="radio" name="ms_word" value="<?php echo $classification_id; ?>" checked ></center></td>
											<?php
										}else{
											?>
											<td><center><input type="radio" name="ms_word" value="<?php echo $classification_id; ?>"></center></td>
											<?php
										}										
									}
									?>									
								</tr>
								<tr>
									<td>MS Excel</td>
									<?php 
									foreach ($source_classification as $key => $value) {
										$classification_id=$value['id'];
										$classification_name=$value['fullname'];
										if((int)@$profile_detail['ms_excel'] == (int)@$classification_id){
											?>
											<td><center><input type="radio" name="ms_excel" value="<?php echo $classification_id; ?>" checked ></center></td>
											<?php
										}else{
											?>
											<td><center><input type="radio" name="ms_excel" value="<?php echo $classification_id; ?>"></center></td>
											<?php
										}										
									}
									?>		
								</tr>
								<tr>
									<td>MS Power Point</td>
									<?php 
									foreach ($source_classification as $key => $value) {
										$classification_id=$value['id'];
										$classification_name=$value['fullname'];
										if((int)@$profile_detail['ms_power_point'] == (int)@$classification_id){
											?>
											<td><center><input type="radio" name="ms_power_point" value="<?php echo $classification_id; ?>" checked ></center></td>
											<?php
										}else{
											?>
											<td><center><input type="radio" name="ms_power_point" value="<?php echo $classification_id; ?>"></center></td>
											<?php
										}										
									}
									?>		
								</tr>
								<tr>
									<td>MS Outlook</td>
									<?php 
									foreach ($source_classification as $key => $value) {
										$classification_id=$value['id'];
										$classification_name=$value['fullname'];
										if((int)@$profile_detail['ms_outlook'] == (int)@$classification_id){
											?>
											<td><center><input type="radio" name="ms_outlook" value="<?php echo $classification_id; ?>" checked ></center></td>
											<?php
										}else{
											?>
											<td><center><input type="radio" name="ms_outlook" value="<?php echo $classification_id; ?>"></center></td>
											<?php
										}										
									}
									?>		
								</tr>
							</table>
						</div>
						<div class="row mia">
							<div class="col-lg-4" ><div class="xika"><div>Phần mềm khác</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
							<div class="col-lg-8"><input type="text"  name="other_software"  class="vacca" placeholder="Nhập tên phần mềm khác" value="<?php echo @$profile_detail['other_software']; ?>" ></div>
						</div>
						<div class="row mia">
							<div class="col-lg-4" ><div class="xika"><div>Các thành tích nổi bật</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
							<div class="col-lg-8">
								<textarea name="medal" placeholder="Nhập thành tích..." class="vacca summer-editor" rows="10" ><?php echo @$profile_detail['medal']; ?></textarea>
							</div>
						</div>
					</div>
					<div class="row mia">
						<div class="col-lg-4"></div>
						<div class="col-lg-8">
							<div class="titanius">
								<div class="vihamus">
									<a href="javascript:void(0);" onclick="saveOffice();" >
										<div class="narit">
											<div><i class="far fa-save"></i></div>
											<div class="margin-left-5">Lưu</div>
										</div>								
									</a>
								</div>							
								<div class="vihamus-2 margin-left-5">
									<a href="javascript:void(0);" onclick="noSaveOffice();" >
										<div class="narit">
											<div><i class="far fa-times-circle"></i></div>
											<div class="margin-left-5">Không lưu</div>
										</div>								
									</a>
								</div>
							</div>
						</div>
					</div>				
				</div>
				<hr  />		
				<div class="row mia">
					<div class="col-lg-4"><div class="rarakata"><h2 class="login-information">Kỹ năng / Sở trường</h2><div class="miakasaki margin-left-15"></div></div></div>
					<div class="col-lg-8"></div>
				</div>
				<?php 
				$status_skill_edit='';
				$status_skill_save='';
				if(empty(@$profile_detail['hobby']) || empty(@$profile_detail['talent'])){
					$status_skill_edit='display:none';
					$status_skill_save='display:block';
				}else{
					$status_skill_edit='display:block';
					$status_skill_save='display:none';
				}
				$source_skill=App\SkillModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
				$data_profile_skill= DB::table('skill')
				->join('profile_skill','skill.id','=','profile_skill.skill_id')
				->where('profile_skill.profile_id',@$id)
				->select('skill.id','skill.fullname')
				->groupBy('skill.id','skill.fullname')
				->orderBy('skill.id','asc')
				->get()
				->toArray();
				$data_profile_skill=convertToArray($data_profile_skill);				
				?>
				<div class="note note_skill margin-top-15"  style="display: none;"></div>
				<div class="skill_edit" style="<?php echo $status_skill_edit; ?>">
					<div class="skill_txt">		
						<div class="row mia">
							<div class="col-lg-4" ><div class="xika"><div>Kỹ năng - Sở trường</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
							<div class="col-lg-8">
								<?php 
								if(count(@$data_profile_skill) > 0){
									foreach (@$data_profile_skill as $key => $value) {
										$skill_id=$value['id'];
										$skill_name=$value['fullname'];
										?>
										<div><?php echo $skill_name; ?></div>
										<?php
									}							
								}							
								?>							
							</div>
						</div>							
						<div class="row mia">
							<div class="col-lg-4" ><div class="xika"><div>Sở thích</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
							<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['hobby']; ?></div> </div>
						</div>
						<div class="row mia">
							<div class="col-lg-4" ><div class="xika"><div>Kỹ năng đặc biệt</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
							<div class="col-lg-8"><div class="xika2"><?php echo @$profile_detail['talent']; ?></div> </div>
						</div>						
					</div>
					<div class="row mia">
						<div class="col-lg-4"></div>
						<div class="col-lg-8">
							<div class="vihamus-3 margin-top-5">
								<a href="javascript:void(0);" onclick="showSkillSave();"  >
									<div class="narit">
										<div><i class="far fa-edit"></i></div>
										<div class="margin-left-5">Chỉnh sửa</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="skill_save" style="<?php echo $status_skill_save; ?>">	
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Kỹ năng - Sở trường</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8">
							<?php 
							if(count(@$source_skill) > 0){
								?>
								<div class="row mia">
									<?php 
									$k=1;
									foreach (@$source_skill as $key => $value) {
										$skill_id=$value['id'];
										$skill_name=$value['fullname'];
										$checked_status='';		
										foreach ($data_profile_skill as $key2 => $value2) {
											$skill_id2=$value2['id'];																	
											if((int)@$skill_id == (int)@$skill_id2){
												$checked_status='checked';						
											}										
										}									
										?>
										<div class="col-lg-4">
											<input type="checkbox" name="skill_id[]" <?php echo $checked_status; ?> value="<?php echo $skill_id; ?>"><?php echo $skill_name; ?>
										</div>
										<?php
										if($k%3 == 0){
											?><div class="clr"></div><?php
										}
										$k++;
									}
									?>
								</div>
								<?php								
							}							
							?>							
						</div>
					</div>									
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Sở thích</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><input type="text"  name="hobby"  class="vacca" placeholder="Nhập sở thích" value="<?php echo @$profile_detail['hobby']; ?>" ></div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Kỹ năng đặc biệt</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8">
							<textarea name="talent" placeholder="Nhập kỹ năng đặc biệt" class="vacca summer-editor" rows="10" ><?php echo @$profile_detail['talent']; ?></textarea>
						</div>
					</div>
					<div class="row mia">
						<div class="col-lg-4"></div>
						<div class="col-lg-8">
							<div class="titanius">
								<div class="vihamus">
									<a href="javascript:void(0);" onclick="saveSkill();" >
										<div class="narit">
											<div><i class="far fa-save"></i></div>
											<div class="margin-left-5">Lưu</div>
										</div>								
									</a>
								</div>							
								<div class="vihamus-2 margin-left-5">
									<a href="javascript:void(0);" onclick="noSaveSkill();" >
										<div class="narit">
											<div><i class="far fa-times-circle"></i></div>
											<div class="margin-left-5">Không lưu</div>
										</div>								
									</a>
								</div>
							</div>
						</div>
					</div>			
				</div>	
			</form>			
		</div>							
		<div class="col-lg-3">
			@include("frontend.candidate-sidebar")				
		</div>
	</div>
</div>

<script type="text/javascript" language="javascript">
	function saveCareerGoal(){
		var id = $("form[name='frm']").find("input[name='id']").val();
		var career_goal = $("form[name='frm']").find("textarea[name='career_goal']").summernote('code');
		var token = $("form[name='frm']").find("input[name='_token']").val();
		var dataItem = new FormData();
		dataItem.append('id',id);
		dataItem.append('career_goal',career_goal);           
		dataItem.append('_token',token);
		$.ajax({
			url: '<?php echo route("frontend.index.updateCareerGoal"); ?>',
			type: 'POST',
			data: dataItem,
			async: false,
			success: function (data) {
				if(data.checked==1){      					
					$('.career_goal_txt').empty();
					$('.career_goal_txt').append(data.career_goal);										
					$('.career_goal_edit').show();
					$('.career_goal_save').hide();
				} 
				showMsg('note_career_goal',data);     			
			},
			error : function (data){

			},
			beforeSend  : function(jqXHR,setting){

			},
			cache: false,
			contentType: false,
			processData: false
		});
	}
	function showCareerGoalSave(){
		$('.career_goal_edit').hide();
		$('.career_goal_save').show();
	}
	function noSaveCareerGoal(){
		$('.career_goal_edit').show();
		$('.career_goal_save').hide();	
	}	
	function saveExperienceJob(){
		var id = $("form[name='frm']").find("input[name='id']").val();
		var company_name = $("form[name='frm']").find("input[name='company_name']").val();
		var person_title = $("form[name='frm']").find("input[name='person_title']").val();
		var month_from = $("form[name='frm']").find("select[name='month_from']").val();
		var year_from = $("form[name='frm']").find("select[name='year_from']").val();
		var month_to = $("form[name='frm']").find("select[name='month_to']").val();
		var year_to = $("form[name='frm']").find("select[name='year_to']").val();
		var currency = $("form[name='frm']").find("select[name='currency']").val();
		var salary = $("form[name='frm']").find("input[name='salary']").val();
		var job_description = $("form[name='frm']").find("textarea[name='job_description']").summernote('code');
		var achievement = $("form[name='frm']").find("textarea[name='achievement']").summernote('code');		
		var token = $("form[name='frm']").find("input[name='_token']").val();
		var dataItem = new FormData();
		dataItem.append('id',id);
		dataItem.append('company_name',company_name);           
		dataItem.append('person_title',person_title);           
		dataItem.append('month_from',month_from);           
		dataItem.append('year_from',year_from);           
		dataItem.append('month_to',month_to);           
		dataItem.append('year_to',year_to);           
		dataItem.append('currency',currency);           
		dataItem.append('salary',salary);           
		dataItem.append('job_description',job_description);           
		dataItem.append('achievement',achievement);           		
		dataItem.append('_token',token);
		$.ajax({
			url: '<?php echo route("frontend.index.saveExperienceJob"); ?>',
			type: 'POST',
			data: dataItem,
			async: false,
			success: function (data) {
				if(data.checked==1){      	
					var data_profile_experience=data.data_profile_experience;	
					loadDataProfileExperience(data_profile_experience);
					$('.experience_job_edit').show();
					$('.experience_job_save').hide();
				}
				showMsg('note_experience',data);         			
			},
			error : function (data){

			},
			beforeSend  : function(jqXHR,setting){

			},
			cache: false,
			contentType: false,
			processData: false
		});
	}
	function noSaveExperienceJob(){
		$('.experience_job_edit').show();
		$('.experience_job_save').hide();		
	}
	function addExperienceJob(){
		$('.experience_job_save').show();
		$("form[name='frm']").find("input[name='company_name']").val('');
		$("form[name='frm']").find("input[name='person_title']").val('');
		$("form[name='frm']").find("select[name='month_from']").val(0);
		$("form[name='frm']").find("select[name='year_from']").val(0);
		$("form[name='frm']").find("select[name='month_to']").val(0);
		$("form[name='frm']").find("select[name='year_to']").val(0);
		$("form[name='frm']").find("select[name='currency']").val('');
		$("form[name='frm']").find("input[name='salary']").val('');
		$("form[name='frm']").find("textarea[name='job_description']").val('');
		$("form[name='frm']").find("textarea[name='achievement']").val('');		
	}
	function loadDataProfileExperience(data_profile_experience){
		$('.experience_job_txt').empty();					
		$.each(data_profile_experience,function(index,value){
			/* begin company_name */
			var company_name_row_mia=document.createElement('div');					
			var company_name_col_lg_4=document.createElement('div');
			var company_name_col_lg_8=document.createElement('div');
			var company_name_xika=document.createElement('div');
			var company_name_xika2=document.createElement('div');
			$(company_name_row_mia).addClass('row mia');
			$(company_name_col_lg_4).addClass('col-lg-4');
			$(company_name_col_lg_8).addClass('col-lg-8');
			$(company_name_xika).addClass('xika');
			$(company_name_xika2).addClass('xika2');
			$('.experience_job_txt').append(company_name_row_mia);
			$(company_name_row_mia).append(company_name_col_lg_4);
			$(company_name_row_mia).append(company_name_col_lg_8);
			$(company_name_col_lg_4).append(company_name_xika);
			$(company_name_col_lg_8).append(company_name_xika2);
			$(company_name_xika).text('Tên công ty');
			$(company_name_xika2).text(value.company_name);						
			/* end company_name */
			/* begin person_title */
			var person_title_row_mia=document.createElement('div');					
			var person_title_col_lg_4=document.createElement('div');
			var person_title_col_lg_8=document.createElement('div');
			var person_title_xika=document.createElement('div');
			var person_title_xika2=document.createElement('div');
			$(person_title_row_mia).addClass('row mia');
			$(person_title_col_lg_4).addClass('col-lg-4');
			$(person_title_col_lg_8).addClass('col-lg-8');
			$(person_title_xika).addClass('xika');
			$(person_title_xika2).addClass('xika2');
			$('.experience_job_txt').append(person_title_row_mia);
			$(person_title_row_mia).append(person_title_col_lg_4);
			$(person_title_row_mia).append(person_title_col_lg_8);
			$(person_title_col_lg_4).append(person_title_xika);
			$(person_title_col_lg_8).append(person_title_xika2);
			$(person_title_xika).text('Chức danh');
			$(person_title_xika2).text(value.person_title);						
			/* end person_title */
			/* begin business_time */
			var business_time_row_mia=document.createElement('div');					
			var business_time_col_lg_4=document.createElement('div');
			var business_time_col_lg_8=document.createElement('div');
			var business_time_xika=document.createElement('div');
			var business_time_xika2=document.createElement('div');
			var business_time_general=document.createElement('div');
			var business_time_from=document.createElement('div');
			var business_time_month_year_from=document.createElement('div');
			var business_time_to=document.createElement('div');
			var business_time_month_year_to=document.createElement('div');
			$(business_time_row_mia).addClass('row mia');
			$(business_time_col_lg_4).addClass('col-lg-4');
			$(business_time_col_lg_8).addClass('col-lg-8');
			$(business_time_xika).addClass('xika');
			$(business_time_xika2).addClass('xika2');
			$(business_time_general).addClass('lunarnewyear');
			$(business_time_month_year_from).addClass('margin-left-10');						
			$(business_time_to).addClass('margin-left-10');
			$(business_time_month_year_to).addClass('margin-left-10');						
			$('.experience_job_txt').append(business_time_row_mia);
			$(business_time_row_mia).append(business_time_col_lg_4);
			$(business_time_row_mia).append(business_time_col_lg_8);
			$(business_time_col_lg_4).append(business_time_xika);
			$(business_time_col_lg_8).append(business_time_xika2);
			$(business_time_xika).text('Thời gian làm việc');						
			$(business_time_xika2).append(business_time_general);
			$(business_time_general).append(business_time_from);
			$(business_time_general).append(business_time_month_year_from);						
			$(business_time_general).append(business_time_to);
			$(business_time_general).append(business_time_month_year_to);						
			$(business_time_from).text('Từ');
			$(business_time_month_year_from).text(value.time_from);									
			$(business_time_to).text('Đến');
			$(business_time_month_year_to).text(value.time_to);											
			/* end business_time */
			/* begin salary */
			var salary_row_mia=document.createElement('div');					
			var salary_col_lg_4=document.createElement('div');
			var salary_col_lg_8=document.createElement('div');
			var salary_xika=document.createElement('div');
			var salary_xika2=document.createElement('div');						
			var salary_money=document.createElement('div');						
			$(salary_row_mia).addClass('row mia');
			$(salary_col_lg_4).addClass('col-lg-4');
			$(salary_col_lg_8).addClass('col-lg-8');
			$(salary_xika).addClass('xika');
			$(salary_xika2).addClass('xika2');											
			$('.experience_job_txt').append(salary_row_mia);
			$(salary_row_mia).append(salary_col_lg_4);
			$(salary_row_mia).append(salary_col_lg_8);
			$(salary_col_lg_4).append(salary_xika);
			$(salary_col_lg_8).append(salary_xika2);
			$(salary_xika).text('Mức lương');
			$(salary_xika2).append(salary_money);						
			$(salary_money).text(value.salary);						
			/* end salary */
			/* begin job_description */
			var job_description_row_mia=document.createElement('div');					
			var job_description_col_lg_4=document.createElement('div');
			var job_description_col_lg_8=document.createElement('div');
			var job_description_xika=document.createElement('div');
			var job_description_xika2=document.createElement('div');
			$(job_description_row_mia).addClass('row mia');
			$(job_description_col_lg_4).addClass('col-lg-4');
			$(job_description_col_lg_8).addClass('col-lg-8');
			$(job_description_xika).addClass('xika');
			$(job_description_xika2).addClass('xika2');
			$('.experience_job_txt').append(job_description_row_mia);
			$(job_description_row_mia).append(job_description_col_lg_4);
			$(job_description_row_mia).append(job_description_col_lg_8);
			$(job_description_col_lg_4).append(job_description_xika);
			$(job_description_col_lg_8).append(job_description_xika2);
			$(job_description_xika).text('Mô tả công việc');
			$(job_description_xika2).append(value.job_description);						
			/* end job_description */
			/* begin achievement */
			var achievement_row_mia=document.createElement('div');					
			var achievement_col_lg_4=document.createElement('div');
			var achievement_col_lg_8=document.createElement('div');
			var achievement_xika=document.createElement('div');
			var achievement_xika2=document.createElement('div');
			$(achievement_row_mia).addClass('row mia');
			$(achievement_col_lg_4).addClass('col-lg-4');
			$(achievement_col_lg_8).addClass('col-lg-8');
			$(achievement_xika).addClass('xika');
			$(achievement_xika2).addClass('xika2');
			$('.experience_job_txt').append(achievement_row_mia);
			$(achievement_row_mia).append(achievement_col_lg_4);
			$(achievement_row_mia).append(achievement_col_lg_8);
			$(achievement_col_lg_4).append(achievement_xika);
			$(achievement_col_lg_8).append(achievement_xika2);
			$(achievement_xika).text('Thành tích đạt được');
			$(achievement_xika2).append(value.achievement);	
			/* end achievement */
			/* begin delete */
			var delete_row_mia=document.createElement('div');					
			var delete_col_lg_4=document.createElement('div');
			var delete_col_lg_8=document.createElement('div');							
			$(delete_row_mia).addClass('row mia');
			$(delete_col_lg_4).addClass('col-lg-4');
			$(delete_col_lg_8).addClass('col-lg-8');								
			$('.experience_job_txt').append(delete_row_mia);
			$(delete_row_mia).append(delete_col_lg_4);
			$(delete_row_mia).append(delete_col_lg_8);	
			var delete_html='<div class="vihamus-3"><a href="javascript:void(0);" onclick="deleteProfileExperience('+parseInt(value.id)+');"><div class="narit"><div><i class="far fa-times-circle"></i></div><div class="margin-left-5">Xóa</div></div></a></div>';		
			$(delete_col_lg_8).append(delete_html);									
			/* end delete */
			/* begin hr */
			var hr=document.createElement('hr');
			$('.experience_job_txt').append(hr);				
			/* end hr */
		});										
}
function deleteProfileExperience(profile_experience_id){
	var xac_nhan = 0;
	var msg="Bạn có muốn xóa ?";
	if(window.confirm(msg)){ 
		xac_nhan = 1;
	}
	if(xac_nhan  == 0){
		return 0;
	}
	var id = $("form[name='frm']").find("input[name='id']").val();		
	var token = $("form[name='frm']").find("input[name='_token']").val();
	var dataItem = new FormData();
	dataItem.append('id',id);
	dataItem.append('profile_experience_id',profile_experience_id);           		
	dataItem.append('_token',token);
	$.ajax({
		url: '<?php echo route("frontend.index.deleteExperienceJob"); ?>',
		type: 'POST',
		data: dataItem,
		async: false,
		success: function (data) {
			if(data.checked==1){      	
				var data_profile_experience=data.data_profile_experience;	
				loadDataProfileExperience(data_profile_experience);
			} 
			showMsg('note_experience',data);       			
		},
		error : function (data){

		},
		beforeSend  : function(jqXHR,setting){

		},
		cache: false,
		contentType: false,
		processData: false
	});
}
function saveGraduation(){
	var id = $("form[name='frm']").find("input[name='id']").val();
	var literacy_id = $("form[name='frm']").find("select[name='literacy_id']").val();
	var training_unit = $("form[name='frm']").find("input[name='training_unit']").val();
	var graduation_year_from = $("form[name='frm']").find("select[name='graduation_year_from']").val();
	var graduation_year_to = $("form[name='frm']").find("select[name='graduation_year_to']").val();
	var department = $("form[name='frm']").find("input[name='department']").val();
	var graduation_id = $("form[name='frm']").find("select[name='graduation_id']").val();
	/* begin xử lý image */
	var image_file=null;
	var image_ctrl=$('input[name="degree"]');         
	var image_files = $(image_ctrl).get(0).files;        
	if(image_files.length > 0){            
		image_file  = image_files[0];  
	}        
	/* end xử lý image */   
	var token = $("form[name='frm']").find("input[name='_token']").val();
	var dataItem = new FormData();
	dataItem.append('id',id);
	dataItem.append('literacy_id',literacy_id);
	dataItem.append('training_unit',training_unit);
	dataItem.append('graduation_year_from',graduation_year_from);
	dataItem.append('graduation_year_to',graduation_year_to);
	dataItem.append('department',department);
	dataItem.append('graduation_id',graduation_id);
	if(image_files.length > 0){
		dataItem.append('image',image_file);
	}  	
	dataItem.append('_token',token);
	$.ajax({
		url: '<?php echo route("frontend.index.saveGraduation"); ?>',
		type: 'POST',
		data: dataItem,
		async: false,
		success: function (data) {
			if(data.checked==1){
				var data_profile_graduation=data.data_profile_graduation;	
				loadDataProfileGraduation(data_profile_graduation);
				$('.graduation_edit').show();
				$('.graduation_save').hide();			
			}
			showMsg('note_graduation',data);    
		},
		error : function (data){

		},
		beforeSend  : function(jqXHR,setting){

		},
		cache: false,
		contentType: false,
		processData: false
	});
}
function loadDataProfileGraduation(data_profile_graduation){
	$('.graduation_txt').empty();
	$.each(data_profile_graduation,function(index,value){
		/* begin literacy */
		var literacy_row_mia=document.createElement('div');					
		var literacy_col_lg_4=document.createElement('div');
		var literacy_col_lg_8=document.createElement('div');
		var literacy_xika=document.createElement('div');
		var literacy_xika2=document.createElement('div');
		$(literacy_row_mia).addClass('row mia');
		$(literacy_col_lg_4).addClass('col-lg-4');
		$(literacy_col_lg_8).addClass('col-lg-8');
		$(literacy_xika).addClass('xika');
		$(literacy_xika2).addClass('xika2');
		$('.graduation_txt').append(literacy_row_mia);
		$(literacy_row_mia).append(literacy_col_lg_4);
		$(literacy_row_mia).append(literacy_col_lg_8);
		$(literacy_col_lg_4).append(literacy_xika);
		$(literacy_col_lg_8).append(literacy_xika2);
		$(literacy_xika).text('Trình độ học vấn');
		$(literacy_xika2).text(value.literacy_name);						
		/* end literacy */
		/* begin training_unit */
		var training_unit_row_mia=document.createElement('div');					
		var training_unit_col_lg_4=document.createElement('div');
		var training_unit_col_lg_8=document.createElement('div');
		var training_unit_xika=document.createElement('div');
		var training_unit_xika2=document.createElement('div');
		$(training_unit_row_mia).addClass('row mia');
		$(training_unit_col_lg_4).addClass('col-lg-4');
		$(training_unit_col_lg_8).addClass('col-lg-8');
		$(training_unit_xika).addClass('xika');
		$(training_unit_xika2).addClass('xika2');
		$('.graduation_txt').append(training_unit_row_mia);
		$(training_unit_row_mia).append(training_unit_col_lg_4);
		$(training_unit_row_mia).append(training_unit_col_lg_8);
		$(training_unit_col_lg_4).append(training_unit_xika);
		$(training_unit_col_lg_8).append(training_unit_xika2);
		$(training_unit_xika).text('Đơn vị đào tạo');
		$(training_unit_xika2).text(value.training_unit);						
		/* end training_unit */
		/* begin business_time */
		var business_time_row_mia=document.createElement('div');					
		var business_time_col_lg_4=document.createElement('div');
		var business_time_col_lg_8=document.createElement('div');
		var business_time_xika=document.createElement('div');
		var business_time_xika2=document.createElement('div');
		var business_time_general=document.createElement('div');
		var business_time_from=document.createElement('div');
		var business_time_month_year_from=document.createElement('div');
		var business_time_to=document.createElement('div');
		var business_time_month_year_to=document.createElement('div');
		$(business_time_row_mia).addClass('row mia');
		$(business_time_col_lg_4).addClass('col-lg-4');
		$(business_time_col_lg_8).addClass('col-lg-8');
		$(business_time_xika).addClass('xika');
		$(business_time_xika2).addClass('xika2');
		$(business_time_general).addClass('lunarnewyear');
		$(business_time_month_year_from).addClass('margin-left-10');						
		$(business_time_to).addClass('margin-left-10');
		$(business_time_month_year_to).addClass('margin-left-10');						
		$('.graduation_txt').append(business_time_row_mia);
		$(business_time_row_mia).append(business_time_col_lg_4);
		$(business_time_row_mia).append(business_time_col_lg_8);
		$(business_time_col_lg_4).append(business_time_xika);
		$(business_time_col_lg_8).append(business_time_xika2);
		$(business_time_xika).text('Thời gian');						
		$(business_time_xika2).append(business_time_general);
		$(business_time_general).append(business_time_from);
		$(business_time_general).append(business_time_month_year_from);						
		$(business_time_general).append(business_time_to);
		$(business_time_general).append(business_time_month_year_to);						
		$(business_time_from).text('Từ');
		$(business_time_month_year_from).text(value.year_from);									
		$(business_time_to).text('Đến');
		$(business_time_month_year_to).text(value.year_to);											
		/* end business_time */
		/* begin department */
		var department_row_mia=document.createElement('div');					
		var department_col_lg_4=document.createElement('div');
		var department_col_lg_8=document.createElement('div');
		var department_xika=document.createElement('div');
		var department_xika2=document.createElement('div');
		$(department_row_mia).addClass('row mia');
		$(department_col_lg_4).addClass('col-lg-4');
		$(department_col_lg_8).addClass('col-lg-8');
		$(department_xika).addClass('xika');
		$(department_xika2).addClass('xika2');
		$('.graduation_txt').append(department_row_mia);
		$(department_row_mia).append(department_col_lg_4);
		$(department_row_mia).append(department_col_lg_8);
		$(department_col_lg_4).append(department_xika);
		$(department_col_lg_8).append(department_xika2);
		$(department_xika).text('Chuyên ngành');
		$(department_xika2).text(value.department);						
		/* end department */
		/* begin graduation */
		var graduation_row_mia=document.createElement('div');					
		var graduation_col_lg_4=document.createElement('div');
		var graduation_col_lg_8=document.createElement('div');
		var graduation_xika=document.createElement('div');
		var graduation_xika2=document.createElement('div');
		$(graduation_row_mia).addClass('row mia');
		$(graduation_col_lg_4).addClass('col-lg-4');
		$(graduation_col_lg_8).addClass('col-lg-8');
		$(graduation_xika).addClass('xika');
		$(graduation_xika2).addClass('xika2');
		$('.graduation_txt').append(graduation_row_mia);
		$(graduation_row_mia).append(graduation_col_lg_4);
		$(graduation_row_mia).append(graduation_col_lg_8);
		$(graduation_col_lg_4).append(graduation_xika);
		$(graduation_col_lg_8).append(graduation_xika2);
		$(graduation_xika).text('Tốt nghiệp loại');
		$(graduation_xika2).text(value.graduation_name);						
		/* end graduation */
		/* begin degree */
		var degree_row_mia=document.createElement('div');					
		var degree_col_lg_4=document.createElement('div');
		var degree_col_lg_8=document.createElement('div');
		var degree_xika=document.createElement('div');
		var degree_xika2=document.createElement('div');
		var degree_img=document.createElement('img');
		$(degree_row_mia).addClass('row mia');
		$(degree_col_lg_4).addClass('col-lg-4');
		$(degree_col_lg_8).addClass('col-lg-8');
		$(degree_xika).addClass('xika');
		$(degree_xika2).addClass('xika2');
		$('.graduation_txt').append(degree_row_mia);
		$(degree_row_mia).append(degree_col_lg_4);
		$(degree_row_mia).append(degree_col_lg_8);
		$(degree_col_lg_4).append(degree_xika);
		$(degree_col_lg_8).append(degree_xika2);
		$(degree_xika).text('Bằng cấp');
		$(degree_img).prop('src',value.degree);
		$(degree_xika2).append(degree_img);
		/* end degree */
		/* begin delete */
		var delete_row_mia=document.createElement('div');					
		var delete_col_lg_4=document.createElement('div');
		var delete_col_lg_8=document.createElement('div');							
		$(delete_row_mia).addClass('row mia');
		$(delete_col_lg_4).addClass('col-lg-4');
		$(delete_col_lg_8).addClass('col-lg-8');								
		$('.graduation_txt').append(delete_row_mia);
		$(delete_row_mia).append(delete_col_lg_4);
		$(delete_row_mia).append(delete_col_lg_8);	
		var delete_html='<div class="vihamus-3"><a href="javascript:void(0);" onclick="deleteProfileGraduation('+parseInt(value.id)+');"><div class="narit"><div><i class="far fa-times-circle"></i></div><div class="margin-left-5">Xóa</div></div></a></div>';		
		$(delete_col_lg_8).append(delete_html);									
		/* end delete */
		/* begin hr */
		var hr=document.createElement('hr');
		$('.graduation_txt').append(hr);				
		/* end hr */
	});				
}
function deleteProfileGraduation(profile_graduation_id){
	var xac_nhan = 0;
	var msg="Bạn có muốn xóa ?";
	if(window.confirm(msg)){ 
		xac_nhan = 1;
	}
	if(xac_nhan  == 0){
		return 0;
	}
	var id = $("form[name='frm']").find("input[name='id']").val();		
	var token = $("form[name='frm']").find("input[name='_token']").val();
	var dataItem = new FormData();
	dataItem.append('id',id);
	dataItem.append('profile_graduation_id',profile_graduation_id);           		
	dataItem.append('_token',token);
	$.ajax({
		url: '<?php echo route("frontend.index.deleteGraduation"); ?>',
		type: 'POST',
		data: dataItem,
		async: false,
		success: function (data) {
			if(data.checked==1){      	
				var data_profile_graduation=data.data_profile_graduation;	
				loadDataProfileGraduation(data_profile_graduation);				
			} 
			showMsg('note_graduation',data);         			
		},
		error : function (data){

		},
		beforeSend  : function(jqXHR,setting){

		},
		cache: false,
		contentType: false,
		processData: false
	});
}
function noSaveGraduation(){
	$('.graduation_edit').show();
	$('.graduation_save').hide();		
}
function addGraduation(){
	$('.graduation_save').show();
	$("form[name='frm']").find("select[name='literacy_id']").val(0);
	$("form[name='frm']").find("input[name='training_unit']").val('');
	$("form[name='frm']").find("select[name='graduation_year_from']").val(0);
	$("form[name='frm']").find("select[name='graduation_year_to']").val(0);
	$("form[name='frm']").find("input[name='department']").val('');
	$("form[name='frm']").find("select[name='graduation_id']").val(0);
}
function loadDataProfileLanguage(data_profile_language){
	$('.language_txt').empty();
	$.each(data_profile_language,function(index,value){
		/* begin language */
		var language_row_mia=document.createElement('div');					
		var language_col_lg_4=document.createElement('div');
		var language_col_lg_8=document.createElement('div');
		var language_xika=document.createElement('div');
		var language_xika2=document.createElement('div');
		$(language_row_mia).addClass('row mia');
		$(language_col_lg_4).addClass('col-lg-4');
		$(language_col_lg_8).addClass('col-lg-8');
		$(language_xika).addClass('xika');
		$(language_xika2).addClass('xika2');
		$('.language_txt').append(language_row_mia);
		$(language_row_mia).append(language_col_lg_4);
		$(language_row_mia).append(language_col_lg_8);
		$(language_col_lg_4).append(language_xika);
		$(language_col_lg_8).append(language_xika2);
		$(language_xika).text('Ngoại ngữ');
		$(language_xika2).text(value.language_name);						
		/* end language */
		/* begin language_level */
		var language_level_row_mia=document.createElement('div');					
		var language_level_col_lg_4=document.createElement('div');
		var language_level_col_lg_8=document.createElement('div');
		var language_level_xika=document.createElement('div');
		var language_level_xika2=document.createElement('div');
		$(language_level_row_mia).addClass('row mia');
		$(language_level_col_lg_4).addClass('col-lg-4');
		$(language_level_col_lg_8).addClass('col-lg-8');
		$(language_level_xika).addClass('xika');
		$(language_level_xika2).addClass('xika2');
		$('.language_txt').append(language_level_row_mia);
		$(language_level_row_mia).append(language_level_col_lg_4);
		$(language_level_row_mia).append(language_level_col_lg_8);
		$(language_level_col_lg_4).append(language_level_xika);
		$(language_level_col_lg_8).append(language_level_xika2);
		$(language_level_xika).text('Trình độ');
		$(language_level_xika2).text(value.language_level_name);						
		/* end language_level */	
		/* begin listening */
		var listening_row_mia=document.createElement('div');					
		var listening_col_lg_4=document.createElement('div');
		var listening_col_lg_8=document.createElement('div');
		var listening_xika=document.createElement('div');
		var listening_xika2=document.createElement('div');
		$(listening_row_mia).addClass('row mia');
		$(listening_col_lg_4).addClass('col-lg-4');
		$(listening_col_lg_8).addClass('col-lg-8');
		$(listening_xika).addClass('xika');
		$(listening_xika2).addClass('xika2');
		$('.language_txt').append(listening_row_mia);
		$(listening_row_mia).append(listening_col_lg_4);
		$(listening_row_mia).append(listening_col_lg_8);
		$(listening_col_lg_4).append(listening_xika);
		$(listening_col_lg_8).append(listening_xika2);
		$(listening_xika).text('Nghe');
		$(listening_xika2).text(value.listening);						
		/* end listening */	
		/* begin speaking */
		var speaking_row_mia=document.createElement('div');					
		var speaking_col_lg_4=document.createElement('div');
		var speaking_col_lg_8=document.createElement('div');
		var speaking_xika=document.createElement('div');
		var speaking_xika2=document.createElement('div');
		$(speaking_row_mia).addClass('row mia');
		$(speaking_col_lg_4).addClass('col-lg-4');
		$(speaking_col_lg_8).addClass('col-lg-8');
		$(speaking_xika).addClass('xika');
		$(speaking_xika2).addClass('xika2');
		$('.language_txt').append(speaking_row_mia);
		$(speaking_row_mia).append(speaking_col_lg_4);
		$(speaking_row_mia).append(speaking_col_lg_8);
		$(speaking_col_lg_4).append(speaking_xika);
		$(speaking_col_lg_8).append(speaking_xika2);
		$(speaking_xika).text('Nói');
		$(speaking_xika2).text(value.speaking);						
		/* end speaking */
		/* begin reading */
		var reading_row_mia=document.createElement('div');					
		var reading_col_lg_4=document.createElement('div');
		var reading_col_lg_8=document.createElement('div');
		var reading_xika=document.createElement('div');
		var reading_xika2=document.createElement('div');
		$(reading_row_mia).addClass('row mia');
		$(reading_col_lg_4).addClass('col-lg-4');
		$(reading_col_lg_8).addClass('col-lg-8');
		$(reading_xika).addClass('xika');
		$(reading_xika2).addClass('xika2');
		$('.language_txt').append(reading_row_mia);
		$(reading_row_mia).append(reading_col_lg_4);
		$(reading_row_mia).append(reading_col_lg_8);
		$(reading_col_lg_4).append(reading_xika);
		$(reading_col_lg_8).append(reading_xika2);
		$(reading_xika).text('Đọc');
		$(reading_xika2).text(value.reading);						
		/* end reading */
		/* begin writing */
		var writing_row_mia=document.createElement('div');					
		var writing_col_lg_4=document.createElement('div');
		var writing_col_lg_8=document.createElement('div');
		var writing_xika=document.createElement('div');
		var writing_xika2=document.createElement('div');
		$(writing_row_mia).addClass('row mia');
		$(writing_col_lg_4).addClass('col-lg-4');
		$(writing_col_lg_8).addClass('col-lg-8');
		$(writing_xika).addClass('xika');
		$(writing_xika2).addClass('xika2');
		$('.language_txt').append(writing_row_mia);
		$(writing_row_mia).append(writing_col_lg_4);
		$(writing_row_mia).append(writing_col_lg_8);
		$(writing_col_lg_4).append(writing_xika);
		$(writing_col_lg_8).append(writing_xika2);
		$(writing_xika).text('Viết');
		$(writing_xika2).text(value.writing);						
		/* end writing */
		/* begin delete */
		var delete_row_mia=document.createElement('div');					
		var delete_col_lg_4=document.createElement('div');
		var delete_col_lg_8=document.createElement('div');							
		$(delete_row_mia).addClass('row mia');
		$(delete_col_lg_4).addClass('col-lg-4');
		$(delete_col_lg_8).addClass('col-lg-8');								
		$('.language_txt').append(delete_row_mia);
		$(delete_row_mia).append(delete_col_lg_4);
		$(delete_row_mia).append(delete_col_lg_8);	
		var delete_html='<div class="vihamus-3"><a href="javascript:void(0);" onclick="deleteProfileLanguage('+parseInt(value.id)+');"><div class="narit"><div><i class="far fa-times-circle"></i></div><div class="margin-left-5">Xóa</div></div></a></div>';		
		$(delete_col_lg_8).append(delete_html);									
		/* end delete */
		/* begin hr */
		var hr=document.createElement('hr');
		$('.language_txt').append(hr);				
		/* end hr */
	});				
}
function saveLanguage(){
	var id = $("form[name='frm']").find("input[name='id']").val();
	var language_id = $("form[name='frm']").find("select[name='language_id']").val();		
	var language_level_id = $("form[name='frm']").find("select[name='language_level_id']").val();
	var listening = $("form[name='frm']").find("input[name='listening']:checked").val();		
	var speaking = $("form[name='frm']").find("input[name='speaking']:checked").val();		
	var reading = $("form[name='frm']").find("input[name='reading']:checked").val();		
	var writing = $("form[name='frm']").find("input[name='writing']:checked").val();			
	var token = $("form[name='frm']").find("input[name='_token']").val();
	var dataItem = new FormData();
	dataItem.append('id',id);
	dataItem.append('language_id',language_id);	
	dataItem.append('language_level_id',language_level_id);	
	dataItem.append('listening',listening);	
	dataItem.append('speaking',speaking);	
	dataItem.append('reading',reading);	
	dataItem.append('writing',writing);	
	dataItem.append('_token',token);
	$.ajax({
		url: '<?php echo route("frontend.index.saveLanguage"); ?>',
		type: 'POST',
		data: dataItem,
		async: false,
		success: function (data) {
			if(data.checked==1){
				var data_profile_language=data.data_profile_language;					
				loadDataProfileLanguage(data_profile_language);
				$('.language_edit').show();
				$('.language_save').hide();			
			}			
			showMsg('note_language',data); 
		},
		error : function (data){

		},
		beforeSend  : function(jqXHR,setting){

		},
		cache: false,
		contentType: false,
		processData: false
	});
}
function deleteProfileLanguage(profile_language_id){
	var xac_nhan = 0;
	var msg="Bạn có muốn xóa ?";
	if(window.confirm(msg)){ 
		xac_nhan = 1;
	}
	if(xac_nhan  == 0){
		return 0;
	}
	var id = $("form[name='frm']").find("input[name='id']").val();		
	var token = $("form[name='frm']").find("input[name='_token']").val();
	var dataItem = new FormData();
	dataItem.append('id',id);
	dataItem.append('profile_language_id',profile_language_id);           		
	dataItem.append('_token',token);
	$.ajax({
		url: '<?php echo route("frontend.index.deleteLanguage"); ?>',
		type: 'POST',
		data: dataItem,
		async: false,
		success: function (data) {
			if(data.checked==1){      	
				var data_profile_language=data.data_profile_language;	
				loadDataProfileLanguage(data_profile_language);				
			} 
			showMsg('note_language',data);         			
		},
		error : function (data){

		},
		beforeSend  : function(jqXHR,setting){

		},
		cache: false,
		contentType: false,
		processData: false
	});
}
function noSaveLanguage(){
	$('.language_edit').show();
	$('.language_save').hide();		
}
function addLanguage(){
	$('.language_save').show();
	$("form[name='frm']").find("select[name='language_id']").val(0);	
	$("form[name='frm']").find("select[name='language_level_id']").val(0);
}
function saveOffice(){
	var id = $("form[name='frm']").find("input[name='id']").val();	
	var ms_word = $("form[name='frm']").find("input[name='ms_word']:checked").val();		
	var ms_excel = $("form[name='frm']").find("input[name='ms_excel']:checked").val();		
	var ms_power_point = $("form[name='frm']").find("input[name='ms_power_point']:checked").val();		
	var ms_outlook = $("form[name='frm']").find("input[name='ms_outlook']:checked").val();			
	var other_software = $("form[name='frm']").find("input[name='other_software']").val();	
	var medal = $("form[name='frm']").find("textarea[name='medal']").summernote('code');	
	var token = $("form[name='frm']").find("input[name='_token']").val();
	var dataItem = new FormData();
	dataItem.append('id',id);
	
	dataItem.append('ms_word',ms_word);	
	dataItem.append('ms_excel',ms_excel);	
	dataItem.append('ms_power_point',ms_power_point);	
	dataItem.append('ms_outlook',ms_outlook);	
	dataItem.append('other_software',other_software);	
	dataItem.append('medal',medal);	
	dataItem.append('_token',token);
	$.ajax({
		url: '<?php echo route("frontend.index.saveOffice"); ?>',
		type: 'POST',
		data: dataItem,
		async: false,
		success: function (data) {
			if(data.checked==1){	
				$('.office_txt').empty();	
				/* begin ms_word */
				var ms_word_row_mia=document.createElement('div');					
				var ms_word_col_lg_4=document.createElement('div');
				var ms_word_col_lg_8=document.createElement('div');
				var ms_word_xika=document.createElement('div');
				var ms_word_xika2=document.createElement('div');
				$(ms_word_row_mia).addClass('row mia');
				$(ms_word_col_lg_4).addClass('col-lg-4');
				$(ms_word_col_lg_8).addClass('col-lg-8');
				$(ms_word_xika).addClass('xika');
				$(ms_word_xika2).addClass('xika2');
				$('.office_txt').append(ms_word_row_mia);
				$(ms_word_row_mia).append(ms_word_col_lg_4);
				$(ms_word_row_mia).append(ms_word_col_lg_8);
				$(ms_word_col_lg_4).append(ms_word_xika);
				$(ms_word_col_lg_8).append(ms_word_xika2);
				$(ms_word_xika).text('MS Word');
				$(ms_word_xika2).text(data.ms_word_level);						
				/* end ms_word */
				/* begin ms_excel */
				var ms_excel_row_mia=document.createElement('div');					
				var ms_excel_col_lg_4=document.createElement('div');
				var ms_excel_col_lg_8=document.createElement('div');
				var ms_excel_xika=document.createElement('div');
				var ms_excel_xika2=document.createElement('div');
				$(ms_excel_row_mia).addClass('row mia');
				$(ms_excel_col_lg_4).addClass('col-lg-4');
				$(ms_excel_col_lg_8).addClass('col-lg-8');
				$(ms_excel_xika).addClass('xika');
				$(ms_excel_xika2).addClass('xika2');
				$('.office_txt').append(ms_excel_row_mia);
				$(ms_excel_row_mia).append(ms_excel_col_lg_4);
				$(ms_excel_row_mia).append(ms_excel_col_lg_8);
				$(ms_excel_col_lg_4).append(ms_excel_xika);
				$(ms_excel_col_lg_8).append(ms_excel_xika2);
				$(ms_excel_xika).text('MS Excel');
				$(ms_excel_xika2).text(data.ms_excel_level);						
				/* end ms_excel */
				/* begin ms_power_point */
				var ms_power_point_row_mia=document.createElement('div');					
				var ms_power_point_col_lg_4=document.createElement('div');
				var ms_power_point_col_lg_8=document.createElement('div');
				var ms_power_point_xika=document.createElement('div');
				var ms_power_point_xika2=document.createElement('div');
				$(ms_power_point_row_mia).addClass('row mia');
				$(ms_power_point_col_lg_4).addClass('col-lg-4');
				$(ms_power_point_col_lg_8).addClass('col-lg-8');
				$(ms_power_point_xika).addClass('xika');
				$(ms_power_point_xika2).addClass('xika2');
				$('.office_txt').append(ms_power_point_row_mia);
				$(ms_power_point_row_mia).append(ms_power_point_col_lg_4);
				$(ms_power_point_row_mia).append(ms_power_point_col_lg_8);
				$(ms_power_point_col_lg_4).append(ms_power_point_xika);
				$(ms_power_point_col_lg_8).append(ms_power_point_xika2);
				$(ms_power_point_xika).text('MS Power Point');
				$(ms_power_point_xika2).text(data.ms_power_point_level);						
				/* end ms_power_point */
				/* begin ms_outlook */
				var ms_outlook_row_mia=document.createElement('div');					
				var ms_outlook_col_lg_4=document.createElement('div');
				var ms_outlook_col_lg_8=document.createElement('div');
				var ms_outlook_xika=document.createElement('div');
				var ms_outlook_xika2=document.createElement('div');
				$(ms_outlook_row_mia).addClass('row mia');
				$(ms_outlook_col_lg_4).addClass('col-lg-4');
				$(ms_outlook_col_lg_8).addClass('col-lg-8');
				$(ms_outlook_xika).addClass('xika');
				$(ms_outlook_xika2).addClass('xika2');
				$('.office_txt').append(ms_outlook_row_mia);
				$(ms_outlook_row_mia).append(ms_outlook_col_lg_4);
				$(ms_outlook_row_mia).append(ms_outlook_col_lg_8);
				$(ms_outlook_col_lg_4).append(ms_outlook_xika);
				$(ms_outlook_col_lg_8).append(ms_outlook_xika2);
				$(ms_outlook_xika).text('MS Outlook');
				$(ms_outlook_xika2).text(data.ms_outlook_level);						
				/* end ms_outlook */
				/* begin other_software */
				var other_software_row_mia=document.createElement('div');					
				var other_software_col_lg_4=document.createElement('div');
				var other_software_col_lg_8=document.createElement('div');
				var other_software_xika=document.createElement('div');
				var other_software_xika2=document.createElement('div');
				$(other_software_row_mia).addClass('row mia');
				$(other_software_col_lg_4).addClass('col-lg-4');
				$(other_software_col_lg_8).addClass('col-lg-8');
				$(other_software_xika).addClass('xika');
				$(other_software_xika2).addClass('xika2');
				$('.office_txt').append(other_software_row_mia);
				$(other_software_row_mia).append(other_software_col_lg_4);
				$(other_software_row_mia).append(other_software_col_lg_8);
				$(other_software_col_lg_4).append(other_software_xika);
				$(other_software_col_lg_8).append(other_software_xika2);
				$(other_software_xika).text('Phần mềm khác');
				$(other_software_xika2).text(data.other_software);						
				/* end other_software */
				/* begin medal */
				var medal_row_mia=document.createElement('div');					
				var medal_col_lg_4=document.createElement('div');
				var medal_col_lg_8=document.createElement('div');
				var medal_xika=document.createElement('div');
				var medal_xika2=document.createElement('div');
				$(medal_row_mia).addClass('row mia');
				$(medal_col_lg_4).addClass('col-lg-4');
				$(medal_col_lg_8).addClass('col-lg-8');
				$(medal_xika).addClass('xika');
				$(medal_xika2).addClass('xika2');
				$('.office_txt').append(medal_row_mia);
				$(medal_row_mia).append(medal_col_lg_4);
				$(medal_row_mia).append(medal_col_lg_8);
				$(medal_col_lg_4).append(medal_xika);
				$(medal_col_lg_8).append(medal_xika2);
				$(medal_xika).text('Thành tích');
				$(medal_xika2).append(data.medal);						
				/* end medal */
				$('.office_edit').show();
				$('.office_save').hide();			
			}			
			showMsg('note_office',data); 
		},
		error : function (data){

		},
		beforeSend  : function(jqXHR,setting){

		},
		cache: false,
		contentType: false,
		processData: false
	});
}
function showOfficeSave(){
	$('.office_edit').hide();
	$('.office_save').show();
}
function noSaveOffice(){
	$('.office_edit').show();
	$('.office_save').hide();		
}
function saveSkill(){
	var id = $("form[name='frm']").find("input[name='id']").val();			
	var skill_ctrl = $("form[name='frm']").find("input[name='skill_id[]']:checked");
	var source_skill_id = $.map($(skill_ctrl), function(e,i) {
		return +e.value;
	});			
	var hobby = $("form[name='frm']").find("input[name='hobby']").val();	
	var talent = $("form[name='frm']").find("textarea[name='talent']").summernote('code');	
	var token = $("form[name='frm']").find("input[name='_token']").val();
	var dataItem = new FormData();
	dataItem.append('id',id);		
	dataItem.append('source_skill_id',source_skill_id);	
	dataItem.append('hobby',hobby);	
	dataItem.append('talent',talent);	
	dataItem.append('_token',token);
	$.ajax({
		url: '<?php echo route("frontend.index.saveSkill"); ?>',
		type: 'POST',
		data: dataItem,
		async: false,
		success: function (data) {
			if(data.checked==1){	
				$('.skill_txt').empty();	
				/* begin skill */
				var source_profile_skill=data.source_profile_skill;
				var skill_row_mia=document.createElement('div');					
				var skill_col_lg_4=document.createElement('div');
				var skill_col_lg_8=document.createElement('div');
				var skill_xika=document.createElement('div');
				var skill_xika2=document.createElement('div');
				$(skill_row_mia).addClass('row mia');
				$(skill_col_lg_4).addClass('col-lg-4');
				$(skill_col_lg_8).addClass('col-lg-8');
				$(skill_xika).addClass('xika');
				$(skill_xika2).addClass('xika2');
				$('.skill_txt').append(skill_row_mia);
				$(skill_row_mia).append(skill_col_lg_4);
				$(skill_row_mia).append(skill_col_lg_8);
				$(skill_col_lg_4).append(skill_xika);
				$(skill_col_lg_8).append(skill_xika2);
				$(skill_xika).text('Sở trường');
				for(var i=0;i<source_profile_skill.length;i++){
					$(skill_xika2).append('<div>'+source_profile_skill[i]['fullname']+'</div>');						
				}				
				/* end skill */				
				/* begin hobby */
				var hobby_row_mia=document.createElement('div');					
				var hobby_col_lg_4=document.createElement('div');
				var hobby_col_lg_8=document.createElement('div');
				var hobby_xika=document.createElement('div');
				var hobby_xika2=document.createElement('div');
				$(hobby_row_mia).addClass('row mia');
				$(hobby_col_lg_4).addClass('col-lg-4');
				$(hobby_col_lg_8).addClass('col-lg-8');
				$(hobby_xika).addClass('xika');
				$(hobby_xika2).addClass('xika2');
				$('.skill_txt').append(hobby_row_mia);
				$(hobby_row_mia).append(hobby_col_lg_4);
				$(hobby_row_mia).append(hobby_col_lg_8);
				$(hobby_col_lg_4).append(hobby_xika);
				$(hobby_col_lg_8).append(hobby_xika2);
				$(hobby_xika).text('Sở thích');
				$(hobby_xika2).text(data.hobby);						
				/* end hobby */
				/* begin talent */
				var talent_row_mia=document.createElement('div');					
				var talent_col_lg_4=document.createElement('div');
				var talent_col_lg_8=document.createElement('div');
				var talent_xika=document.createElement('div');
				var talent_xika2=document.createElement('div');
				$(talent_row_mia).addClass('row mia');
				$(talent_col_lg_4).addClass('col-lg-4');
				$(talent_col_lg_8).addClass('col-lg-8');
				$(talent_xika).addClass('xika');
				$(talent_xika2).addClass('xika2');
				$('.skill_txt').append(talent_row_mia);
				$(talent_row_mia).append(talent_col_lg_4);
				$(talent_row_mia).append(talent_col_lg_8);
				$(talent_col_lg_4).append(talent_xika);
				$(talent_col_lg_8).append(talent_xika2);
				$(talent_xika).text('Kỹ năng đặc biệt');
				$(talent_xika2).append(data.talent);						
				/* end talent */
				$('.skill_edit').show();
				$('.skill_save').hide();			
			}			
			showMsg('note_skill',data); 
		},
		error : function (data){

		},
		beforeSend  : function(jqXHR,setting){

		},
		cache: false,
		contentType: false,
		processData: false
	});
}
function showSkillSave(){
	$('.skill_edit').hide();
	$('.skill_save').show();
}
function noSaveSkill(){
	$('.skill_edit').show();
	$('.skill_save').hide();		
}
</script>
@endsection()