@extends("adminsystem.master")
@section("content")
<?php 
$linkNew			=	route('adminsystem.'.$controller.'.getForm',['add']);
$linkCancel			=	route('adminsystem.'.$controller.'.getList');
$linkLoadData		=	route('adminsystem.'.$controller.'.loadData');
$linkDelete			=	route('adminsystem.'.$controller.'.deleteItem');
$linkTrash			=	route('adminsystem.'.$controller.'.trash');
$linkSortOrder		=	route('adminsystem.'.$controller.'.sortOrder');
?>
<form class="form-horizontal" role="form">	
	<div class="portlet light bordered">
		<div class="portlet-title">
			<div class="note"  style="display: none;"></div>
			<div class="caption font-dark">
				<i class="{{$icon}}"></i>
				<span class="caption-subject bold uppercase">{{$title}}</span>
			</div>     
			<div class="actions">
				<div class="table-toolbar">
					<div class="row">
						<div class="col-md-12">						
							<a href="<?php echo $linkNew; ?>" class="btn green">Thêm mới <i class="fa fa-plus"></i></a> 
							<a href="javascript:void(0)" onclick="sort()" class="btn grey-cascade">Sắp xếp <i class="fa fa-sort"></i></a> 
							<a href="javascript:void(0)" onclick="trash()" class="btn red">Xóa <i class="fa fa-trash"></i></a> 	
							{{ csrf_field() }}    		
							<input type="hidden" name="sort_json" id="sort_json" value="" />	
						</div>                                                
					</div>
				</div>    
			</div>                                 
		</div>
		<div class="portlet-body">		
			<table class="table table-striped table-bordered table-hover table-checkable order-column" id="tbl-<?php echo $controller; ?>">
				<thead>
					<tr>
						<th width="1%"><input type="checkbox" onclick="checkAllAgent(this)"  name="checkall-toggle"></th>                
						<th>Nhóm quyền</th>
						<th>Controller</th>
						<th>Action</th>						
						<th width="10%">Sắp xếp</th>									
						<th width="1%">Sửa</th>  
						<th width="1%">Xóa</th>                    
					</tr>
				</thead>
				<tbody>                                                
				</tbody>
			</table>
		</div>
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
				
				vPrivilegeTable.clear().draw();
				vPrivilegeTable.rows.add(data).draw();
				spinner.hide();
			},
			beforeSend  : function(jqXHR,setting){
				spinner.show();
			},
		});
	}	
	function checkWithList(this_checkbox){
		var dr = vPrivilegeTable.row( $(this_checkbox).closest('tr') ).data();       		
		if(parseInt(dr['is_checked']) == 0){
			dr['checked'] ='<input type="checkbox" checked onclick="checkWithList(this)" name="cid" />';
			dr['is_checked'] = 1;
		}else{
			dr['checked'] ='<input type="checkbox" onclick="checkWithList(this)" name="cid" />';
			dr['is_checked'] = 0;
		}
		vPrivilegeTable.row( $(this_checkbox).closest('tr') ).data(dr);
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
				showMsg('note',data);               		
				vPrivilegeTable.clear().draw();
				vPrivilegeTable.rows.add(data.data).draw();
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
		var dt 		= 	vPrivilegeTable.data();
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
				showMsg('note',data);  
				vPrivilegeTable.clear().draw();
				vPrivilegeTable.rows.add(data.data).draw();
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
				showMsg('note',data);  
				vPrivilegeTable.clear().draw();
				vPrivilegeTable.rows.add(data.data).draw();
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
@endsection()         

