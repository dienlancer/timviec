@extends("frontend.master")
@section("content")
@include("frontend.content-top-register")
<?php 
$seo=getSeo();
$source_district=App\ProvinceModel::whereRaw('status = ?',[1])->orderBy('fullname','asc')->select('id','fullname')->get()->toArray();
$source_scale=App\ScaleModel::whereRaw('status = ?',[1])->orderBy('sort_order','asc')->select('id','fullname')->get()->toArray();
$ddlProvince=cmsSelectboxCategory("province_id","vacca",$source_district,@$data['province_id'],"");
$ddlScale=cmsSelectboxCategory("scale_id","vacca",$source_scale,@$data['scale_id'],"");
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
					<div class="alert-system padding-top-5">
						<?php                                           
						if(count(@$error) > 0){
							?>
							<ul class="alert-error">
								<?php 
								foreach (@$error as $key => $value) {
									?>
									<li><?php echo $value; ?></li>
									<?php
								}
								?>                              
							</ul>
							<?php
						}						
						?>  
						<div class="clr"></div>                                            
					</div>              
					<?php
				}            
				?>
				<h1 class="dn-dk-h">Đăng Ký Nhà Tuyển Dụng</h1>			
				<div class="row mia">
					<div class="col-lg-4"><h2 class="login-information">Thông tin đăng nhập</h2></div>
					<div class="col-lg-8"></div>
				</div>			
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Email</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="email" class="vacca" placeholder="Email" value="<?php echo @$data['email']; ?>"></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Mật khẩu</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="password" name="password" class="vacca" placeholder="Mật khẩu" value="<?php echo @$data['password']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Nhập lại mật khẩu</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="password" name="password_confirmed" class="vacca" placeholder="Nhập lại mật khẩu" value="<?php echo @$data['password_confirmed']; ?>" ></div>
				</div>
				<hr  />
				<div class="row mia">
					<div class="col-lg-4"><h2 class="login-information">Thông tin công ty</h2></div>
					<div class="col-lg-8"></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Tên công ty</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="fullname" class="vacca" placeholder="Tên công ty" value="<?php echo @$data['fullname']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Địa chỉ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="address" class="vacca" placeholder="Địa chỉ công ty" value="<?php echo @$data['address']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Điện thoại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="phone" class="vacca" placeholder="Điện thoại công ty" value="<?php echo @$data['phone']; ?>" ></div>
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
					<div class="col-lg-4" ><div class="xika"><div>Sơ lược công ty</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><textarea name="intro" class="vacca" rows="10" ><?php echo @$data['intro']; ?></textarea></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Fax</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="fax" class="vacca" placeholder="Fax công ty" value="<?php echo @$data['fax']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Website</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="website" class="vacca" placeholder="Website công ty" value="<?php echo @$data['website']; ?>" ></div>
				</div>
				<hr  />
				<div class="row mia">
					<div class="col-lg-4"><h2 class="login-information">Thông tin liên hệ</h2></div>
					<div class="col-lg-8"></div>
				</div>	
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Tên người liên hệ</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="contacted_name" class="vacca" placeholder="Tên người liên hệ" value="<?php echo @$data['contacted_name']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Email</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="contacted_email" class="vacca" placeholder="Email người liên hệ" value="<?php echo @$data['contacted_email']; ?>" ></div>
				</div>
				<div class="row mia">
					<div class="col-lg-4" ><div class="xika"><div>Điện thoại</div><div class="pappa margin-left-5"><i class="fas fa-asterisk"></i></div></div></div>
					<div class="col-lg-8"><input type="text" name="contacted_phone" class="vacca" placeholder="Điện thoại người liên hệ" value="<?php echo @$data['contacted_phone']; ?>" ></div>
				</div>				
				<div class="row mia">
					<div class="col-lg-4" ></div>
					<div class="col-lg-8"><div class="btn-dang-ky"><a href="javascript:void(0);" onclick="document.forms['frm'].submit();">Đăng ký</a></div></div>
				</div>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" language="javascript">
	function register(ctrl){
		var xForm=$(ctrl).closest('form')[0]; 
		var email =$(xForm).find('input[name="email"]').val();
		var password =$(xForm).find('input[name="password"]').val();
		var password_confirmed =$(xForm).find('input[name="password_confirmed"]').val();
		var fullname =$(xForm).find('input[name="fullname"]').val();
		var address =$(xForm).find('input[name="address"]').val();
		var phone =$(xForm).find('input[name="phone"]').val();
		var province_id =$(xForm).find('select[name="province_id"]').val();
		var scale_id =$(xForm).find('select[name="scale_id"]').val();
		var intro =$(xForm).find('textarea[name="intro"]').val();
		var fax =$(xForm).find('input[name="fax"]').val();
		var website =$(xForm).find('input[name="website"]').val();
		var contacted_name =$(xForm).find('input[name="contacted_name"]').val();
		var contacted_email =$(xForm).find('input[name="contacted_email"]').val();
		var contacted_phone =$(xForm).find('input[name="contacted_phone"]').val();
		var token =$(xForm).find('input[name="_token"]').val();					
		var dataItem={
			'email':email,
			'password':password,
			'password_confirmed':password_confirmed,
			'fullname':fullname,
			'address':address,
			'phone':phone,
			'province_id':province_id,
			'scale_id':scale_id,
			'intro':intro ,
			'fax':fax,
			'website':website,
			'contacted_name':contacted_name,
			'contacted_email':contacted_email,
			'contacted_phone':contacted_phone,       
			'_token': token
		};
		$.ajax({
			url: '<?php echo route("frontend.index.registerCandidateAjax"); ?>',
			type: 'POST',
			data: dataItem,
			async: false,
			success: function (data) {                                      
				if(data.checked==1){
					//alert('Đặt hàng thành công');
					//window.location.assign(data.link_redirect);
					console.log(data);
				}else{   
					var data_error=data.error;                                  
					var ul='<ul class="alert-error">';
					$.each(data_error,function(index,value){
						ul+='<li>'+value+'</li>';
					});                    
					ul+='</ul>';
					$('.alert-system').show();
					$('.alert-system').empty();
					$('.alert-system').append(ul);
					setTimeout(hideMsgPdetail,10000);    
				}
			},
			error : function (data){

			},
			beforeSend  : function(jqXHR,setting){

			},
		});
	}
</script>
@endsection()