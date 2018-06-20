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


   
<div class="container">
	<div class="row">			
		<div class="col-lg-9">
			<form name="frm-group-profile" method="POST" enctype="multipart/form-data">
				{{ csrf_field() }}
				<?php echo $inputID; ?>
				<input type="hidden" name="filter_page" value="1">      
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
	function uploadFile() {
		$("form[name='frm-group-profile']").find("input[name='file_attached']").click();
	}
	function chooseFileInfo(){
		$("form[name='frm-group-profile']").find("input[name='file_attached']").change(function(){    		
			var id=$("form[name='frm-group-profile']").find('input[name="id"]').val();        
			/* begin xử lý image */
			var image_file=null;
			var image_ctrl=$("form[name='frm-group-profile']").find('input[name="file_attached"]');         
			var image_files = $(image_ctrl).get(0).files;        
			if(image_files.length > 0){            
				image_file  = image_files[0];  
			}        
			/* end xử lý image */
			var token =$("form[name='frm-group-profile']").find('input[name="_token"]').val();       
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