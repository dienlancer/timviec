<?php 
$li_dashboard='';

$li_content_management='';
$li_category_article='';
$li_article='';

$li_employer_management='';
$li_employer='';

$li_candidate_management='';
$li_candidate='';

$li_category_management='';
$li_province='';
$li_scale='';
$li_sex='';
$li_marriage='';

$li_menu_type='';
$li_page='';
$li_category_banner='';
$li_module_item='';

$li_setting_system='';

$li_phan_quyen='';
$li_group_member='';
$li_user='';
$li_privilege='';
$li_media='';
switch ($controller) {
    case 'dashboard':
    $li_dashboard='active open';
    break;
    case 'category-article':  
    $li_category_article='active open';
    $li_content_management='active open';
    break;   
    case 'article': 
    $li_article='active open';
    $li_content_management='active open';
    break;
    case 'employer': 
    $li_employer='active open';       
    $li_employer_management='active open';
    break;
    case 'candidate': 
    $li_candidate='active open';       
    $li_candidate_management='active open';
    break;
    case 'province': 
    $li_province='active open';       
    $li_category_management='active open'; 
    break;
    case 'scale': 
    $li_scale='active open';       
    $li_category_management='active open'; 
    break;
    case 'sex': 
    $li_sex='active open';       
    $li_category_management='active open'; 
    break;
    case 'marriage': 
    $li_marriage='active open';       
    $li_category_management='active open'; 
    break;    
    case 'category-param':  
    $li_category_param='active open';
    $li_product_management='active open';
    break;   
    case 'menu-type':
    case 'menu':
    $li_menu_type='active open';
    break;  
    case 'page':    
    $li_page='active open';
    break;  
    case 'category-banner':
    case 'banner':
    $li_category_banner='active open';
    break;  
    case 'module-item':
    $li_module_item='active open';
    break;
    case 'setting-system':
    $li_setting_system='active open';
    break; 
    case 'media':
    $li_media='active open';
    break;    
    case 'group-member':
    $li_group_member='active open';
    $li_phan_quyen='active open';
    break;  
    case 'user':
    $li_user='active open';
    $li_phan_quyen='active open';
    break;
    case 'privilege':
    $li_privilege='active open';
    $li_phan_quyen='active open';
    break;       
}

$user=Sentinel::getUser();                                
$data=array();
$source=array();
$alias=null;
$source=DB::table('group_member')
->join('user_group_member','group_member.id','=','user_group_member.group_member_id')
->join('users','users.id','=','user_group_member.user_id')
->where('users.id',(int)@$user->id)                            
->select('group_member.alias')
->groupBy('group_member.alias')
->get()->toArray();
if(count($source) > 0){
    $data=convertToArray($source);
    $alias=$data[0]['alias'];
}                   
?>
<ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
    <li class="nav-item  <?php echo $li_dashboard; ?>">
            <a href="{!! route('adminsystem.dashboard.getForm') !!}" class="nav-link nav-toggle">
                <i class="icon-notebook"></i>
                <span class="title">Bảng điều khiển</span>                                            
            </a>                                                                      
    </li>
    <?php     
    switch ($alias){
        case 'administrator':
        ?>                                            
        <li class="nav-item <?php echo $li_content_management; ?>">
            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-folder-open-o" ></i>
                <span class="title">Quản lý nội dung</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">                                    
                <li class="nav-item  <?php echo $li_category_article; ?>">
                    <a href="{!! route('adminsystem.category-article.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Chủ đề bài viết</span>                                            
                    </a>                                                                      
                </li>            
                <li class="nav-item  <?php echo $li_article; ?>">
                    <a href="{!! route('adminsystem.article.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Bài viết</span>                                            
                    </a>                                                                      
                </li>           
            </ul>
        </li>
        <li class="nav-item  <?php echo $li_category_banner; ?>">
            <a href="{!! route('adminsystem.category-banner.getList') !!}" class="nav-link nav-toggle">
                <i class="icon-notebook"></i>
                <span class="title">Quản lý banner</span>                                            
            </a>                                                                      
        </li> 
        <li class="nav-item  <?php echo $li_page; ?>">
            <a href="{!! route('adminsystem.page.getList') !!}" class="nav-link nav-toggle">
                <i class="icon-notebook"></i>
                <span class="title">Trang tĩnh</span>                                            
            </a>                                                                      
        </li> 

        <li class="nav-item <?php echo $li_employer_management; ?>">
            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-folder-open-o" ></i>
                <span class="title">Quản lý nhà tuyển dụng</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">                                    
                <li class="nav-item  <?php echo $li_employer; ?>">
                    <a href="{!! route('adminsystem.employer.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Thông tin doanh nghiệp</span>                                            
                    </a>                                                                      
                </li>                 
            </ul>
        </li>

        <li class="nav-item <?php echo $li_candidate; ?>">
            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-folder-open-o" ></i>
                <span class="title">Quản lý ứng viên</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">                                    
                <li class="nav-item  <?php echo $li_candidate; ?>">
                    <a href="{!! route('adminsystem.candidate.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Thông tin ứng viên</span>                                            
                    </a>                                                                      
                </li>                 
            </ul>
        </li>

        <li class="nav-item <?php echo $li_category_management; ?>">
            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-folder-open-o" ></i>
                <span class="title">Quản lý danh mục</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">                                    
                <li class="nav-item  <?php echo $li_province; ?>">
                    <a href="{!! route('adminsystem.province.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Tỉnh / Thành phố</span>                                            
                    </a>                                                                      
                </li>     
                <li class="nav-item  <?php echo $li_scale; ?>">
                    <a href="{!! route('adminsystem.scale.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Quy mô công ty</span>                                            
                    </a>                                                                      
                </li>    
                <li class="nav-item  <?php echo $li_sex; ?>">
                    <a href="{!! route('adminsystem.sex.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Giới tính</span>                                            
                    </a>                                                                      
                </li> 
                <li class="nav-item  <?php echo $li_marriage; ?>">
                    <a href="{!! route('adminsystem.marriage.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Tình trạng hôn nhân</span>                                            
                    </a>                                                                      
                </li>       
            </ul>
        </li>


        <li class="nav-item  <?php echo $li_media; ?>">
            <a href="{!! route('adminsystem.media.getList') !!}" class="nav-link nav-toggle">
                <i class="icon-notebook"></i>
                <span class="title">Thư viện</span>                                            
            </a>                                                                      
        </li>
        <li class="nav-item  <?php echo $li_menu_type; ?>">
            <a href="{!! route('adminsystem.menu-type.getList') !!}" class="nav-link nav-toggle">
                <i class="icon-notebook"></i>
                <span class="title">Menu</span>                                            
            </a>                                                                      
        </li> 
        <li class="nav-item  <?php echo $li_module_item; ?>">
            <a href="{!! route('adminsystem.module-item.getList') !!}" class="nav-link nav-toggle">
                <i class="icon-notebook"></i>
                <span class="title">Module</span>                                            
            </a>                                                                      
        </li>     

        <li class="nav-item  <?php echo $li_setting_system; ?>">
            <a href="{!! route('adminsystem.setting-system.getList') !!}" class="nav-link nav-toggle">
                <i class="icon-notebook"></i>
                <span class="title">Cấu hình</span>                                            
            </a>                                                                      
        </li>       
        <li class="nav-item  <?php echo $li_phan_quyen ?>">
            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-folder-open-o" ></i>
                <span class="title">Quản lý người dùng</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">                                    
                <li class="nav-item  <?php echo $li_group_member; ?>">
                    <a href="{!! route('adminsystem.group-member.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Nhóm người dùng</span>                                            
                    </a>                                                                      
                </li>
                <li class="nav-item  <?php echo $li_user; ?>">
                    <a href="{!! route('adminsystem.user.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Người dùng</span>                                            
                    </a>                                                                      
                </li>
                <li class="nav-item  <?php echo $li_privilege; ?>">
                    <a href="{!! route('adminsystem.privilege.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Nhóm quyền</span>                                            
                    </a>                                                                      
                </li>
            </ul>
        </li>          
        <?php
        break;
        default:
        ?>
        <li class="nav-item <?php echo $li_employer_management; ?>">
            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-folder-open-o" ></i>
                <span class="title">Quản lý nhà tuyển dụng</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">                                    
                <li class="nav-item  <?php echo $li_employer; ?>">
                    <a href="{!! route('adminsystem.employer.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Thông tin doanh nghiệp</span>                                            
                    </a>                                                                      
                </li>                 
            </ul>
        </li>
        <li class="nav-item <?php echo $li_candidate; ?>">
            <a href="javascript:;" class="nav-link nav-toggle">
                <i class="fa fa-folder-open-o" ></i>
                <span class="title">Quản lý ứng viên</span>
                <span class="arrow"></span>
            </a>
            <ul class="sub-menu">                                    
                <li class="nav-item  <?php echo $li_candidate; ?>">
                    <a href="{!! route('adminsystem.candidate.getList') !!}" class="nav-link nav-toggle">
                        <i class="icon-notebook"></i>
                        <span class="title">Thông tin ứng viên</span>                                            
                    </a>                                                                      
                </li>                 
            </ul>
        </li>
        <?php
        break;
    }
    ?>                           
</ul>