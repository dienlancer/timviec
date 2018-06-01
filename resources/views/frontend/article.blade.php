@extends("frontend.master")
@section("content")
@include("frontend.content-top")
<div class="container margin-top-15">
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
				/* end cập nhật count view */
				$dataArticleCategory=DB::table('article_category')
				->join('category_article','article_category.category_id','=','category_article.id')		
				->select('category_article.id','category_article.fullname','category_article.alias')
				->where('article_category.article_id','=',(int)@$id)					
				->groupBy('category_article.id','category_article.fullname','category_article.alias')
				->orderBy('category_article.sort_order','asc')
				->get()->toArray();
				$arr_category_id=array();
				$arr_category_name=array();	
				$category_name='';	
				if(count($dataArticleCategory) > 0){		
					$dataArticleCategory=convertToArray($dataArticleCategory);
					foreach ($dataArticleCategory as $key => $value) {
						$arr_category_id[]=$value["id"];
						$permalink=route('frontend.index.index',[$value['alias']]);
						$arr_category_name[]='<a href="'.$permalink.'">'.$value["fullname"].'</a>' ;						
					}		
					$category_name=implode(' / ', $arr_category_name);		
				}		
				?>	
				<div class="margin-top-15 box-article">
					<h1 class="tieu-de-bai-viet">
						<?php echo $title; ?>		
					</h1>
					<div class="margin-top-15">
						<span class="box-article-category">
							<i class="fa fa-folder" aria-hidden="true"></i>
							<?php echo $category_name; ?>
						</span>
						<span class="post-view margin-left-15">
							<i class="fa fa-eye" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $count_view_text ?>&nbsp;Lượt xem
						</span>
					</div>	
					<hr class="duong-ngang" />	
					<h2 class="margin-top-10 article-excerpt vidola">
						<?php echo $intro; ?>
					</h2>		
					<div class="margin-top-15 vidola mimi">
						<?php echo $content; ?>
					</div>	
					<hr class="duong-ngang" />
					<?php 					
					if(count($arr_category_id) > 0){						
						$data=DB::table('article')
						->join('article_category','article.id','=','article_category.article_id')                			
						->select('article.id','article.alias','article.fullname')
						->whereIn('article_category.category_id', $arr_category_id)
						->where('article.id','<>',(int)@$id)
						->where('article.status','=',1)
						->groupBy('article.id','article.alias','article.fullname')
						->orderBy('article.id', 'desc')
						->take(6)
						->get()->toArray();
						$data=convertToArray($data);            
						?>
						<div class="margin-top-10">
							<div class="related-news">
								<b>Tin liên quan :</b>
							</div>
							<div class="related-news-right">
								<ul class="related-articles">
									<?php 
									foreach ($data as $key => $value) {
										$related_article_fullname=$value["fullname"];
										$related_article_alias=$value['alias'];
										$related_article_permalink=route('frontend.index.index',[$related_article_alias]) ;
										?>
										<li><a href="<?php echo $related_article_permalink; ?>"><?php echo $related_article_fullname; ?></a></li>
										<?php
									}
									?>					
								</ul>
							</div>	
							<div class="clr"></div>			
						</div>	
						<?php				
					}
					?>	
				</div>
				<?php
			}
			?>	
		</div>
		<div class="col-lg-4">@include("frontend.main-sidebar")</div>
	</div>
</div>
@endsection()      

