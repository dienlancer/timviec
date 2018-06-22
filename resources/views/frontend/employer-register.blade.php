@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<?php 
$seo=getSeo();
$source_province=App\ProvinceModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
$source_scale=App\ScaleModel::orderBy('id','asc')->select('id','fullname')->get()->toArray();
$disabled_status='';
$register_status='onclick="document.forms[\'frm\'].submit();"';
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>


<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<form name="frm" method="POST" enctype="multipart/form-data">
				{{ csrf_field() }}
				<h1 class="dn-dk-h">Đăng Ký Nhà Tuyển Dụng</h1>		
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
				$ddlProvince=cmsSelectboxCategory("province_id","vacca select2-province",$source_province,@$data['province_id'],$disabled_status,'Chọn tỉnh thành');
				$ddlScale=cmsSelectboxCategory("scale_id","vacca",$source_scale,@$data['scale_id'],$disabled_status,'Chọn quy mô công ty');
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
					<div class="col-lg-4"><h2 class="login-information">Thông tin công ty</h2></div>
					<div class="col-lg-8"></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Tên công ty</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" <?php echo $disabled_status; ?> name="fullname" class="vacca" placeholder="Tên công ty" value="<?php echo @$data['fullname']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Địa chỉ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" <?php echo $disabled_status; ?> name="address" class="vacca" placeholder="Địa chỉ công ty" value="<?php echo @$data['address']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Điện thoại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" <?php echo $disabled_status; ?> name="phone" class="vacca" placeholder="Điện thoại công ty" value="<?php echo @$data['phone']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Tỉnh/thành phố</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8">						
						<?php echo $ddlProvince; ?>
					</div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Quy mô</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8">
						<?php echo $ddlScale; ?>
					</div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Sơ lược công ty</div></div></div>
					<div class="col-lg-8"><textarea name="intro" placeholder="Nhập sơ lược công ty..." <?php echo $disabled_status; ?> class="vacca summer-editor" rows="10" ><?php echo @$data['intro']; ?></textarea></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Fax</div></div></div>
					<div class="col-lg-8"><input type="text" <?php echo $disabled_status; ?> name="fax" class="vacca" placeholder="Fax công ty" value="<?php echo @$data['fax']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Website</div></div></div>
					<div class="col-lg-8">
						<div class="ex-website">
							<div class="tattoo"><input type="text" <?php echo $disabled_status; ?> name="website" class="vacca" placeholder="Nhập tên miền website của công ty" value="<?php echo @$data['website']; ?>" ></div>
							<div class="margin-left-15 lili">Ví dụ : www.pnj.com.vn</div>
						</div>						
					</div>
				</div>				
				<hr  />
				<div class="row mia">
					<div class="col-lg-4"><h2 class="login-information">Thông tin liên hệ</h2></div>
					<div class="col-lg-8"></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Tên người liên hệ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" <?php echo $disabled_status; ?> name="contacted_name" class="vacca" placeholder="Tên người liên hệ" value="<?php echo @$data['contacted_name']; ?>" ></div>
				</div>				
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Điện thoại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" <?php echo $disabled_status; ?> name="contacted_phone" class="vacca" placeholder="Điện thoại người liên hệ" value="<?php echo @$data['contacted_phone']; ?>" ></div>
				</div>				
				<div class="row mia">
					<div class="col-lg-4" ></div>
					<div class="col-lg-8"><div class="btn-dang-ky"><a href="javascript:void(0);" <?php echo $register_status; ?> >Đăng ký</a></div></div>
				</div>
			</form>
		</div>
		<div class="col-lg-4">@include("frontend.main-sidebar")</div>
	</div>
</div>
<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		$('.select2-province').select2();
	});
</script>
@endsection()