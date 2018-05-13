@extends("adminsystem.master")
@section("content")
<?php 
$setting= getSettingSystem();
$linkCancel             =   route('adminsystem.'.$controller.'.getList',[@$candidate_id]);
$linkSave               =   route('adminsystem.'.$controller.'.save');

$status                 =   (count(@$arrRowData) > 0) ? (int)@$arrRowData['status'] : 1 ;
$arrStatus              =   array(-1 => '- Select status -', 1 => 'Publish', 0 => 'Unpublish');  
$ddlStatus              =   cmsSelectbox("status","form-control",@$arrStatus,@$status,"");
$id                     =   (count(@$arrRowData) > 0) ? @$arrRowData['id'] : "" ;
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
            <div class="form-body">
                <?php 
                $candidate_fullname='';         
                $sex_id=0;                   
                $birthday='';
                $address='';
                $phone='';
                $email='';
                $avatar='';
                $product_width = $setting['product_width']['field_value'];
                $product_height = $setting['product_height']['field_value'];  
                $source_candidate=App\CandidateModel::find(@$candidate_id);
                if($source_candidate != null){
                    $data_candidate=$source_candidate->toArray();
                    $candidate_fullname=$data_candidate['fullname'];
                    $sex_id=(int)$data_candidate['sex_id'];
                    $birthday=datetimeConverterVn($data_candidate['birthday']);
                    $address=$data_candidate['address'];
                    $phone=$data_candidate['phone'];
                    $email=$data_candidate['email'];
                    if(!empty(@$data_candidate['avatar'])){
                        $avatar='<div class="margin-top-15"><img width="150" height="150" src="'.asset("/upload/" . $product_width . "x" . $product_height . "-".@$data_candidate['avatar']).'"  /></div>';
                    }else{
                        $avatar='<div class="margin-top-15"><img width="100" height="100" src="'.asset("upload/avatar-default-icon.png").'"  /></div>';
                    }                    
                }                            
                ?>       
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Họ tên</b></label>
                        <div class="col-md-9">                              
                            <label class="control-label"><?php echo $candidate_fullname ?></label>                                              
                        </div>
                    </div>                         
                </div>     
                <?php 
                $source_sex=App\SexModel::find(@$sex_id);
                if($source_sex != null){
                    $data_sex=$source_sex->toArray();
                    $sex_name=$data_sex['fullname'];
                }                
                ?>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Giới tính</b></label>
                        <div class="col-md-9">                                   
                            <label class="control-label"><?php echo $sex_name; ?></label>                                              
                        </div>
                    </div>                         
                </div>                   
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Ngày sinh</b></label>
                        <div class="col-md-9">                                   
                            <label class="control-label"><?php echo $birthday; ?></label>                                              
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Địa chỉ</b></label>
                        <div class="col-md-9">                                   
                            <label class="control-label"><?php echo $address; ?></label>                                              
                        </div>
                    </div>                         
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Số điện thoại</b></label>
                        <div class="col-md-9">                                   
                            <label class="control-label"><?php echo $phone; ?></label>                                              
                        </div>
                    </div>                         
                </div>   
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Email</b></label>
                        <div class="col-md-9">                                   
                            <label class="control-label"><?php echo $email; ?></label>                                              
                        </div>
                    </div>                         
                </div>                    
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Hình đại diện</b></label>
                        <div class="col-md-9">                                   
                            <?php echo $avatar; ?>
                        </div>
                    </div>                         
                </div>                   
                <hr>   
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>THÔNG TIN CHUNG</b></label>
                        <div class="col-md-9">                                   
                            
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Tiêu đề hồ sơ</b></label>
                        <div class="col-md-9">                                   
                            <label class="control-label"><?php echo @$arrRowData['fullname']; ?></label>                                              
                        </div>
                    </div>                         
                </div> 
                <?php 
                $literacy_name='';
                $source_literacy=App\LiteracyModel::find(@$arrRowData['literacy_id']);                
                if($source_literacy!=null){
                    $data_literacy=$source_literacy->toArray();
                    $literacy_name=$data_literacy['fullname'];
                }
                ?>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Trình độ cao nhất</b></label>
                        <div class="col-md-9">                                   
                            <label class="control-label"><?php echo @$literacy_name; ?></label>                                              
                        </div>
                    </div>                         
                </div>    
                <?php 
                $experience_name='';
                $source_experience=App\ExperienceModel::find(@$arrRowData['experience_id']);                
                if($source_experience!=null){
                    $data_experience=$source_experience->toArray();
                    $experience_name=$data_experience['fullname'];
                }
                ?>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-label"><b>Số năm kinh nghiệm</b></label>
                        <div class="col-md-9">                                   
                            <label class="control-label"><?php echo @$experience_name; ?></label>                                              
                        </div>
                    </div>                         
                </div>                                                                       
            </div>              
        </form>
    </div>
</div>
<script type="text/javascript" language="javascript">
   
    function save(){
        var id=$('input[name="id"]').val();        
        var fullname=$('input[name="fullname"]').val();                
        var alias=$('input[name="alias"]').val();                
        var sort_order=$('input[name="sort_order"]').val();
        var status=$('select[name="status"]').val();     
        var token = $('input[name="_token"]').val();   
        
        var dataItem={
            "id":id,
            "fullname":fullname,  
            "alias":alias,          
            "sort_order":sort_order,
            "status":status,
            "_token": token
        };
        $.ajax({
            url: '<?php echo $linkSave; ?>',
            type: 'POST',
            data: dataItem,
            async: false,
            success: function (data) {
                if(data.checked==1){                            
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
        });
    }          
    
</script>
@endsection()            