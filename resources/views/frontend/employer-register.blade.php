@extends("frontend.master")
@section("content")
@include("frontend.content-top-register")
<form name="frm" action="">
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
					<div class="col-lg-8"><input type="password" name="password" class="vacca" placeholder="Mật khẩu"></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Nhập lại mật khẩu</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="password" name="password_confirmed" class="vacca" placeholder="Nhập lại mật khẩu"></div>
				</div>
				<hr  />
				<div class="row mia">
					<div class="col-lg-4"><h2 class="login-information">Thông tin công ty</h2></div>
					<div class="col-lg-8"></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Tên công ty</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="fullname" class="vacca" placeholder="Tên công ty"></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Địa chỉ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="address" class="vacca" placeholder="Địa chỉ công ty"></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Điện thoại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="phone" class="vacca" placeholder="Điện thoại công ty"></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Tỉnh/thành phố</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8">
						<select name="province_id" class="vacca">
							<option>Vui lòng chọn</option>
							<option>Hồ Chí Minh</option>
							<option>Hà Nội</option>
							<option>An Giang</option>
							<option>Bạc Liêu</option>
						</select>
					</div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Quy mô</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8">
						<select name="scale_id" class="vacca">
							<option>Vui lòng chọn</option>
							<option>Trên 500 người</option>
							<option>200 - 500 người</option>
							<option>100 - 200 người</option>
							<option>50 - 100 người</option>
						</select>
					</div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Sơ lược công ty</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><textarea name="intro" class="vacca" rows="10" ></textarea></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Fax</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="fax" class="vacca" placeholder="Fax công ty"></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Website</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="website" class="vacca" placeholder="Website công ty"></div>
				</div>
				<hr  />
				<div class="row mia">
					<div class="col-lg-4"><h2 class="login-information">Thông tin liên hệ</h2></div>
					<div class="col-lg-8"></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Tên người liên hệ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="contacted_name" class="vacca" placeholder="Tên người liên hệ"></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Email</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="contacted_email" class="vacca" placeholder="Email người liên hệ"></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Điện thoại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="contacted_phone" class="vacca" placeholder="Điện thoại người liên hệ"></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ></div>
					<div class="col-lg-8"><div class="btn-dang-ky"><a href="javascript:void(0);" onclick="document.forms['frm'].submit();">Đăng ký</a></div></div>
				</div>
			</div>
		</div>
	</div>
</form>
@endsection()