<div class="source-recruitment-box margin-top-15">
	<div class="source-recruitment-title">
		<i class="fas fa-suitcase"></i>
		<span class="margin-left-5">VIỆC LÀM LƯƠNG CAO</span>
	</div>
	<div class="margin-top-15 padding-left-15 padding-right-15 padding-bottom-15">
		<?php 		
		$query=DB::table('recruitment')
		->join('employer','recruitment.employer_id','=','employer.id')
		->join('salary','recruitment.salary_id','=','salary.id');
		$query->where('recruitment.status',1);
		$query->where('recruitment.status_employer',1);
		$query->where('recruitment.status_high_salary',1);
		$source=$query->select(
			'recruitment.id',
			'recruitment.fullname',
			'recruitment.alias',
			'recruitment.duration',
			'recruitment.status_hot',
			'salary.fullname as salary_name',
			'employer.fullname as employer_fullname',
			'employer.alias as employer_alias',
			'employer.logo'
		)
		->groupBy(
			'recruitment.id',
			'recruitment.fullname',
			'recruitment.alias',
			'recruitment.duration',
			'recruitment.status_hot',
			'salary.fullname',
			'employer.fullname',
			'employer.alias',
			'employer.logo'
		)
		->orderBy('recruitment.id', 'desc')
		->take(10)
		->get()
		->toArray();		
		if(count(@$source) > 0){
			$data=convertToArray(@$source);	
			foreach ($data as $key => $value){
				$fullname=truncateString($value['fullname'],80) ;
				$employer=truncateString($value['employer_fullname'],40);
				$duration=datetimeConverterVn($value['duration']);
				$hot_gif='';
				if((int)@$value['status_hot'] == 1){
					$hot_gif= '&nbsp;<img src="'.asset('upload/hot.gif').'" width="40" />';
				}
				$logo='';
				if(!empty($value['logo'])){
					$logo=asset('upload/'.$width.'x'.$height.'-'.$value['logo']);
				}else{
					$logo=asset('upload/no-logo.png');
				}
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
					$province_text.='<span class="kara-province"><a title="'.@$value_province["fullname"].'" href="'.route('frontend.index.index',[$value_province['alias']]).'">'.$value_province['fullname'].'</a></span>&nbsp;,';
				}
				$province_text=mb_substr($province_text, 0,mb_strlen($province_text)-1);
				?>
				<div class="hot-job-box">
					<div class="nysaki">
						<div class="hot-job-img">
							<a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[@$value['employer_alias']]); ?>"><img title="<?php echo @$value['employer_fullname']; ?>" alt="<?php echo @$value['employer_fullname']; ?>" src="<?php echo @$logo; ?>"></a>
						</div>
						<div class="hot-job-right">
							<div class="hot-job-name"><a title="<?php echo $value['fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['alias']]); ?>"><?php echo $fullname; ?></a><?php echo $hot_gif; ?></div>
							<div class="khaly margin-top-10"><a title="<?php echo $value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['employer_alias']]); ?>"><?php echo $employer; ?></a></div>										
						</div>		
						<div class="clr"></div>		
					</div>
					<div class="batay">
						<div><i class="far fa-money-bill-alt"></i>&nbsp;<?php echo $value['salary_name']; ?></div>
						<div class="margin-top-10">
							<div><i class="far fa-clock"></i>&nbsp;<?php echo $duration; ?></div>
							<div><i class="fas fa-map-marker-alt"></i>&nbsp;<?php echo $province_text; ?></div>
						</div>
					</div>
					<div class="clr"></div>
				</div>
				<?php
			}
		}	
		?>
	</div>
</div>
