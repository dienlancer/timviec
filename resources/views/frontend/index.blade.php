<?php 
$seo_alias="";
if(isset($alias)){
    $seo_alias=$alias;
}
?>
@extends("frontend.master")
@section("content")
<div class="box-inner-content">
    <div class="container">    
        <?php             
        switch ($layout){
            case 'two-column':  
            ?>
            <div class="col-sm-3">
                <?php                                      
                $argsTinTucSuKien = array(                         
                    'menu_class'            => 'categoryarticle',                            
                    'before_wrapper'        => '<div class="box-category margin-top-15">',
                    'before_title'          => '<h2 class="menu-right-title">',
                    'after_title'           => '</h2>',
                    'before_wrapper_ul'     =>  '<div>',
                    'after_wrapper_ul'      =>  '</div>',
                    'after_wrapper'         => '</div>'     ,
                    'link_before'           => '', 
                    'link_after'            => '',                                                                    
                    'theme_location'        => 'ttsk' ,
                    'menu_li_actived'       => 'current-menu-item',
                    'menu_item_has_children'=> 'menu-item-has-children',
                    'alias'                 => $seo_alias,
                );    
                $argsDanhMucSanPham = array(                         
                    'menu_class'            => 'categoryproduct',                            
                    'before_wrapper'        => '<div class="box-category margin-top-15">',
                    'before_title'          => '<h2 class="menu-right-title">',
                    'after_title'           => '</h2>',
                    'before_wrapper_ul'     =>  '<div class="category-product-wrapper">',
                    'after_wrapper_ul'      =>  '</div>',
                    'after_wrapper'         => '</div>'     ,
                    'link_before'           => '', 
                    'link_after'            => '',                                                                    
                    'theme_location'        => 'dmsp-left' ,
                    'menu_li_actived'       => 'current-menu-item',
                    'menu_item_has_children'=> 'menu-item-has-children',
                    'alias'                 => $seo_alias,
                );    
                switch ($component) {
                    case 'articles':
                    case 'category-article':
                    case 'article':
                    case 'page':                
                    wp_nav_menu($argsTinTucSuKien);  
                    $data_featured_news=\App\ArticleModel::whereRaw('status = 1')->select('id','fullname','alias','intro','image')->orderBy('created_at','desc')->take(10)->get()->toArray();

                    if(count($data_featured_news) > 0){
                    	?>
                    	<script language="javascript" type="text/javascript">
                    		$(document).ready(function(){
                    			$('.bx-slider-news').bxSlider({
                    				mode: 'vertical', speed: 500, slideMargin:50, infiniteLoop: true, pager: false, controls: false, minSlides: 5, maxSlides:20, moveSlides: 5, adaptiveHeight: false,auto:true
                    			});
                    		});
                    	</script>
                    	<div class="menu-right-title margin-top-20">Tin nổi bật</div>
                    	<div class="bx-slider-news">
                    		<?php 
                    		foreach($data_featured_news as $featured_news_key => $featured_news_value){
                    			$featured_news_name=$featured_news_value['fullname'];
                    			$featured_news_alias=$featured_news_value['alias'];
                    			$featured_news_link=route('frontend.index.index',[$featured_news_alias]);
                    			$featured_news_intro=$featured_news_value['intro'];                    			
                    			$featured_news_image =get_article_thumbnail($featured_news_value['image']) ;                    			
                    			?>
                    			<div>
                    				<div>
                    					<center>
                    						<figure>
                    							<a href="<?php echo $featured_news_link; ?>"><img src="<?php echo $featured_news_image; ?>"></a>
                    						</figure>
                    					</center>      
                    				</div> 
                    				<div class="margin-top-5 box-title"><a href="<?php echo $featured_news_link ?>"><?php echo $featured_news_name; ?></a></div>                  			
                    			</div>
                    			<?php
                    		}
                    		?>
                    	</div>
                    	<?php
                    }
                    break;
                    case 'products':        
                    case 'category-product':
                    case 'product':
                    case 'search-product':                                                    
                    $argsDanhMucSanPham2 = array(                         
                        'menu_class'            => 'dmspleft',                                        
                        'before_wrapper'        => '<div class="dmsp-left">',
                        'before_title'          => '<div class="menu-right-title margin-top-20">',
                        'after_title'           => '</div>',
                        'before_wrapper_ul'     =>  '<div class="category-product-wrapper">',
                        'after_wrapper_ul'      =>  '</div>',
                        'after_wrapper'         => '</div>'     ,
                        'link_before'           => '', 
                        'link_after'            => '<i class="fa fa-caret-down pull-right" aria-hidden="true"></i>',                                        
                        'theme_location'        => 'dmsp-left' ,
                        'menu_li_actived'       => 'current-menu-item',
                        'menu_item_has_children'=> 'menu-item-has-children',
                        'alias'                 => $seo_alias
                    );                    
                    wp_nav_menu($argsDanhMucSanPham2);                    
                    /* begin tìm kiếm sản phẩm theo thuộc tính */
                    ?>
                    <form name="frm-search-product-param" action='<?php echo route('frontend.index.searchProduct') ?>'  method="POST" enctype="multipart/form-data">
                    	{{ csrf_field() }}
                    	<input type="hidden" name="category_id" value="<?php echo @$category['id']; ?>">
                    	<?php 
                    	$query=\DB::table('category_param');
                    	$query->where('alias','<>','mau')->where('alias','<>','kich-thuoc')->where('parent_id','=',0);
                    	$data_father=$query->select('category_param.id','category_param.fullname','category_param.alias')
                    	->groupBy('category_param.id','category_param.fullname','category_param.alias')
                    	->orderBy('category_param.sort_order', 'asc')
                    	->get()
                    	->toArray(); 
                    	$data_father=convertToArray($data_father);
                    	if(count($data_father) > 0){
                    		foreach ($data_father as $key_father => $value_father) {
                    			$father_id=$value_father['id'];
                    			$father_fullname=$value_father['fullname'];                            
                    			$father_alias=$value_father['alias'];                            
                    			?>
                    			<hr class="cara" />                    
                    			<div class="bo-loc margin-top-10"><?php echo $father_fullname; ?></div>
                    			<?php 
                    			$data_children=\App\CategoryParamModel::whereRaw('parent_id = ?',[(int)@$father_id])->select('id','alias','fullname','param_value')->orderBy('sort_order','asc')->get()->toArray();
                    			if(count($data_children) > 0){
                    				?>
                    				<div>
                    					<ul class="tich-tac">
                    						<?php 
                    						foreach ($data_children as $child_key => $child_value) {
                    							$child_id=$child_value['id'];
                    							$child_fullname=$child_value['fullname'];
                    							$child_alias=$child_value['alias'];
                    							if(@$prod_param != null){
                    								if(count(@$prod_param) > 0){
                    									if(in_array($child_id, @$prod_param)){
                    										?>
                    										<li><input type="checkbox" checked name="prod_param[]" onclick='document.forms["frm-search-product-param"].submit();'  value="<?php echo $child_id; ?>"><span class="margin-left-5"><?php echo $child_fullname; ?></span></li>
                    										<?php
                    									}else{
                    										?>
                    											<li><input type="checkbox" name="prod_param[]" onclick='document.forms["frm-search-product-param"].submit();'  value="<?php echo $child_id; ?>"><span class="margin-left-5"><?php echo $child_fullname; ?></span></li>   
                    											<?php
                    									}                    									
                    								}          
                    							}else{
                    								?>
                    								<li><input type="checkbox" name="prod_param[]" onclick='document.forms["frm-search-product-param"].submit();'  value="<?php echo $child_id; ?>"><span class="margin-left-5"><?php echo $child_fullname; ?></span></li>   
                    								<?php
                    							}			
                    						}
                    						?>                  						        					
                    					</ul>
                    				</div>
                    				<?php                  				                  			
                    			}                  			
                    		}
                    	}             
                    	?>
                    </form>
                    <?php
                    /* end tìm kiếm sản phẩm theo thuộc tính */        
                    $data_featured_products=\App\ProductModel::whereRaw('status = 1')->select('id','fullname','alias','intro','image','price','sale_price')->orderBy('created_at','desc')->take(10)->get()->toArray();                                
                    if(count($data_featured_products) > 0){                        
                        ?>
                            <script language="javascript" type="text/javascript">
                                $(document).ready(function(){
                                    $('.bxSlider').bxSlider({
                                        mode: 'vertical', speed: 500, slideMargin:15, infiniteLoop: true, pager: false, controls: false, minSlides: 5, maxSlides:20, moveSlides: 5, adaptiveHeight: false,auto:true
                                    });
                                });
                            </script>                            
                            <div class="menu-right-title margin-top-20">Sản phẩm mới</div>
                            <div class="bxSlider">
                                <?php 
                                foreach($data_featured_products as $key => $value){
                                    $featured_product_id=$value['id'];
                                    $featured_product_alias=$value['alias'];
                                    $featured_product_name=$value['fullname'];
                                    $featured_product_link=route('frontend.index.index',[$featured_product_alias]) ;
                                    $featured_product_img =get_product_thumbnail($value['image']) ;      
                                    $featured_product_price=$value['price'];
                                    $featured_product_sale_price=$value['sale_price'];
                                    $html_price='';                     
                                    if((int)@$featured_product_sale_price > 0){              
                                        $price_on_html ='<span class="price-on">'.fnPrice($featured_product_sale_price).'</span>';
                                        $price_off_html='<span class="price-off">'.fnPrice($featured_product_price).'</span>' ;                 
                                        $html_price='<div class="sale-price">'.$price_on_html.'</div><div class="old-price">'.$price_off_html.'</div><div class="clr"></div>' ;              
                                    }else{
                                        $html_price='<span class="price-on">'.fnPrice($featured_product_price).'</span>' ;                  
                                    }           
                                    ?>
                                    <div >
                                        <div class="box-product box-product-rian">
                                            <div class="box-product-img">
                                                <center><figure><a href="<?php echo $featured_product_link; ?>"><img src="<?php echo $featured_product_img; ?>"></a></figure></center>
                                            </div>
                                            <div class="box-product-intro-title"><a href="<?php echo $featured_product_link; ?>"><b><?php echo $featured_product_name; ?></b></a></div>
                                            <div class="box-product-price">
                                                <div><center><?php echo $html_price; ?></center></div>
                                            </div>
                                        </div>
                                    </div>
                                    <?php
                                }
                                ?>
                            </div>
                            <?php          
                    }                                                        
                    break;                            
                }                                       
                ?>                            
            </div>
            <div class="col-sm-9">
                <?php
                switch ($component) {                                                                      
                    case "category-article":    
                    case "articles":                                                                          
                    ?>@include("frontend.category-article")<?php
                    break;                                         
                    case "article":                                                            
                    ?>@include("frontend.article")<?php
                    break;                
                    case "page":                                                            
                    ?>@include("frontend.page")<?php
                    break;            
                    case "search-product":             
                    case "category-product":
                    case "products":                                                
                    ?>@include("frontend.category-product")<?php
                    break; 
                    case "product":                                                
                    ?>@include("frontend.product")<?php
                    break;
                    case "gio-hang":                                                
                    ?>@include("frontend.cart")<?php
                    break; 
                    case "register":                                                
                    ?>@include("frontend.register")<?php
                    break;
                    case "account":                                                
                    ?>@include("frontend.account")<?php
                    break;
                    case "login":                                                
                    ?>@include("frontend.login")<?php
                    break;
                    case "login-join-project":                                                
                    ?>@include("frontend.login-join-project")<?php
                    break;
                    case "security":                                                
                    ?>@include("frontend.security")<?php
                    break;
                    case "xac-nhan-thanh-toan":                                                
                    ?>@include("frontend.confirm-checkout")<?php
                    break;
                    case "dang-nhap-thanh-toan":                                                
                    ?>@include("frontend.login-checkout")<?php
                    break;
                    case "hoan-tat-thanh-toan":                                                
                    ?>@include("frontend.finished-checkout")<?php
                    break;
                    case "hoa-don":                                                
                    ?>@include("frontend.invoice")<?php
                    break;                                                                        
                }
                ?>
            </div>
            <div class="clr"></div>
            <?php          
            break;
            case 'full-width':        
            ?>
            <div class="col-lg-12">
                <?php
                switch ($component) {                          
                    case "contact": 
                    ?>@include("frontend.contact")<?php   
                    break;      
                    case "categories-album": 
                    ?>@include("frontend.categories-album")<?php   
                    break;   
                    case "album": 
                    ?>@include("frontend.album")<?php   
                    break; 
                    case "category-video": 
                    ?>@include("frontend.category-video")<?php   
                    break;                                                                                     
                }  
                ?>
                
            </div> 
            <div class="clr"></div>           
            <?php
            break;
        }
        ?>    
    </div>
</div>
@endsection()               