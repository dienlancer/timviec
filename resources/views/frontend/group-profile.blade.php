@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<?php 
$seo=getSeo();
$linkChangeProfileSearchStatus	=	route('frontend.index.changeProfileSearchStatus');
$inputID     =   '<input type="hidden" name="id"  value="'.@$id.'" />';
$linkSave               =   route('frontend.index.saveFileAttached');
$linkCancel               =   route('frontend.index.getGroupProfile',[@$id]);
$linkCreateProfileStepByStep=route('frontend.index.getProfileDetail',[@$id]);
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>

{{ csrf_field() }}
<?php echo $inputID; ?>
<input type="hidden" name="filter_page" value="1">         
<div class="container">
	<div class="row">			
		<div class="col-lg-9">
			<form name="frm" method="POST" enctype="multipart/form-data">
				<h1 class="dn-dk-h">BỘ HỒ SƠ</h1>
				<div class="note margin-top-15"  style="display: none;"></div>
				<div class="box-group-profile">					
					<div class="rawon">
						<div><center><i class="far fa-folder-open"></i></center></div>
						<div class="mimi"><a href="<?php echo $linkCreateProfileStepByStep; ?>">Tạo hồ sơ từng bước</a></div>
					</div>										
					<div class="rawon margin-left-15">
						<div><center><i class="fas fa-upload"></i></center></div>
						<div class="mimi">							
							<a href="javascript:void(0);" onclick="uploadFile();">Upload hồ sơ</a>
							<div style="height: 0px; width: 0; overflow: hidden;">
								<input type="file" name="file_attached"  />                                    
							</div>
						</div>
					</div>
					
				</div>
			</form>	
		</div>
		<div class="col-lg-3">
			@include("frontend.candidate-sidebar")				
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
			url: '<?php echo $linkChangeProfileSearchStatus; ?>',
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
	function uploadFile() {
		$("input[name='file_attached']").click();
	}
	function chooseFileInfo(){
		$("input[name='file_attached']").change(function(){    		
			var id=$('input[name="id"]').val();        
			/* begin xử lý image */
			var image_file=null;
			var image_ctrl=$('input[name="file_attached"]');         
			var image_files = $(image_ctrl).get(0).files;        
			if(image_files.length > 0){            
				image_file  = image_files[0];  
			}        
			/* end xử lý image */
			var token = $('input[name="_token"]').val();       
			var dataItem = new FormData();
			dataItem.append('id',id);
			if(image_files.length > 0){
				dataItem.append('file_attached',image_file);
			} 
			dataItem.append('_token',token);
			$.ajax({
				url: '<?php echo $linkSave; ?>',
				type: 'POST',
				data: dataItem,
				async: false,
				success: function (data) {
					if(data.checked==1){      
						alert('Lưu file đính kèm thành công');              
						window.location.href = "<?php echo $linkCancel; ?>";                    
					} else{
						showMsg('note',data);    
					}       			
				},
				error : function (data){
					
				},
				beforeSend  : function(jqXHR,setting){
					
				},
				cache: false,
				contentType: false,
				processData: false
			});
		});
	}
	chooseFileInfo();
</script>
@endsection()