@extends("frontend.master")
@section("content")
<?php 
//use Illuminate\Support\Facades\DB;
$seo=getSeo();
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
	<div class="row">	
	<?php 
		$query=DB::table('recruitment')
				->join('employer','recruitment.employer_id','=','employer.id');
		$query->where('recruitment.status',1);
		$query->where('recruitment.status_employer',1);
		$source_hot_job=$query->select(
								'recruitment.id',
								'recruitment.fullname',
								'recruitment.alias',
								'employer.fullname as employer_fullname',
								'employer.alias as employer_alias'
								)
							  ->groupBy(
								'recruitment.id',
								'recruitment.fullname',
								'recruitment.alias',
								'employer.fullname',
								'employer.alias'
								)
							  ->orderBy('recruitment.id', 'desc')
							  ->get()
							  ->toArray();		
		if(count($source_hot_job) > 0){
			$data_hot_job=convertToArray($source_hot_job);
			$k=1;
			foreach ($data_hot_job as $key => $value) {
				$hot_job_fullname=truncateString($value['fullname'],40,'...') ;
				?>
				<div class="col-lg-4">
					<div class="margin-top-15">
						<div class="hot-job-name"><a href="javascript:void(0);"><?php echo $hot_job_fullname; ?></a></div>
						<div class="hot-job-employer"><a href="javascript:void(0);"><?php echo $value['employer_fullname']; ?></a></div>
					</div>
				</div>
				<?php
				if($k%3==0 || $k == count($data_hot_job)){
					echo '<div class="clr"></div>';
				}
				$k++;
			}
		}				
	?>	
	</div>
</div>
@endsection()               