<?php 
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
$opened_time=$setting['opened_time']['field_value'];
$seo_title="";
if(isset($title) && !empty($title)){
	$seo_title=$title;
}else{	
	$seo_title=$seo["title"];
}

$seo_meta_description="";
if(isset($meta_description) && !empty($meta_description)){
	$seo_meta_description=$meta_description;
}else{
	$seo_meta_description=$seo["meta_description"];
}

$seo_meta_keyword="";
if(isset($meta_keyword) && ! empty($meta_keyword)){
	$seo_meta_keyword=$meta_keyword;
}else{
	$seo_meta_keyword=$seo["meta_keyword"];
}
$seo_google_analytics=$seo["google_analytics"];
$seo_author=$seo["author"];
$seo_copyright=$seo["copyright"];
$seo_generator="Mã nguồn mở phát triển bởi tichtacso.com";
$seo_google_site_verification=$seo["google_site_verification"];
$seo_page_url=url('/');
$seo_favicon=asset('upload/'.$seo['favicon']);
$seo_logo_frontend=asset('upload/'.$seo['logo_frontend']);
$seo_alias="";
if(isset($alias)){
	$seo_alias=$alias;
}
$ssName="vmuser";
$arrUser =array();   
$user = Sentinel::forceCheck(); 
if(!empty($user)){                
    $arrUser = $user->toArray();    
}         
$account_link=route("frontend.index.viewAccount");  
$logout_link=route("frontend.index.getLgout"); 
$security_link=route("frontend.index.viewSecurity"); 
$invoice_link=route("frontend.index.getInvoice");
$register_member_link=route("frontend.index.register");
$cart_link=route('frontend.index.viewCart');

$ssNameCart='vmart';
$quantity=0;
$arrCart=array();
if(Session::has($ssNameCart)){    
	$arrCart = @Session::get($ssNameCart);    
}         
if(count($arrCart) > 0){
	foreach ($arrCart as $key => $value){
		$quantity+=(int)$value['product_quantity'];              
	}
}   

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">  
	<title><?php echo $seo_title; ?></title>
	<meta name="keywords" content="<?php echo $seo_meta_keyword; ?>">
	<meta name="description" content="<?php echo $seo_meta_description; ?>">	
	<meta name="author" content="<?php echo $seo_author; ?>">
	<meta name="copyright" content="<?php echo $seo_copyright; ?>">
	<meta name="robots" content="index, archive, follow, noodp">
	<meta name="googlebot" content="index,archive,follow,noodp">
	<meta name="msnbot" content="all,index,follow">
	<meta name="generator" content="<?php echo $seo_generator; ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="google-site-verification" content="<?php echo $seo_google_site_verification; ?>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta property="og:title" content="<?php echo $seo_title; ?>">
	<meta property="og:type" content="website">
	<meta property="og:description" content="<?php echo $seo_meta_description; ?>">
	<meta property="og:site_name" content="<?php echo $seo_title; ?>">
	<meta property="og:url" content="<?php echo $seo_page_url; ?>">
	<!-- begin google analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=<?php echo $seo_google_analytics; ?>"></script>
	<script language="javascript" type="text/javascript">
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', '<?php echo $seo_google_analytics; ?>');
	</script>
	<!-- end google analytics -->
	<link rel="shortcut icon" href="<?php echo $seo_favicon; ?>" type="image/x-icon">
	<link rel="icon" href="<?php echo $seo_favicon; ?>" type="image/x-icon">
	<script src="{{ asset('public/frontend/js/jquery-3.2.1.js') }}"></script>
	<!--begin bootstrap-->
	<script src="{{ asset('public/frontend/js/bootstrap.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/css/bootstrap.css') }}" />
	<!--end bootstrap-->
	<!-- begin jquery-ui -->
	<script src="{{ asset('public/frontend/jquery-ui/jquery-ui.min.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/jquery-ui/jquery-ui.css') }}" />
	<!-- end jquery-ui -->
	<!-- begin font-awesome -->
	<link rel="stylesheet" href="{{ asset('public/frontend/web-fonts-with-css/css/fontawesome-all.min.css') }}" />	
	<!-- end font-awesome -->	
	<!-- begin ddsmoothmenu -->
	<script src="{{ asset('public/frontend/js/ddsmoothmenu.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/css/ddsmoothmenu.css') }}" />
	<link rel="stylesheet" href="{{ asset('public/frontend/css/ddsmoothmenu-v2.css') }}" />
	<!-- end ddsmoothmenu -->
	<!-- begin slick slider -->
	<script src="{{ asset('public/frontend/slick/slick.min.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/slick/slick.css') }}" />
	<link rel="stylesheet" href="{{ asset('public/frontend/slick/slick-theme.css') }}" />
	<!-- end slick slider -->
	<!-- begin tab -->
	<link rel="stylesheet" href="{{ asset('public/frontend/css/tab.css') }}" />
	<!-- end tab-->
	<!-- begin bxslider -->
	<script src="{{ asset('public/frontend/bxslider/jquery.bxslider.min.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/bxslider/jquery.bxslider.min.css') }}" />  
	<!-- end bxslider -->
	<!-- begin owl_carousel -->
	<script src="{{ asset('public/frontend/owl-carousel-2/owl.carousel.min.js') }}"></script>
	<script src="{{ asset('public/frontend/owl-carousel-2/owl.carousel2.thumbs.min.js') }}"></script>
	<link rel="stylesheet" href="{{ asset('public/frontend/owl-carousel-2/owl.carousel.min.css') }}" />
	<link rel="stylesheet" href="{{ asset('public/frontend/owl-carousel-2/owl.theme.min.css') }}" /> 
	<link rel="stylesheet" href="{{ asset('public/frontend/owl-carousel-2/themes.css') }}" />  
	<!-- end owl_carousel -->
	<!-- begin elevatezoom -->
	<script src="{{ asset('public/frontend/js/jquery.elevatezoom-3.0.8.min.js') }}"></script>  
	<!-- end elevatezoom -->
	<!-- begin accounting -->
	<script src="{{ asset('public/frontend/js/accounting.min.js') }}"></script>  
	<!-- end accounting -->
	<!-- begin pagination -->
	<!--<link rel="stylesheet" href="{{ asset('public/frontend/css/pagination.css') }}" />-->
	<!-- end pagination-->
	<!-- begin product -->
	<link rel="stylesheet" href="{{ asset('public/frontend/css/product.css') }}" />
	<!-- end product-->
	<!-- begin datatables -->	
	<script src="{{ asset('public/frontend/js/jquery.dataTables.min.js') }}"></script>    
	<link rel="stylesheet" href="{{ asset('public/frontend/css/jquery.dataTables.min.css') }}" />
	<script src="{{ asset('public/frontend/js/table-library.js') }}"></script>    
	<!-- end datatables -->
	<!-- begin youtube -->    
  <script src="{{ asset('public/frontend/js/jquery-modal-video.min.js') }}"></script>
  <script src="{{ asset('public/frontend/js/modal-video.min.js') }}"></script>
  <link rel="stylesheet" href="{{ asset('public/frontend/css/modal-video.min.css') }}" />
  <!-- end youtube -->
	<!-- begin fancybox -->
	<script language="javascript" type="text/javascript" src="{{asset('public/frontend/js/jquery.fancybox.min.js')}}"                 ></script>
	<link href="{{asset('public/frontend/css/jquery.fancybox.min.css')}}" rel="stylesheet" type="text/css" />
	<!-- end fancybox -->
	<!-- begin ckeditor-->
	<script language="javascript" type="text/javascript" src="{{asset('public/frontend/ckeditor/ckeditor.js')}}"                 ></script>
    <script language="javascript" type="text/javascript" src="{{asset('public/frontend/ckfinder/ckfinder.js')}}"                 ></script>
    <!-- end ckeditor-->
	<!-- begin custom -->
	<link rel="stylesheet" href="{{ asset('public/frontend/css/menu-horizontal-right.css') }}" />
	<link rel="stylesheet" href="{{ asset('public/frontend/css/menu-horizontal-right-dmsp.css') }}" />
	<script language="javascript" type="text/javascript" src="{{asset('public/frontend/js/spinner.js')}}"                 ></script>
	<script src="{{ asset('public/frontend/js/custom.js') }}"></script>    
	<link rel="stylesheet" href="{{ asset('public/frontend/css/template.css') }}" />
	<!-- end custom -->
	<script type="text/javascript" language="javascript">
		ddsmoothmenu.init({
			mainmenuid: "smoothmainmenu", 
			orientation: "h", 
			classname: "ddsmoothmenu",
			contentsource: "markup" 
		});    
		$(document).ready(function(){        
			$(window).bind("scroll", function() {                        
				if ($(window).scrollTop() > 90) {					
					
				}
				else {					
					
				}
			});			
		});  
		var spinner = new Spinner();  
		function restartCart(data){
			var data_cart=data.cart;
			var xtable = document.createElement("TABLE");                
			var xtbody=xtable.createTBody();                
			var i=0;
			$.each( data_cart, function( key, value ) {
				var cart_product_id=value.product_id;
				var cart_product_code=value.product_code;
				var cart_product_name=value.product_name;
				var cart_product_image=value.product_image;                    
				var cart_product_quantity=value.product_quantity;
				var cart_product_price=value.product_price;
				var cart_product_total_price=value.product_total_price;  
				var cart_product_total_price_text=    accounting.formatMoney(cart_product_total_price, "", 0, ".",",") + ' đ';
				var xNewRow   = xtbody.insertRow(i);    
				var cell_product_image=xNewRow.insertCell(0);
				var cell_product_name=xNewRow.insertCell(1);
				var cell_product_total_price=xNewRow.insertCell(2);
				$(cell_product_image).addClass('com_product20');
				$(cell_product_name).addClass('com_product22');                    
				$(cell_product_total_price).addClass('com_product23');
				$(cell_product_name).attr('align','left');
				$(cell_product_total_price).attr('align','right');
				$(xNewRow).attr('pro_id',cart_product_id);                    
				cell_product_image.innerHTML='<img src="/upload/'+cart_product_image+'" />';
				cell_product_name.innerHTML='<div>'+cart_product_name+'</div><div><input  type="text" onblur="changeTotalPrice(this);" onkeypress="return isNumberKey(event)" value="'+cart_product_quantity+'" size="4" class="com_product19" name="quantity['+cart_product_id+']">      </div>' ;                    
				cell_product_total_price.innerHTML= '<div class="tt-pri">'+cart_product_total_price_text+'</div><div><a href="javascript:void(0);" onclick="deleteRowCart(this);"><i class="fa fa-trash" aria-hidden="true"></i><span class="margin-left-5">Xóa</span></a></div>' ;                    
				i++;
			});
			$(xtable).addClass('com_product16');
			$(xtable).attr('cellpadding','0');
			$(xtable).attr('cellspacing','0');
			$(xtable).attr("width","100%");
			$('.x-table-cart').empty();
			$('.x-table-cart').append(xtable);                
			$('.tbl-ttkh').show();
			$('.leem').removeClass('ridoo');
			$('.leem').addClass('nadoo');
		}
		
		function changeTotalPrice(ctrl){
			var xRow=$(ctrl).closest('tr')[0];    
			var xForm=$(ctrl).closest('form')[0];        
			var product_id=$(xRow).attr('pro_id');        
			var quantity=$(ctrl).val(); 
			if(parseInt(quantity) < 1){
				alert('Số lượng phải lớn hơn 0');                        
			}
			var token =$(xForm).find('input[name="_token"]').val();
			var dataItem={
				"id":product_id,            
				"quantity":quantity,
				"_token": token
			};      
			$.ajax({
				url: '<?php echo route("frontend.index.changeTotalPrice"); ?>',
				type: 'POST',
				data: dataItem,
				async: false,
				success: function (data) {                                       
					restartCart(data);
				},
				error : function (data){

				},
				beforeSend  : function(jqXHR,setting){

				},
			}); 
		}
		function deleteRowCart(ctrl){
			var xac_nhan = 0;
			var msg="Bạn có muốn xóa ?";
			if(window.confirm(msg)){ 
				xac_nhan = 1;
			}
			if(xac_nhan  == 0){
				return 0;
			}
			var xRow=$(ctrl).closest('tr')[0];        
			var xForm=$(ctrl).closest('form')[0];              
			var xTBody=$(ctrl).closest('tbody')[0];      
			var product_id=$(xRow).attr('pro_id');                
			var token =$(xForm).find('input[name="_token"]').val();
			var dataItem={
				"id":product_id,                        
				"_token": token
			};      
			$.ajax({
				url: '<?php echo route("frontend.index.deleteRowCart"); ?>',
				type: 'POST',
				data: dataItem,
				async: false,
				success: function (data) {                       
					restartCart(data);
					if(parseInt(data.product_count)  < 1 ){
						$('.tbl-ttkh').hide();
						$('.leem').removeClass('nadoo');
						$('.leem').addClass('ridoo');
					}                
				},
				error : function (data){

				},
				beforeSend  : function(jqXHR,setting){

				},
			}); 
		}     
		function hideMsgPdetail() {
			$('.alert-system').fadeOut();
		}     
		function checkout(ctrl){
			var xForm=$(ctrl).closest('form')[0]; 
			var customer_name =$(xForm).find('input[name="customer_name"]').val();
			var customer_phone =$(xForm).find('input[name="customer_phone"]').val();
			var customer_address =$(xForm).find('input[name="customer_address"]').val();
			var customer_email =$(xForm).find('input[name="customer_email"]').val();
			var customer_note =$(xForm).find('input[name="customer_note"]').val();
			var token =$(xForm).find('input[name="_token"]').val();					
			var dataItem={
				'customer_name':customer_name,
				'customer_phone':customer_phone,
				'customer_address':customer_address,
				'customer_email':customer_email,
				'customer_note':customer_note,        
				'_token': token
			};
			$.ajax({
				url: '<?php echo route("frontend.index.checkoutQuickly"); ?>',
				type: 'POST',
				data: dataItem,
				async: false,
				success: function (data) {                                      
					if(data.checked==1){
						alert('Đặt hàng thành công');
						window.location.assign(data.link_redirect);
					}else{   
						var data_error=data.error;                                  
						var ul='<ul class="alert-error">';
						$.each(data_error,function(index,value){
							ul+='<li>'+value+'</li>';
						});                    
						ul+='</ul>';
						$('.alert-system').show();
						$('.alert-system').empty();
						$('.alert-system').append(ul);
						setTimeout(hideMsgPdetail,10000);    
					}
				},
				error : function (data){

				},
				beforeSend  : function(jqXHR,setting){

				},
			});
		}
	</script>	
</head>
<body>	
	<!-- begin fanpage -->
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.11&appId=206740246563578';
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
	<!-- end fanpage -->
	<header class="header">	
		<div class="bg-social">
			<div class="container vienchan">
				<div class="col-lg-12">
					<div class="covu">
						<div class="edra">
							<div class="hera">
								<div class="line">
									<span></span>
									<span></span>
									<span></span>
								</div>
								<span class="dmsanpham">Danh mục sản phẩm</span>
								<span><font color="#ffffff"><i class="fa fa-caret-down pull-right" aria-hidden="true"></i></font></span>
								<div class="clr"></div>
							</div>
							<div class="cate-product-horizontal-right" >
								<?php     
								$args = array(                         
									'menu_class'            => 'cateprodhorizontalright', 					                     
									'before_wrapper'        => '',
									'before_title'          => '',
									'after_title'           => '',
									'before_wrapper_ul'     =>  '',
									'after_wrapper_ul'      =>  '',
									'after_wrapper'         => ''     ,
									'link_before'       	=> '<i class="fa fa-angle-double-right" aria-hidden="true"></i>&nbsp;&nbsp;', 
									'link_after'        	=> '<i class="fa fa-caret-down pull-right" aria-hidden="true"></i>',                                        
									'theme_location'        => 'main-menu' ,
									'menu_li_actived'       => 'current-menu-item',
									'menu_item_has_children'=> 'menu-item-has-children',
									'alias'                 => $seo_alias
								);                    
								wp_nav_menu($args);
								?>                 
								<div class="clr"></div>
							</div>
						</div>					
					</div>
					<div class="himlam">
						
							<div class="col-lg-3">
								<div class="nippet">
									<center>
										<a href="<?php echo url('/'); ?>">                
											<img src="<?php echo $seo_logo_frontend;?>" />
										</a>
									</center>	
								</div>					
							</div>
							<div class="col-lg-6">
								<form action="<?php echo route('frontend.index.searchProduct'); ?>" method="post" name="frm-search" class="margin-top-5">
									{{ csrf_field() }}
									<input type="text" name="q" autocomplete="off" placeholder="Tìm kiếm" value="<?php echo @$q; ?>">
									<a href="javascript:void(0);" onclick="document.forms['frm-search'].submit();"><i class="fas fa-search"></i></a>
								</form>
							</div>	
							<div class="col-lg-3">
								<div class="rimex">
									<div><div class="nimme"><font color="#ffffff"><i class="fas fa-phone"></i></font></div></div>
									<div>
										<div><font color="#ffffff"><?php echo $telephone; ?></font></div>
										<div><font color="#ffffff"><?php echo $opened_time; ?></font></div>
									</div>
								</div>					
							</div>				
																		
					</div>	
					<div class="timex relative">
						<a href="javascript:void(0);" class="tem-cart"><i class="fas fa-cart-arrow-down"></i></a>
						<?php
						$class_cart_box='ridoo'; 
						$ssName="vmart";
						$arrCart=array();
						if(Session::has($ssName)){
							$arrCart=Session::get($ssName);  
							ksort($arrCart);  
						}
						if(count($arrCart) > 0){
							$class_cart_box='nadoo';
						}                       
						?>
						<div class="leem <?php echo $class_cart_box; ?>">
							<form name="frm-product-top"  method="POST" enctype="multipart/form-data">
								{{ csrf_field() }}                                        
								<div class="margin-top-5 x-table-cart">
									<?php                         
									if(Session::has($ssName)){
										$arrCart=Session::get($ssName);  
										ksort($arrCart);  
										if(count($arrCart) > 0){    
											?>
											<table  class="com_product16" cellpadding="0" cellspacing="0" width="100%">

												<tbody>
													<?php 
													foreach ($arrCart as $cart_key => $cart_value) {
														$cart_product_id=$cart_value['product_id'];
														$cart_product_code=$cart_value['product_code'];
														$cart_product_name=$cart_value['product_name'];
														$cart_product_alias=$cart_value['product_alias'];
														$cart_product_link               =   route('frontend.index.index',[$cart_product_alias]);    
														$cart_product_image=$cart_value['product_image'];
														$cart_product_price_text         =   fnPrice($cart_value["product_price"]);
														$cart_product_total_price_text   =   fnPrice($cart_value["product_total_price"]);
														$cart_product_quantity           =   $cart_value["product_quantity"];
														$cart_img=get_product_thumbnail($cart_product_image);                                        
														?>      
														<tr pro_id=<?php echo $cart_product_id; ?> >            
															<td class="com_product20" ><img src="<?php echo $cart_img; ?>" ></td>

															<td align="left" class="com_product22">
																<div><a href="<?php echo $cart_product_link; ?>"><?php echo $cart_product_name; ?></a></div>
																<div><input  type="text" onkeypress="return isNumberKey(event)" onblur='changeTotalPrice(this);' value="<?php echo $cart_product_quantity; ?>" size="4" class="com_product19" name="quantity[<?php echo $cart_product_id; ?>]">      </div>  
															</td>
															<td align="right" class="com_product23" >
																<div class="tt-pri"><?php echo $cart_product_total_price_text; ?></div>
																<div><a href="javascript:void(0);" onclick="deleteRowCart(this);"><i class="fa fa-trash" aria-hidden="true"></i><span class="margin-left-5">Xóa</span></a></div>
															</td>                                            
														</tr>                          
														<?php
													}         
													?>
												</tbody>
											</table>           
											<?php                                                                   
										}
									}                     
									?>                
								</div>    
								<?php                           
								if(count(@$error) > 0 || count(@$success) > 0){
									?>
									<div class="alert-system padding-top-5">
										<?php                                           
										if(count(@$error) > 0){
											?>
											<ul class="alert-error">
												<?php 
												foreach (@$error as $key => $value) {
													?>
													<li><?php echo $value; ?></li>
													<?php
												}
												?>                              
											</ul>
											<?php
										}
										if(count(@$success) > 0){
											?>
											<ul class="alert-success">
												<?php 
												foreach (@$success as $key => $value) {
													?>
													<li><?php echo $value; ?></li>
													<?php
												}
												?>                              
											</ul>
											<?php
										}
										?>  
										<div class="clr"></div>                                            
									</div>              
									<?php
								}                
								$style_ttkh='';
								if(count($arrCart) > 0){
									$style_ttkh='block';
								}else{
									$style_ttkh='none';
								}                
								?>            
								<div class="alert-system padding-top-5" style="display: none;"></div>    
								<div class="margin-top-15 tbl-ttkh" style="display: <?php echo $style_ttkh; ?>">
									<div class="ttkh">Thông tin khách hàng</div>
									<div class="margin-top-15">
										<input type="text" class="ttkh-text" name="customer_name" value="" placeholder="Tên người nhận">
									</div>
									<div class="margin-top-15">
										<input type="text" class="ttkh-text" name="customer_phone" value="" placeholder="Số điện thoại">
									</div>
									<div class="margin-top-15">
										<input type="text" class="ttkh-text" name="customer_address" value="" placeholder="Địa chỉ">
									</div>
									<div class="margin-top-15">
										<input type="text" class="ttkh-text" name="customer_email" value="" placeholder="Email">
									</div>
									<div class="margin-top-15">
										<input type="text" class="ttkh-text" name="customer_note" value="" placeholder="Ghi chú: Màu sắc, thời gian giao hàng,...">
									</div>
									<div class="margin-top-15">
										<a href="javascript:void(0);" onclick="checkout(this);" class="kh-checkout_2">Thanh toán</a>
										<a href="<?php echo url('/'); ?>" class="kh-mua-them_2">Mua thêm</a>
									</div>
								</div>                                                                   
							</form>           
						</div>
					</div>						
				</div>				
			</div>				
		</div>						
		<div class="mobilemenu padding-top-15">
			<div class="container">
				<div>
					<nav class="navbar navbar-default">
						<div class="container-fluid">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>                   
							</div>
							<div id="navbar" class="navbar-collapse collapse">
								<?php     
								$args = array(                         
									'menu_class'            => 'nav navbar-nav',                            
									'before_wrapper'        => '',
									'before_title'          => '',
									'after_title'           => '',
									'before_wrapper_ul'     =>  '',
									'after_wrapper_ul'      =>  '',
									'after_wrapper'         => ''     ,
									'link_before'           => '', 
									'link_after'            => '',                                                                    
									'theme_location'        => 'mobile-menu' ,
									'menu_li_actived'       => 'current-menu-item',
									'menu_item_has_children'=> 'menu-item-has-children',
									'alias'                 => ''
								);                 
								wp_nav_menu($args);                          
								?>             
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>    
	</header>
@yield("content")
@include("frontend.footer")
</body>
</html>



