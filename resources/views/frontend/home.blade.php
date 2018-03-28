@extends("frontend.master")
@section("content")
<?php 
use Illuminate\Support\Facades\DB;
$setting=getSettingSystem();
$seo=getSeo();
$telephone=$setting['telephone']['field_value'];
$email_to=$setting['email_to']['field_value'];
$facebook_url=$setting['facebook_url']['field_value'];
$twitter_url=$setting['twitter_url']['field_value'];
$google_plus=$setting['google_plus']['field_value'];
$youtube_url=$setting['youtube_url']['field_value'];
$instagram_url=$setting['instagram_url']['field_value'];
$pinterest_url=$setting['pinterest_url']['field_value'];   
$company=$setting['contacted_person']['field_value'];
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<?php 
			$data_slideshow2=getBanner("slideshow");
			if(count($data_slideshow2) > 0){
				$items2=$data_slideshow2["items"];
				if(count($items2) > 0){
					?>
					<div class="slideshow">
						<script type="text/javascript" language="javascript">        
							$(document).ready(function(){
								$(".slick-slideshow").slick({
									dots: false,
									autoplay:true,
									arrows:false,
									adaptiveHeight:true,
									slidesToShow: 1,
									slidesToScroll: 1,        
								});  
							});     
						</script>
						<div class="slick-slideshow">    
							<?php 
							foreach ($items2 as $key => $value) {
								$alt2=$value["alt"];
								$featuredImg2=asset('upload/'.$value["image"]);
								?>
								<div><img src="<?php echo $featuredImg2; ?>" alt="<?php echo $alt2; ?>" /></div>
								<?php 
							}
							?>              
						</div>
					</div>
					<?php
				}  
			}
			?>
		</div>
	</div>	
	<?php 
	$arr_alias=array(
		'laptop',
		'may-tinh',		
		'phu-kien-may-tinh',
		'loa-am-thanh',
		
	);
	foreach ($arr_alias as $key1 => $value_alias) {
		$alias1=$value_alias;
		$category_fullname='';
		$id1=0;
		$arrCategoryID=array();
		$data_category=\App\CategoryProductModel::whereRaw('alias = ?',[$alias1])->select('id','fullname')->get()->toArray();
		if(count($data_category) > 0){
			$id1=$data_category[0]['id'];
			$category_fullname=$data_category[0]['fullname'];
		}		
		$arrCategoryID[]=@$id1;
		getStringCategoryID($id1,$arrCategoryID,'category_product');       
		$query=DB::table('product')
		->join('category_product','product.category_id','=','category_product.id')  ;      			 
		$query->whereIn('product.category_id',$arrCategoryID);   
		$data_product=$query->select('product.id','product.code','product.fullname','product.alias','product.image','category_product.fullname as category_name','product.price','product.sale_price')
		->groupBy('product.id','product.code','product.fullname','product.alias','product.image','category_product.fullname','product.price','product.sale_price')
		->orderBy('product.created_at','desc')->take(10)->get()->toArray();      	    
		if(count($data_product) > 0){		
			?>
			<div class="row">
				<div class="col-lg-12">
					<div class="box-category">
						<div class="padding-left-15 padding-top-15 padding-right-15">
							<div class="zuna-home">
								<div class="cot-1">
									<div class="margin-left-10"><img src="<?php echo asset('upload/iconlogo.ico'); ?>"></div>
									<h2 class="margin-left-10"><a href="<?php echo route('frontend.index.index',[$alias1]); ?>"><?php echo $category_fullname; ?></a></h2>
								</div>							
								<div class="clr"></div>
							</div>						
							<div class="box-tialia margin-top-10">
								<script type="text/javascript" language="javascript">
									$(document).ready(function(){
										$(".<?php echo $alias1; ?>").owlCarousel({
											autoplay:false,                    
											loop:true,
											margin:10,                        
											nav:true,            
											mouseDrag: false,
											touchDrag: false,                                
											responsiveClass:true,
											responsive:{
												0:{
													items:1
												},
												600:{
													items:5
												},
												1000:{
													items:5
												}
											}
										});
										var chevron_left='<i class="fa fa-chevron-left"></i>';
										var chevron_right='<i class="fa fa-chevron-right"></i>';
										$("div.<?php echo $alias1; ?> div.owl-prev").html(chevron_left);
										$("div.<?php echo $alias1; ?> div.owl-next").html(chevron_right);
									});                
								</script>
								<div class="owl-carousel <?php echo $alias1; ?> owl-theme">
									<?php 
									$data_product=convertToArray($data_product);
									foreach($data_product as $key2 => $value){
										$featuredImg1=get_product_thumbnail($value['image']) ;
										$permalink1=route('frontend.index.index',[$value['alias']]);
										$title1=$value['fullname'];
										$price1=$value['price'];
										$sale_price1=$value['sale_price'];
										$html_price='';                     
										if((int)@$sale_price1 > 0){              
											$price_on_html ='<span class="price-on">'.fnPrice($sale_price1).'</span>';
											$price_off_html='<span class="price-off">'.fnPrice($price1).'</span>' ;                 
											$html_price='<div class="sale-price">'.$price_on_html.'</div><div class="old-price">'.$price_off_html.'</div><div class="clr"></div>' ;              
										}else{
											$html_price='<span class="price-on">'.fnPrice($price1).'</span>' ;                  
										}   					
										?>
										<div class="box-product">
											<div class="box-product-img">
												<center><figure><a href="<?php echo $permalink1; ?>"><img src="<?php echo $featuredImg1; ?>"></a></figure></center>
											</div>
											<div class="box-product-intro-title"><a href="<?php echo $permalink1; ?>"><b><?php echo $title1; ?></b></a></div>
											<div class="box-product-price">
												<div><center><?php echo $html_price; ?></center></div>
											</div>
										</div>
										<?php
									}
									?>
								</div>

							</div>					
						</div>	

					</div>	

				</div>

			</div>
			<?php
		}		
	}	
	?>	
</div>
@endsection()               