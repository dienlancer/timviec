@extends("frontend.master")
@section("content")
@include("frontend.candidate-content-top")
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
->join('literacy','profile.literacy_id','=','literacy.id')
->join('experience','profile.experience_id','=','experience.id')
->join('rank as rank_present','profile.rank_present_id','=','rank_present.id')
->join('rank as rank_offered','profile.rank_offered_id','=','rank_offered.id')
;
$query->where('profile.id',@$id);
$source_info=$query->select('profile.fullname'
	,'literacy.fullname as literacy_fullname'
	,'experience.fullname as experience_fullname'
	,'rank_present.fullname as rank_present_fullname'
	,'rank_offered.fullname as rank_offered_fullname'
	,'profile.salary'
	,'profile.career_goal'
	,'profile.status_search')
->groupBy('profile.fullname'
	,'literacy.fullname'
	,'experience.fullname'
	,'rank_present.fullname'
	,'rank_offered.fullname'
	,'profile.salary'
	,'profile.career_goal'
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
<form name="frm" method="POST" enctype="multipart/form-data">
	{{ csrf_field() }}
	<?php echo $inputID; ?>
	<div class="container">
		<div class="row">			
			<div class="col-lg-9">
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
										<div><i class="far fa-times-circle"></i></div>
										<div class="margin-left-5">Chỉnh sửa</div>
									</div>
								</a>
							</div>
						</div>
						<div class="career_goal_save" style="<?php echo $status_career_goal_save; ?>">
							<div><textarea name="career_goal" placeholder="Nhập mục tiêu nghề nghiệp..." class="vacca" rows="10" ><?php echo @$profile_detail['career_goal']; ?></textarea></div>
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
							<textarea name="job_description" placeholder="Nhập mô tả công việc..."  class="vacca" rows="10" ></textarea>
						</div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Thành tích đạt được</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8">						
							<textarea name="achievement" placeholder="Nhập thành tích đạt được..."  class="vacca" rows="10" ></textarea>
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
			</div>
			<div class="col-lg-3">
				@include("frontend.candidate-sidebar")				
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" language="javascript">
	function saveCareerGoal(){
		var id = $("form[name='frm']").find("input[name='id']").val();
		var career_goal = $("form[name='frm']").find("textarea[name='career_goal']").val();
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
				} else{
					showMsg('note_career_goal',data);    
				}       			
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
		var job_description = $("form[name='frm']").find("textarea[name='job_description']").val();
		var achievement = $("form[name='frm']").find("textarea[name='achievement']").val();		
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
					var row_mia=document.createElement('div');					
					var col_lg_4=document.createElement('div');
					var col_lg_8=document.createElement('div');
					$(row_mia).addClass('row mia');
					$(col_lg_4).addClass('col-lg-4');
					$(col_lg_8).addClass('col-lg-8');
					$(row_mia).append(col_lg_4)			;
					$(row_mia).append(col_lg_8);
					$('.experience_job_edit').show();
					$('.experience_job_save').hide();
				} else{
					showMsg('note_career_goal',data);    
				}       			
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
</script>
@endsection()