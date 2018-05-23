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
						
					</a>
				</div>												
			</div>
		</div>
	</div>
</div>	
<footer>
	
</footer>