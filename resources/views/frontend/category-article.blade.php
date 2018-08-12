@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<h1 style="display: none;"><?php echo @$title; ?></h1>
<h2 style="display: none;"><?php echo @$meta_description; ?></h2>				
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<?php 		
			if(isset($category)){
				$breadcrumb= getBreadCrumbCategoryArticle(@$category);	
				?>
				<div class="mybreadcrumb margin-top-15">
					<ul itemscope itemtype="http://schema.org/BreadcrumbList" >
						<?php echo $breadcrumb; ?>
					</ul>		
				</div>		
				<?php
			}else{
				?>
				<div class="mybreadcrumb margin-top-15">
					<ul itemscope="" itemtype="http://schema.org/BreadcrumbList" >
						<li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<a itemscope="" itemtype="http://schema.org/Thing" itemprop="item" href="<?php echo route('frontend.index.getHome'); ?>">
								<span itemprop="name">Trang chủ</span>
							</a>
							<i class="fa fa-angle-right"></i>
							<meta itemprop="position" content="1">
						</li>
						<li itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
							<a itemscope="" itemtype="http://schema.org/Thing" itemprop="item" href="javascript:void(0);">
								<span itemprop="name">Tìm kiếm</span>
							</a>
							<i class="fa fa-angle-right"></i>
							<meta itemprop="position" content="2">
						</li>						    			
					</ul>
				</div>
				<?php
			}							
			if(count(@$items) > 0){
				?>
				<form method="post" name="frm">
					<input type="hidden" name="filter_page" value="1">         
					{{ csrf_field() }}	
					<?php 
					$i=0;
					$main_wrapper='';
					foreach (@$items as $key => $value) {
						$id=@$value['id'];						
						$permalink=route('frontend.index.index',[@$value['alias']]) ;
						$image=get_article_thumbnail(@$value['image']) ;
						$intro= truncateString(@$value['intro'],99999);
						$count_view=(int)@$value['count_view'];
						$count_view_text=number_format(@$count_view,0,",",".");	
						$created_at=datetimeConverterVn(@$value['created_at']);		
						if((int)@$i==0){
							$main_wrapper="jp_blog_cate_left_main_wrapper margin-top-15";
						}else{
							$main_wrapper="jp_blog_cate_left_main_wrapper jp_blog_cate_left_main_wrapper2";
						}
						$source_article_category=DB::table('article_category')
						->join('category_article','article_category.category_id','=','category_article.id')		
						->select('category_article.id','category_article.fullname','category_article.alias')
						->where('article_category.article_id','=',(int)@$id)					
						->groupBy('category_article.id','category_article.fullname','category_article.alias')
						->orderBy('category_article.sort_order','asc')
						->get()->toArray();						
						$arr_category_name=array();	
						$category_name='';	
						if(count($source_article_category) > 0){		
							$data_article_category=convertToArray($source_article_category);
							foreach ($data_article_category as $key => $value_article_category) {								
								$permalink_category=route('frontend.index.index',[$value_article_category['alias']]);
								$arr_category_name[]='<span><a href="'.$permalink_category.'">'.$value_article_category["fullname"].'</a></span>' ;						
							}		
							$category_name=implode(' / ', $arr_category_name);		
						}		
						?>
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="<?php echo @$main_wrapper; ?>">
									<div class="jp_first_blog_post_main_wrapper">
										<div class="jp_first_blog_post_img">
											<a href="<?php echo @$permalink; ?>" title="<?php echo @$value['alt_image']; ?>"><img src="<?php echo asset('upload/'.@$value['image']); ?>" class="img-responsive" alt="<?php echo @$value['alt_image']; ?>" title="<?php echo @$value['alt_image']; ?>" /></a>
										</div>
										<div class="jp_first_blog_post_cont_wrapper">
											<ul>
												<li><a href="javascript:void(0);"><i class="fa fa-calendar"></i> &nbsp;&nbsp;<?php echo @$created_at; ?></a></li>
												<!--<li><a href="javascript:void(0);"><i class="fa fa-clone"></i> &nbsp;&nbsp;IT jobs</a></li>-->
												<li><a href="javascript:void(0);"><i class="fa fa-clone"></i></a>&nbsp;&nbsp;<?php echo @$category_name; ?></li>
											</ul>
											<h3><a href="<?php echo @$permalink; ?>" title="<?php echo @$value['fullname']; ?>"><?php echo @$value['fullname']; ?></a></h3>
											<p><?php echo @$value['intro']; ?></p>
										</div>
										<div class="jp_first_blog_bottom_cont_wrapper">	
											<div class="jp_blog_bottom_left_cont">
												<ul>
													<li><i class="fa fa-eye"></i>&nbsp;&nbsp; Lượt xem : <?php echo @$count_view_text; ?></li>
												</ul>
											</div>										
											<div class="jp_blog_bottom_right_cont">
												<p class="hidden-xs"><a href="javascript:void(0);" class="hidden-xs"><i class="fa fa-comments"></i></a></p>
												<ul>
													<li>CHIA SẺ :</li>
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
						$i++;
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
		<div class="col-lg-4">
			@include("frontend.search-article")
			<div class="clr"></div>
			@include("frontend.recruitment-content-right")
			@include("frontend.recruitment-search-advance")
			@include("frontend.recruitment-province")
			@include("frontend.recruitment-top-employer")
		</div>
	</div>
</div>
@endsection()             