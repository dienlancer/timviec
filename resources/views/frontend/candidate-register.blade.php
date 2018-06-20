@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<?php 
$seo=getSeo();
$disabled_status='';
$register_status='onclick="document.forms[\'frm\'].submit();"';
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>
	{{ csrf_field() }}
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<form name="frm" method="POST" enctype="multipart/form-data">
					<h1 class="dn-dk-h">Đăng Ký Ứng Viên</h1>
					<?php 
					if(count(@$msg) > 0){
						$type_msg='';					
						if((int)@$checked == 1){
							$disabled_status='disabled';
							$register_status='';
							$type_msg='note-success';
						}else{
							$type_msg='note-danger';
						}
						?>
						<div class="note margin-top-15 <?php echo $type_msg; ?>" >
							<ul>
								<?php 
								foreach (@$msg as $key => $value) {
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
						<div class="col-lg-8"><input type="text" <?php echo $disabled_status; ?> name="email" class="vacca" placeholder="Email" value="<?php echo @$data['email']; ?>"></div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Mật khẩu</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><input type="password" <?php echo $disabled_status; ?> name="password" class="vacca" placeholder="Mật khẩu" value="<?php echo @$data['password']; ?>" ></div>
					</div>
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Nhập lại mật khẩu</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><input type="password" <?php echo $disabled_status; ?> name="password_confirmed" class="vacca" placeholder="Nhập lại mật khẩu" value="<?php echo @$data['password_confirmed']; ?>" ></div>
					</div>
					<hr  />
					<div class="row mia">
						<div class="col-lg-4"><h2 class="login-information">Thông tin cá nhân</h2></div>
						<div class="col-lg-8"></div>
					</div>	
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Họ tên</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><input type="text" <?php echo $disabled_status; ?> name="fullname" class="vacca" placeholder="Họ tên ứng viên" value="<?php echo @$data['fullname']; ?>" ></div>
					</div>				
					<div class="row mia">
						<div class="col-lg-4" ><div class="xika"><div>Điện thoại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
						<div class="col-lg-8"><input type="text" <?php echo $disabled_status; ?> name="phone" class="vacca" placeholder="Điện thoại ứng viên" value="<?php echo @$data['phone']; ?>" ></div>
					</div>				
					<div class="row mia">
						<div class="col-lg-4" ></div>
						<div class="col-lg-8"><div class="btn-dang-ky"><a href="javascript:void(0);" <?php echo $register_status; ?> >Đăng ký</a></div></div>
					</div>
				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>

@endsection()