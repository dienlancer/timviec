@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<?php 
$seo=getSeo();
$disabled_status='';
$register_status='onclick="apply();"';
$arrUser=array();
$id=0;
if(Session::has("vmuser")){
	$arrUser=Session::get("vmuser");
	$id=@$arrUser['id'];
}     
$source_recruitment=\App\RecruitmentModel::find((int)@$recruitment_id);
$data_recruitment=array();
$recruitment_name='';
if($source_recruitment != null){
	$data_recruitment=$source_recruitment->toArray();	
	$recruitment_name=@$data_recruitment['fullname'];
}
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<h2 style="display: none;"><?php echo $seo["meta_description"]; ?></h2>
{{ csrf_field() }}
<input type="hidden" name="recruitment_id" value="<?php echo @$recruitment_id; ?>">				
<div class="container">
	<div class="row">
		<div class="col-lg-9">
			<form name="frm-apply-logined" method="POST" enctype="multipart/form-data">
				<h1 class="dn-dk-h">NỘP HỒ SƠ TRỰC TUYẾN</h1>		
				<?php 
				if(count(@$msg) > 0){
					$type_msg='';					
					if((int)@$checked == 1){
						$disabled_status='disabled';
						$register_status='';
						$type_msg='note-success';
					}else{
						$type_msg='note-danger';
					}
					?>
					<div class="note margin-top-15 <?php echo $type_msg; ?>" >
						<ul>
							<?php 
							foreach (@$msg as $key => $value) {
								?>
								<li><?php echo $value; ?></li>
								<?php
							}
							?>                              
						</ul>	
					</div>      
					<?php
				}						
				$query=DB::table('profile')   ;     
				$query->where('profile.candidate_id',(int)@$id);
				$query->where('profile.status',1);    				
				$source_profile=$query->select('profile.id','profile.fullname','profile.status')
				->groupBy('profile.id','profile.fullname','profile.status') 
				->get()->toArray();	
				$data_profile=convertToArray($source_profile);		
				?>
				<div class="row">
					<div class="col-lg-12">
						<div class="margin-top-15"><div class="nop-chon-viec">Bạn muốn nộp hồ sơ vào vị trí <span class="recruitment-name">"<?php echo $recruitment_name; ?>"</span></div></div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="margin-top-15">Vui lòng chọn 1 trong 2 cách dưới đây</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="margin-top-15 nop-chon-viec">Cách 1 : Nộp hồ sơ trên hệ thống Chọn Việc</div>
					</div>
				</div>
				<div class="list-profile">
					<?php		
					if(count(@$data_profile) > 0){
						foreach ($data_profile as $key => $value) {
							$status='';
							if((int)@$value['status'] == 1){
								$status='Đã duyệt';
							}else{
								$status='Chưa duyệt';
							}
							?>
							<div class="row mia">
								<div class="col-xs-1"><input type="radio" name="profile_id" value="<?php echo $value['id'] ?>"></div> 
								<div class="col-xs-9"><?php echo $value['fullname']; ?></div>
								<div class="col-xs-2"><?php echo $status; ?></div>
							</div>		
							<?php
						}
					}else{
						?>
						<div class="row">
							<div class="col-lg-12"><div class="margin-top-15">Chưa có bộ hồ sơ nào</div></div>
						</div>
						<?php
					}				
					?>						
				</div>	
				<div class="row margin-top-10">
					<div class="col-xs-2"></div>
					<div class="col-xs-10"><div class="btn-dang-ky"><a href="javascript:void(0);" <?php echo $register_status; ?> >NỘP HỒ SƠ</a></div></div>
				</div>	
				<div class="row">
					<div class="col-lg-12">
						<div class="margin-top-15 nop-chon-viec">Cách 2 : Tải hồ sơ đính kèm từ máy tính</div>
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
	function apply(){		  
        var profile_id=$('form[name="frm-apply-logined"]').find('input[name="profile_id"]').val();                
        var recruitment_id=$('form[name="frm-apply-logined"]').find('input[name="recruitment_id"]').val(); 
        var token=$('form[name="frm-apply-logined"]').find('input[name="_token"]').val();                

        var dataItem = new FormData();
        dataItem.append('profile_id',profile_id);        
        dataItem.append('recruitment_id',recruitment_id);
        dataItem.append('_token',token);
        $.ajax({
            url: '<?php echo route("frontend.index.loginApply"); ?>',
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