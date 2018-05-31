@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<div class="container margin-top-15">
	<div class="row">
		<div class="col-lg-8">
			<?php 
			$setting= getSettingSystem();
			$width=$setting['product_width']['field_value'];
			$height=$setting['product_height']['field_value'];  
			if(count(@$item) > 0){		
				$id= (int)@$item["id"];
				$fullname = @$item["fullname"];	
				$count_view=(int)@$item['count_view'];
				$count_view++;
				$row				= App\RecruitmentModel::find((int)@$id); 
				$row->count_view=(int)@$count_view;
				$row->save();
				$count_view_text=number_format((int)@$count_view,0,",",".");		
				$data_employer=App\EmployerModel::find((int)@$item['employer_id'])->toArray();
				$logo='';
				if(!empty($data_employer['logo'])){
					$logo=asset('upload/'.$width.'x'.$height.'-'.$data_employer['logo']);
				}else{
					$logo=asset('upload/no-logo.png');
				}
				?>
				<div class="col-lg-3 no-padding-left">
					<div class="box-employer-logo"><center><img src="<?php echo $logo; ?>"></center></div>
				</div>				
				<div class="col-lg-9">
					<div class="recruitment-title"><?php echo $fullname; ?></div>
					<div class="employer-title margin-top-10"><span><i class="far fa-building"></i></span><span class="margin-left-10"><?php echo @$data_employer['fullname']; ?></span></div>
					<div class="margin-top-10 khaly">
						<span><b>Địa điểm&nbsp;:</b></span>
						<span class="margin-left-10">
							<?php 
							$source_province3=DB::table('province')
							->join('recruitment_place','province.id','=','recruitment_place.province_id')							
							->where('recruitment_place.recruitment_id',(int)@$id)
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
							$data_province3=convertToArray($source_province3);					
							$province_text3='';
							foreach ($data_province3 as $key_province3 => $value_province3) {
								$province_text3.='<a href="'.route('frontend.index.index',[@$value_province3['alias']]).'">'.@$value_province3['fullname'].'</a>' .' ,';
							}
							$province_title3=mb_substr($province_text3, 0,mb_strlen($province_text3)-1);
							echo $province_title3;
							?>
						</span>						
					</div>
					<div class="margin-top-10 fiob">
						<span><b>Mức lương&nbsp;:</b></span>
						<span class="margin-left-10">							
							<?php 
							$data_salary=App\SalaryModel::find($item['salary_id'])->toArray();
							echo $data_salary['fullname'];
							?>
						</span>						
					</div>
					<div class="margin-top-10 fiob">
						<span><b>Hạn nộp hồ sơ&nbsp;:</b></span>
						<span class="margin-left-10">							
							<?php 
							$duration=datetimeConverterVn($item['duration']);
							echo $duration;
							?>
						</span>						
					</div>
					<div class="margin-top-10">
						<div class="vihamus-3">
							<a href="javascript:void(0);"   >
								<div class="narit">
									<div><i class="far fa-edit"></i></div>
									<div class="margin-left-5">Nộp Hồ Sơ</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<?php
			}
			?>	
		</div>
		<div class="col-lg-4">@include("frontend.main-sidebar")</div>
	</div>
</div>		
@endsection()

