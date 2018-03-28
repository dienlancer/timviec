<?php 
?>
<footer class="footer margin-top-15">
	<div class="container azweb">
		<div class="col-sm-3">				
			<?php 
			$module=getPage("intro-footer");
			if(count($module) > 0){
				$fullname=substr($module["fullname"],0,50);
				$featuredImg=asset('upload/'.$module['image']);
				$permalink=route('frontend.index.index',[$module['alias']]);	
				$content=$module["content"];					
				?>		
				<div class="margin-top-25">
					<div>

							<a href="<?php echo url('/'); ?>">                
								<img src="<?php echo $seo_logo_frontend;?>" />
							</a>
						
					</div>	
					<div ><?php echo $fullname; ?></div>
					<div class="tialia margin-top-15">
						<?php echo $content; ?>
					</div>
					<div class="margin-top-15 thiet-ke-boi">Thiết kế bởi: <a href="https://vidoweb.com.vn" target="_blank">Vidoweb</a> </div>		
				</div>										
				<?php				
			}
			?>			
		</div>
		<div class="col-sm-2">
			<?php     
			$args = array(                         
				'menu_class'            => 'danhmucspfooter', 					                     
				'before_wrapper'        => '<div class="margin-top-40">',
				'before_title'          => '<div class="brabel">',
				'after_title'           => '</div>',
				'before_wrapper_ul'     =>  '<div class="margin-top-10">',
				'after_wrapper_ul'      =>  '</div>',
				'after_wrapper'         => '</div>'     ,
				'link_before'       	=> '', 
				'link_after'        	=> '',                                        
				'theme_location'        => 'danhmucspfooter' ,
				'menu_li_actived'       => 'current-menu-item',
				'menu_item_has_children'=> 'menu-item-has-children',
				'alias'                 => $seo_alias
			);                    
			wp_nav_menu($args);
			?>         
		</div>
		<div class="col-sm-2">
			<?php     
			$args = array(                         
				'menu_class'            => 'danhmucspfooter', 					                     
				'before_wrapper'        => '<div class="margin-top-40">',
				'before_title'          => '<div class="brabel">',
				'after_title'           => '</div>',
				'before_wrapper_ul'     =>  '<div class="margin-top-10">',
				'after_wrapper_ul'      =>  '</div>',
				'after_wrapper'         => '</div>'     ,
				'link_before'       	=> '', 
				'link_after'        	=> '',                                        
				'theme_location'        => 'htkh' ,
				'menu_li_actived'       => 'current-menu-item',
				'menu_item_has_children'=> 'menu-item-has-children',
				'alias'                 => $seo_alias
			);                    
			wp_nav_menu($args);
			?>         
		</div>
		<div class="col-sm-2">
			<div class="margin-top-40">
				<div class="brabel">Kết nối mạng xã hội</div>
				<div class="tialia margin-top-15">
					<?php 
					$setting=getSettingSystem();
					$telephone=$setting['telephone']['field_value'];
					$facebook_url=$setting['facebook_url']['field_value'];
					$twitter_url=$setting['twitter_url']['field_value'];
					$google_plus=$setting['google_plus']['field_value'];
					$youtube_url=$setting['youtube_url']['field_value'];
					$instagram_url=$setting['instagram_url']['field_value'];
					$pinterest_url=$setting['pinterest_url']['field_value'];   
					?>
					<ul class="inline-block connected-social">
						<li><a href="<?php echo $facebook_url; ?>"><img src="<?php echo asset('upload/facebook-icon.png'); ?>"></a></li>
						<li><a href="<?php echo $twitter_url; ?>"><img src="<?php echo asset('upload/twitter-icon.png'); ?>"></a></li>
						<li><a href="<?php echo $google_plus; ?>"><img src="<?php echo asset('upload/google-plus.png'); ?>"></a></li>
						<li><a href="<?php echo $youtube_url; ?>"><img src="<?php echo asset('upload/youtube-icon.png'); ?>"></a></li>												
					</ul>
					<div class="clr"></div>  
				</div>
			</div>		
								
		</div>
		<div class="col-sm-3">
				<?php 
			$module=getPage("fanpage-footer");			
			if(count($module) > 0){		
				$fullname=$module['fullname'];		
				$intro=$module["intro"];					
				?>		
				<div class="margin-top-40">
					<div class="brabel"><?php echo $fullname; ?></div>
					<div class="tialia margin-top-15">
						<?php echo $intro; ?>
					</div>		
				</div>										
				<?php				
			}
			?>							
		</div>
	</div>
</footer>
<div class="modal fade modal-add-cart" id="modal-alert-add-cart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        
      </div>
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>        
			</div>
			<div class="modal-body">

			</div>      
		</div>
	</div>
</div>