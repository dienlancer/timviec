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
<form name="frm" method="POST" enctype="multipart/form-data">
	{{ csrf_field() }}
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<h1 class="dn-dk-h">NỘP HỒ SƠ TRỰC TUYẾN</h1>		
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
					<div class="col-lg-4" ></div>
					<div class="col-lg-8"><div class="btn-dang-ky"><a href="javascript:void(0);" <?php echo $register_status; ?> >NỘP HỒ SƠ</a></div></div>
				</div>
			</div>
		</div>
	</div>
</form>
@endsection()