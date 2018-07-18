@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<?php 
$seo=getSeo();
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>
<div class="note note-success" >
	<ul>
		<li>Đăng ký tài khoản thành công . Vui lòng kích hoạt tài khoản trong email</li>                        
	</ul>   
</div>
<div class="container">
	<div class="row">
		<div class="col-lg-8"></div>
		<div class="col-lg-4">@include("frontend.main-sidebar")</div>
	</div>
</div>
@endsection()