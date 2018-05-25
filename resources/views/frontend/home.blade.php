@extends("frontend.master")
@section("content")
<?php 
$seo=getSeo();
$setting= getSettingSystem();
$width=$setting['product_width']['field_value'];
$height=$setting['product_height']['field_value'];  
$article_width=$setting['article_width']['field_value'];
$article_height=$setting['article_height']['field_value'];  
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
	$query_new_job=DB::table('recruitment')
	->join('employer','recruitment.employer_id','=','employer.id')
	->join('salary','recruitment.salary_id','=','salary.id');
	$query_new_job->where('recruitment.status',1);
	$query_new_job->where('recruitment.status_employer',1);
	$source_new_job=$query_new_job->select(
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
	if(count($source_new_job) > 0){
		?>
		<div class="row">
			<div class="col-lg-12">
				<div class="relative">
					<div class="nikatasuzuki margin-top-15">
						<div class="tibolee-icon"><i class="far fa-folder-open"></i></div>
						<div class="tibolee">VIỆC LÀM MỚI</div>
					</div>
					<hr class="banban">
					<div class="lonatraction xem-tat-ca"><a href="<?php echo route('frontend.index.getNewRecruitment'); ?>">XEM TẤT CẢ</a></div>
				</div>			
			</div>
		</div>	
		<div class="row">	
			<?php 
			$data_new_job=convertToArray($source_new_job);
			$k=1;
			foreach ($data_new_job as $key => $value) {
				$new_job_fullname=truncateString($value['fullname'],40) ;
				$new_job_employer=truncateString($value['employer_fullname'],40);
				$new_job_duration=datetimeConverterVn($value['duration']);
				$new_job_img='';
				if(!empty($value['logo'])){
					$new_job_img=asset('upload/'.$width.'x'.$height.'-'.$value['logo']);
				}else{
					$new_job_img=asset('upload/no-logo.png');
				}
				?>
				<div class="col-lg-4">
					<div class="hot-job-box">
						<div class="hot-job-img">
							<img src="<?php echo $new_job_img; ?>" width="64">
						</div>
						<div class="hot-job-right">
							<div class="hot-job-name"><a title="<?php echo $value['fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['alias']]); ?>"><?php echo $new_job_fullname; ?></a></div>
							<div class="hot-job-employer"><a title="<?php echo $value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['employer_alias']]); ?>"><?php echo $new_job_employer; ?></a></div>
							<div>
								<div class="simantest-left"><i class="far fa-money-bill-alt"></i>&nbsp;<?php echo $value['salary_name']; ?></div>
								<div class="simantest-right">Ngày hết hạn:&nbsp;<?php echo $new_job_duration; ?></div>
								<div class="clr"></div>
							</div>
						</div>		
						<div class="clr"></div>				
					</div>
				</div>
				<?php
				if($k%3==0 || $k == count($data_new_job)){
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
						<hr class="telarik">
						<div class="lonatraction xem-tat-ca"><a href="javascript:void(0)">XEM TẤT CẢ</a></div>
					</div>	
					<div>
						<?php 
						foreach ($data_high_salary as $key => $value){
							$high_salary_fullname=truncateString($value['fullname'],40) ;
							$high_salary_employer=truncateString($value['employer_fullname'],40);
							$high_salary_duration=datetimeConverterVn($value['duration']);
							$high_salary_img='';
							if(!empty($value['logo'])){
								$high_salary_img=asset('upload/'.$width.'x'.$height.'-'.$value['logo']);
							}else{
								$high_salary_img=asset('upload/no-logo.png');
							}
							$source_province2=DB::table('province')
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
							$data_province2=convertToArray($source_province2);					
							$province_text2='';
							foreach ($data_province2 as $key_province2 => $value_province2) {
								$province_text2.=$value_province2['fullname'].' ,';
							}
							$province_text2=mb_substr($province_text2, 0,mb_strlen($province_text2)-1);
							?>
							<div class="hot-job-box">
								<div class="nysaki">
									<div class="hot-job-img">
										<img src="<?php echo $high_salary_img; ?>" width="64">
									</div>
									<div class="hot-job-right">
										<div class="hot-job-name"><a title="<?php echo $value['fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['alias']]); ?>"><?php echo $high_salary_fullname; ?></a></div>
										<div class="hot-job-employer margin-top-10"><a title="<?php echo $value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['employer_alias']]); ?>"><?php echo $high_salary_employer; ?></a></div>										
									</div>		
									<div class="clr"></div>		
								</div>
								<div class="batay">
									<div><i class="far fa-money-bill-alt"></i>&nbsp;<?php echo $value['salary_name']; ?></div>
									<div class="margin-top-10">
										<i class="far fa-clock"></i>&nbsp;<?php echo $high_salary_duration; ?>&nbsp;
										<i class="fas fa-map-marker-alt"></i>&nbsp;<?php echo $province_text2; ?>
									</div>
								</div>
								<div class="clr"></div>
							</div>
							<?php
						}
						?>
					</div>	
					<?php 
				}
				$source_job_r=DB::table('job')
				->join('recruitment_job','job.id','=','recruitment_job.job_id')
				->join('recruitment','recruitment.id','=','recruitment_job.recruitment_id')
				->where('recruitment.status',1)
				->where('recruitment.status_employer',1)
				->select('job.id','job.fullname','job.alias',DB::raw('count(recruitment.id) as recruitment_quantity'))
				->groupBy('job.id','job.fullname','job.alias')
				->orderBy('job.id','asc')					
				->get()
				->toArray();
				if(count($source_job_r) > 0){
					?>
					<div class="relative">
						<div class="nikatasuzuki margin-top-15">
							<div class="tibolee-icon"><i class="far fa-folder-open"></i></div>
							<div class="tibolee">VIỆC LÀM THEO NGÀNH NGHỀ</div>
						</div>
						<hr class="royal-bira">
						<div class="lonatraction xem-tat-ca"><a href="javascript:void(0);">XEM TẤT CẢ</a></div>
					</div>	
					<div>
						<?php 					
						$data_job_r=convertToArray($source_job_r);
						$k=1;
						foreach ($data_job_r as $key => $value) {
							?>
							<div class="col-lg-6">
								<div class="margin-top-10 madrid"><a href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><?php echo @$value['fullname']; ?></a>&nbsp;(<?php echo @$value['recruitment_quantity']; ?>)</div>
							</div>
							<?php
							if($k%2==0 || $k == count($data_job_r)){
								echo '<div class="clr"></div>';
							}
							$k++;
						}
						?> 
					</div>				
					<?php
				}
				$query_hot_job=DB::table('recruitment')
				->join('employer','recruitment.employer_id','=','employer.id')
				->join('salary','recruitment.salary_id','=','salary.id')
				->join('scale','employer.scale_id','=','scale.id');
				$query_hot_job->where('recruitment.status',1);
				$query_hot_job->where('recruitment.status_employer',1);
				$source_hot_job=$query_hot_job->select(
					'recruitment.id',
					'recruitment.fullname',
					'recruitment.alias',
					'recruitment.duration',
					'salary.fullname as salary_name',
					'employer.fullname as employer_fullname',
					'employer.address',
					'scale.fullname as scale_name',
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
					'employer.address',
					'scale.fullname',
					'employer.alias',
					'employer.logo'
				)
				->orderBy('recruitment.id', 'desc')
				->take(12)
				->get()
				->toArray();	
				if(count($source_hot_job) > 0){
					$data_hot_job=convertToArray($source_hot_job);				
					?>
					<div class="relative">
						<div class="nikatasuzuki margin-top-15">
							<div class="tibolee-icon"><i class="far fa-folder-open"></i></div>
							<div class="tibolee">VIỆC LÀM HOT</div>
						</div>
						<hr class="flera">
						<div class="lonatraction xem-tat-ca"><a href="javascript:void(0)">XEM TẤT CẢ</a></div>
					</div>	
					<div>
						<?php 
						foreach ($data_hot_job as $key => $value) {
							$hot_job_fullname=truncateString($value['fullname'],100) ;
							$hot_job_employer=$value['employer_fullname'];
							$hot_job_duration=datetimeConverterVn($value['duration']);
							$hot_job_img='';
							if(!empty($value['logo'])){
								$hot_job_img=asset('upload/'.$width.'x'.$height.'-'.$value['logo']);
							}else{
								$hot_job_img=asset('upload/no-logo.png');
							}
							$hot_job_source_province=DB::table('province')
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
							$hot_job_data_province=convertToArray($hot_job_source_province);					
							$hot_job_province_text='';
							foreach ($hot_job_data_province as $hot_job_key_province => $hot_job_value_province) {
								$hot_job_province_text.='<a class="fenando" href="'.route('frontend.index.index',[@$hot_job_value_province['alias']]).'">'.$hot_job_value_province['fullname'].'</a>' .' ,';
							}
							$hot_job_province_text=mb_substr($hot_job_province_text, 0,mb_strlen($hot_job_province_text)-1);
							?>
							<div class="labasa">
								<div>
									<div class="nysaki"><img src="<?php echo $hot_job_img; ?>" width="100"></div>
									<div class="nibi">
										<div class="faraykta"><b><a title="<?php echo $value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['employer_alias']]); ?>"><?php echo @$hot_job_employer; ?></a></b></div>
										<div class="margin-top-10"><span class="oppacafe">Địa chỉ&nbsp;:</span>&nbsp;<span><?php echo @$value['address']; ?></span></div>
										<div class="margin-top-10"><span class="oppacafe">Quy mô công ty&nbsp;:</span>&nbsp;<span><b><?php echo @$value['scale_name']; ?></b></span></div>
									</div>
									<div class="clr"></div>
								</div>
								<hr>
								<div class="lamarun"><a title="<?php echo $value['fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['alias']]); ?>"><?php echo $hot_job_fullname; ?></a></div>	
								<div class="margin-top-10">
									<div class="col-lg-4 no-padding-left"><span class="sementec"><i class="far fa-money-bill-alt"></i>&nbsp;Mức lương :</span>&nbsp;<?php echo @$value['salary_name']; ?> </div>
									<div class="col-lg-4"><span class="sementec"><i class="fas fa-map-marker-alt"></i>&nbsp;Địa điểm :</span>&nbsp;<?php echo $hot_job_province_text; ?></div>
									<div class="col-lg-4"><span class="sementec"><i class="far fa-clock"></i>&nbsp;Hạn nộp :</span>&nbsp;<?php echo $hot_job_duration; ?></div>
									<div class="clr"></div>
								</div>					
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
				@include("frontend.main-sidebar")				
			</div>
		</div>
		<?php
	}
	$data_featured_article=App\ArticleModel::whereRaw('status = 1')->select('id','fullname','alias','image','intro')->orderBy('id','desc')->take(8)->get()->toArray();	
	if(count(@$data_featured_article) > 0){
		?>
		<div class="relative">
			<div class="nikatasuzuki margin-top-15">
				<div class="tibolee-icon"><i class="far fa-folder-open"></i></div>
				<div class="tibolee">CẨM NANG NGHỀ NGHIỆP</div>
			</div>
			<hr class="subachuem">
			<div class="lonatraction xem-tat-ca"><a href="javascript:void(0)">XEM TẤT CẢ</a></div>
		</div>	
		<div>
			<?php 
			$k=1;
			foreach ($data_featured_article as $key => $value) {
				$featured_article_fullname=truncateString($value['fullname'],900) ;
				$featured_article_intro=truncateString($value['intro'],200) ;
				$featured_article_img='';
				if(!empty($value['image'])){
					$featured_article_img=asset('upload/'.$article_width.'x'.$article_height.'-'.$value['image']);
				}else{
					$featured_article_img=asset('upload/no-logo.png');
				}
				?>
				<div class="col-lg-6 no-padding-left">
					<div class="margin-top-15">
						<div class="col-lg-4">
							<div class="box-featured-article">
								<a href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><img src="<?php echo $featured_article_img; ?>"></a>
							</div>
						</div>
						<div class="col-lg-8">
							<div class="box-featured-article-title"><a href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><?php echo $featured_article_fullname; ?></a></div>
							<div class="vidola margin-top-5"><?php echo $featured_article_intro; ?></div>
							<div class="box-featured-article-readmore">
								<a href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>">
									<div class="lialo">
										<div><i class="fas fa-arrow-circle-right"></i></div>
										<div class="margin-left-5">Xem thêm</div>
									</div>									
								</a>
							</div>
						</div>
						<div class="clr"></div>					
					</div>
				</div>
				<?php
				if($k%2 == 0 || $k == count($data_featured_article)){
					echo '<div class="clr"></div>';
				}
				$k++;
			}
			?>
		</div>
		<?php					
	}
	?>		
</div>
@endsection()               