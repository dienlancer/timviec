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
							<div class="col-lg-3"><div class="xika">Họ tên</div> </div>
							<div class="col-lg-9"><div class="xika2"><b><?php echo @$data_candidate['fullname']; ?></b></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika">Giới tính</div></div>
							<div class="col-lg-9"><div class="xika2"><b><?php echo @$sex['fullname']; ?></b></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika">Ngày sinh</div></div>
							<div class="col-lg-9"><div class="xika2"><b><?php echo @$data_candidate['birthday']; ?></b></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika">Địa chỉ</div></div>
							<div class="col-lg-9"><div class="xika2"><b><?php echo @$data_candidate['address']; ?></b></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika">Số điện thoại</div></div>
							<div class="col-lg-9"><div class="xika2"><b><?php echo @$data_candidate['phone']; ?></b></div></div>
						</div>	
						<div class="row margin-top-10">
							<div class="col-lg-3"><div class="xika">Email</div></div>
							<div class="col-lg-9"><div class="xika2"><b><?php echo @$data_candidate['email']; ?></b></div></div>
						</div>	
					</div>
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