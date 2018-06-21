@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<?php 
$seo=getSeo();
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>
<div class="container">
	<div class="row">			
		<div class="col-lg-9">
			<form name="frm-cabinet-applied-profile" method="POST" enctype="multipart/form-data">
				{{ csrf_field() }}
				<input type="hidden" name="filter_page" value="1">     
				<h1 class="dn-dk-h">DANH SÁCH ỨNG VIÊN NỘP HỒ SƠ</h1>
				<div class="margin-top-15">
					<div class="row">						
						<div class="col-lg-4"><input type="text" name="candidate_name" class="kiem-cong-viec kiatisak" value="<?php echo @$candidate_name; ?>" placeholder="Nhập tên ứng viên..."></div>
						<div class="col-lg-4"><input type="text" name="recruitment_name" class="kiem-cong-viec kiatisak" value="<?php echo @$recruitment_name; ?>" placeholder="Nhập vị trí tuyển dụng..."></div>
						<div class="col-lg-4"><div class="btn-search-recruitment"><a href="javascript:void(0);" onclick="document.forms['frm-cabinet-applied-profile'].submit();">Lọc</a></div></div>
					</div>										
				</div>				
				<table class="table table-bordered margin-top-15">
					<thead>
						<tr>
							<th class="news-title"><center>Ứng viên</center></th>	
							<th class="news-title"><center>Ứng tuyển vị trí</center></th>	
							<th class="news-title"><center>Chi tiết hồ sơ</center></th>	
							<th class="news-title"><center>File hồ sơ đính kèm</center></th>														
						</tr>
					</thead>
					<tbody>
						<?php 
						foreach ($data as $key => $value) {
							$id=$value['id'];
							$fullname=$value['fullname'];	
							$recruitment_name=$value['recruitment_name'];		
							$entranced=$value['entranced'];		
							$link_cv=$value['link_cv'];			
							?>
							<tr>
								<td><?php echo $fullname; ?></td>	
								<td><?php echo $recruitment_name; ?></td>								
								<td><?php echo $entranced; ?></td>	
								<td><?php echo $link_cv; ?></td>								
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
			</form>		
		</div>
		<div class="col-lg-3">
			@include("frontend.employer-sidebar")				
		</div>
	</div>
</div>
@endsection()