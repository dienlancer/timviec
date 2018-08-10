<div class="source-recruitment-box margin-top-15">
	<div class="source-recruitment-title">
		<i class="fas fa-suitcase"></i>
		<span class="margin-left-5">VIỆC LÀM HẤP DẪN</span>
	</div>
	<div class="margin-top-15 padding-left-15 padding-right-15 padding-bottom-15">
		<?php 		
		$query=DB::table('recruitment')
		->join('employer','recruitment.employer_id','=','employer.id')
		->join('salary','recruitment.salary_id','=','salary.id');
		$query->where('recruitment.status',1);
		$query->where('recruitment.status_employer',1);
		$query->where('recruitment.status_attractive',1);
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
		->take(30)
		->get()
		->toArray();	
		if(count(@$source) > 0){
			$data=convertToArray(@$source);	
			?>
			<table class="cidu">
				<tr>
					<th width="40%">Vị trí tuyển dụng</th>
					<th width="30%">Khu vực</th>
					<th width="20%">Mức lương</th>
					<th width="10%">Hạn nộp HS</th>
				</tr>
				<?php 
				foreach ($data as $key => $value) {							
					$fullname=truncateString($value['fullname'],70) ;
					$employer=truncateString($value['employer_fullname'],40);
					$duration=datetimeConverterVn($value['duration']);
					$hot_gif='';
					if((int)@$value['status_hot'] == 1){
						$hot_gif= '&nbsp;<img src="'.asset('upload/hot.gif').'" width="40" />';
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
						$province_text.='<div class="padding-top-5 padding-bottom-5 madrid"><a href="'.route('frontend.index.index',[$value_province['alias']]).'">'.$value_province['fullname'].'</a></div>';
					}
					?>
					<tr>
						<td>
							<div class="hot-job-name vivan-hd"><a title="<?php echo @$value['fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['alias']]); ?>"><?php echo @$fullname; ?></a><?php echo @$hot_gif; ?></div>
							<div class="hot-job-employer vivan-hd"><a title="<?php echo @$value['employer_fullname']; ?>" href="<?php echo route('frontend.index.index',[$value['employer_alias']]); ?>"><?php echo @$employer; ?></a></div>
						</td>
						<td><?php echo @$province_text; ?></td>
						<td><?php echo @$value['salary_name']; ?></td>
						<td><?php echo @$duration; ?></td>
					</tr>
					<?php
				}
				?>
			</table>	
			<?php
		}	
		?>
	</div>
</div>
