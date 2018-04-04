@extends("frontend.master")
@section("content")
@include("frontend.content-top-register")
<?php 
$seo=getSeo();
$arrUser=array();
$ssNameUser='vmuser';
if(Session::has($ssNameUser)){
      $arrUser=Session::get($ssNameUser);
} 
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>
<form name="frm" method="POST" enctype="multipart/form-data">
	{{ csrf_field() }}
	<div class="container">
		<div class="row">			
			<div class="col-lg-9">
				<h1 class="dn-dk-h">Tài Khoản Ứng Viên</h1>
				<?php 
				if(count(@$error) > 0){
					?>
					<div class="alert-system margin-top-10">
						<ul class="alert-error">
							<?php 
							foreach (@$error as $key => $value) {
								?>
								<li><?php echo $value; ?></li>
								<?php
							}
							?>                              
						</ul>
					</div>
					<?php
				}
				if(count(@$success) > 0){					
					?>
					<div class="alert-system margin-top-10">
						<ul class="alert-success">
							<?php 
							foreach (@$success as $key => $value) {
								?>
								<li><?php echo $value; ?></li>
								<?php
							}
							?>                              
						</ul>
					</div>
					<?php
				}						
				?>					
				<div class="row mia">
					<div class="col-lg-4"><h2 class="login-information">Thông tin đăng nhập</h2></div>
					<div class="col-lg-8"></div>
				</div>			
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Email</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" disabled name="email" class="vacca" placeholder="Email" value="<?php echo @$arrUser['email']; ?>"></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ></div>
					<div class="col-lg-8 change-passwrd">
						<a href="<?php echo route('frontend.index.viewCandidateSecurity'); ?>">Đổi mật khẩu</a>
					</div>
				</div>			
				<hr  />
				<div class="row mia">
					<div class="col-lg-4"><h2 class="login-information">Thông tin cá nhân</h2></div>
					<div class="col-lg-8"></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Họ tên</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text"  name="fullname" class="vacca" placeholder="Họ tên ứng viên" value="<?php echo @$data['fullname']; ?>" ></div>
				</div>				
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Điện thoại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text"  name="phone" class="vacca" placeholder="Điện thoại ứng viên" value="<?php echo @$data['phone']; ?>" ></div>
				</div>			
				<div class="row mia">
					<div class="col-lg-4" ></div>
					<div class="col-lg-8"><div class="btn-dang-ky"><a href="javascript:void(0);" onclick="document.forms['frm'].submit();" >Cập nhật thông tin</a></div></div>
				</div>	
			</div>
			<div class="col-lg-3">
					@include("frontend.candidate-sidebar")				
			</div>
		</div>
	</div>
</form>
@endsection()