@extends("frontend.master")
@section("content")
@include("frontend.content-top-register")
<?php 
$seo=getSeo();
$source_district=App\ProvinceModel::whereRaw('status = ?',[1])->orderBy('fullname','asc')->select('id','fullname')->get()->toArray();
$source_scale=App\ScaleModel::whereRaw('status = ?',[1])->orderBy('sort_order','asc')->select('id','fullname')->get()->toArray();
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
				<h1 class="dn-dk-h">Tài Khoản Nhà Tuyển Dụng</h1>
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
				$ddlProvince=cmsSelectboxCategory("province_id","vacca",$source_district,@$data['province_id'],'');
				$ddlScale=cmsSelectboxCategory("scale_id","vacca",$source_scale,@$data['scale_id'],'');		
				?>					
				<div class="row mia">
					<div class="col-lg-4"><h2 class="login-information">Thông tin đăng nhập</h2></div>
					<div class="col-lg-8"></div>
				</div>			
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Email</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" disabled name="email" class="vacca" placeholder="Email" value="<?php echo @$arrUser['email']; ?>"></div>
				</div>
				
				<hr  />
				<div class="row mia">
					<div class="col-lg-4"><h2 class="login-information">Thông tin công ty</h2></div>
					<div class="col-lg-8"></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Tên công ty</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text"  name="fullname" class="vacca" placeholder="Tên công ty" value="<?php echo @$data['fullname']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Địa chỉ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text"  name="address" class="vacca" placeholder="Địa chỉ công ty" value="<?php echo @$data['address']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Điện thoại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text"  name="phone" class="vacca" placeholder="Điện thoại công ty" value="<?php echo @$data['phone']; ?>" ></div>
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
					<div class="col-lg-8"><textarea name="intro"  class="vacca" rows="10" ><?php echo @$data['intro']; ?></textarea></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Fax</div></div></div>
					<div class="col-lg-8"><input type="text"  name="fax" class="vacca" placeholder="Fax công ty" value="<?php echo @$data['fax']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Website</div></div></div>
					<div class="col-lg-8">
						<div class="ex-website">
							<div class="tattoo"><input type="text"  name="website" class="vacca" placeholder="Nhập tên miền website của công ty" value="<?php echo @$data['website']; ?>" ></div>
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
					<div class="col-lg-8"><input type="text"  name="contacted_name" class="vacca" placeholder="Tên người liên hệ" value="<?php echo @$data['contacted_name']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Email</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text"  name="contacted_email" class="vacca" placeholder="Email người liên hệ" value="<?php echo @$data['contacted_email']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Điện thoại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text"  name="contacted_phone" class="vacca" placeholder="Điện thoại người liên hệ" value="<?php echo @$data['contacted_phone']; ?>" ></div>
				</div>				
				<div class="row mia">
					<div class="col-lg-4" ></div>
					<div class="col-lg-8"><div class="btn-dang-ky"><a href="javascript:void(0);" onclick="document.forms['frm'].submit();" >Cập nhật thông tin</a></div></div>
				</div>	
			</div>
			<div class="col-lg-3">
					@include("frontend.employer-sidebar")				
			</div>
		</div>
	</div>
</form>
@endsection()