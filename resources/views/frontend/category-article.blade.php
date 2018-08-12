@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<h1 style="display: none;"><?php echo @$title; ?></h1>
<h2 style="display: none;"><?php echo @$meta_description; ?></h2>				
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<?php 			
			$breadcrumb= getBreadCrumbCategoryArticle($category);	
			?>
			<div class="mybreadcrumb margin-top-15">
				<ul itemscope itemtype="http://schema.org/BreadcrumbList" >
					<?php echo $breadcrumb; ?>
				</ul>		
			</div>		
			<?php 
			if(count(@$items) > 0){
				?>
				<form method="post" name="frm">
					<input type="hidden" name="filter_page" value="1">         
					{{ csrf_field() }}	
					<?php 
					foreach (@$items as $key => $value) {
						$id=$value['id'];						
						$permalink=route('frontend.index.index',[$value['alias']]) ;
						$image=get_article_thumbnail($value['image']) ;
						$intro= truncateString($value['intro'],99999);
						$count_view=(int)@$value['count_view'];
						$count_view_text=number_format($count_view,0,",",".");	
						$created_at=datetimeConverterVn(@$value['created_at']);		
						?>
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="jp_blog_cate_left_main_wrapper jp_blog_cate_left_main_wrapper2">
									<div class="jp_first_blog_post_main_wrapper">
										<div class="jp_first_blog_post_img">
											<a href="<?php echo @$permalink; ?>" title="<?php echo @$value['alt_image']; ?>"><img src="<?php echo asset('upload/'.@$value['image']); ?>" class="img-responsive" alt="<?php echo @$value['alt_image']; ?>" title="<?php echo @$value['alt_image']; ?>" /></a>
										</div>
										<div class="jp_first_blog_post_cont_wrapper">
											<ul>
												<li><a href="javascript:void(0);"><i class="fa fa-calendar"></i> &nbsp;&nbsp;<?php echo @$created_at; ?></a></li>
												<li><a href="javascript:void(0);"><i class="fa fa-clone"></i> &nbsp;&nbsp;IT jobs</a></li>
											</ul>
											<h3><a href="<?php echo @$permalink; ?>"><?php echo @$value['fullname']; ?></a></h3>
											<p><?php echo @$value['intro']; ?></p>
										</div>
										<div class="jp_first_blog_bottom_cont_wrapper">	
											<div class="jp_blog_bottom_left_cont">
												<ul>
													<li><img src="{{asset('public/frontend/job-light/images/content/blog_small_img.jpg')}}" alt="small_img" class="img-circle" />&nbsp;&nbsp; Jhon Doe</li>
												</ul>
											</div>										
											<div class="jp_blog_bottom_right_cont">
												<p class="hidden-xs"><a href="javascript:void(0);" class="hidden-xs"><i class="fa fa-comments"></i></a></p>
												<ul>
													<li>SHARE :</li>
													<li><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
													<li><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
													<li><a href="javascript:void(0);"><i class="fa fa-pinterest-p"></i></a></li>
													<li><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
													<li class="hidden-xs"><a href="javascript:void(0);"><i class="fa fa-google-plus"></i></a></li>
													<li class="hidden-xs"><a href="javascript:void(0);"><i class="fa fa-vimeo"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<?php
					}					
					?>
					<div class="row">
						<div class="col-lg-12">
							<?php echo $pagination->showPagination(); ?>
						</div>
					</div>							
				</form>
				<?php
			}else{
				echo '<center>Đang cập nhật...</center>';
			}
			?>													
		</div>
		<div class="col-lg-4"></div>
	</div>
</div>
@endsection()             