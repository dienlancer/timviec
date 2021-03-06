@extends("adminsystem.master")
@section("content")
<?php 
$setting= getSettingSystem();
$linkCancel             =   route('adminsystem.'.$controller.'.getList');
$linkSave               =   route('adminsystem.'.$controller.'.save');

$inputEmail             =   @$arrRowData['email']; 
$inputPassword          =   '<input type="password"   name="password" class="form-control" />';
$inputPasswordConfirmed =   '<input type="password"  name="password_confirmed" class="form-control"  />';
$inputFullName          =   '<input type="text" class="form-control" name="fullname"        value="'.@$arrRowData['fullname'].'">'; 
$inputAlias             =   '<input type="text" class="form-control" name="alias"            value="'.@$arrRowData['alias'].'">';
$inputMetakeyword       =   '<textarea  name="meta_keyword" rows="2" cols="100" class="form-control" >'.@$arrRowData['meta_keyword'].'</textarea>'; 
$inputMetadescription   =   '<textarea name="meta_description" rows="5" cols="100" class="form-control" >'.@$arrRowData['meta_description'].'</textarea>'; 
$inputAddress           =   '<input type="text" class="form-control" name="address"        value="'.@$arrRowData['address'].'">'; 
$inputPhone             =   '<input type="text" class="form-control" name="phone"        value="'.@$arrRowData['phone'].'">'; 
/* begin tỉnh thành phố và quy mô công ty */
$ddlProvince            = cmsSelectboxCategory("province_id","form-control selected2",$arrProvince,@$arrRowData['province_id'],"",'Chọn tỉnh thành phố');
$ddlScale               = cmsSelectboxCategory("scale_id","form-control",$arrScale,@$arrRowData['scale_id'],"",'Chọn quy mô công ty');
/* end tỉnh thành phố và quy mô công ty */
$inputIntro             =   '<textarea name="intro" rows="10" cols="100" class="form-control summer-editor" >'.@$arrRowData['intro'].'</textarea>'; 
$inputFax =         '<input type="text" class="form-control" name="fax"        value="'.@$arrRowData['fax'].'">'; 
$inputWebsite = '<input type="text" class="form-control" name="website"        value="'.@$arrRowData['website'].'">'; 
$inputContactedName='<input type="text" class="form-control" name="contacted_name"        value="'.@$arrRowData['contacted_name'].'">'; 

$inputContactedPhone='<input type="text" class="form-control" name="contacted_phone"        value="'.@$arrRowData['contacted_phone'].'">'; 
$ddlUser      =   cmsSelectboxCategory("user_id","form-control",$arrUser,@$arrRowData['user_id'],"",'Chọn danh mục');

$arrStatus              =   array(-1 => '- Select status -', 1 => 'Kích hoạt', 0 => 'Ngưng kích hoạt');  
$ddlStatus              =   cmsSelectbox("status","form-control",$arrStatus,(int)@$arrRowData['status'],"");

$arrStatus              =   array(-1 => '- Select status -', 1 => 'Xác nhận', 0 => 'Không xác nhận');  
$ddlStatusAuthentication              =   cmsSelectbox("status_authentication","form-control",$arrStatus,(int)@$arrRowData['status_authentication'],"");

/* begin logo */
$picture                =   "";
$strImage               =   "";
$setting = getSettingSystem();
$product_width = $setting['product_width']['field_value'];
$product_height = $setting['product_height']['field_value'];  
if(count(@$arrRowData)>0){
    if(!empty(@$arrRowData["logo"])){
        $picture        =   '<div class="box-logo"><div><center>&nbsp;<img src="'.asset("/upload/" . $product_width . "x" . $product_height . "-".@$arrRowData["logo"]).'" style="width:100%" />&nbsp;</center></div><div><a href="javascript:void(0);" onclick="deleteImage();"><img src="'.asset('public/adminsystem/images/delete-icon.png').'"/></a></div></div>';                        
        $strImage       =   @$arrRowData["logo"];
    }        
} 
$inputPictureHidden     =   '<input type="hidden" name="image_hidden"  value="'.@$strImage.'" />';
/* end logo */

$id                     =   (count($arrRowData) > 0) ? @$arrRowData['id'] : "" ;
$inputID                =   '<input type="hidden" name="id" value="'.@$id.'" />'; 

?>
<div class="portlet light bordered">
    <div class="portlet-title">
        <div class="note"  style="display: none;"></div>
        <div class="caption">
            <i class="{{$icon}}"></i>
            <span class="caption-subject font-dark sbold uppercase">{{$title}}</span>
        </div>
        <div class="actions">
           <div class="table-toolbar">
            <div class="row">
                <div class="col-md-12">
                    <button onclick="save()" class="btn purple">Lưu <i class="fa fa-floppy-o"></i></button> 
                    <a href="<?php echo $linkCancel; ?>" class="btn green">Thoát <i class="fa fa-ban"></i></a>                    </div>                                                
                </div>
            </div>    
        </div>
    </div>
    <div class="portlet-body form">
        <form class="form-horizontal" name="frm" role="form" enctype="multipart/form-data">
            {{ csrf_field() }}                     
            <?php echo  $inputID; ?>
            <?php echo $inputPictureHidden; ?>                   
            <div class="form-body">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Email</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $inputEmail; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Password</b></label>
                        <div class="col-md-9">
                            <?php echo $inputPassword; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>  
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Xác nhận mật khẩu</b></label>
                        <div class="col-md-9">
                            <?php echo $inputPasswordConfirmed; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Tên công ty</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $inputFullName; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Alias</b></label>
                        <div class="col-md-9">
                            <?php echo $inputAlias; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>MetaKeyword</b></label>
                        <div class="col-md-9">
                            <?php echo $inputMetakeyword; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>MetaDescription</b></label>
                        <div class="col-md-9">
                            <?php echo $inputMetadescription; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Địa chỉ</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $inputAddress; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Điện thoại</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $inputPhone; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Tỉnh / thành phố</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $ddlProvince; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Quy mô công ty</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $ddlScale; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <div class="col-md-3 control-label" ><b>Logo</b></div>
                        <div class="col-md-9 ctrl-right">
                            <div class="recommend">
                                <div><input type="file" name="image"  /></div>
                                <div><font color="#E30000"><b>Khuyến khích cập nhật logo hình vuông</b></font></div>
                            </div>
                            <div class="picture-area"><?php echo $picture; ?>                      </div>
                        </div>
                    </div>                    
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Sơ lược công ty</b></label>
                        <div class="col-md-9">
                            <?php echo $inputIntro; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Fax</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $inputFax; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Website</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $inputWebsite; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Tên người liên hệ</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $inputContactedName; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>                 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Điện thoại người liên hệ</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $inputContactedPhone; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Chăm sóc khách hàng</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $ddlUser; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row"> 
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Trạng thái đăng nhập</b></label>
                        <div class="col-md-9">                            
                            <?php echo $ddlStatus; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div>  
                <div class="row"> 
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Xác thực</b></label>
                        <div class="col-md-9">                            
                            <?php echo $ddlStatusAuthentication; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div>                                                                             
            </div>              
        </form>
    </div>
</div>
<script type="text/javascript" language="javascript">    
    function deleteImage(){
        var xac_nhan = 0;
        var msg="Bạn có muốn xóa ?";
        if(window.confirm(msg)){ 
            xac_nhan = 1;
        }
        if(xac_nhan  == 0){
            return 0;
        }
        $(".picture-area").empty();
        $("input[name='image_hidden']").val("");        
    }
    function save(){
        var id=$('input[name="id"]').val();         
        var password=$('input[name="password"]').val();
        var password_confirmed=$('input[name="password_confirmed"]').val();           
        var fullname=$('input[name="fullname"]').val(); 
        var alias=$('input[name="alias"]').val(); 
        var meta_keyword=$('textarea[name="meta_keyword"]').val();
        var meta_description=$('textarea[name="meta_description"]').val();    
        var address=$('input[name="address"]').val();   
        var phone=$('input[name="phone"]').val();   
        var province_id=$('select[name="province_id"]').val();          
        var scale_id=$('select[name="scale_id"]').val();       
        var intro=$('textarea[name="intro"]').summernote('code');   
        var fax=$('input[name="fax"]').val(); 
        var website=$('input[name="website"]').val(); 
        var contacted_name=$('input[name="contacted_name"]').val(); 
        
        var contacted_phone=$('input[name="contacted_phone"]').val(); 
        /* begin xử lý image */
        var image_file=null;
        var image_ctrl=$('input[name="image"]');         
        var image_files = $(image_ctrl).get(0).files;        
        if(image_files.length > 0){            
            image_file  = image_files[0];  
        }        
        var image_hidden=$('input[name="image_hidden"]').val(); 
        /* end xử lý image */                     
        var user_id=$('select[name="user_id"]').val();  
        var status=$('select[name="status"]').val();   
        var status_authentication=$('select[name="status_authentication"]').val();     
        var token = $('input[name="_token"]').val();           
        var dataItem = new FormData();
        dataItem.append('id',id);        
        dataItem.append('password',password);        
        dataItem.append('password_confirmed',password_confirmed);        
        dataItem.append('fullname',fullname);
        dataItem.append('alias',alias);
        dataItem.append('meta_keyword',meta_keyword);
        dataItem.append('meta_description',meta_description);
        dataItem.append('address',address);
        dataItem.append('phone',phone);
        dataItem.append('province_id',province_id);
        dataItem.append('scale_id',scale_id);
        dataItem.append('intro',intro);
        dataItem.append('fax',fax);
        dataItem.append('website',website);
        dataItem.append('contacted_name',contacted_name);
        
        dataItem.append('contacted_phone',contacted_phone);
        if(image_files.length > 0){
            dataItem.append('image',image_file);
        } 
        dataItem.append('image_hidden',image_hidden);
        dataItem.append('user_id',user_id);
        dataItem.append('status',status);  
        dataItem.append('status_authentication',status_authentication);                         
        dataItem.append('_token',token);      
        $.ajax({
            url: '<?php echo $linkSave; ?>',
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
                spinner.hide();
            },
            error : function (data){
                spinner.hide();
            },
            beforeSend  : function(jqXHR,setting){
                spinner.show();
            },
            cache: false,
            contentType: false,
            processData: false
        });
    }           
     
</script>
@endsection()            