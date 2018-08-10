<div class="source-recruitment-box margin-top-15">
	<div class="source-recruitment-title">
		<i class="fas fa-suitcase"></i>
		<span class="margin-left-5">NHÀ TUYỂN DỤNG HÀNG ĐẦU</span>
	</div>
	<div class="margin-top-10 padding-left-15 padding-right-15 padding-bottom-15">
		<?php 
		$data_employer_r=App\EmployerModel::whereRaw('status = 1')->select('id','fullname','alias','logo')->orderBy('id','desc')->take(9)->get()->toArray();
		if(count($data_employer_r) > 0){
			$k=0;				
			foreach ($data_employer_r as $key => $value) {
				$employer_r_img='';
				if(!empty($value['logo'])){
					$employer_r_img=asset('upload/'.$width.'x'.$height.'-'.$value['logo']);
				}else{
					$employer_r_img=asset('upload/no-logo.png');
				}
				if((int)@$k%3==0){
					echo '<div class="row">';
				}
				?>
				<div class="col-lg-4">
					<div class="employer-box margin-top-5">
						<a title="<?php echo $value['fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>"><img title="<?php echo $value['fullname']; ?>" alt="<?php echo $value['fullname']; ?>"  src="<?php echo $employer_r_img; ?>"></a>
					</div>
				</div>
				<?php
				$k++;					 
				if($k%3 == 0 || $k==count($data_employer_r)){
					echo '</div>';
				}								
			}				
		}
		?>
	</div>
</div>