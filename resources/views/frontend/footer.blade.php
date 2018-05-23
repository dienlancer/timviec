<div class="ranoo margin-top-15">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">				
				<?php     
				$args = array(                         
					'menu_class'            => 'menu-footer',                               
					'before_wrapper'        => '<div class="ritae">',
					'before_title'          => '',
					'after_title'           => '',
					'before_wrapper_ul'     => '',
					'after_wrapper_ul'      => '',
					'after_wrapper'         => '</div>'     ,
					'link_before'           => '', 
					'link_after'            => '',                                                                    
					'theme_location'        => 'menu-footer' ,
					'menu_li_actived'       => 'current-menu-item',
					'menu_item_has_children'=> 'menu-item-has-children',
					'alias'                 => @$seo_alias,
				);                    
				wp_nav_menu($args);
				?>     	
				<div class="jamaramdo">
					<a href="javascript:void(0);">
						<i class="fas fa-arrow-circle-up"></i>&nbsp;
						Về đầu trang
					</a>
				</div>												
			</div>
		</div>
	</div>
</div>	
<footer>
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<div class="margin-top-15"><center><a href="<?php url('/'); ?>"><img src="<?php echo asset('/upload/logo.png'); ?>"></a></center></div>
				<div class="margin-top-15"><center><img src="<?php echo asset('/upload/bo-cong-thuong.png'); ?>"></center></div>
			</div>
			<div class="col-lg-8">
				<div class="margin-top-15">
					<?php 
				$page_footer_intro=getPage("footer-intro");							
				if(count($page_footer_intro) > 0){								
					$page_footer_intro_content=$page_footer_intro["content"];					
					echo $page_footer_intro_content;		
				}
				?>
				</div>					
			</div>
		</div>
	</div>
</footer>