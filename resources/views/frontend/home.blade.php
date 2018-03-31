@extends("frontend.master")
@section("content")
<?php 
use Illuminate\Support\Facades\DB;
$seo=getSeo();
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<div class="bg-startup">
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
@include("frontend.content-top-register")
@endsection()               