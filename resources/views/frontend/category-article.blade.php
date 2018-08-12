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
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="jp_blog_cate_left_main_wrapper">
						<div class="jp_first_blog_post_main_wrapper">
							<div class="jp_first_blog_post_img">
								<img src="{{asset('public/frontend/job-light/images/content/blog_img1.jpg')}}" class="img-responsive" alt="blog_img" />
							</div>
							<div class="jp_first_blog_post_cont_wrapper">
								<ul>
									<li><a href="#"><i class="fa fa-calendar"></i> &nbsp;&nbsp;20 OCT, 2017</a></li>
									<li><a href="#"><i class="fa fa-clone"></i> &nbsp;&nbsp;IT jobs</a></li>
								</ul>
								<h3><a href="#">Hey Seeker, It’s Time to job Now!</a></h3>
								<p>Nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non mauris
								vitae erat consequat auctor eu in elit. Class aptent taciti sociosqu ad litora torquent..</p>
							</div>
							<div class="jp_first_blog_bottom_cont_wrapper">
								<div class="jp_blog_bottom_left_cont">
									<ul>
										<li><img src="{{asset('public/frontend/job-light/images/content/blog_small_img.jpg')}}" alt="small_img" class="img-circle" />&nbsp;&nbsp; Jhon Doe</li>
									</ul>
								</div>
								<div class="jp_blog_bottom_right_cont">
									<p class="hidden-xs"><a href="#" class="hidden-xs"><i class="fa fa-comments"></i></a></p>
									<ul>
										<li>SHARE :</li>
										<li><a href="#"><i class="fa fa-facebook"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
										<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
										<li class="hidden-xs"><a href="#"><i class="fa fa-google-plus"></i></a></li>
										<li class="hidden-xs"><a href="#"><i class="fa fa-vimeo"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--<form method="post" class="source-recruitment-box margin-top-15 padding-left-10 padding-right-10" name="frm">
				<input type="hidden" name="filter_page" value="1">         
				{{ csrf_field() }}												
				<?php 	
				if(count($items) > 0){
					$k=1;			
					foreach ($items as $key => $value) {
						$id=$value['id'];
						$alias=$value['alias'];
						$fullname=$value['fullname'];
						$permalink=route('frontend.index.index',[$alias]) ;
						$image=get_article_thumbnail($value['image']) ;
						$intro= truncateString($value['intro'],200);
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
			</form>	-->					
		</div>
		<div class="col-lg-4"></div>
	</div>
</div>
@endsection()             