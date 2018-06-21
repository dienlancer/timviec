@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<?php 
$seo=getSeo();
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>
<div class="container">
	<div class="row">			
		<div class="col-lg-9">
			<?php 
			$source_profile=App\ProfileModel::find((int)@$profile_id);
			$data_profile=array();
			$data_candidate=array();
			if(@$source_profile != null){
				$data_profile=@$source_profile->toArray();
				$data_candidate=App\CandidateModel::find((int)@$data_profile['candidate_id'])->toArray();			
				$sex=App\SexModel::find((int)@$data_candidate['sex_id'])->toArray();    
				$marriage=App\MarriageModel::find((int)@$data_candidate['marriage_id'])->toArray();
				$data_candidate['birthday']=datetimeConverterVn($data_candidate['birthday']);    	
				?>
				<h1 class="dn-dk-h">THÔNG TIN ỨNG VIÊN</h1>			
				<div class="row margin-top-15">
					<div class="col-lg-3"><img src="<?php echo asset('upload/'.@$data_candidate['avatar']); ?>"></div>
					<div class="col-lg-9">
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika"><b>Họ tên</b></div> </div>
							<div class="col-lg-9"><div class="xika2"><?php echo @$data_candidate['fullname']; ?></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika"><b>Giới tính</b></div></div>
							<div class="col-lg-9"><div class="xika2"><?php echo @$sex['fullname']; ?></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika"><b>Ngày sinh</b></div></div>
							<div class="col-lg-9"><div class="xika2"><?php echo @$data_candidate['birthday']; ?></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika"><b>Địa chỉ</b></div></div>
							<div class="col-lg-9"><div class="xika2"><?php echo @$data_candidate['address']; ?></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika"><b>Số điện thoại</b></div></div>
							<div class="col-lg-9"><div class="xika2"><?php echo @$data_candidate['phone']; ?></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika"><b>Email</b></div></div>
							<div class="col-lg-9"><div class="xika2"><?php echo @$data_candidate['email']; ?></div></div>
						</div>	
					</div>
				</div>	
				<hr  />		
				<div class="row mia">
					<div class="col-lg-12"><div class="login-information"><font color="#E30000">THÔNG TIN CHUNG</font> </div></div>					
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><b>Tiêu đề hồ sơ</b></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$data_profile['fullname']; ?></div> </div>
				</div>	
				<?php 
                $literacy_name='';
                $source_literacy=App\LiteracyModel::find(@$data_profile['literacy_id']);                
                if($source_literacy!=null){
                    $data_literacy=$source_literacy->toArray();
                    $literacy_name=$data_literacy['fullname'];
                }
                ?>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><b>Trình độ cao nhất</b></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$literacy_name; ?></div> </div>
				</div>	
				<?php 
                $experience_name='';
                $source_experience=App\ExperienceModel::find(@$data_profile['experience_id']);                
                if($source_experience!=null){
                    $data_experience=$source_experience->toArray();
                    $experience_name=$data_experience['fullname'];
                }
                ?>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><b>Số năm kinh nghiệm</b></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$experience_name; ?></div> </div>
				</div>	
				<?php 
                $rank_present='';
                $source_rank_present=App\RankModel::find(@$data_profile['rank_present_id']);
                if($source_rank_present != null){
                    $data_rank_present=$source_rank_present->toArray();
                    $rank_present=$data_rank_present['fullname'];
                }
                ?>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><b>Cấp bậc hiện tại</b></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$rank_present; ?></div> </div>
				</div>	
				<?php 
                $rank_offered='';
                $source_rank_offered=App\RankModel::find(@$data_profile['rank_offered_id']);
                if($source_rank_offered != null){
                    $data_rank_offered=$source_rank_offered->toArray();
                    $rank_offered=$data_rank_offered['fullname'];
                }
                ?>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><b>Cấp bậc mong muốn</b></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$rank_offered; ?></div> </div>
				</div>	
				<?php 
                $source_profile_job=App\ProfileJobModel::whereRaw('profile_id = ?',[(int)@$data_profile['id']])->select('id','profile_id','job_id')->get()->toArray();
                $job_fullname='';
                $job_id=array();
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
                ?>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><b>Ngành nghề mong muốn</b></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$job_fullname; ?></div> </div>
				</div>	
				<?php                 
                $salary=convertToTextPrice((int)@$data_profile['salary']) . ' VNĐ/tháng';
                ?>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><b>Mức lương mong muốn</b></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$salary; ?></div> </div>
				</div>	
				<?php 
                $source_profile_place=App\ProfilePlaceModel::whereRaw('profile_id = ?',[(int)@$data_profile['id']])->select('id','profile_id','province_id')->get()->toArray();
                $province_id=array();
                $province_fullname='';                
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
                ?>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><b>Nơi làm việc mong muốn</b></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$province_fullname; ?></div> </div>
				</div>	
				<?php 
                $marriage_name='';
                $source_marriage=App\MarriageModel::find((int)@$data_candidate['marriage_id']);          
                if($source_marriage != null){
                    $data_marriage=$source_marriage->toArray();
                    $marriage_name=$data_marriage['fullname'];
                }      
                ?>     
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><b>Hôn nhân</b></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$marriage_name; ?></div> </div>
				</div>	
				<?php 
                $status_search='';
                if((int)@$data_profile['status_search'] == 1){
                    $status_search='Cho phép Nhà tuyển dụng tìm kiếm thông tin của bạn và chủ động liên hệ mời phỏng vấn';
                }else{
                    $status_search='Không cho phép nhà tuyển dụng tìm kiếm. Hồ sơ này chỉ dùng để ứng tuyển';
                }   
                ?>   
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><b>Hiện tại</b></div></div>
					<div class="col-lg-8"><div class="xika2"><?php echo @$status_search; ?></div> </div>
				</div>	
				<hr  />		
				<div class="row">
					<div class="col-lg-4"><div class="login-information"><font color="#E30000">MỤC TIÊU NGHỀ NGHIỆP</font> </div></div>				
					<div class="col-lg-8"><?php echo @$data_profile['career_goal']; ?></div>	
				</div>				
				<?php
			}			
			?>
		</div>
		<div class="col-lg-3">
			@include("frontend.employer-sidebar")				
		</div>
	</div>
</div>
@endsection()