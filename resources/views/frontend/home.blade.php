@extends("frontend.master")
@section("content")
<?php 
//use Illuminate\Support\Facades\DB;
$seo=getSeo();
$setting= getSettingSystem();
$width=$setting['product_width']['field_value'];
$height=$setting['product_height']['field_value'];  
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>
<div class="bg-startup">
	<div class="margin-top-15">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="co-hoi">Cơ hội việc làm</div>
					<div class="tim-kiem-cv-mo-uoc">
						Tìm kiếm công việc mơ ước của bạn với <b><font color="#E30000">149</font></b> việc làm mới trong <b><font color="#E30000">52057</font></b>  việc làm đang tuyển dụng! 
					</div>	
				</div>			
			</div>
		</div>	
	</div>	
</div>
@include("frontend.content-top-register")
<div class="container">
	<?php 
	$query_hot_job=DB::table('recruitment')
	->join('employer','recruitment.employer_id','=','employer.id')
	->join('salary','recruitment.salary_id','=','salary.id');
	$query_hot_job->where('recruitment.status',1);
	$query_hot_job->where('recruitment.status_employer',1);
	$source_hot_job=$query_hot_job->select(
		'recruitment.id',
		'recruitment.fullname',
		'recruitment.alias',
		'recruitment.duration',
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
		'salary.fullname',
		'employer.fullname',
		'employer.alias',
		'employer.logo'
	)
	->orderBy('recruitment.id', 'desc')
	->take(63)
	->get()
	->toArray();		
	if(count($source_hot_job) > 0){
		?>
		<div class="row">
			<div class="col-lg-12">
				<div class="relative">
					<div class="nikatasuzuki margin-top-15">
						<div class="tibolee-icon"><i class="far fa-folder-open"></i></div>
						<div class="tibolee">VIỆC LÀM MỚI</div>
					</div>
					<hr class="banban">
					<div class="lonatraction xem-tat-ca"><a href="javascript:void(0)">XEM TẤT CẢ</a></div>
				</div>			
			</div>
		</div>	
		<div class="row">	
			<?php 
			$data_hot_job=convertToArray($source_hot_job);
			$k=1;
			foreach ($data_hot_job as $key => $value) {
				$hot_job_fullname=truncateString($value['fullname'],40) ;
				$hot_job_employer=truncateString($value['employer_fullname'],40);
				$hot_job_duration=datetimeConverterVn($value['duration']);
				$hot_job_img='';
				if(!empty($value['logo'])){
					$hot_job_img=asset('upload/'.$width.'x'.$height.'-'.$value['logo']);
				}else{
					$hot_job_img=asset('upload/no-logo.png');
				}
				?>
				<div class="col-lg-4">
					<div class="hot-job-box">
						<div class="hot-job-img">
							<img src="<?php echo $hot_job_img; ?>" width="64">
						</div>
						<div class="hot-job-right">
							<div class="hot-job-name"><a title="<?php echo $value['fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['alias']]); ?>"><?php echo $hot_job_fullname; ?></a></div>
							<div class="hot-job-employer"><a title="<?php echo $value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['employer_alias']]); ?>"><?php echo $hot_job_employer; ?></a></div>
							<div>
								<div class="simantest-left"><i class="far fa-money-bill-alt"></i>&nbsp;<?php echo $value['salary_name']; ?></div>
								<div class="simantest-right">Ngày hết hạn:&nbsp;<?php echo $hot_job_duration; ?></div>
								<div class="clr"></div>
							</div>
						</div>		
						<div class="clr"></div>				
					</div>
				</div>
				<?php
				if($k%3==0 || $k == count($data_hot_job)){
					echo '<div class="clr"></div>';
				}
				$k++;
			}			
			?>	
		</div>
		<?php
	}
	$query_attractive_job=DB::table('recruitment')
	->join('employer','recruitment.employer_id','=','employer.id')
	->join('salary','recruitment.salary_id','=','salary.id');
	$query_attractive_job->where('recruitment.status',1);
	$query_attractive_job->where('recruitment.status_employer',1);
	$source_attractive_job=$query_attractive_job->select(
		'recruitment.id',
		'recruitment.fullname',
		'recruitment.alias',
		'recruitment.duration',
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
		'salary.fullname',
		'employer.fullname',
		'employer.alias',
		'employer.logo'
	)
	->orderBy('recruitment.id', 'desc')
	->take(10)
	->get()
	->toArray();		
	if(count($source_attractive_job) > 0){
		$data_attractive_job=convertToArray($source_attractive_job);		
		?>
		<div class="row">
			<div class="col-lg-8">
				<div class="relative">
					<div class="nikatasuzuki margin-top-15">
						<div class="tibolee-icon"><i class="far fa-folder-open"></i></div>
						<div class="tibolee">VIỆC LÀM HẤP DẪN</div>
					</div>
					<hr class="royal">
					<div class="lonatraction xem-tat-ca"><a href="javascript:void(0)">XEM TẤT CẢ</a></div>
				</div>		
				<div>
					<table class="cidu margin-top-15">
						<tr>
							<th width="40%">Vị trí tuyển dụng</th>
							<th width="30%">Khu vực</th>
							<th width="20%">Mức lương</th>
							<th width="10%">Hạn nộp HS</th>
						</tr>
						<?php 
						foreach ($data_attractive_job as $key => $value) {
							$hot_attractive_fullname=truncateString($value['fullname'],40) ;
							$hot_attractive_employer=truncateString($value['employer_fullname'],40);
							$hot_attractive_duration=datetimeConverterVn($value['duration']);
							$source_province=DB::table('province')
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
							$data_province=convertToArray($source_province);					
							$province_text='';
							foreach ($data_province as $key_province => $value_province) {
								$province_text.='<div class="padding-top-5 padding-bottom-5 madrid"><a href="'.route('frontend.index.index',[$value_province['alias']]).'">'.$value_province['fullname'].'</a></div>';
							}
							?>
							<tr>
								<td>
									<div class="hot-job-name vivan-hd"><a title="<?php echo $value['fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['alias']]); ?>"><?php echo $hot_attractive_fullname; ?></a></div>
									<div class="hot-job-employer vivan-hd"><a title="<?php echo $value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['employer_alias']]); ?>"><?php echo $hot_attractive_employer; ?></a></div>
								</td>
								<td><?php echo $province_text; ?></td>
								<td><?php echo $value['salary_name']; ?></td>
								<td><?php echo $hot_attractive_duration; ?></td>
							</tr>
							<?php
						}
						?>						
					</table>
				</div>
				<?php 
				$query_high_salary=DB::table('recruitment')
				->join('employer','recruitment.employer_id','=','employer.id')
				->join('salary','recruitment.salary_id','=','salary.id');
				$query_high_salary->where('recruitment.status',1);
				$query_high_salary->where('recruitment.status_employer',1);
				$source_high_salary=$query_high_salary->select(
					'recruitment.id',
					'recruitment.fullname',
					'recruitment.alias',
					'recruitment.duration',
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
					'salary.fullname',
					'employer.fullname',
					'employer.alias',
					'employer.logo'
				)
				->orderBy('recruitment.id', 'desc')
				->take(10)
				->get()
				->toArray();		
				if(count($source_high_salary) > 0){
					$data_high_salary=convertToArray($source_high_salary);
					?>
					<div class="relative">
						<div class="nikatasuzuki margin-top-15">
							<div class="tibolee-icon"><i class="far fa-folder-open"></i></div>
							<div class="tibolee">VIỆC LÀM LƯƠNG CAO</div>
						</div>
						<hr class="royal">
						<div class="lonatraction xem-tat-ca"><a href="javascript:void(0)">XEM TẤT CẢ</a></div>
					</div>	
					<div>
						<?php 
						foreach ($data_high_salary as $key => $value){
							$hight_salary_fullname=truncateString($value['fullname'],40) ;
							$hight_salary_employer=truncateString($value['employer_fullname'],40);
							$hight_salary_duration=datetimeConverterVn($value['duration']);
							$hight_salary_img='';
							if(!empty($value['logo'])){
								$hight_salary_img=asset('upload/'.$width.'x'.$height.'-'.$value['logo']);
							}else{
								$hight_salary_img=asset('upload/no-logo.png');
							}
							?>
							<div class="hot-job-box">
								
							</div>
							<?php
						}
						?>
					</div>	
					<?php 
				}
				?>				
			</div>
			<div class="col-lg-4">
				<div class="nhathongminhquata">
					<h3 class="menu-highlight">TÌM KIẾM VIỆC LÀM</h3>
					<div class="america">
						<?php 
						$source_job=App\JobModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
						$source_province=App\ProvinceModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
						$source_salary=App\SalaryModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
						$source_literacy=App\LiteracyModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();			
						$source_sex=App\SexModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();		
						$source_working_form=App\WorkingFormModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();		
						$source_experience=App\ExperienceModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();		
						$ddlJob        =cmsSelectboxCategory("job_id", 'vacca', @$source_job, 0,'','Chọn ngành nghề');
						$ddlProvince        =cmsSelectboxCategory("province_id", 'vacca', @$source_province, 0,'','Chọn tỉnh thành');
						$ddlSalary        =cmsSelectboxCategory("salary_id", 'vacca', @$source_salary, 0,'','Chọn mức lương');
						$ddlLiteracy        =cmsSelectboxCategory("literacy_id", 'vacca', @$source_literacy, 0,'','Chọn trình độ học vấn');
						$ddlSex        =cmsSelectboxCategory("sex_id", 'vacca', @$source_sex, 0,'','Chọn giới tính');
						$ddlWorkingForm        =cmsSelectboxCategory("working_form_id", 'vacca', @$source_working_form, 0,'','Chọn loại hình công việc');
						$ddlExperience        =cmsSelectboxCategory("experience_id", 'vacca', @$source_experience, 0,'','Chọn kinh nghiệm');
						?>
						<div class="ritacruista"><input type="text" name="q" class="vacca" placeholder="Nhập từ khóa"></div>						
						<div class="ritacruista"><?php echo $ddlJob; ?></div>
						<div class="ritacruista"><?php echo $ddlProvince; ?></div>						
						<div class="ritacruista"><?php echo $ddlSalary; ?></div>
						<div class="ritacruista"><?php echo $ddlLiteracy; ?></div>						
						<div class="ritacruista"><?php echo $ddlSex; ?></div>	
						<div class="ritacruista"><?php echo $ddlWorkingForm; ?></div>				
						<div class="ritacruista"><?php echo $ddlExperience; ?></div>	
						<div class="ritacruista margin-bottom-5">	
							<div class="vihamus-3">
									<a href="javascript:void(0);" >
										<div class="narit">
											<div><i class="fas fa-search"></i></div>
											<div class="margin-left-5">Tìm kiếm</div>
										</div>								
									</a>
							</div>
						</div>					
					</div>
				</div>
			</div>
		</div>
		<?php
	}
	?>		
</div>
@endsection()               