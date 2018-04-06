@extends("adminsystem.master")
@section("content")
<?php 
$setting= getSettingSystem();
$linkCancel             =   route('adminsystem.'.$controller.'.getList');
$linkSave               =   route('adminsystem.'.$controller.'.save');

$inputEmail             =   @$arrRowData['email']; 
$inputPassword          =   '<input type="password"   name="password" class="form-control" />';
$inputPasswordConfirmed   =   '<input type="password"  name="password_confirmed" class="form-control"  />';
$inputFullName          =   @$arrRowData['fullname']; 
$inputAlias             =   '<input type="text" class="form-control" name="alias"            value="'.@$arrRowData['alias'].'">';
$inputMetakeyword             =   '<textarea  name="meta_keyword" rows="2" cols="100" class="form-control" >'.@$arrRowData['meta_keyword'].'</textarea>'; 
$inputMetadescription             =   '<textarea name="meta_description" rows="2" cols="100" class="form-control" >'.@$arrRowData['meta_description'].'</textarea>'; 
$inputAddress           =   @$arrRowData['address'];
$inputPhone             =   @$arrRowData['phone']; 
/* begin tỉnh thành phố và quy mô công ty */
$inputProvince = '';
$inputScale = '';
$source_province=App\ProvinceModel::find((int)@$arrRowData['province_id']);
$source_scale=App\ScaleModel::find((int)@$arrRowData['scale_id']);
if((@$source_province)!=null){
    $data_province=@$source_province->toArray();
    $inputProvince=$data_province['fullname'];
}
if((@$source_scale)!=null){
    $data_scale=@$source_scale->toArray();
    $inputScale=$data_scale['fullname'];
}
/* end tỉnh thành phố và quy mô công ty */
$inputIntro             =   '<textarea name="intro" rows="5" cols="100" class="form-control" >'.@$arrRowData['intro'].'</textarea>'; 
$inputFax =         @$arrRowData['fax'];
$inputWebsite = @$arrRowData['website'];
$inputContactedName=@$arrRowData['contacted_name'];
$inputContactedEmail=@$arrRowData['contacted_email'];
$inputContactedPhone=@$arrRowData['contacted_phone'];
$status                 =   (count($arrRowData) > 0) ? @$arrRowData['status'] : 1 ;
$arrStatus              =   array(-1 => '- Select status -', 1 => 'Publish', 0 => 'Unpublish');  
$ddlStatus              =   cmsSelectbox("status","form-control",$arrStatus,$status,"");
$id                     =   (count($arrRowData) > 0) ? @$arrRowData['id'] : "" ;
$inputID                =   '<input type="hidden" name="id" value="'.@$id.'" />'; 

?>
<div class="portlet light bordered">
    <div class="portlet-title">
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
                            <?php echo $inputProvince; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Quy mô</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $inputScale; ?>
                            <span class="help-block"></span>
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
                        <label class="col-md-3 control-label"><b>Email người liên hệ</b></label>
                        <div class="col-md-9 ctrl-right">
                            <?php echo $inputContactedEmail; ?>
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
                        <label class="col-md-3 control-label"><b>Trạng thái</b></label>
                        <div class="col-md-9">                            
                            <?php echo $ddlStatus; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>     
                </div>                                                                             
            </div>              
        </form>
    </div>
</div>
<script type="text/javascript" language="javascript">
    function resetErrorStatus(){
        var id                   =   $('input[name="id"]');
        var password             =   $('input[name="password"]');                  
        var status               =   $('select[name="status"]');
        
        $(password).closest('.form-group').removeClass("has-error");                   
        $(status).closest('.form-group').removeClass("has-error");        

        $(password).closest('.form-group').find('span').empty().hide();                    
        $(status).closest('.form-group').find('span').empty().hide();        
    }

    function save(){
        var id=$('input[name="id"]').val();         
        var password=$('input[name="password"]').val();
        var password_confirmed=$('input[name="password_confirmed"]').val();           
        var alias=$('input[name="alias"]').val();                        
        var status=$('select[name="status"]').val();     
        var token = $('input[name="_token"]').val();   
        resetErrorStatus();
        var dataItem = new FormData();
        dataItem.append('id',id);        
        dataItem.append('password',password);        
        dataItem.append('password_confirmed',password_confirmed);
        dataItem.append('alias',alias);
        dataItem.append('status',status);                         
        dataItem.append('_token',token);      
        $.ajax({
            url: '<?php echo $linkSave; ?>',
            type: 'POST',
            data: dataItem,
            async: false,
            success: function (data) {
                if(data.checked==1){                            
                    window.location.href = "<?php echo $linkCancel; ?>";
                }else{
                    var data_error=data.error;
                    if(typeof data_error.password               != "undefined"){
                        $('input[name="password"]').closest('.form-group').addClass(data_error.password.type_msg);
                        $('input[name="password"]').closest('.form-group').find('span').text(data_error.password.msg);
                        $('input[name="password"]').closest('.form-group').find('span').show();                        
                    }   
                    if(typeof data_error.alias               != "undefined"){
                        $('input[name="alias"]').closest('.form-group').addClass(data_error.alias.type_msg);
                        $('input[name="alias"]').closest('.form-group').find('span').text(data_error.alias.msg);
                        $('input[name="alias"]').closest('.form-group').find('span').show();                        
                    }                                                                                           
                    if(typeof data_error.status               != "undefined"){
                        $('select[name="status"]').closest('.form-group').addClass(data_error.status.type_msg);
                        $('select[name="status"]').closest('.form-group').find('span').text(data_error.status.msg);
                        $('select[name="status"]').closest('.form-group').find('span').show();
                    }                    
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