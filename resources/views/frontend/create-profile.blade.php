@extends("frontend.master")
@section("content")
@include("frontend.candidate-content-top")
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
				<h1 class="dn-dk-h">Tạo hồ sơ</h1>
				<?php 
				if(count(@$msg) > 0){
					$type_msg='';					
					if((int)@$flag == 1){						
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
					<div class="col-lg-4" ></div>
					<div class="col-lg-8"><div class="btn-dang-ky"><a href="javascript:void(0);" onclick="document.forms['frm'].submit();" >Cập nhật</a></div></div>
				</div>	
			</div>
			<div class="col-lg-3">
					@include("frontend.candidate-sidebar")				
			</div>
		</div>
	</div>
</form>
@endsection()