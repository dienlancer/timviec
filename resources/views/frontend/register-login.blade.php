@extends("frontend.master")
@section("content")
<?php 
$seo=getSeo();
$employer_link='';
$employer_link='';
$candidate_text='';
$candidate_link='';
$login_register_link='';
$login_register_text='';
switch ($status) {
	case 'register':
		$employer_text='ĐĂNG KÝ NHÀ TUYỂN DỤNG';
		$employer_link=route('frontend.index.employerRegister');
		$candidate_text='ĐĂNG KÝ ỨNG VIÊN';
		$candidate_link=route('frontend.index.candidateRegister');
		$login_register_link=route('frontend.index.registerLogin',['login']);
		$login_register_text='ĐĂNG NHẬP';
		break;
	case 'login':
		$employer_text='ĐĂNG NHẬP NHÀ TUYỂN DỤNG';
		$employer_link=route('frontend.index.employerLogin');
		$candidate_text='ĐĂNG NHẬP ỨNG VIÊN';
		$candidate_link=route('frontend.index.candidateLogin');
		$login_register_link=route('frontend.index.registerLogin',['register']);
		$login_register_text='ĐĂNG KÝ';
		break;	
}
?>
<h1 style="display: none;"><?php echo @$seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo @$seo["meta_description"]; ?></h2>
@include("frontend.banner")
@endsection()               