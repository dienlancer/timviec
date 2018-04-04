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
			<div class="col-lg-9">
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
				<h1 class="dn-dk-h">Tài Khoản Ứng Viên</h1>		
			</div>
			<div class="col-lg-3">
				@include("frontend.candidate-sidebar")									
			</div>
		</div>
	</div>
</form>
@endsection()