@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<form method="post" class="frm margin-top-15" name="frm">
				<input type="hidden" name="filter_page" value="1">         
				{{ csrf_field() }}		
				<?php 			
				$breadcrumb= getBreadCrumbCategoryArticle($category);	
				?>
				<div class="breadcrumb-title">
					<?php echo $breadcrumb; ?>
				</div>
				<h1 style="display: none;"><?php echo @$category['fullname']; ?></h1>
				<h2 style="display: none;"><?php echo @$meta_description; ?></h2>				
				<?php 	
				if(count($items) > 0){
					$k=1;			
					foreach ($items as $key => $value) {
						$id=$value['id'];
						$alias=$value['alias'];
						$fullname=$value['fullname'];
						$permalink=route('frontend.index.index',[$alias]) ;
						$image=get_article_thumbnail($value['image']) ;
						$intro= truncateString($value['intro'],999);
						$count_view=(int)@$value['count_view'];
						$count_view_text=number_format($count_view,0,",",".");				
						?>
						<div class="box-row">
							<div class="row">								
								<div class="col-sm-4"><div class="box-img"><center><figure><a href="<?php echo $permalink; ?>"><img src="<?php echo $image; ?>" /></a></figure></center></div></div>
								<div class="col-sm-8">
									<h3 class="box-title"><a href="<?php echo $permalink; ?>"><?php echo $fullname; ?></a></h3>
									<div class="margin-top-5">
										<div class="view-post-count">
											<i class="fa fa-eye" aria-hidden="true"></i><span class="margin-left-5"><?php echo $count_view_text; ?>&nbsp;lượt xem	</span>
										</div>							
									</div>
									<div class="margin-top-5 box-intro"><?php echo $intro; ?></div>
									<div class="box-readmore margin-top-10"><a href="<?php echo $permalink; ?>">Xem chi tiết</a></div>
								</div>								
							</div>
						</div>						
						<?php			
					}
				}else{
					echo '<center>Đang cập nhật...</center>';
				}				
				if(count($items) > 0){
					?>
					<div class="row">
						<div class="col-lg-12">
							<?php echo $pagination->showPagination(); ?>
						</div>
					</div>							
					<?php					
				}  
				?>
			</form>		
		</div>
		<div class="col-lg-4">@include("frontend.main-sidebar")</div>
	</div>
</div>
@endsection()             