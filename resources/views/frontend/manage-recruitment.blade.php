@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<?php 
$seo=getSeo();
$linkChangeRecruitmentAppearedStatus	=	route('frontend.index.changeRecruitmentAppearedStatus');
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>


    
<div class="container">
	<div class="row">			
		<div class="col-lg-9">
			<form name="frm" method="POST" enctype="multipart/form-data">
				{{ csrf_field() }}
				<input type="hidden" name="filter_page" value="1">     
				<h1 class="dn-dk-h">Danh Sách Tin Tuyển Dụng</h1>
				<div class="flamentco margin-top-15">
					<div class="kaso"><input type="text" name="q" class="kiem-cong-viec kiatisak" value="<?php echo $q; ?>" placeholder="Nhập tiêu đề tin đăng..."></div>
					<div class="btn-search-recruitment margin-left-15"><a href="javascript:void(0);" onclick="document.forms['frm'].submit();">Lọc</a></div>
				</div>
				@if(Session::has("message"))	
				<?php 
				$type_msg='';
				$checked=Session::get('message')['checked'];
				if((int)@$checked==1){
					$type_msg='note-success';
				}else{
					$type_msg='note-danger';
				}
				?>		
				<div class="note margin-top-15 <?php echo $type_msg; ?>" >
					<?php 				
					$msg=Session::get("message")['msg'];				
					if(count(@$msg) > 0){
						?>					
						<ul>
							<?php 
							foreach (@$msg as $key => $value) {
								?>
								<li><?php echo $value; ?></li>
								<?php
							}
							?>                              
						</ul>					
						<?php
					}				
					?>
				</div>                                                                            
				@endif			
				<table class="table table-bordered margin-top-15">
					<thead>
						<tr>
							<th class="news-title">Tin tuyển dụng</th>	
							<th class="news-title"><center>Ngày đăng</center></th>							
							<th class="news-title"><center>Hiển thị</center></th>
							<th class="news-title"><center>Sửa</center></th>
							<th class="news-title"><center>Xóa</center></th>
						</tr>
					</thead>
					<tbody>
						<?php 
						foreach ($data as $key => $value) {
							$id=$value['id'];
							$fullname=$value['fullname'];	
							$created_at=$value['created_at'];
							$status=$value['status'];						
							$edited=$value['edited'];
							$deleted=$value['deleted'];
							?>
							<tr>
								<td><?php echo $fullname; ?></td>	
								<td><?php echo $created_at; ?></td>
								<td><?php echo $status; ?></td>
								<td><?php echo $edited; ?></td>
								<td><?php echo $deleted; ?></td>						
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
	function changeStatus(id,status){		
		var token = $("form[name='frm']").find("input[name='_token']").val();   
		var dataItem={   
			'id':id,
			'status':status,         
			'_token': token
		};
		$.ajax({
			url: '<?php echo $linkChangeRecruitmentAppearedStatus; ?>',
			type: 'POST',     
			data: dataItem,
			success: function (data, status, jqXHR) {   				
				var element     = 'a#status-' + data['id'];
				var classRemove = 'publish';
				var classAdd    = 'unpublish';
				if(parseInt(data['status']) ==1){
					classRemove = 'unpublish';
					classAdd    = 'publish';
				}
				$(element).attr('onclick',data['link']);
				$(element + ' span').removeClass(classRemove).addClass(classAdd);
			},
			beforeSend  : function(jqXHR,setting){
				
			},
		});				
	}	
</script>
@endsection()