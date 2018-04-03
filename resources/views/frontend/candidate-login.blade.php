@extends("frontend.master")
@section("content")
@include("frontend.content-top-register")
<?php 
$seo=getSeo();
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>
<form name="frm" method="POST" enctype="multipart/form-data">
	{{ csrf_field() }}
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
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
				?>
				<h1 class="dn-dk-h">Đăng Nhập Ứng Viên</h1>			
				<div class="row mia">
					<div class="col-lg-4"><h2 class="login-information">Thông tin đăng nhập</h2></div>
					<div class="col-lg-8"></div>
				</div>			
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Email</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text"  name="email" class="vacca" placeholder="Email" value="<?php echo @$data['email']; ?>"></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Mật khẩu</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="password"  name="password" class="vacca" placeholder="Mật khẩu" value="<?php echo @$data['password']; ?>" ></div>
				</div>					
				<div class="row mia">
					<div class="col-lg-4" ></div>
					<div class="col-lg-8">
						<div >
							<a href="javascript:void(0);" class="btn-login" onclick="document.forms['frm'].submit();" >Đăng nhập</a>
							<a href="javascript:void(0);" class="btn-remember-password">Quên mật khẩu</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
@endsection()