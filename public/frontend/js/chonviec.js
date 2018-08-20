function apply(apply_link){	
	var profile_id=0;
	var profile_id_selected=$('form[name="frm-apply-method-1"]').find('input[name="profile_id"]:checked');                
	var recruitment_id=$('form[name="frm-apply-method-1"]').find('input[name="recruitment_id"]').val(); 
	var candidate_id=$('form[name="frm-apply-method-1"]').find('input[name="candidate_id"]').val(); 
	var token=$('form[name="frm-apply-method-1"]').find('input[name="_token"]').val();           
	if(profile_id_selected.length > 0){
		profile_id=parseInt($(profile_id_selected).val()) ;
	}else{
		alert('Vui lòng chọn 1 hồ sơ để ứng tuyển');
		return 0;
	}             
	var xac_nhan = 0;
	var msg="Hồ sơ sẽ không được chỉnh sửa sau khi nộp . Bạn có chắc chắn ?";
	if(window.confirm(msg)){ 
		xac_nhan = 1;
	}
	if(xac_nhan  == 0){
		return 0;
	}		
	var dataItem = new FormData();
	dataItem.append('profile_id',profile_id);        
	dataItem.append('recruitment_id',recruitment_id);
	dataItem.append('candidate_id',candidate_id);
	dataItem.append('_token',token);
	$.ajax({
		url: apply_link,
		type: 'POST',
		data: dataItem,
		async: false,
		success: function (data) {                
			if(data.checked==1){    
				alert(data.msg.success);                      
				window.location.href = data.link_edit;                    
			}else{
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
}
function uploadFile() {
	$('form[name="frm-apply-method-2"]').find("input[name='file_attached']").click();
}
function chooseFileInfo(save_file_applied_link){
	$('form[name="frm-apply-method-2"]').find("input[name='file_attached']").change(function(){   
		var xac_nhan = 0;
		var msg="Bạn chắc chắn có muốn ứng tuyển vào vị trí này không ?";
		if(window.confirm(msg)){ 
			xac_nhan = 1;
		}
		if(xac_nhan  == 0){
			return 0;
		} 					
		/* begin xử lý image */
		var image_file=null;
		var image_ctrl=$('form[name="frm-apply-method-2"]').find('input[name="file_attached"]');         
		var image_files = $(image_ctrl).get(0).files;        
		if(image_files.length > 0){            
			image_file  = image_files[0];  
		}        
		/* end xử lý image */
		var recruitment_id=$('form[name="frm-apply-method-2"]').find('input[name="recruitment_id"]').val(); 
		var candidate_id=$('form[name="frm-apply-method-2"]').find('input[name="candidate_id"]').val(); 
		var token=$('form[name="frm-apply-method-2"]').find('input[name="_token"]').val();   
		var dataItem = new FormData();			
		if(image_files.length > 0){
			dataItem.append('file_attached',image_file);
		} 
		dataItem.append('recruitment_id',recruitment_id);
		dataItem.append('candidate_id',candidate_id);
		dataItem.append('_token',token);
		$.ajax({
			url: save_file_applied_link,
			type: 'POST',
			data: dataItem,
			async: false,
			success: function (data) {
				if(data.checked==1){      
					alert(data.msg.success); 
					window.location.href = data.link_edit;                                      			
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
function changeStatusLink(id,status,link,ctrl){		
		var frm=$(ctrl).closest('form');
		var token = $(frm).find("input[name='_token']").val();   
		var dataItem={   
			'id':id,
			'status':status,         
			'_token': token
		};
		$.ajax({
			url: link,
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