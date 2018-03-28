<?php 
$linkCancel			=	route('frontend.'.$controller.'.getList');
$linkLoadData		=	route('frontend.'.$controller.'.loadData');
$linkChangeStatus	=	route('frontend.'.$controller.'.changeStatus');
$linkDelete			=	route('frontend.'.$controller.'.deleteItem');
$linkUpdateStatus	=	route('frontend.'.$controller.'.updateStatus');
$linkTrash			=	route('frontend.'.$controller.'.trash');
$linkSortOrder		=	route('frontend.'.$controller.'.sortOrder');
?>
<h2 class="tieu-de margin-top-15">
	Danh sách đơn hàng
</h2>	
<form method="post" name="frm" class="margin-top-5 box-article frm-vip padding-top-5" enctype="multipart/form-data">
	{{ csrf_field() }}    		
	<input type="hidden" name="sort_json" id="sort_json" value="" />
	<div class="alert alert-success" id="alert" style="display: none">
		<strong>Success!</strong> 
	</div>
	
	<div class="row margin-top-15">	
		<div class="col-lg-12">
			<table class="table table-striped table-bordered table-hover table-checkable order-column" id="tbl-invoice">
				<thead>
					<tr>
						<th width="1%"><input type="checkbox" onclick="checkAllAgent(this)"  name="checkall-toggle"></th>                
						<th>Mã đơn hàng</th>
						<th>Username</th>
						<th>Email</th>
						<th>Tên khách hàng</th>						
						<th>Ngày mua</th>
						<th width="10%">Trạng thái</th>							
						<th width="1%">Xem</th>  
						          
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
		var token = $('input[name="_token"]').val();   
		var dataItem={            
			'_token': token
		};
		$.ajax({
			url: '<?php echo $linkLoadData; ?>',
			type: 'POST', 
			data: dataItem,
			success: function (data, status, jqXHR) {  				
				vInvoiceTable.clear().draw();
				vInvoiceTable.rows.add(data).draw();
				spinner.hide();
			},
			beforeSend  : function(jqXHR,setting){
				spinner.show();
			},
		});
	}	
	function checkWithList(this_checkbox){
		var dr = vInvoiceTable.row( $(this_checkbox).closest('tr') ).data();       		
		if(parseInt(dr['is_checked']) == 0){
			dr['checked'] ='<input type="checkbox" checked onclick="checkWithList(this)" name="cid" />';
			dr['is_checked'] = 1;
		}else{
			dr['checked'] ='<input type="checkbox" onclick="checkWithList(this)" name="cid" />';
			dr['is_checked'] = 0;
		}
		vInvoiceTable.row( $(this_checkbox).closest('tr') ).data(dr);
	}	
	function changeStatus(id,status){		
		var token = $('input[name="_token"]').val();   
		var dataItem={   
			'id':id,
			'status':status,         
			'_token': token
		};
		$.ajax({
			url: '<?php echo $linkChangeStatus; ?>',
			type: 'POST',     
			data: dataItem,
			success: function (data, status, jqXHR) {   							                              				
				showMsg('alert',data.msg,data.type_msg);               		
				vInvoiceTable.clear().draw();
				vInvoiceTable.rows.add(data.data).draw();
				spinner.hide();
			},
			beforeSend  : function(jqXHR,setting){
				spinner.show();
			},
		});		
		$("input[name='checkall-toggle']").prop("checked",false);
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
				vInvoiceTable.clear().draw();
				vInvoiceTable.rows.add(data.data).draw();
				spinner.hide();
			},
			beforeSend  : function(jqXHR,setting){
				spinner.show();
			},
		});
		$("input[name='checkall-toggle']").prop("checked",false);
	}
	function updateStatus(status){		
		var token 	= 	$('input[name="_token"]').val();   
		var dt 		= 	vInvoiceTable.data();
		var str_id	=	"";		
		for(var i=0;i<dt.length;i++){
			var dr=dt[i];
			if(dr.is_checked==1){
				str_id +=dr.id+",";	            
			}
		}
		var dataItem ={   
			'str_id':str_id,
			'status':status,			
			'_token': token
		};
		$.ajax({
			url: '<?php echo $linkUpdateStatus; ?>',
			type: 'POST', 

			data: dataItem,
			success: function (data, status, jqXHR) {   							                              				
				showMsg('alert',data.msg,data.type_msg);               		
				vInvoiceTable.clear().draw();
				vInvoiceTable.rows.add(data.data).draw();
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
		var dt 		= 	vInvoiceTable.data();
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
				vInvoiceTable.clear().draw();
				vInvoiceTable.rows.add(data.data).draw();
				spinner.hide();
			},
			beforeSend  : function(jqXHR,setting){
				spinner.show();
			},
		});
		$("input[name='checkall-toggle']").prop("checked",false);
	}
	function sort(){			
		var token 	= 	$('input[name="_token"]').val();   
		var sort_json=$('input[name="sort_json"]').val();
		var dataItem ={   
			sort_json:sort_json,		
			'_token': token
		};        
		$.ajax({
			url: '<?php echo $linkSortOrder; ?>',
			type: 'POST', 

			data: dataItem,
			success: function (data, status, jqXHR) {   	
				showMsg('alert',data.msg,data.type_msg);  
				vInvoiceTable.clear().draw();
				vInvoiceTable.rows.add(data.data).draw();
				spinner.hide();
			},
			beforeSend  : function(jqXHR,setting){
				spinner.show();
			},
		});
		$("input[name='checkall-toggle']").prop("checked",false);
	}
	function setSortOrder(ctrl){
		var id=$(ctrl).attr("sort_order_id");
		var giatri=$(ctrl).val();		
		var sort_json=$('input[name="sort_json"]').val();
		var data_sort=null;
		if(sort_json != ''){
			data_sort=$.parseJSON(sort_json);	
		}		
		if(data_sort == null){
			var token = $('input[name="_token"]').val();   
			var dataItem={            
				'_token': token
			};
			$.ajax({
				url: '<?php echo $linkLoadData; ?>',
				type: 'POST', 

				data: dataItem,
				async:false,
				success: function (data, status, jqXHR) {  		
					data_sort = new Array(data.length);
					for(var i=0;i<data_sort.length;i++){							
						var sort_order_input=	$(data[i]["sort_order"]).find("input[name='sort_order']");
						var sort_order=parseInt($(sort_order_input).val());												
						var obj={"id":parseInt(data[i]["id"]),"sort_order":sort_order};						
						data_sort[i]=obj;
					}					
				},
				beforeSend  : function(jqXHR,setting){
					
				},
			});
		}			
		var data=new Array(data_sort.length);	
		for(var i=0;i<data_sort.length;i++){								
			var sort_order=parseInt(data_sort[i].sort_order);
			if(parseInt(id)==parseInt(data_sort[i].id)){
				sort_order=parseInt(giatri);
			}
			var obj={"id":data_sort[i].id,"sort_order":sort_order};
			data[i]=obj;
		}				
		$('input[name="sort_json"]').val(JSON.stringify(data));
	}
	$(document).ready(function(){
		
		getList();
	});
</script>


