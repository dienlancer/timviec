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
	<input type="hidden" name="filter_page" value="1">         
	<div class="container">
		<div class="row">			
			<div class="col-lg-9">
				<h1 class="dn-dk-h">Danh sách tin tuyển dụng</h1>
				<table class="table table-bordered margin-top-15">
					<thead>
						<tr>
							<th class="news-title">Tin tuyển dụng</th>							
						</tr>
					</thead>
					<tbody>
						<?php 
						foreach ($data as $key => $value) {
							$id=$value['id'];
							$fullname=$value['fullname'];							
							?>
							<tr>
								<td><a href="<?php echo route('frontend.index.postRecruitment',['edit',$id]); ?>"><?php echo $fullname; ?></a></td>							
							</tr>
							<?php
						}
						?>											
					</tbody>
				</table>	
				<div class="margin-top-15">
					<?php 
					if(count($data) > 0){
						echo $pagination->showPagination();
					}  
					?>
				</div>			
			</div>
			<div class="col-lg-3">
				@include("frontend.employer-sidebar")				
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" language="javascript">
	$(document).ready(function(){
		$( 'input[name="duration"]' ).datepicker({
			dateFormat: "dd/mm/yy",
			defaultDate: "+3d",
			changeYear: true,
			changeMonth: true,
			yearRange: "1975:3000"
		});
	});		
</script>
@endsection()