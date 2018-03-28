<div class="tieu-de margin-top-15">
            Giỏ hàng
        </div>
<?php 
$setting=getSettingSystem();
$product_width = $setting['product_width']['field_value'];
$product_height = $setting['product_height']['field_value'];
$ssName="vmart";
$arrCart=array();
if(Session::has($ssName)){
    $arrCart=Session::get($ssName);    
}      
if(count($arrCart) > 0){
	?>
	<form name="frm" method="post" action="" class="margin-top-5">
<table  class="com_product16" cellpadding="0" cellspacing="0" width="100%">
	<thead>
	<tr>	
		<th>Sản phẩm</th>
		<th>Giá</th>
		<th>Số lượng</th>
		<th>Tổng giá</th>
		<th></th>
	</tr>
	</thead>
	<tbody>
	<?php	
	$total_price=0;
	foreach ($arrCart as $key => $value) {	
		$product_id=$value["product_id"];      
        $product_name 				=	$value["product_name"];
        $product_code				=	$value["product_code"];
        $product_price 				=	$value["product_price"];        
        $product_image 				=  	asset('/upload/'.$product_width.'x'.$product_height.'-'.$value['product_image']) ;        
        $product_link 				= 	route('frontend.index.index',[$value['product_alias']]);			
		$product_quantity			=	$value["product_quantity"];
		$product_price_text 		=	fnPrice($value["product_price"]);
		$product_total_price_text 	= 	fnPrice($value["product_total_price"]);
		$total_price+=(float)$value["product_total_price"];				
		$delete_cart				=	route('frontend.index.deleteAll');
		$continue_link 				=	url('/');
		$delete_link 				=	route('frontend.index.delete',[$product_id]);
		$checkout_link 				=	route('frontend.index.checkout');
	 	?>
	 	<tr>			
			<td class="com_product20"><a href="<?php echo $product_link ?>"><?php echo $product_name; ?></a></td>
			<td align="right" class="com_product21"><?php echo $product_price_text; ?></td>
			<td align="center" class="com_product22"><input  type="text" onkeypress="return isNumberKey(event)" value="<?php echo $product_quantity; ?>" size="4" class="com_product19" name="quantity[<?php echo $product_id; ?>]">		
			</td>
			<td align="right" class="com_product23"><?php echo $product_total_price_text; ?></td>
			<td align="center" class="com_product24"><a href="<?php echo $delete_link; ?>"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
		</tr>
	 	<?php
	 } 
	?>					
	</tbody>
	<tfoot>
		<tr>
			<td colspan="3">
				<a href="<?php echo $delete_cart; ?>" class="com_product28">Xóa giỏ hàng</a>
				<input type="submit" name="btn_update_cart" class="com_product25" value="Cập nhật" />							
				<a href="<?php echo $continue_link; ?>" class="com_product27">Tiếp tục mua hàng</a>
				<a href="<?php echo $checkout_link; ?>" class="com_product29">Thanh toán</a>
				<input type="hidden" name="action" value="update-cart" />
				{{ csrf_field() }}
			</td>			
			<td align="right"><?php echo fnPrice($total_price) ; ?></td>
			<td></td>
		</tr>
	</tfoot>
</table>
</form>
	<?php
}else{
	?>
	<table class="com_product16 margin-top-5" cellpadding="0" cellspacing="0" width="100%">
		<thead>
			<tr>					
				<th>Giỏ hàng rỗng</th>
			</tr>
		</thead>
	</table>
	<?php
}    
?>
