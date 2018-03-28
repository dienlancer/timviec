
<?php 
$linkNew			=	route('frontend.'.$controller.'.getForm',['add']);
$linkCancel			=	route('frontend.'.$controller.'.getList');
$linkLoadData		=	route('frontend.'.$controller.'.loadData');
$linkDelete			=	route('frontend.'.$controller.'.deleteItem');
$linkTrash			=	route('frontend.'.$controller.'.trash');
?>
<h1 class="tieu-de margin-top-15">
	Media
</h1>		
<form method="post" name="frm" class="margin-top-5 box-article frm-vip padding-top-5" enctype="multipart/form-data">
	{{ csrf_field() }}	
	<div class="alert alert-success" id="alert" style="display: none">
		<strong>Success!</strong> 
	</div>
	<div class="row padding-top-15">
		<div class="col-md-12">	
			<div class="actions">
				<a href="<?php echo $linkNew; ?>" class="btn green">Thêm mới <i class="fa fa-plus"></i></a> 							
				<a href="javascript:void(0)" onclick="trash();" class="btn red">Xóa <i class="fa fa-trash"></i></a> 				
			</div>								
		</div>    
		<div class="clr"></div>                                            
	</div>
	<div class="row margin-top-15">
		<div class="col-md-12">
			<table class="table table-striped table-bordered table-hover table-checkable order-column" id="tbl-media">
				<thead>
					<tr>
						<th width="1%"><input type="checkbox" onclick="checkAllAgent(this)"  name="checkall-toggle"></th>                						
						<th>Media</th>
						<th>Tên file</th>						
						<th width="1%">Xóa</th>                    
					</tr>
				</thead>
				<tbody>                                                
				</tbody>
			</table>
		</div>
		<div class="clr"></div>					
	</div>	
</form>
<script type="text/javascript" language="javascript">	
	function getList() {  	
		var token = $('form[name="frm"] > input[name="_token"]').val();         
		var dataItem={            
			'_token': token,            
		};
		$.ajax({
			url: '<?php echo $linkLoadData; ?>',
			type: 'POST', 
			data: dataItem,
			success: function (data, status, jqXHR) {  								
				vMediaTable.clear().draw();
				vMediaTable.rows.add(data).draw();
				spinner.hide();
			},
			beforeSend  : function(jqXHR,setting){
				spinner.show();
			},
		});
	}	
	function checkWithList(this_checkbox){
		var dr = vMediaTable.row( $(this_checkbox).closest('tr') ).data();       		
		if(parseInt(dr['is_checked']) == 0){
			dr['checked'] ='<input type="checkbox" checked onclick="checkWithList(this)" name="cid" />';
			dr['is_checked'] = 1;
		}else{
			dr['checked'] ='<input type="checkbox" onclick="checkWithList(this)" name="cid" />';
			dr['is_checked'] = 0;
		}
		vMediaTable.row( $(this_checkbox).closest('tr') ).data(dr);
	}	
	function deleteItem(id){		
		var xac_nhan = 0;
		var msg="Bạn có muốn xóa ?";
		if(window.confirm(msg)){ 
			xac_nhan = 1;
		}
		if(xac_nhan  == 0){
			return 0;
		}
		var token 	 = $('input[name="_token"]').val();   		
		var dataItem ={   
			'id':id,					
			'_token': token
		};
		$.ajax({
			url: '<?php echo $linkDelete; ?>',
			type: 'POST', 			
			data: dataItem,
			success: function (data, status, jqXHR) {  				
				showMsg('alert',data.msg,data.type_msg);    		
				vMediaTable.clear().draw();
				vMediaTable.rows.add(data.data).draw();
				spinner.hide();
				
			},
			beforeSend  : function(jqXHR,setting){
				spinner.show();
			},
		});
		$("input[name='checkall-toggle']").prop("checked",false);
	}
	
	function trash(){	
		var xac_nhan = 0;
		var msg="Bạn có muốn xóa ?";
		if(window.confirm(msg)){ 
			xac_nhan = 1;
		}
		if(xac_nhan  == 0){
			return 0;
		}
		var token 	= 	$('input[name="_token"]').val();   
		
		var dt 		= 	vMediaTable.data();
		var str_id	=	"";		
		for(var i=0;i<dt.length;i++){
			var dr=dt[i];
			if(dr.is_checked==1){
				str_id +=dr.id+",";	            
			}
		}
		var dataItem ={   
			'str_id':str_id,		
			
			'_token': token
		};
		$.ajax({
			url: '<?php echo $linkTrash; ?>',
			type: 'POST', 
			
			data: dataItem,
			success: function (data, status, jqXHR) {
				showMsg('alert',data.msg,data.type_msg);
				vMediaTable.clear().draw();
				vMediaTable.rows.add(data.data).draw();
				spinner.hide();
				
			},
			beforeSend  : function(jqXHR,setting){
				spinner.show();
			},
		});
		$("input[name='checkall-toggle']").prop("checked",false);
	}		
	$(document).ready(function(){
		
		getList();
	});
</script>


