@extends("frontend.master")
@section("content")
<?php 
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
}
?>	
@endsection()

