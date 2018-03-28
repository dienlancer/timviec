 <div class="tieu-de margin-top-15">Xác nhận thanh toán</div>
 <?php
 $setting=getSettingSystem();
 $product_width = $setting['product_width']['field_value'];
 $product_height = $setting['product_height']['field_value'];    
 $ssName="vmart";
 $arrCart=array();
 if(Session::has($ssName)){    
    $arrCart = @Session::get($ssName);    
}   
?>
<table  class="com_product16 margin-top-5" cellpadding="0" cellspacing="0" width="100%">
    <thead>
        <tr>    
            <th align="center">Sản phẩm</th>
            <th width="20%"><center>Giá</center></th>
            <th  width="10%"><center>Số lượng</center></th>
            <th width="20%"><center>Tổng giá</center></th>        
        </tr>
    </thead>
    <tbody>
        <?php   
        $total_price=0;
        $total_quantity=0;
        foreach ($arrCart as $key => $value) {  
            $product_id=$value["product_id"];      
            $product_name=$value["product_name"];
            $product_code=$value["product_code"];
            $product_price=$value["product_price"];        
            $product_image=    asset('/upload/'.$product_width."x".$product_height."-". $value["product_image"]) ;        
            $product_link=route('frontend.index.index',[$value['product_alias']]) ;         
            $product_quantity=$value["product_quantity"];
            $product_price=fnPrice($value["product_price"]) ;
            $product_total_price=fnPrice($value["product_total_price"]) ;
            $total_price+=(float)$value["product_total_price"];  
            $total_quantity+=(float)$product_quantity;    
            ?>
            <tr>

                <td class="com_product20"><a href="<?php echo $product_link ?>"><?php echo $product_name; ?></a></td>
                <td class="com_product21" align="right"><?php echo $product_price; ?></td>
                <td align="center" class="com_product22"><?php echo $product_quantity; ?></td>
                <td class="com_product23" align="right"><?php echo $product_total_price; ?></td>            
            </tr>
            <?php
        } 
        ?>                  
    </tbody>
    <tfoot>
        <tr>
            <td colspan="2">
                Tổng cộng
            </td>
            <td align="center"><?php echo $total_quantity; ?></td>
            <td align="right"><?php echo fnPrice($total_price) ; ?></td>
            
        </tr>
    </tfoot>
</table>
<?php                           
 if(count($error) > 0 || count($success) > 0){
    ?>
    <div class="alert-system padding-top-5">
        <?php                                           
        if(count($error) > 0){
            ?>
            <ul class="alert-error">
                <?php 
                foreach ($error as $key => $value) {
                    ?>
                    <li><?php echo $value; ?></li>
                    <?php
                }
                ?>                              
            </ul>
            <?php
        }
        if(count($success) > 0){
            ?>
            <ul class="alert-success">
                <?php 
                foreach ($success as $key => $value) {
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
 ?>
<form method="post" name="frm">   
    <input type="hidden" name="id" value="<?php echo @$data["id"]; ?>" />
    <input type="hidden" name="username" value="<?php echo @$data["username"]; ?>" />
    <input type="hidden" name="quantity" value="<?php echo @$total_quantity; ?>" />
    <input type="hidden" name="total_price" value="<?php echo @$total_price; ?>" />                
    {{ csrf_field() }}     
    <div class="col-md-4">
        <table class="com-product-51"  border="0" width="100%" cellpadding="0" cellspacing="0">                   
            <tbody>        
                <tr>
                    <td align="right">Tài khoản</td>
                    <td><?php echo @$data["username"]; ?></td>        
                </tr>                           
                <tr>
                    <td align="right">Email</td>
                    <td><input type="text" name="email" value="<?php echo @$data["email"]; ?>" class="contact-input" /></td>                   
                </tr>                     
                <tr>
                    <td align="right">Tên</td>
                    <td><input type="text" name="fullname" value="<?php echo @$data["fullname"]; ?>" class="contact-input" /></td>            
                </tr>
                <tr>
                    <td align="right">Địa chỉ</td>
                    <td><input type="text" name="address" value="<?php echo @$data["address"]; ?>" class="contact-input" /></td>            
                </tr>                
                <tr>
                    <td align="right">Phone</td>
                    <td><input type="text" name="phone" value="<?php echo @$data["phone"]; ?>" class="contact-input" /></td>            
                </tr>                  
                <tr>           
                    <td></td>
                    <td class="com_product31" align="right">
                        <a href="javascript:void(0);" class="com_product32 thanh-toan-thuong" onclick="document.forms['frm'].submit();">Thanh toán</a> 
                    </td>                       
                </tr> 
            </tbody>    
        </table>
    </div>
    <div class="col-md-8">
        <table  class="com-product-51" border="0" cellpadding="0" cellspacing="0">   
            <thead><tr><th>Hình thức thanh toán</th></tr></thead>     
            <tbody>        
                <tr>
                    <td align="left"><font color="red"><b><i>Vui lòng chọn một hình thức thanh toán *</i></b></font></td>                    
                </tr>                                               
                <tr>
                    <td>
                        <select class="contact-input" name="payment_method_id" onchange="changePaymentMethod(this.value);">
                            <?php 
                            for($i=0;$i<count($data_paymentmethod);$i++){
                                $id=$data_paymentmethod[$i]["id"];
                                $fullname=$data_paymentmethod[$i]["fullname"];
                                if((int)@$data["payment_method_id"] == (int)$id){
                                    echo '<option selected value="'.$id.'">'.$fullname.'</option>';                               
                                }
                                else{
                                    echo '<option          value="'.$id.'">'.$fullname.'</option>';                               
                                }
                            }
                            ?>                                                    
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><div class="boxContent" ><span class="payment_method_content"></span></div></td>
                </tr>                
            </tbody>    
        </table>
    </div> 
    <div class="clr"></div>      
</form>
<script type="text/javascript" language="javascript">
    function changePaymentMethod(id)    {
        var token=$("input[type='hidden'][name='_token']").val();   
        var dataItem = {                 
            "id"                    : id,           
            "_token"                : token                            
        };
        $.ajax({
            url         : '<?php echo route('frontend.index.getPaymentmethod'); ?>',
            type        : "POST",
            data        : dataItem,           
            success     : function(data, status, jsXHR){                            
                $(".payment_method_content").empty();
                $(".boxContent").hide();
                if(data != null){
                    $(".boxContent").show();
                    $(".payment_method_content").append(data.content);
                }                           
            }
        });
    }
</script>