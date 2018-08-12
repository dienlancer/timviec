@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<div class="container">
	<div class="row">
		<div class="col-lg-8">
			<?php 
			use App\ArticleCategoryModel;
			use App\ArticleModel;
			use Illuminate\Support\Facades\DB;
			if(count($item) > 0){		
				$id=$item["id"];
				$fullname = $item["fullname"];
				$intro=$item["intro"];
				$content=$item['content'];	
				/* begin cập nhật count view */
				$count_view=(int)@$item['count_view'];
				$count_view++;
				$row				=	ArticleModel::find((int)@$id); 
				$row->count_view=$count_view;
				$row->save();
				$count_view_text=number_format($count_view,0,",",".");
				$created_at=datetimeConverterVn(@$item['created_at']);		
				/* end cập nhật count view */
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
				<div class="jp_blog_cate_left_main_wrapper margin-top-30">
					<div class="jp_first_blog_post_main_wrapper">
						<div class="jp_first_blog_post_img">
							<img src="<?php echo asset('upload/'.@$item['image']); ?>" class="img-responsive" alt="<?php echo @$item['alt_image']; ?>" />
						</div>
						<div class="jp_first_blog_post_cont_wrapper">
							<ul>
								<li><a href="javascript:void(0);"><i class="fa fa-calendar"></i> &nbsp;&nbsp;<?php echo @$created_at; ?></a></li>
								<li><a href="javascript:void(0);"><i class="fa fa-clone"></i></a>&nbsp;&nbsp;<?php echo @$category_name; ?></li>
							</ul>
							<div class="clr"></div>
							<h3><a href="javascript:void(0);"><?php echo @$fullname; ?></a></h3>
							<div><?php echo @$item['intro']; ?></div>
						</div>
						<div class="clr"></div>
						<div class="jp_blog_single_bottom_post_cont">
							<div><?php echo @$item['content']; ?></div>
							<ul>
								<li><i class="fa fa-tags"></i>Keywords :</li>
								<li><a href="#">ui designer,</a></li>
								<li><a href="#">developer,</a></li>
								<li><a href="#">senior</a></li>
								<li><a href="#">it company,</a></li>
								<li><a href="#">design,</a></li>
								<li><a href="#">call center</a></li>
							</ul>
						</div>
						<div class="clr"></div>
						<div class="jp_first_blog_bottom_cont_wrapper">
							<div class="jp_blog_bottom_left_cont">
								<ul>
									<li><i class="fa fa-eye"></i>&nbsp;&nbsp; Lượt xem : <?php echo @$count_view_text; ?></li>
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
						<div class="clr"></div>
					</div>
				</div>
				
				<?php
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

