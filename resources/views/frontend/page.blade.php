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
				?>	
				<div class="jp_blog_cate_left_main_wrapper margin-top-30">
					<div class="jp_first_blog_post_main_wrapper">
						<?php 
						if(!empty(@$item['alt_image'])){
							?>
							<div class="jp_first_blog_post_img">
								<img src="<?php echo asset('upload/'.@$item['image']); ?>" class="img-responsive" alt="<?php echo @$item['alt_image']; ?>" title="<?php echo @$item['alt_image']; ?>" />
							</div>
							<?php
						}
						?>						
						<div class="jp_first_blog_post_cont_wrapper">
							<ul>
								<li><a href="javascript:void(0);"><i class="fa fa-calendar"></i> &nbsp;&nbsp;<?php echo @$created_at; ?></a></li>							
							</ul>
							<div class="clr"></div>
							<h3 class="page-title"><a href="javascript:void(0);"><?php echo @$fullname; ?></a></h3>							
						</div>
						<div class="clr"></div>
						<div class="jp_blog_single_bottom_post_cont">
							<div><?php echo @$item['content']; ?></div>								
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
									<li>CHIA SẺ :</li>
									<li><a href="javascript:void(0);"><i class="fab fa-facebook-f"></i></a></li>
									<li><a href="javascript:void(0);"><i class="fab fa-twitter"></i></a></li>
									<li><a href="javascript:void(0);"><i class="fab fa-pinterest"></i></a></li>
									<li><a href="javascript:void(0);"><i class="fab fa-linkedin-in"></i></a></li>
									<li class="hidden-xs"><a href="javascript:void(0);"><i class="fab fa-google-plus-g"></i></a></li>
									<li class="hidden-xs"><a href="javascript:void(0);"><i class="fab fa-vimeo-v"></i></a></li>
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
			@include("frontend.recruitment-quicked-2")
			<div class="clr"></div>
			@include("frontend.recruitment-search-advance")
			<div class="clr"></div>
			@include("frontend.recruitment-province")
			<div class="clr"></div>
			@include("frontend.recruitment-top-employer")			
			<div class="clr"></div>
		</div>
	</div>
</div>
@endsection()      

