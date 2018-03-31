@extends("frontend.master")
@section("content")
@include("frontend.content-top-register")
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<h1 class="dn-dk-h">Đăng Ký Nhà Tuyển Dụng</h1>			
			<div class="row mia">
				<div class="col-lg-4"><h2 class="login-information">Thông tin đăng nhập</h2></div>
				<div class="col-lg-8"></div>
			</div>			
			<div class="row mia">
				<div class="col-lg-4" ><div class="xika"><div>Email</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
				<div class="col-lg-8"><input type="text" name="email" class="vacca" placeholder="Email"></div>
			</div>
			<div class="row mia">
				<div class="col-lg-4" ><div class="xika"><div>Mật khẩu</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
				<div class="col-lg-8"><input type="text" name="password" class="vacca" placeholder="Mật khẩu"></div>
			</div>
			<div class="row mia">
				<div class="col-lg-4" ><div class="xika"><div>Nhập lại mật khẩu</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
				<div class="col-lg-8"><input type="text" name="password_confirmed" class="vacca" placeholder="Nhập lại mật khẩu"></div>
			</div>
		</div>
	</div>
</div>
@endsection()