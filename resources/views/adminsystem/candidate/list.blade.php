@extends("adminsystem.master")
@section("content")
<?php 

$linkCancel			=	route('adminsystem.'.$controller.'.getList');
$linkLoadData		=	route('adminsystem.'.$controller.'.loadData');
$linkChangeStatus	=	route('adminsystem.'.$controller.'.changeStatus');
$linkDelete			=	route('adminsystem.'.$controller.'.deleteItem');
$linkUpdateStatus	=	route('adminsystem.'.$controller.'.updateStatus');
$linkTrash			=	route('adminsystem.'.$controller.'.trash');
$inputFilterSearch 		=	'<input type="text" class="form-control" name="filter_search"          value="">';
?>
<form class="form-horizontal" role="form" name="frm">	
	{{ csrf_field() }}
	<input type="hidden" name="sort_json"  value="" />	
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
							<a href="javascript:void(0)" onclick="updateStatus(1)" class="btn blue">Hiển thị <i class="fa fa-eye"></i></a> 
							<a href="javascript:void(0)" onclick="updateStatus(0)" class="btn yellow">Ẩn <i class="fa fa-eye-slash"></i></a> 
							<a href="javascript:void(0)" onclick="trash()" class="btn red">Xóa <i class="fa fa-trash"></i></a> 	
							
						</div>                                                
					</div>
				</div>    
			</div>                                 
		</div>
		<div class="row">                     
                <div class="col-md-6">
                    <div><b>Tên ứng viên</b>  </div>
                    <div><?php echo $inputFilterSearch; ?></div>
                </div>            
                <div class="col-md-6">
                    <div>&nbsp;</div>
                    <div>
                        <button type="button" class="btn dark btn-outline sbold uppercase btn-product" onclick="getList();">Tìm kiếm</button>                                         
                    </div>                
                </div>                
        </div>   
		<div class="portlet-body">		
			<table class="table table-striped table-bordered table-hover table-checkable order-column" id="tbl-<?php echo $controller; ?>">
				<thead>
					<tr>
						<th width="1%"><input type="checkbox" onclick="checkAllAgent(this)"  name="checkall-toggle"></th>
						<th>Tên ứng viên</th>													
						<th>Email đăng nhập </th>																						
						<th width="5%">Đăng nhập</th>							
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
		var token = $('form[name="frm"] input[name="_token"]').val();         
        var filter_search=$('form[name="frm"] input[name="filter_search"]').val();
		var dataItem={            
            '_token': token,
            'filter_search':filter_search,            
        };
		$.ajax({
			url: '<?php echo $linkLoadData; ?>',
			type: 'POST', 
			data: dataItem,
			success: function (data, status, jqXHR) {  								
				vCandidateTable.clear().draw();
				vCandidateTable.rows.add(data).draw();
				spinner.hide();
			},
			beforeSend  : function(jqXHR,setting){
				spinner.show();
			},
		});
	}	
	function checkWithList(this_checkbox){
		var dr = vCandidateTable.row( $(this_checkbox).closest('tr') ).data();       		
		if(parseInt(dr['is_checked']) == 0){
			dr['checked'] ='<input type="checkbox" checked onclick="checkWithList(this)" name="cid" />';
			dr['is_checked'] = 1;
		}else{
			dr['checked'] ='<input type="checkbox" onclick="checkWithList(this)" name="cid" />';
			dr['is_checked'] = 0;
		}
		vCandidateTable.row( $(this_checkbox).closest('tr') ).data(dr);
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
				showMsg('note',data);		
				vCandidateTable.clear().draw();
				vCandidateTable.rows.add(data.data).draw();
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
				showMsg('note',data);   		
				vCandidateTable.clear().draw();
				vCandidateTable.rows.add(data.data).draw();
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
		var dt 		= 	vCandidateTable.data();		
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
				showMsg('note',data);             		
				vCandidateTable.clear().draw();
				vCandidateTable.rows.add(data.data).draw();
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
		var dt 		= 	vCandidateTable.data();
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
				vCandidateTable.clear().draw();
				vCandidateTable.rows.add(data.data).draw();
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
@endsection()         

