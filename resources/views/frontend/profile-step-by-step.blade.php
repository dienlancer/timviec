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
	,'profile.status_search')
->groupBy('profile.fullname'
	,'literacy.fullname'
	,'experience.fullname'
	,'rank_present.fullname'
	,'rank_offered.fullname'
	,'profile.salary'
	,'profile.status_search')	
->get()->toArray();	
$info_general=array();
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
	$info_general=$source_info2[0];
	$info_general['salary']=convertToTextPrice($info_general['salary']) . ' VNĐ/tháng';	
	if((int)@$info_general['status_search'] == 1){
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
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>
<form name="frm" method="POST" enctype="multipart/form-data">
	{{ csrf_field() }}
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
					<div class="col-lg-8"><div class="xika2"><?php echo @$info_general['fullname']; ?></div> </div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Trình độ cao nhất</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$info_general['literacy_fullname']; ?></div></div>
				</div>					
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Số năm kinh nghiệm</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$info_general['experience_fullname']; ?></div></div>
				</div>					
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Cấp bậc hiện tại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$info_general['rank_present_fullname']; ?></div></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Cấp bậc mong muốn</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$info_general['rank_offered_fullname']; ?></div></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Ngành nghề mong muốn</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$job_fullname; ?></div></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Mức lương mong muốn</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$info_general['salary']; ?></div></div>
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
					<div class="col-lg-4"><h2 class="login-information">Mục tiêu nghề nghiệp</h2></div>
					<div class="col-lg-8"></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Mục tiêu</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><textarea name="career_goal"  class="vacca" rows="10" ></textarea></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ></div>
					<div class="col-lg-8">
						<div class="titanius">
							<div class="vihamus">
								<a href="javascript:void(0);"  >
									<div class="narit">
										<div><i class="far fa-save"></i></div>
										<div class="margin-left-5">Lưu</div>
									</div>								
								</a>
							</div>							
							<div class="vihamus-2 margin-left-5">
								<a href="javascript:void(0);"  >
									<div class="narit">
										<div><i class="far fa-times-circle"></i></div>
										<div class="margin-left-5">Không lưu</div>
									</div>								
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ></div>
					<div class="col-lg-8">
						<div class="rianmus">
							<a href="javascript:void(0);" <?php echo $register_status; ?> >
								<div class="narit">
									<div><i class="far fa-save"></i></div>
									<div class="margin-left-5">Lưu hồ sơ</div>
								</div>								
							</a>
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
@endsection()