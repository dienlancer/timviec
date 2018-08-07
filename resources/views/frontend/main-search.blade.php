<div class="job-box">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form name="frm-searching-job" method="POST" enctype="multipart/form-data">
					{{ csrf_field() }}
					<div class="job-box-searching">
						<div>
							<div class="job-box-kk">
								<div class="job-box-m"><i class="far fa-address-book"></i></div>
								<input type="text" name="q" class="job-box-in" >
							</div>							
						</div>
						<div>
							<div class="job-box-kk">
								<div class="job-box-m"><i class="far fa-address-book"></i></div>
								<?php 
								$source_job=App\JobModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
								$ddlJob        =cmsSelectboxCategory("job_id", 'selected2', @$source_job, @$job_id,'','Ngành nghề');
								echo $ddlJob;
								?>	
							</div>							
						</div>		
						<div>
							<div class="job-box-kk">
								<div class="job-box-m"><i class="far fa-address-book"></i></div>
								<?php                             	
								$source_province=App\ProvinceModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
								$ddlProvince=cmsSelectboxCategory("province_id","selected2",@$source_province,@$province_id,'','Tỉnh thành');
								echo $ddlProvince;
								?>	
							</div>							
						</div>
						<div>
							<div class="job-box-searching-btn">
								<a href="javascript:void(0);" onclick="document.forms['frm-searching-job'].submit();">
									<div class="caramba">
										
									</div>
								</a>
							</div>							
						</div>						
					</div>
				</form>				
			</div>
		</div>
	</div>
</div>