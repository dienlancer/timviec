 <h1 class="tieu-de margin-top-15">
    Tài khoản
</h1>
<form method="post" name="frm" class="padding-top-5 margin-top-5 box-article">
    {{ csrf_field() }}
    <input type="hidden" name="username" value="<?php echo @$data["username"]; ?>" />   
    <?php                           
    if(count($error) > 0 || count($success) > 0){
        ?>
        <div class="alert-system margin-top-5">
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
        </div>              
        <?php
    }
    ?>
    <table class="com_product30" border="0" width="90%" cellpadding="0" cellspacing="0">                   
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
                <td class="com_product31">
                    <div class="box-readmore">
                        <a href="javascript:void(0);" onclick="document.forms['frm'].submit();">Gửi</a>       
                    </div>      
                </td>                      
            </tr> 
        </tbody>    
    </table>
</form>
