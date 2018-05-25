@extends("frontend.master")
@section("content")
@include("frontend.content-top-register")
<?php 
$seo=getSeo();
$seo_title="";
if(!empty(@$title)){
	$seo_title=@$title;
}else{	
	$seo_title=@$seo["title"];
}
$seo_meta_description="";
if(!empty(@$meta_description)){
	$seo_meta_description=@$meta_description;
}else{
	$seo_meta_description=@$seo["meta_description"];
}
?>
<h1 style="display: none;"><?php echo @$seo_title; ?></h1>
<h2 style="display: none;"><?php echo @$seo_meta_description; ?></h2>
<form name="frm" method="POST" enctype="multipart/form-data" class="margin-top-15">
	<input type="hidden" name="filter_page" value="1">        
	{{ csrf_field() }}	
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				
			</div>
			<div class="col-lg-4">@include("frontend.main-sidebar")</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<?php 
				if(count(@$items) > 0){
					echo @$pagination->showPagination();
				}  
				?>
			</div>
		</div>
	</div>
</form>
@endsection()