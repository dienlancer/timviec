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
	$query=DB::table('recruitment')
	->join('employer','recruitment.employer_id','=','employer.id')
	->join('salary','recruitment.salary_id','=','salary.id');
	$query->where('recruitment.status',1);
	$query->where('recruitment.status_employer',1);
	$source_hot_job=$query->select(
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
	?>	
</div>
@endsection()               