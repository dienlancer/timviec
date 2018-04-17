@extends("frontend.master")
@section("content")
@include("frontend.candidate-content-top")
<?php 
$seo=getSeo();
$setting = getSettingSystem();

$arrUser=array();
$ssNameUser='vmuser';
$candidate=array();
if(Session::has($ssNameUser)){
    $arrUser=Session::get($ssNameUser);
    $candidate=App\CandidateModel::find((int)@$arrUser['id'])->toArray();
    $sex=App\SexModel::find((int)@$candidate['sex_id'])->toArray();    
    $candidate['birthday']=datetimeConverterVn($candidate['birthday']);
    $candidate['sex']=$sex['fullname'];
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
	,'profile.salary')
->groupBy('profile.fullname'
	,'literacy.fullname'
	,'experience.fullname'
	,'rank_present.fullname'
	,'rank_offered.fullname'
	,'profile.salary')	
->get()->toArray();	
$info_general=array();
if(count($source_info) > 0){
	$source_info2=convertToArray($source_info);	
	$info_general=$source_info2[0];
	$info_general['salary']=convertToTextPrice($info_general['salary']);	
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
				<h1 class="dn-dk-h">Tạo hồ sơ</h1>
					
				<div class="row">
					<div class="col-lg-3"><?php echo $picture; ?></div>
					<div class="col-lg-9">
						<div class="row margin-top-10">
							<div class="col-lg-3">Họ tên:</div>
							<div class="col-lg-9"><b><?php echo @$candidate['fullname']; ?></b></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3">Giới tính:</div>
							<div class="col-lg-9"><b><?php echo @$candidate['sex']; ?></b></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3">Ngày sinh:</div>
							<div class="col-lg-9"><b><?php echo @$candidate['birthday']; ?></b></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3">Địa chỉ:</div>
							<div class="col-lg-9"><b><?php echo @$candidate['address']; ?></b></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3">Số điện thoại:</div>
							<div class="col-lg-9"><b><?php echo @$candidate['phone']; ?></b></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3">Email:</div>
							<div class="col-lg-9"><b><?php echo @$candidate['email']; ?></b></div>
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
					<div class="col-lg-4" ><div class="xika"><div>Mức lương mong muốn</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$info_general['salary']; ?></div></div>
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