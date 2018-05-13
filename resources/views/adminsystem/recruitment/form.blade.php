@extends("adminsystem.master")
@section("content")
<?php 
$setting= getSettingSystem();
$id                     =   (count($arrRowData) > 0) ? @$arrRowData['id'] : "" ;
$source_sex=App\SexModel::whereRaw('status = ?',[1])->orderBy('id','asc')->select('id','fullname')->get()->toArray();
$source_work=App\WorkModel::whereRaw('status = ?',[1])->orderBy('id','asc')->select('id','fullname')->get()->toArray();
$source_literacy=App\LiteracyModel::whereRaw('status = ?',[1])->orderBy('id','asc')->select('id','fullname')->get()->toArray();
$source_experience=App\ExperienceModel::whereRaw('status = ?',[1])->orderBy('id','asc')->select('id','fullname')->get()->toArray();
$source_salary=App\SalaryModel::whereRaw('status = ?',[1])->orderBy('id','asc')->select('id','fullname')->get()->toArray();
$source_working_form=App\WorkingFormModel::whereRaw('status = ?',[1])->orderBy('id','asc')->select('id','fullname')->get()->toArray();
$source_probationary=App\ProbationaryModel::whereRaw('status = ?',[1])->orderBy('id','asc')->select('id','fullname')->get()->toArray();
$source_job=App\JobModel::whereRaw('status = ?',[1])->orderBy('id','asc')->select('id','fullname')->get()->toArray();
$source_province=App\ProvinceModel::whereRaw('status = ?',[1])->orderBy('id','asc')->select('id','fullname')->get()->toArray();

$source_recruitment_job=App\RecruitmentJobModel::whereRaw('recruitment_id = ?',[(int)@$id])->select('job_id')->get()->toArray();
$source_recruitment_place=App\RecruitmentPlaceModel::whereRaw('recruitment_id = ?',[(int)@$id])->select('province_id')->get()->toArray();
$source_job_id=array();
$source_province_id=array();
if(count($source_recruitment_job) > 0){
    foreach ($source_recruitment_job as $key => $value) {
      $source_job_id[]=$value['job_id'];
  }
}
if(count($source_recruitment_place) > 0){
    foreach ($source_recruitment_place as $key => $value) {
      $source_province_id[]=$value['province_id'];
  }
}      
$arrRowData['job_id']=$source_job_id;
$arrRowData['province_id']=$source_province_id;
$arrRowData['duration']=datetimeConverterVn($arrRowData['duration']);      

$linkCancel             =   route('adminsystem.'.$controller.'.getList');
$linkSave               =   route('adminsystem.'.$controller.'.save');
$linkCreateAlias        =   route('adminsystem.'.$controller.'.createAlias');
$inputFullName          =   '<input type="text" class="form-control" name="fullname"  disabled     onblur="createAlias();"   value="'.@$arrRowData['fullname'].'">'; 
$inputAlias             =   '<input type="text" class="form-control" name="alias"        disabled     value="'.@$arrRowData['alias'].'">';
$inputQuantity          =   '<input type="text" class="form-control" name="quantity"       value="'.@$arrRowData['quantity'].'">';
$ddlSex=cmsSelectboxCategory("sex_id","form-control",$source_sex,@$arrRowData['sex_id'],'','Chọn giới tính');  
$inputDescription       =   '<textarea name="description" rows="10" cols="100" class="form-control" >'.@$arrRowData['description'].'</textarea>'; 
$inputRequirement       =   '<textarea name="requirement" rows="10" cols="100" class="form-control" >'.@$arrRowData['requirement'].'</textarea>'; 
$ddlWork=cmsSelectboxCategory("work_id","form-control",$source_work,@$arrRowData['work_id'],'','Chọn tính chất công việc');
$ddlLiteracy=cmsSelectboxCategory("literacy_id","form-control",$source_literacy,@$arrRowData['literacy_id'],'','Chọn trình độ học vấn');
$ddlExperience=cmsSelectboxCategory("experience_id","form-control",$source_experience,@$arrRowData['experience_id'],'','Chọn kinh nghiệm');
$ddlSalary=cmsSelectboxCategory("salary_id","form-control",$source_salary,@$arrRowData['salary_id'],'','Chọn mức lương');
$inputCommissionFrom          =   '<input type="text" class="form-control" name="commission_from"     value="'.@$arrRowData['commission_from'].'">'; 
$inputCommissionTo          =   '<input type="text" class="form-control" name="commission_to"     value="'.@$arrRowData['commission_to'].'">'; 
$ddlWorkingForm=cmsSelectboxCategory("working_form_id","form-control",$source_working_form,@$arrRowData['working_form_id'],'','Chọn hình thức làm việc');
$ddlProbationary=cmsSelectboxCategory("probationary_id","form-control",$source_probationary,@$arrRowData['probationary_id'],'','Chọn thời gian thử việc');
$inputBenefit       =   '<textarea name="benefit" rows="10" cols="100" class="form-control" >'.@$arrRowData['benefit'].'</textarea>'; 
$ddlJob        =cmsSelectboxMultiple("job_id", 'form-control', @$source_job, @$arrRowData['job_id'],'','Chọn ngành nghề');
$ddlProvince        =cmsSelectboxMultiple("province_id", 'form-control', @$source_province, @$arrRowData['province_id'],'','Chọn nơi làm việc');
$inputDuration='<input type="text" readonly="readonly"  name="duration" class="form-control"  value="'.@$arrRowData['duration'].'" >';
$status                 =   (count($arrRowData) > 0) ? @$arrRowData['status'] : 1 ;
$arrStatus              =   array(-1 => '- Select status -', 1 => 'Hiển thị tin', 0 => 'Ẩn tin');  
$ddlStatus              =   cmsSelectbox("status","form-control",$arrStatus,$status,"");

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
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Tiêu đề</b></label>
                        <div class="col-md-10">
                            <?php echo $inputFullName; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>   
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Alias</b></label>
                        <div class="col-md-10">
                            <?php echo $inputAlias; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div> 
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Số lượng cần tuyển</b></label>
                        <div class="col-md-10">
                            <?php echo $inputQuantity; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Giới tính</b></label>
                        <div class="col-md-10">
                            <?php echo $ddlSex; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Mô tả công việc</b></label>
                        <div class="col-md-10">
                            <?php echo $inputDescription; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Yêu cầu công việc</b></label>
                        <div class="col-md-10">
                            <?php echo $inputRequirement; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Tính chất công việc</b></label>
                        <div class="col-md-10">
                            <?php echo $ddlWork; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Trình độ</b></label>
                        <div class="col-md-10">
                            <?php echo $ddlLiteracy; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Kinh nghiệm</b></label>
                        <div class="col-md-10">
                            <?php echo $ddlExperience; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Mức lương</b></label>
                        <div class="col-md-10">
                            <?php echo $ddlSalary; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Mức hoa hồng</b></label>
                        <div class="col-md-10">
                            <div class="box-logo">
                                <div><?php echo $inputCommissionFrom; ?></div>
                                <div class="margin-left-15" ><?php echo $inputCommissionTo; ?></div>
                            </div>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Hình thức làm việc</b></label>
                        <div class="col-md-10">
                            <?php echo $ddlWorkingForm; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Thời gian thử việc</b></label>
                        <div class="col-md-10">
                            <?php echo $ddlProbationary; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Quyền lợi</b></label>
                        <div class="col-md-10">
                            <?php echo $inputBenefit; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>  
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Ngành nghề</b></label>
                        <div class="col-md-10">
                            <?php echo $ddlJob; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>    
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Nơi làm việc</b></label>
                        <div class="col-md-10">
                            <?php echo $ddlProvince; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>    
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Hết hạn</b></label>
                        <div class="col-md-10">
                            <?php echo $inputDuration; ?>
                            <span class="help-block"></span>
                        </div>
                    </div>                         
                </div>                                                 
                <div class="row"> 
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-label"><b>Hiển thị tin</b></label>
                        <div class="col-md-10">                            
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
    

    function save(){
        var id=$('input[name="id"]').val();        
        var fullname    = $('input[name="fullname"]').val();
        var alias       = $('input[name="alias"]').val();
        var quantity       = $('input[name="quantity"]').val();
        var sex_id      = $('select[name="sex_id"]').val();
        var description =   $('textarea[name="description"]').val();
        var requirement = $('textarea[name="requirement"]').val();
        var work_id     = $('select[name="work_id"]').val();
        var literacy_id = $('select[name="literacy_id"]').val();
        var experience_id = $('select[name="experience_id"]').val();
        var salary_id = $('select[name="salary_id"]').val();
        var commission_from = $('input[name="commission_from"]').val();
        var commission_to = $('input[name="commission_to"]').val();
        var working_form_id = $('select[name="working_form_id"]').val();
        var probationary_id = $('select[name="probationary_id"]').val();
        var benefit = $('textarea[name="benefit"]').val();
        var job_id = $('select[name="job_id[]"]').val();
        var province_id = $('select[name="province_id[]"]').val();
        var duration = $('input[name="duration"]').val();        
        var status=$('select[name="status"]').val();     
        var token = $('input[name="_token"]').val();   
        
        var dataItem={
            "id":id,
            "fullname":fullname,  
            "alias":alias,          
            "quantity":quantity,
            "sex_id":sex_id,
            "description":description,
            "requirement":requirement,
            "work_id":work_id,
            "literacy_id":literacy_id,
            "experience_id":experience_id,
            "salary_id":salary_id,
            "commission_from":commission_from,
            "commission_to":commission_to,
            "working_form_id":working_form_id,
            "probationary_id":probationary_id,
            "benefit":benefit,
            "job_id":job_id,
            "province_id":province_id,
            "duration":duration,
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
    function createAlias(){
        var id=$('input[name="id"]').val();   
        var fullname    = $('input[name="fullname"]').val();        
        var token       = $('form[name="frm"] > input[name="_token"]').val();     
        var dataItem={      
            "id":id,      
            "fullname":fullname,            
            "_token": token
        };   
        $('input[name="alias"]').val(''); 
            
        $.ajax({
            url: '<?php echo $linkCreateAlias; ?>',
            type: 'POST',
            data: dataItem,            
            async: false,
            success: function (data) {                
                if(data.checked==1){
                    $('input[name="alias"]').val(data.alias); 
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
    $(document).ready(function(){
            $( 'input[name="duration"]' ).datepicker({
                dateFormat: "dd/mm/yy",
                defaultDate: "+3d",
                changeYear: true,
                changeMonth: true,
                yearRange: "1975:3000"
            });
        });     
</script>
@endsection()            