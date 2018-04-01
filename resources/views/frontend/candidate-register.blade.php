@extends("frontend.master")
@section("content")
@include("frontend.content-top-register")
<?php 
$seo=getSeo();
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>
<div class="container">
	<div class="row">
		<div class="col-lg-12"><h1 class="dn-dk-h">Đăng ký ứng viên</h1></div>
	</div>
</div>
@endsection()