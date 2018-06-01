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
										
				?>	
				<div class="margin-top-15 box-article">
					<h1 class="tieu-de-bai-viet">
						<?php echo $title; ?>		
					</h1>
					<div class="margin-top-15">									
						<span class="post-view">
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
				</div>
				<?php
			}
			?>	
		</div>
		<div class="col-lg-4">@include("frontend.main-sidebar")</div>
	</div>
</div>
@endsection()      

