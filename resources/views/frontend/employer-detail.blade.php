@extends("frontend.master")
@section("content")
<?php 
$seo=getSeo();
$setting= getSettingSystem();
$seo_title="";
if(!empty(@$title)){
	$seo_title=@$title;
}else{	
	$seo_title=@$seo["title"];
}
$seo_meta_description="";
if(!empty(@$meta_description)){
	$seo_meta_description=@$meta_description;
}else{
	$seo_meta_description=@$seo["meta_description"];
}
$width=$setting['product_width']['field_value'];
$height=$setting['product_height']['field_value'];  
?>
<h1 style="display: none;"><?php echo @$seo_title; ?></h1>
<h2 style="display: none;"><?php echo @$seo_meta_description; ?></h2>
@include("frontend.content-top")
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<form name="frm" method="POST" enctype="multipart/form-data" class="margin-top-15">
				<input type="hidden" name="filter_page" value="1">        
				{{ csrf_field() }}
				<?php 
				if(count(@$item) > 0){
					$logo='';
					if(!empty($item['logo'])){
						$logo=asset('upload/'.$width.'x'.$height.'-'.$item['logo']);
					}else{
						$logo=asset('upload/no-logo.png');
					}
					?>
					<div class="nibota">
						<div class="nikatasuzuki margin-top-15">
							<div class="tibolee-icon"><i class="far fa-folder-open"></i></div>
							<h1 class="tibolee rambada"><?php echo @$item['fullname']; ?></h1>
						</div>						
						<div class="lonatraction xem-tat-ca"><a href="javascript:void(0);">XEM TẤT CẢ</a></div>
					</div>	
					<div class="row">
						<div class="col-lg-3">							
							<div class="box-employer-logo"><center><img src="<?php echo $logo; ?>"></center></div>
							<div class="margin-top-40">
								<?php 
								if((int)@$item['status_authentication'] > 0){
									?>
									<center><img src="<?php echo asset('upload/ok.png'); ?>"></center>
									<?php
								}else{
									?>
									<center><img src="<?php echo asset('upload/no-ok.png'); ?>"></center>
									<?php
								}
								?>
							</div>
						</div>
						<div class="col-lg-9">
							<div class="margin-top-10">
								<span class="lazasa"><b>Địa chỉ&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$item['address']; ?></span>
							</div>
							<?php 
							if(!empty(@$item['website'])){
								?>
								<div class="margin-top-10">
								<span class="lazasa"><b>Website&nbsp;:&nbsp;</b></span><span class="lazasa"><?php echo @$item['website']; ?></span>
								</div>
								<?php
							}
							?>	
							<div class="margin-top-10 vidola">
								<?php echo @$item['intro']; ?>
							</div>						
						</div>
					</div>
					<?php
				}				
				if(count(@$items) > 0){
					?>						
					<table width="100%"  class="cidu margin-top-15">
						<tr>
							<th><font color="#E30000">Vị trí tuyển dụng</font></th>
							<th><font color="#E30000">Khu vực</font></th>
							<th><font color="#E30000">Mức lương</font></th>
							<th><center><font color="#E30000">Ngày hết hạn</font></center></th>
						</tr>
						<?php 
						foreach ($items as $key => $value) {
							$fullname= truncateString($value['fullname'],70);
							$duration=datetimeConverterVn($value['duration']);
							$employer_name=truncateString($value['employer_fullname'],9999);
							$source_province=DB::table('province')
							->join('recruitment_place','province.id','=','recruitment_place.province_id')							
							->where('recruitment_place.recruitment_id',(int)@$value['id'])
							->select(								
								'province.fullname',
								'province.alias'								
							)
							->groupBy(								
								'province.fullname',
								'province.alias'								
							)
							->orderBy('province.id', 'desc')						
							->get()
							->toArray();	
							$data_province=convertToArray($source_province);					
							$province_text='';
							foreach ($data_province as $key_province => $value_province) {
								$province_text.='<div class="padding-top-5 padding-bottom-5 madrid"><a href="'.route('frontend.index.index',[$value_province['alias']]).'">'.$value_province['fullname'].'</a></div>';
							}
							$hot_gif='';
							if((int)@$value['status_hot'] == 1){
								$hot_gif= '&nbsp;<img src="'.asset('upload/hot.gif').'" width="40" />';
							}
							?>
							<tr>
								<td>
									<div class="hot-job-name vivan-hd"><a title="<?php echo $value['fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['alias']]); ?>"><?php echo $fullname; ?></a><?php echo $hot_gif; ?></div>
									<div class="hot-job-employer vivan-hd"><a title="<?php echo $value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['employer_alias']]); ?>"><?php echo $employer_name; ?></a></div>
								</td>
								<td><?php echo $province_text; ?></td>
								<td><?php echo $value['salary_name']; ?></td>
								<td><center><?php echo $duration; ?></center></td>
							</tr>
							<?php
						}
						?>						
					</table>
					<?php
					echo '<div class="margin-top-15">'.@$pagination->showPagination().'</div>';
				}else{
					?><center>Chưa có dữ liệu...</center><?php
				}  
				?>		
			</form>			
		</div>
		<div class="col-lg-4">@include("frontend.main-sidebar")</div>
	</div>		
</div>
@endsection()               
