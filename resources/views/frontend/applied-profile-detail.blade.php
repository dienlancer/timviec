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
			
			?>
		</div>
		<div class="col-lg-3">
			@include("frontend.employer-sidebar")				
		</div>
	</div>
</div>
@endsection()