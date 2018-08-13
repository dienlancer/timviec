<div class="jp_spotlight_main_wrapper">
	<div class="spotlight_header_wrapper">
		<h4>Việc làm tại các thành phố lớn</h4>
	</div>
	<div class="clr"></div>
	<div class="padding-left-15 padding-right-15 padding-bottom-15 province-big">
		<?php 
		$data_province_r=App\ProvinceModel::whereIn('alias',['ho-chi-minh','ha-noi','dong-nai','da-nang','binh-duong'])->select('id','fullname','alias')->orderBy('id','desc')->get()->toArray();
		if(count($data_province_r) > 0){
			?>					
			<ul class="lafata">
				<?php 
				foreach ($data_province_r as $key => $value) {								
					?>
					<li>
						<a href="<?php echo route('frontend.index.index',[@$value['alias']]); ?>">
							<div class="hihu">
								<div><img src="<?php echo asset('upload/square-menu.jpg'); ?>"></div>
								<div class="margin-left-10">Việc làm tại <?php echo @$value['fullname']; ?></div>
							</div>																					
						</a>
					</li>
					<?php
				}
				?>							
			</ul>							
			<?php
		}		
		?>
	</div>
</div>