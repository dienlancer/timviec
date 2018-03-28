<?php namespace App\Http\Controllers\frontend;
session_start();
use App\Http\Requests;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\CategoryModel;
use App\CategoryArticleModel;
use App\CategoryProductModel;
use App\GroupModel;
use App\MenuModel;
use App\ArticleModel;
use App\PageModel;
use App\PaginationModel;
use App\ProductModel;
use App\ModuleMenuModel;
use App\ModuleCustomModel;
use App\ModuleArticleModel;
use App\ModMenuTypeModel;
use App\User;
use App\UserGroupMemberModel;
use App\GroupMemberModel;
use App\CustomerModel;
use App\InvoiceModel;
use App\InvoiceDetailModel;
use App\BannerModel;
use App\ModuleItemModel;
use App\PaymentMethodModel;
use App\ProjectModel;
use App\ProjectArticleModel;
use App\ProjectMemberModel;
use App\OrganizationModel;
use App\AlbumModel;
use App\PhotoModel;
use App\CategoryVideoModel;
use App\VideoModel;
use App\NL_CheckOutV3;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use Session;
use DB;
use Hash;
use Sentinel;
class IndexController extends Controller {  
  var $_pageRange=4;
  var $_ssNameUser="vmuser";
  var $_ssNameCart="vmart";      
  var $_ssNameInvoice="vminvoice";
  public function getHome(Request $request){       
    $flag=1;
        $error=array();
        $data=array();
        $success=array();           
        $layout="two-column";     
        $component='contact';
        $alias="lien-he-voi-chung-toi";   
        if($request->isMethod('post'))     {  
          $data=$request->all();                    
          $fullname   = @$request->fullname;
          $email      = @$request->email;   
          $telephone  = @$request->telephone;
          $title      = @$request->title;
         
          $content    = @$request->content;
          /* begin load config contact */
          $setting=getSettingSystem();    
          $smtp_host      = @$setting['smtp_host']['field_value'];
          $smtp_port      = @$setting['smtp_port']['field_value'];
          $smtp_auth      = @$setting['authentication']['field_value'];
          $encription     = @$setting['encription']['field_value'];
          $smtp_username  = @$setting['smtp_username']['field_value'];
          $smtp_password  = @$setting['smtp_password']['field_value'];
          $email_from     = $email;
          $email_to       = @$setting['email_to']['field_value'];
          $contacted_person = @$setting['contacted_person']['field_value'];          
          /* end load config contact */       
          if(mb_strlen($fullname) < 6){
            $error["fullname"] = 'Họ tên phải chứa từ 6 ký tự trở lên';
            $data["fullname"] = "";          
            $flag=0;
          }
          if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#",$email )){
            $error["email"] = 'Email không hợp lệ';
            $data["email"] = '';
            $flag=0;
          }
          if(mb_strlen($telephone) < 10){
            $error["telephone"] = 'Số điện thoại không hợp lệ';
            $data["telephone"] = "";          
            $flag=0;
          }
          if(mb_strlen($title) < 10){
            $error["title"] = 'Tiêu đề không hợp lệ';
            $data["title"] = "";         
            $flag=0;
          }   
          
          if(mb_strlen($content) < 10){
            $error["content"] = 'Nội dung không hợp lệ';
            $data["content"] = "";         
            $flag=0;
          }     
          if((int)@$flag==1){
            $mail = new PHPMailer(true);
            try{
              $mail->SMTPDebug = 0;                           
              $mail->isSMTP();     
              $mail->CharSet = "UTF-8";                           
              $mail->Host = $smtp_host; 
              $mail->SMTPAuth = $smtp_auth;                         
              $mail->Username = $smtp_username;             
              $mail->Password = $smtp_password;             
              $mail->SMTPSecure = $encription;                       
              $mail->Port = $smtp_port;                            
              $mail->setFrom($email_from, $fullname);
              $mail->addAddress($email_to, $contacted_person);   
              $mail->Subject = 'Thông tin liên hệ từ khách hàng '.$fullname.' - '.$telephone ;   
              $html_content='';     
              $html_content .='<table border="1" cellspacing="5" cellpadding="5">';
              $html_content .='<thead>';
              $html_content .='<tr>';
              $html_content .='<th colspan="2"><h3>Thông tin liên lạc từ khách hàng '.$fullname.'</h3></th>';
              $html_content .='</tr>';
              $html_content .='</thead>';
              $html_content .='<tbody>';

              $html_content .='<tr><td>Họ và tên</td><td>'.$fullname.'</td></tr>';
              $html_content .='<tr><td>Email</td><td>'.$email.'</td></tr>';
              $html_content .='<tr><td>Telephone</td><td>'.$telephone.'</td></tr>';
              $html_content .='<tr><td>Tiêu đề</td><td>'.$title.'</td></tr>';              
              $html_content .='<tr><td>Nội dung</td><td>'.$content.'</td></tr>';          

              $html_content .='</tbody>';
              $html_content .='</table>';                            
              $mail->msgHTML($html_content);
              if ($mail->Send()) {                
                $success['success']='Gửi thông tin hoàn tất'; 
                echo '<script language="javascript" type="text/javascript">alert("Gửi thông tin hoàn tất");</script>'; 
              }
              else{
                $error["exception_error"]='Quá trình gửi dữ liệu gặp sự cố'; 
                echo '<script language="javascript" type="text/javascript">alert("Có sự cố trong quá trình gửi dữ liệu");</script>'; 
              }
            }catch (Exception $e){
              $error["exception_error"]='Quá trình gửi dữ liệu gặp sự cố'; 
              echo '<script language="javascript" type="text/javascript">alert("Có sự cố trong quá trình gửi dữ liệu");</script>'; 
            }            
          }        
        }     
        \Artisan::call('sitemap:auto');   
        return view("frontend.home",compact("component","error","data","success","alias","layout"));        
  }  
  
  public function searchProduct(Request $request){
    /* begin standard */    
    $layout="two-column";                                                           
    $totalItems=0;
    $totalItemsPerPage=0;
    $pageRange=0;      
    $currentPage=1;  
    $pagination ;                                              
    $setting= getSettingSystem();     
    
    /* end standard */     
    $items=array();                            
    $component='search-product';              
    $title="Tìm kiếm"; 
    $q='';
    $prod_param=array();    

    $query=DB::table('product')   ;     
    if($request->prod_param != null){
      if(count(@$request->prod_param)>0){   
        $prod_param=@$request->prod_param;
        $query->join('post_param','product.id','=','post_param.post_id');               
        $query->whereIn('post_param.param_id',@$request->prod_param);    
      }      
    }                                       
    $category=array();
    $arr_category_id=array();
    if(!empty(@$request->category_id)){      
      $category_id    = $request->category_id;              
      $arr_category_id[]=$category_id;      
      getStringCategoryID($category_id,$arr_category_id,'category_product');      
      $query->whereIn('product.category_id', $arr_category_id);        
      $category=CategoryProductModel::find($category_id);       
    }
    
      if(!empty(@$request->q)){
        $q=@$request->q;
        $query->where('product.fullname','like', '%'.trim(@$q).'%');
      }      
 
    $query->where('product.status',1);    
    $data=$query->select('product.id')
    ->groupBy('product.id')                
    ->get()->toArray();
    
    $data=convertToArray($data);
    $totalItems=count($data);
    $totalItemsPerPage=(int)@$setting['product_perpage']['field_value']; 
    $pageRange=$this->_pageRange;
    if(!empty(@$request->filter_page)){
      $currentPage=@$request->filter_page;
    }       
    $arrPagination=array(
      "totalItems"=>$totalItems,
      "totalItemsPerPage"=>$totalItemsPerPage,
      "pageRange"=>$pageRange,
      "currentPage"=>$currentPage   
    );           
    $pagination=new PaginationModel($arrPagination);
    $position   = ((int)@$arrPagination['currentPage']-1)*$totalItemsPerPage;        
                    
    $data=$query->select('product.id','product.alias','product.fullname','product.price','product.sale_price','product.image','product.intro','product.count_view')
    ->groupBy('product.id','product.alias','product.fullname','product.price','product.sale_price','product.image','product.intro','product.count_view')
    ->orderBy('product.created_at', 'desc')
    ->skip($position)
    ->take($totalItemsPerPage)
    ->get()->toArray();   
    $items=convertToArray($data);      
    return view("frontend.index",compact("component","title","items","pagination","layout","prod_param",'q','category'));
  }  
  public function index(Request $request,$alias)
  {                     
    /* begin standard */

    $title="";
    $meta_keyword="";
    $meta_description="";                                                                
    $totalItems=0;
    $totalItemsPerPage=0;
    $pageRange=0;      
    $currentPage=1;  
    $pagination ;                                              
    $setting= getSettingSystem();    
    $layout="";       
    /* end standard */          
    $item=array();     
    $items=array();                  
    $category=array();  
    $component="";         
    $menu=MenuModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();    
    $lstCategoryArticle=CategoryArticleModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();    
    $lstCategoryProduct=CategoryProductModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
    $lstArticle=ArticleModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
    $lstProduct=ProductModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
    $lstPage=PageModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();    
    $lstProject=ProjectModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
    $lstProjectArticle=ProjectArticleModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
    $lstOrganization=OrganizationModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
    $lstAlbum=AlbumModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
    $lstCategoryVideo=CategoryVideoModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();
    if(count($lstCategoryArticle) > 0){
      $component='category-article';
    }
    if(count($lstCategoryProduct) > 0){
      $component='category-product';
    }
    if(count($lstArticle) > 0){
      $component='article';
    }
    if(count($lstProduct) > 0){
      $component='product';
    }
    if(count($lstPage) > 0){
      $component='page';
    }
    if(count($lstProject) > 0){
      $component='project';
    } 
    if(count($lstProject) > 0){
      $component='project';
    } 
    if(count($lstProjectArticle) > 0){
      $component='project-article';
    }
    if(count($lstOrganization) > 0){
      $component='organization';
    }
    if(count($lstAlbum) > 0){
      $component='album';
    }    
    if(count($lstCategoryVideo) > 0){
      $component='category-video';
    }             
    switch ($component) {
      case 'category-article':      
      $category_id=0;
      $category=CategoryArticleModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower(@$alias,'UTF-8'))])->get()->toArray();         
      if(count($category) > 0){
        $category     = $category[0];
        $category_id    = $category['id'];        
        $arr_category_id[]=$category_id;
        getStringCategoryID($category_id,$arr_category_id,'category_article');   
        $query=DB::table('article')
                ->join('article_category','article.id','=','article_category.article_id')
                ->join('category_article','category_article.id','=','article_category.category_id')
                ->whereIn('article_category.category_id', $arr_category_id)
                ->where('article.status',1);
        $data=$query->select('article.id')->groupBy('article.id')->get()->toArray();
        $data=convertToArray($data);
        $totalItems=count($data);
        $totalItemsPerPage=(int)@$setting['article_perpage']['field_value']; 
        $pageRange=$this->_pageRange;
        if(!empty(@$request->filter_page)){
          $currentPage=@$request->filter_page;
        }       
        $arrPagination=array(
          "totalItems"=>$totalItems,
          "totalItemsPerPage"=>$totalItemsPerPage,
          "pageRange"=>$pageRange,
          "currentPage"=>$currentPage   
        );           
        $pagination=new PaginationModel($arrPagination);
        $position   = ((int)@$arrPagination['currentPage']-1)*$totalItemsPerPage;        
        $data=$query->select('article.id','article.alias','article.fullname','article.image','article.intro','article.count_view')                
                    ->groupBy('article.id','article.alias','article.fullname','article.image','article.intro','article.count_view')
                    ->orderBy('article.created_at', 'desc')
                    ->skip($position)
                    ->take($totalItemsPerPage)
                    ->get()
                    ->toArray();        
        $items=convertToArray($data);                            
      }              
      $layout="two-column";  
      break;
      case 'article':
      $row=ArticleModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();              
      if(count($row) > 0){
        $item=$row[0];
      }            
      $layout="two-column";       
      break;        
      case 'page':
      $row=PageModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();              
      if(count($row) > 0){
        $item=$row[0];
      }      
      $layout="two-column";         
      break; 
      case 'category-product':
      $category_id=0;
      $category=CategoryProductModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();       
      if(count($category) > 0){
        $category     = $category[0];
        $category_id    = $category['id'];        
        $arr_category_id[]=(int)@$category_id;        

        getStringCategoryID($category_id,$arr_category_id,'category_product');    
        $query=DB::table('product')                      
                ->whereIn('product.category_id', $arr_category_id)
                ->where('product.status',1)  ;
        $data=$query->select('product.id')->groupBy('product.id')->get()->toArray();
        $data=convertToArray($data);

        $totalItems=count($data);
        $totalItemsPerPage=(int)$setting['product_perpage']['field_value']; 
        $pageRange=$this->_pageRange;
        if(!empty(@$request->filter_page)){
          $currentPage=@$request->filter_page;
        }       
        $arrPagination=array(
          "totalItems"=>$totalItems,
          "totalItemsPerPage"=>$totalItemsPerPage,
          "pageRange"=>$pageRange,
          "currentPage"=>$currentPage   
        );           
        $pagination=new PaginationModel($arrPagination);
        $position   = ((int)@$arrPagination['currentPage']-1)*$totalItemsPerPage;        
        $data=$query->select('product.id','product.alias','product.fullname','product.image','product.intro','product.price','product.sale_price')                
                ->groupBy('product.id','product.alias','product.fullname','product.image','product.intro','product.price','product.sale_price')
                ->orderBy('product.created_at', 'desc')
                ->skip($position)
                ->take($totalItemsPerPage)
                ->get()->toArray();   
        $items=convertToArray($data);                  
      }    
      
      $layout="two-column";             
      break; 
      case 'product':
      $row=ProductModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();              
      if(count($row) > 0){
        $item=$row[0];
      }    
      $layout="two-column";       
      break;     
      case 'products':              
      $query=DB::table('product')->where('product.status',1);
      $data= $query->select('product.id')->groupBy('product.id')->get()->toArray();
        $data=convertToArray($data);
        $totalItems=count($data);
        $totalItemsPerPage=(int)@$setting['product_perpage']['field_value']; 
        $pageRange=$this->_pageRange;
        if(!empty(@$request->filter_page)){
          $currentPage=@$request->filter_page;
        }       
        $arrPagination=array(
          "totalItems"=>$totalItems,
          "totalItemsPerPage"=>$totalItemsPerPage,
          "pageRange"=>$pageRange,
          "currentPage"=>$currentPage   
        );           
        $pagination=new PaginationModel($arrPagination);
        $position   = ((int)@$arrPagination['currentPage']-1)*$totalItemsPerPage;        
        $data=$query->select('product.id','product.alias','product.fullname','product.image')                                
                    ->groupBy('product.id','product.alias','product.fullname','product.image')
                    ->orderBy('product.created_at', 'desc')
                    ->skip($position)
                    ->take($totalItemsPerPage)
                    ->get()
                    ->toArray();            
        $items=convertToArray($data);           
      $layout="two-column";        
      break;            
    }  
    if(count($menu) > 0){
      $menu=convertToArray($menu);
      $title=$menu[0]['fullname'];
    }       
    if(count($item) > 0){
      $title=$item['fullname'];                      
      if(!empty($item['meta_keyword'])){
        $meta_keyword=$item['meta_keyword'];
      }                
      if(!empty($item['meta_description'])){
        $meta_description=$item['meta_description'];
      }                
    }         
    if(count($category) > 0){      
      $title=$category['fullname'];                         
      if(!empty($category['meta_keyword'])){
        $meta_keyword=$category['meta_keyword'];
      }                
      if(!empty($category['meta_description'])){
        $meta_description=$category['meta_description'];
      }
    }    
    \Artisan::call('sitemap:auto');        
    return view("frontend.index",compact("component","alias","title","meta_keyword","meta_description","item","items","pagination","layout","category"));   
                               
  }

      
      public function viewCart(Request $request){   
          $layout="two-column";     
          $component='cart';                 
        if($request->isMethod('post')){
            $arrQTY=$request->quantity;                 
              $ssCart=array();
              $arrCart=array();
              if(Session::has($this->_ssNameCart)){
                $arrCart=Session::get($this->_ssNameCart);
              }         
              if(count($arrCart) > 0){
                foreach ($arrCart as $key => $value) {    
                    $product_quantity=(int)$arrQTY[$key];
                    $product_price = (float)$arrCart[$key]["product_price"];
                    $product_total_price=$product_quantity * $product_price;
                    $arrCart[$key]["product_quantity"]=$product_quantity;
                    $arrCart[$key]["product_total_price"]=$product_total_price;
                }
                foreach ($arrCart as $key => $value) {
                  $product_quantity=(int)$arrCart[$key]["product_quantity"];
                  if($product_quantity==0){
                    unset($arrCart[$key]);
                  }
                }
              }              
              $cart["cart"]=$arrCart;                    
              Session::put($this->_ssNameCart,$arrCart);                   
              if(count($arrCart)==0){
                Session::forget($this->_ssNameCart);              
              }                
        }            
        return view("frontend.index",compact("component","layout"));
      }
      public function contact(Request $request){   
        $flag=1;
        $error=array();
        $data=array();
        $success=array();           
        $layout="full-width";     
        $component='contact';
        $alias="lien-he";   
        if($request->isMethod('post'))     {  
          $data=$request->all();                    
          $fullname   = @$request->fullname;
          $email      = @$request->email;   
          $telephone  = @$request->telephone;
          $title      = @$request->title;
          $address    = @$request->address;
          $content    = @$request->content;
          /* begin load config contact */
          $setting=getSettingSystem();    
          $smtp_host      = @$setting['smtp_host']['field_value'];
          $smtp_port      = @$setting['smtp_port']['field_value'];
          $smtp_auth      = @$setting['authentication']['field_value'];
          $encription     = @$setting['encription']['field_value'];
          $smtp_username  = @$setting['smtp_username']['field_value'];
          $smtp_password  = @$setting['smtp_password']['field_value'];
          $email_from     = $email;
          $email_to       = @$setting['email_to']['field_value'];
          $contacted_person = @$setting['contacted_person']['field_value'];          
          /* end load config contact */       
          if(mb_strlen($fullname) < 6){
            $error["fullname"] = 'Họ tên phải chứa từ 6 ký tự trở lên';
            $data["fullname"] = "";          
            $flag=0;
          }
          if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#",$email )){
            $error["email"] = 'Email không hợp lệ';
            $data["email"] = '';
            $flag=0;
          }
          if(mb_strlen($telephone) < 10){
            $error["telephone"] = 'Số điện thoại không hợp lệ';
            $data["telephone"] = "";          
            $flag=0;
          }
          if(mb_strlen($title) < 10){
            $error["title"] = 'Tiêu đề không hợp lệ';
            $data["title"] = "";         
            $flag=0;
          }   
          if(mb_strlen($address) < 10){
            $error["address"] = 'Địa chỉ không hợp lệ';
            $data["address"] = "";         
            $flag=0;
          }   
          if(mb_strlen($content) < 10){
            $error["content"] = 'Nội dung không hợp lệ';
            $data["content"] = "";         
            $flag=0;
          }     
          if((int)@$flag==1){
            $mail = new PHPMailer(true);
            try{
              $mail->SMTPDebug = 0;                           
              $mail->isSMTP();     
              $mail->CharSet = "UTF-8";          
              $mail->Host = $smtp_host; 
              $mail->SMTPAuth = $smtp_auth;                         
              $mail->Username = $smtp_username;             
              $mail->Password = $smtp_password;             
              $mail->SMTPSecure = $encription;                       
              $mail->Port = $smtp_port;                            
              $mail->setFrom($email_from, $fullname);
              $mail->addAddress($email_to, $contacted_person);   
              $mail->Subject = 'Thông tin liên hệ từ khách hàng '.$fullname.' - '.$telephone ;   
              $html_content='';     
              $html_content .='<table border="1" cellspacing="5" cellpadding="5">';
              $html_content .='<thead>';
              $html_content .='<tr>';
              $html_content .='<th colspan="2"><h3>Thông tin liên lạc từ khách hàng '.$fullname.'</h3></th>';
              $html_content .='</tr>';
              $html_content .='</thead>';
              $html_content .='<tbody>';

              $html_content .='<tr><td>Họ và tên</td><td>'.$fullname.'</td></tr>';
              $html_content .='<tr><td>Email</td><td>'.$email.'</td></tr>';
              $html_content .='<tr><td>Telephone</td><td>'.$telephone.'</td></tr>';
              $html_content .='<tr><td>Tiêu đề</td><td>'.$title.'</td></tr>';
              $html_content .='<tr><td>Địa chỉ</td><td>'.$address.'</td></tr>';
              $html_content .='<tr><td>Nội dung</td><td>'.$content.'</td></tr>';          

              $html_content .='</tbody>';
              $html_content .='</table>';                            
              $mail->msgHTML($html_content);
              if ($mail->Send()) {                
                $success['success']='Gửi thông tin hoàn tất'; 
                echo '<script language="javascript" type="text/javascript">alert("Gửi thông tin hoàn tất");</script>'; 
              }
              else{
                $error["exception_error"]='Quá trình gửi dữ liệu gặp sự cố'; 
                echo '<script language="javascript" type="text/javascript">alert("Có sự cố trong quá trình gửi dữ liệu");</script>'; 
              }
            }catch (Exception $e){
              $error["exception_error"]='Quá trình gửi dữ liệu gặp sự cố'; 
              echo '<script language="javascript" type="text/javascript">alert("Có sự cố trong quá trình gửi dữ liệu");</script>'; 
            }            
          }        
        }        
        return view("frontend.index",compact("component","error","data","success","alias","layout"));        
      }
      
      public function loadDataMember(Request $request){
      	$project_id=0;
      	if(!empty($request->project_id))      	{
      		$project_id=(int)@$request->project_id;
      	}
      	$data=DB::table('customer')
				->join('project_member','customer.id','=','project_member.member_id')
				->select('customer.id','customer.fullname','customer.email','customer.address')
				->where('project_member.project_id',(int)@$project_id)
				->groupBy('customer.id','customer.fullname','customer.email','customer.address')
        ->orderBy('project_member.created_at','desc')
				->get()->toArray();
				$data=convertToArray($data);			
      	$data=memberConverter($data);		         
      	return $data;
      }
      public function loadDataSupporter(Request $request){
        $project_id=0;
        if(!empty($request->project_id))        {
          $project_id=(int)@$request->project_id;
        }
        $data=DB::table('supporter')  
                ->join('payment_method','supporter.payment_method_id','=','payment_method.id')              
                ->select('supporter.id','supporter.fullname','supporter.number_money','payment_method.fullname as payment_method_name','supporter.sort_order','supporter.status','supporter.created_at','supporter.updated_at')                
                ->where('supporter.status',1)                     
                ->groupBy('supporter.id','supporter.fullname','supporter.number_money','payment_method.fullname','supporter.sort_order','supporter.status','supporter.created_at','supporter.updated_at')
                ->orderBy('supporter.created_at', 'desc')                
                ->get()->toArray();              
        $data=convertToArray($data);     
        $data=supporterTiepluaConverter($data);            
        return $data;
      }
      public function deleteAll(){          
          if(Session::has($this->_ssNameCart)){
            Session::forget($this->_ssNameCart);
          }                   
          return redirect()->route('frontend.index.viewCart'); 
      }
      public function delete($id){          
          $ssCart=array();
          $arrCart=array();
          if(Session::has($this->_ssNameCart)){
                $arrCart=Session::get($this->_ssNameCart);
          }                   
          unset($arrCart[$id]);              
          Session::put($this->_ssNameCart,$arrCart);             
          return redirect()->route('frontend.index.viewCart'); 
      }

      public function register(Request $request){     
        $flag=1;
        $error=array();
        $success=array();  
        $data=array();        
        $component="register";    
        $layout="two-column";      
        if($request->isMethod('post')){                          
          $data             =   $request->all();     
          $username         =   trim(@$request->username) ;    
          $password         =   @$request->password ;
          $password_confirm =   @$request->password_confirm;
          $email            =   trim(@$request->email) ;
          $fullname         =   trim(@$request->fullname);
          $address          =   trim(@$request->address);
          $phone            =   trim(@$request->phone);                    
          $group_member_id  =   trim(@$request->group_member_id);         
          if(mb_strlen($username) < 6){
            $error["username"] = 'Username phải từ 6 ký tự trở lên';
            $data["username"] = ""; 
            $flag = 0;
          }else{
            $customer=User::whereRaw("trim(lower(username)) = ?",[trim(mb_strtolower($username,'UTF-8'))])->get()->toArray();
            if(count($customer) > 0){
              $error["username"] = 'Username đã tồn tại';
              $data["username"] = ""; 
              $flag = 0;
            }  
          }
          if(mb_strlen($password) < 6){
            $error["password"] = 'Mật khẩu phải có độ dài từ 6 ký tự trở lên';
            $data["password"] = "";
            $data["password_confirm"] = ""; 
            $flag = 0;
          }else{
            if(strcmp($password , $password_confirm) != 0 ){
              $error["password_confirm"] = 'Mật khẩu xác nhận phải trùng khớp';
              $data["password_confirm"] = "";   
              $flag = 0;
            }
          }              
          if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($email,'UTF-8')   )){
            $error["email"] = 'Email không hợp lệ';
            $data["email"] = '';
            $flag = 0;
          }else{
            $customer=User::whereRaw("trim(lower(email)) = ?",[mb_strtolower($email,'UTF-8')])->get()->toArray();
            if(count($customer) > 0){
              $error["email"] = 'Email đã tồn tại';
              $data["email"] = ""; 
              $flag = 0;
            }
          }  
          if(mb_strlen($fullname) < 6){
            $error["fullname"] = 'Họ tên phải từ 6 ký tự trở lên';
            $data["fullname"] = ""; 
            $flag = 0;
          }  
          if(mb_strlen($address) < 6){
            $error["address"] = 'Địa chỉ phải từ 6 ký tự trở lên';
            $data["address"] = ""; 
            $flag = 0;
          }  
          if(mb_strlen($phone) < 10){
              $error["phone"] = 'Số điện thoại phải từ 10 ký tự trở lên';
              $data["phone"] = ""; 
              $flag = 0;
            }    
          if((int)@$group_member_id == 0){
          	$error["group_member_id"] = 'Vui lòng chọn thành viên';
            $data["group_member_id"] = ""; 
            $flag = 0;
          }           
          if($flag==1){
            $user=Sentinel::registerAndActivate($request->all());                  
            $item=new UserGroupMemberModel;
            $item->group_member_id=(int)@$group_member_id;
            $item->user_id=(int)@$user->id;      
            $item->created_at=date("Y-m-d H:i:s",time());
            $item->updated_at=date("Y-m-d H:i:s",time());
            $item->save();                        
            Sentinel::loginAndRemember($user);
            $_SESSION[$this->_ssNameUser]=(int)@$user->id;            
            echo '<script language="javascript" type="text/javascript">alert("Đăng ký thành công")</script>';
            return redirect()->route('frontend.index.viewAccount');                        
          }              
        }
        return view("frontend.index",compact("component","error","data","success","layout"));         
      }
      
      public function login(Request $request){   
        $flag=1;
        $error=array();
        $success=array();   
        $data=array();        
        $component="login";                
        $layout="two-column";     
        $arrUser=array();              
      	$user = Sentinel::forceCheck();       	
      	if(!empty($user)){                
      		$arrUser = $user->toArray();    
      	}      
      	if(count($arrUser) > 0){
      		return redirect()->route('frontend.index.viewAccount');
      	}
        if($request->isMethod('post')){              
          Sentinel::authenticate($request->all());
          if(Sentinel::check()){
            $user=Sentinel::getUser();     
            $_SESSION[$this->_ssNameUser]=(int)@$user->id;
            echo '<script language="javascript" type="text/javascript">alert("Đăng nhập thành công")</script>';
            return redirect()->route('frontend.index.viewAccount'); 
          }else{
            $error["dang-nhap"]="Đăng nhập sai username và password";
          }          
        }                
        return view("frontend.index",compact("component","error","data","success","layout"));        
      }      
      public function viewSecurity(Request $request){
      	$flag=1;
      	$error=array();
      	$success=array();   
      	$data=array();        
      	$component="security";   
      	$layout="two-column";        
      	$arrUser=array();              
      	$user = Sentinel::forceCheck(); 
      	if(!empty($user)){                
      		$arrUser = $user->toArray();    
      	}      
      	if(count($arrUser) == 0){
      		return redirect()->route("frontend.index.login"); 
      	}
      	$data=User::find((int)@$arrUser["id"])->toArray();    
      	$id=(int)@$data["id"];
      	if($request->isMethod('post')){              
      		$data =@$request->all();                     
      		$password=@$request->password ;
      		$password_confirm=@$request->password_confirm ;                
      		if(mb_strlen($password) < 6){
      			$error["password"] = 'Độ dài mật khẩu phải lớn hơn hoặc bằng 6';
      			$data["password"] = "";
      			$data["password_confirm"] = ""; 
      			$flag = 0;
      		}
      		if(strcmp($password,$password_confirm)!=0){
      			$error["password_confirm"] = 'Mật khẩu xác nhận không khớp';
      			$data["password_confirm"] = "";   
      			$flag = 0;
      		}    
      		if($flag==1){
      			$item=User::find($id);                         
      			$item->password         = Hash::make(@$request->password);
      			$item->save();  
      			$success['update-password']="Cập nhật mật khẩu thành công";                                                           
      		}              
      	}             
      	return view("frontend.index",compact("component","error","data","success","layout"));                      
      }
      public function getLgout(){               
      	Sentinel::logout();       
        unset($_SESSION[$this->_ssNameUser]);
      	return redirect()->route('frontend.index.login'); 
      }
      public function viewAccount(Request $request){        
      	$flag=1;
      	$error=array();
      	$success=array();   
      	$data=array();        
      	$component="account";   
      	$layout="two-column";       
      	$id=0;         
      	$arrUser=array();              
      	$user = Sentinel::forceCheck(); 
      	if(!empty($user)){                
      		$arrUser = $user->toArray();    
      	}      
      	if(count($arrUser) == 0){
      		return redirect()->route("frontend.index.login"); 
      	}        
      	$data=User::find((int)@$arrUser['id'])->toArray();    
      	$id=(int)@$data["id"];                  
      	if($request->isMethod('post')){                          
      		$data             =   $request->all();                         
      		$email            =   trim(@$request->email) ;
      		$fullname         =   trim(@$request->fullname);
      		$address          =   trim(@$request->address);
      		$phone            =   trim(@$request->phone);                                           
      		if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($email,'UTF-8')   )){
      			$error["email"] = 'Email không hợp lệ';
      			$data["email"] = '';
      			$flag = 0;
      		}else{
      			$customer=User::whereRaw("trim(lower(email)) = ? and id != ? ",[mb_strtolower($email,'UTF-8'),(int)@$id])->get()->toArray();
      			if(count($customer) > 0){
      				$error["email"] = 'Email đã tồn tại';
      				$data["email"] = ""; 
      				$flag = 0;
      			}
      		}  
      		if(mb_strlen($fullname) < 6){
      			$error["fullname"] = 'Họ tên phải từ 6 ký tự trở lên';
      			$data["fullname"] = ""; 
      			$flag = 0;
      		}  
      		if(mb_strlen($address) < 6){
      			$error["address"] = 'Địa chỉ phải từ 6 ký tự trở lên';
      			$data["address"] = ""; 
      			$flag = 0;
      		}  
      		if(mb_strlen($phone) < 10){
              $error["phone"] = 'Số điện thoại phải từ 10 ký tự trở lên';
              $data["phone"] = ""; 
              $flag = 0;
            }               
      		if($flag==1){
      			$item               =   User::find((int)@$id);            
      			$item->email        =   $email;
      			$item->fullname     =   $fullname;
      			$item->address      =   $address;
      			$item->phone        =   $phone;            
      			$item->created_at   =   date("Y-m-d H:i:s",time());
      			$item->updated_at   =   date("Y-m-d H:i:s",time());
      			$item->save(); 
      			echo '<script language="javascript" type="text/javascript">alert("Cập nhật thông tin thành công")</script>';   
      			return redirect()->route("frontend.index.viewAccount");                    
      		}              
      	}
      	return view("frontend.index",compact("component","error","data","success","layout"));         
      }
      
      public function checkout(){          
        $arrUser=array();              
        $user = Sentinel::forceCheck(); 
        if(!empty($user)){                
          $arrUser = $user->toArray();    
        }              
        if(count($arrUser) > 0){
          $link="frontend.index.confirmCheckout";
        }else{
          $link="frontend.index.loginCheckout";
        }
        return redirect()->route($link); 
      }
      public function confirmCheckout(Request $request){
      	$flag=1;
      	$error=array();
      	$success=array();  
      	$data=array();        
      	$component="xac-nhan-thanh-toan";    
      	$layout="two-column";   
      	$id=0;         
      	$arrUser=array();              
      	$user = Sentinel::forceCheck(); 
      	if(!empty($user)){                
      		$arrUser = $user->toArray();    
      	}      
      	if(count($arrUser) == 0){
      		return redirect()->route("frontend.index.loginCheckout");
      	}      
      	$arrCart=array();
      	if(Session::has($this->_ssNameCart)){
      		$arrCart=Session::get($this->_ssNameCart);
      	} 
      	if(count($arrCart) == 0){
      		return redirect()->route("frontend.index.viewCart");   
      	}      
      	$data=User::find((int)$arrUser["id"])->toArray();    
      	$id=(int)@$data["id"];
      	if($request->isMethod('post')){
      		$data             =   @$request->all();                 
      		$email            =   trim(@$request->email) ;
      		$fullname         =   trim(@$request->fullname);
      		$address          =   trim(@$request->address);
      		$phone            =   trim(@$request->phone);  
      		$payment_method_id = trim(@$request->payment_method_id);    
      		$bank_code 			=trim(@$request->bankcode);      		                                 
      		if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($email,'UTF-8')   )){
      			$error["email"] = 'Email không hợp lệ';
      			$data["email"] = '';
      			$flag = 0;
      		}else{
      			$customer=User::whereRaw("trim(lower(email)) = ? and id != ?",[mb_strtolower($email,'UTF-8'),(int)@$id])->get()->toArray();
      			if(count($customer) > 0){
      				$error["email"] = 'Email đã tồn tại';
      				$data["email"] = ""; 
      				$flag = 0;
      			}
      		}  
      		if(mb_strlen($fullname) < 6){
      			$error["fullname"] = 'Họ tên phải từ 6 ký tự trở lên';
      			$data["fullname"] = ""; 
      			$flag = 0;
      		}  
      		if(mb_strlen($address) < 6){
      			$error["address"] = 'Địa chỉ phải từ 6 ký tự trở lên';
      			$data["address"] = ""; 
      			$flag = 0;
      		}  
      		if(mb_strlen($phone) < 10){
      			$error["phone"] = 'Số điện thoại phải từ 10 ký tự trở lên';
      			$data["phone"] = ""; 
      			$flag = 0;
      		}        
      		if((int)@$payment_method_id==0){
      			$error["payment_method"] = 'Xin vui lòng chọn 1 phương thức thanh toán';                      
      			$flag = 0;
      		}             		  
      		/* begin test payment-method */
      		$paymentmethod=PaymentMethodModel::find((int)@$payment_method_id)->toArray();        
      		$payment_method_alias=$paymentmethod['alias'];              
      		$order_code=randomCodeNumber();              
      		$total_amount=(float)@$request->total_price;           
      		$payment_type=0;
      		$order_description='Thanh toán qua ngân lượng';
      		$tax_amount=0;
      		$fee_shipping=0;
      		$discount_amount=0;
      		$return_url=route('frontend.index.saveInvoice');
      		$cancel_url=route('frontend.index.cancelInvoice');
      		$buyer_fullname=@$request->fullname;
      		$buyer_email=@$request->email;
      		$buyer_mobile=@$request->phone;
      		$buyer_address=@$request->address;
      		$array_items=array();
      		$arrCart=array();
      		if(Session::has($this->_ssNameCart)){
      			$arrCart=Session::get($this->_ssNameCart);
      		}         
      		if(count($arrCart) > 0){
      			$k=1;
      			$j=0;
      			foreach ($arrCart as $key => $value) {                
      				$product_id=$value["product_id"];    
      				$product_code=$value["product_code"];  
      				$product_name=$value["product_name"];              
      				$product_alias=$value["product_alias"];                                      
      				$product_image=   $value["product_image"] ;        
      				$product_price=$value["product_price"];                                  
      				$product_quantity=$value["product_quantity"];                         
      				$product_total_price=$value["product_total_price"];
      				$array_items[$j]= 
      				array(
      					'item_name'.$k => $product_name,
      					'item_quantity'.$k => $product_quantity,
      					'item_amount'.$k => $product_total_price,
      					'item_url'.$k => route('frontend.index.index',[$product_alias])
      				);
      				$k++;
      				$j++;
      			}              
      		}             
          $setting=getSettingSystem();
          $merchant_id=$setting['merchant_id']['field_value'];
          $merchant_pass=$setting['merchant_pass']['field_value'];
          $receiver=$setting['receiver']['field_value'];   
      		$nlcheckout= new NL_CheckOutV3($merchant_id,$merchant_pass,$receiver,'https://www.nganluong.vn/checkout.api.nganluong.post.php');
      		switch ($payment_method_alias) {
      			case 'VISA':
      			$nl_result= $nlcheckout->VisaCheckout($order_code,$total_amount,$payment_type,$order_description,$tax_amount,
      				$fee_shipping,$discount_amount,$return_url,$cancel_url,$buyer_fullname,$buyer_email,$buyer_mobile, 
      				$buyer_address,$array_items,$bank_code);
      			if(empty($bank_code)){
      				$error["bank_code"] = 'Vui lòng chọn mã ngân hàng';                      
      				$flag = 0;
      			}
      			break; 
      			case 'NL':
      			$nl_result= $nlcheckout->NLCheckout($order_code,$total_amount,$payment_type,$order_description,$tax_amount,
      				$fee_shipping,$discount_amount,$return_url,$cancel_url,$buyer_fullname,$buyer_email,$buyer_mobile, 
      				$buyer_address,$array_items);    
      			break;           			
      			case 'ATM_ONLINE':
      			$nl_result= $nlcheckout->BankCheckout($order_code,$total_amount,$bank_code,$payment_type,$order_description,$tax_amount,
      				$fee_shipping,$discount_amount,$return_url,$cancel_url,$buyer_fullname,$buyer_email,$buyer_mobile, 
      				$buyer_address,$array_items) ;
      			if(empty($bank_code)){
      				$error["bank_code"] = 'Vui lòng chọn mã ngân hàng';                      
      				$flag = 0;
      			}
      			break;  
      			case 'NH_OFFLINE':
      			$nl_result= $nlcheckout->officeBankCheckout($order_code, $total_amount, $bank_code, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items);
      			if(empty($bank_code)){
      				$error["bank_code"] = 'Vui lòng chọn mã ngân hàng';                      
      				$flag = 0;
      			}
      			break;
      			case 'ATM_OFFLINE':
      			$nl_result= $nlcheckout->BankOfflineCheckout($order_code, $total_amount, $bank_code, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items);
      			if(empty($bank_code)){
      				$error["bank_code"] = 'Vui lòng chọn mã ngân hàng';                      
      				$flag = 0;
      			}
      			break;
      			case 'IB_ONLINE':      			
      			$nl_result= $nlcheckout->IBCheckout($order_code, $total_amount, $bank_code, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items);
      			if(empty($bank_code)){
      				$error["bank_code"] = 'Vui lòng chọn mã ngân hàng';                      
      				$flag = 0;
      			}
      			break;
      			case 'CREDIT_CARD_PREPAID':
      			$nl_result = $nlcheckout->PrepaidVisaCheckout($order_code, $total_amount, $payment_type, $order_description, $tax_amount, $fee_shipping, $discount_amount, $return_url, $cancel_url, $buyer_fullname, $buyer_email, $buyer_mobile, $buyer_address, $array_items, $bank_code);
      			break;			
      		}
      		if (strcmp($nl_result->error_code, '00')  != 0){                
      			$error["payment_method"] = $nl_result->error_message;                      
      			$flag = 0;
      		}
      		/* end test payment-method */                           
      		if($flag==1){   
      			$data_invoice=array();
      			$data_invoice['code'] 				=	$order_code;
      			$data_invoice['customer_id']  		= 	(int)@$id;
      			$data_invoice['username']     		= 	@$request->username;
      			$data_invoice['email']        		= 	@$request->email;
      			$data_invoice['fullname']     		= 	@$request->fullname;
      			$data_invoice['address']      		= 	@$request->address;
      			$data_invoice['phone'] 				=	@$request->phone;                 
      			$data_invoice['payment_method_id']	=	(int)@$payment_method_id;
      			$data_invoice['quantity'] 			=	(int)@$request->quantity;
      			$data_invoice['total_price'] 		=	(float)@$request->total_price;
      			Session::put($this->_ssNameInvoice,$data_invoice);
      			return redirect((string)$nl_result->checkout_url);                                                     			                                                      
      		}                         
      	}
      	$data_paymentmethod=PaymentMethodModel::select('id','fullname','alias','content')->get()->toArray();
      	$data_paymentmethod[]=array(
      		'id'=>0,
      		'fullname'=>null,
      		'alias'=>null,
      		'content'=>null,          
      	);
      	return view("frontend.index",compact("component","error","data","success","layout","data_paymentmethod"));                   
      }    
      public function saveInvoice(){
      	$arrUser=array();              
      	$user = Sentinel::forceCheck(); 
      	if(!empty($user)){                
      		$arrUser = $user->toArray();    
      	}      
      	if(count($arrUser) == 0){
      		return redirect()->route("frontend.index.login"); 
      	}
		$arrCart=array();
      	if(Session::has($this->_ssNameCart)){
      		$arrCart=Session::get($this->_ssNameCart);
      	} 
      	if(count($arrCart) == 0){
      		return redirect()->route("frontend.index.viewCart");   
      	}    
      	$data_invoice=array();
      	if(Session::has($this->_ssNameInvoice)){
      		$data_invoice=Session::get($this->_ssNameInvoice);
      	} 
      	if(count($data_invoice) == 0){
      		return redirect()->route("frontend.index.viewCart");   
      	}    
      	$item = new InvoiceModel;
      	$item->code 				=	$data_invoice['code'];
      	$item->customer_id  		= 	(int)@$data_invoice['customer_id'];
      	$item->username     		= 	@$data_invoice['username'];
      	$item->email        		= 	@$data_invoice['email'];
      	$item->fullname     		= 	@$data_invoice['fullname'];
      	$item->address      		= 	@$data_invoice['address'];
      	$item->phone 				=	@$data_invoice['phone'];                 
      	$item->payment_method_id 	=	(int)@$data_invoice['payment_method_id'];
      	$item->quantity 			=	(int)@$data_invoice['quantity'];
      	$item->total_price 			=	(float)@$data_invoice['total_price'];
      	$item->status=0;  
      	$item->sort_order=1;
      	$item->created_at=date("Y-m-d H:i:s",time());
      	$item->updated_at=date("Y-m-d H:i:s",time());
      	$item->save();                           
      	$arrCart=array();
      	if(Session::has($this->_ssNameCart)){
      		$arrCart=Session::get($this->_ssNameCart);
      	}         
      	if(count($arrCart) > 0){
      		foreach ($arrCart as $key => $value) {
      			$invoice_id=$item->id;
      			$product_id=$value["product_id"];    
      			$product_code=$value["product_code"];  
      			$product_name=$value["product_name"];                                                    
      			$product_image=   $value["product_image"] ;        
      			$product_price=$value["product_price"];                                  
      			$product_quantity=$value["product_quantity"];                         
      			$product_total_price=$value["product_total_price"];
      			$itemInvoiceDetail=new InvoiceDetailModel;                          
      			$itemInvoiceDetail->invoice_id=$invoice_id;
      			$itemInvoiceDetail->product_id=$product_id;
      			$itemInvoiceDetail->product_code=$product_code;
      			$itemInvoiceDetail->product_name=$product_name;
      			$itemInvoiceDetail->product_image=$product_image;
      			$itemInvoiceDetail->product_price=$product_price;
      			$itemInvoiceDetail->product_quantity=$product_quantity;
      			$itemInvoiceDetail->product_total_price=$product_total_price;
      			$itemInvoiceDetail->created_at=date("Y-m-d H:i:s",time());
      			$itemInvoiceDetail->updated_at=date("Y-m-d H:i:s",time());
      			$itemInvoiceDetail->save();
      		}
      	}                           
      	if(Session::has($this->_ssNameCart)){
      		Session::forget($this->_ssNameCart);
      	}
      	if(Session::has($this->_ssNameInvoice)){
      		Session::forget($this->_ssNameInvoice);
      	}   
      	$component="hoan-tat-thanh-toan";    
        $layout="two-column";   
        return view("frontend.index",compact("component","layout"));                     
      }
      public function cancelInvoice(){
      	$arrUser=array();              
      	$user = Sentinel::forceCheck(); 
      	if(!empty($user)){                
      		$arrUser = $user->toArray();    
      	}      
      	if(count($arrUser) == 0){
      		return redirect()->route("frontend.index.login"); 
      	}
		$arrCart=array();
      	if(Session::has($this->_ssNameCart)){
      		$arrCart=Session::get($this->_ssNameCart);
      	} 
      	if(count($arrCart) == 0){
      		return redirect()->route("frontend.index.viewCart");   
      	}    
      	$data_invoice=array();
      	if(Session::has($this->_ssNameInvoice)){
      		$data_invoice=Session::get($this->_ssNameInvoice);
      	} 
      	if(count($data_invoice) == 0){
      		return redirect()->route("frontend.index.viewCart");   
      	}    
        $component="cancel-invoice";    
        $layout="two-column";   
        return view("frontend.index",compact("component","layout"));       
      }
      public function finishCheckout(){
      	$arrUser=array();              
      	$user = Sentinel::forceCheck(); 
      	if(!empty($user)){                
      		$arrUser = $user->toArray();    
      	}      
      	if(count($arrUser) == 0){
      		return redirect()->route("frontend.index.login"); 
      	}
		$arrCart=array();
      	if(Session::has($this->_ssNameCart)){
      		$arrCart=Session::get($this->_ssNameCart);
      	} 
      	if(count($arrCart) == 0){
      		return redirect()->route("frontend.index.viewCart");   
      	}    
      	$data_invoice=array();
      	if(Session::has($this->_ssNameInvoice)){
      		$data_invoice=Session::get($this->_ssNameInvoice);
      	} 
      	if(count($data_invoice) == 0){
      		return redirect()->route("frontend.index.viewCart");   
      	}    
      	$component="hoan-tat-thanh-toan";    
        $layout="two-column";   
        return view("frontend.index",compact("component","layout"));                  
      }  
      public function loginCheckout(Request $request){          
        $flag=1;
        $error=array();
        $success=array();  
        $data=array();        
        $component="dang-nhap-thanh-toan";    
        $layout="two-column";
        $customer=array();                            
        $arrCart=array();
        if(Session::has($this->_ssNameCart)){
          $arrCart=Session::get($this->_ssNameCart);
        } 
        if(count($arrCart)==0){
          return redirect()->route("frontend.index.viewCart");   
        }       
        if($request->isMethod('post')){
          $action=@$request->action;
          switch ($action) {
            case "register-checkout": 
            $data             =   $request->all();     
            $username         =   trim(@$request->username) ;    
            $password         =   @$request->password ;
            $password_confirm =   @$request->password_confirm;
            $email            =   trim(@$request->email) ;
            $fullname         =   trim(@$request->fullname);
            $address          =   trim(@$request->address);
            $phone            =   trim(@$request->phone);           
            if(mb_strlen($username) < 6){
              $error["username"] = 'Username phải từ 6 ký tự trở lên';
              $data["username"] = ""; 
              $flag = 0;
            }else{
              $customer=User::whereRaw("trim(lower(username)) = ?",[trim(mb_strtolower($username,'UTF-8'))])->get()->toArray();
              if(count($customer) > 0){
                $error["username"] = 'Username đã tồn tại';
                $data["username"] = ""; 
                $flag = 0;
              }  
            }
            if(mb_strlen($password) < 6){
              $error["password"] = 'Mật khẩu phải có độ dài từ 6 ký tự trở lên';
              $data["password"] = "";
              $data["password_confirm"] = ""; 
              $flag = 0;
            }else{
              if(strcmp($password , $password_confirm) != 0 ){
                $error["password_confirm"] = 'Mật khẩu xác nhận phải trùng khớp';
                $data["password_confirm"] = "";   
                $flag = 0;
              }
            }              
            if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($email,'UTF-8')   )){
              $error["email"] = 'Email không hợp lệ';
              $data["email"] = '';
              $flag = 0;
            }else{
              $customer=User::whereRaw("trim(lower(email)) = ?",[mb_strtolower($email,'UTF-8')])->get()->toArray();
              if(count($customer) > 0){
                $error["email"] = 'Email đã tồn tại';
                $data["email"] = ""; 
                $flag = 0;
              }
            }  
            if(mb_strlen($fullname) < 6){
              $error["fullname"] = 'Họ tên phải từ 6 ký tự trở lên';
              $data["fullname"] = ""; 
              $flag = 0;
            }  
            if(mb_strlen($address) < 6){
              $error["address"] = 'Địa chỉ phải từ 6 ký tự trở lên';
              $data["address"] = ""; 
              $flag = 0;
            }  
            if(mb_strlen($phone) < 10){
              $error["phone"] = 'Số điện thoại phải từ 10 ký tự trở lên';
              $data["phone"] = ""; 
              $flag = 0;
            }        
            if($flag==1){
              $user=Sentinel::registerAndActivate(@$request->all());                  
              $item=new UserGroupMemberModel;
              $dataGroupMember=GroupMemberModel::whereRaw('alias = ?',['thanh-vien-thuong'])->select('id')->get()->toArray();
              $item->group_member_id=(int)@$dataGroupMember[0]['id'];
              $item->user_id=(int)@$user->id;      
              $item->created_at=date("Y-m-d H:i:s",time());
              $item->updated_at=date("Y-m-d H:i:s",time());
              $item->save();                        
              Sentinel::loginAndRemember($user);
              $_SESSION[$this->_ssNameUser]=(int)@$user->id;       
              return redirect()->route('frontend.index.confirmCheckout');                        
            }                               
            break;
            case "login-checkout":
              Sentinel::authenticate($request->all());
              if(Sentinel::check()){
                $user=Sentinel::getUser();     
                $_SESSION[$this->_ssNameUser]=(int)@$user->id;
                echo '<script language="javascript" type="text/javascript">alert("Đăng nhập thành công")</script>';
                return redirect()->route('frontend.index.confirmCheckout'); 
              }else{
                $error["dang-nhap"]="Đăng nhập sai username và password";
              }                   
            break;                
          }
        }                    
        return view("frontend.index",compact("component","error","data","success","layout"));        
      }
      public function getInvoice(){              
        $component="hoa-don";                
        $layout="two-column";      
        $id=0;    
        $arrUser=array();              
        $user = Sentinel::forceCheck();         
        if(!empty($user)){                
          $arrUser = $user->toArray();    
        }      
        if(count($arrUser) > 0){
          $id=$arrUser["id"];
        }else{
          return redirect()->route("frontend.index.login");           
        }                    
        $data=InvoiceModel::whereRaw("customer_id = ?",(int)@$id)->get()->toArray();
        return view("frontend.index",compact("component","layout"));        
      }
      public function updateCart(Request $request){   
              $arrQTY=@$request->quantity;                 
              $ssCart=array();
              $arrCart=array();
              if(Session::has($this->_ssNameCart)){
                $arrCart=Session::get($this->_ssNameCart);
              }         
              
              if(count($arrCart) > 0){
                foreach ($arrCart as $key => $value) {    
                    $product_quantity=(int)$arrQTY[$key];
                    $product_price = (float)$arrCart[$key]["product_price"];
                    $product_total_price=$product_quantity * $product_price;
                    $arrCart[$key]["product_quantity"]=$product_quantity;
                    $arrCart[$key]["product_total_price"]=$product_total_price;
                }
                foreach ($arrCart as $key => $value) {
                  $product_quantity=(int)$arrCart[$key]["product_quantity"];
                  if($product_quantity==0){
                    unset($arrCart[$key]);
                  }
                }
              }                            
              Session::put($this->_ssNameCart,$arrCart);                   
              if(count($arrCart)==0){
                Session::forget($this->_ssNameCart);              
              }                  
      }
      public function addToCart(Request $request){
          $id=$request->id;
          $quantity=$request->quantity;   
          $data=ProductModel::find((int)$id);          
          $product_id=(int)($data['id']);
          $product_code=$data["code"];
          $product_name=$data["fullname"];
          $product_alias=$data["alias"];
          $product_image=$data["image"];
          $price=(float)@$data["price"];
          $sale_price=(float)@$data["sale_price"];
          $product_price=$price;
          if($sale_price > 0){
            $product_price=$sale_price;
          }   
          $product_quantity=(int)@$quantity;   
          $total_quantity=0;                
          $arrCart=array();
          if(Session::has($this->_ssNameCart)){
            $arrCart=Session::get($this->_ssNameCart);
          }                             
          if($product_id > 0){            
              if(count($arrCart) == 0){
                $arrCart[$product_id]["product_quantity"] = $product_quantity;
              }
              else{
                    if(!isset($arrCart[$product_id])){
                      $arrCart[$product_id]["product_quantity"] = $product_quantity;                 
                    }                        
                    else{
                      $arrCart[$product_id]["product_quantity"] = $arrCart[$product_id]["product_quantity"] + $product_quantity;                  
                    }                               
              }
              $arrCart[$product_id]["product_id"]=$product_id;  
              $arrCart[$product_id]["product_code"]=$product_code;
              $arrCart[$product_id]["product_name"]=$product_name;
              $arrCart[$product_id]["product_alias"]=$product_alias;      
              $arrCart[$product_id]["product_image"]=$product_image;          
              $arrCart[$product_id]["product_price"]=$product_price;                      
              $product_quantity=(int)$arrCart[$product_id]["product_quantity"];
              $product_total_price=$product_price * $product_quantity;
              $arrCart[$product_id]["product_total_price"]=($product_total_price);                              
              Session::put($this->_ssNameCart,$arrCart);    
              $arrCart=array();
              if(Session::has($this->_ssNameCart)){    
                  $arrCart = @Session::get($this->_ssNameCart);    
              }    
              if(count($arrCart) > 0){
                foreach ($arrCart as $key => $value){
                  $total_quantity+=(int)$value['product_quantity'];              
                }
              }                                                        
          }    
          ksort($arrCart);
          $dataReturn=array(                            
                            'cart'=>$arrCart
                          );
        return $dataReturn;
      }   
      function changeTotalPrice(Request $request){
        $id=$request->id;
        $quantity=$request->quantity;   
        $data=ProductModel::find((int)$id);          
        $product_id=(int)(@$data['id']);
        $product_price=0;      
        $product_quantity=0;        
        $product_total_price=0;                            
        $arrCart=array();
        if(Session::has($this->_ssNameCart)){
          $arrCart=Session::get($this->_ssNameCart);
        }                         
        if(count($arrCart) > 0){
          if((int)@$quantity > 0){
            $product_quantity=(int)@$quantity;   
            $arrCart[$product_id]["product_quantity"] = $product_quantity;
            $product_price=$arrCart[$product_id]["product_price"];
            $product_total_price=$product_price * $product_quantity;
            $arrCart[$product_id]["product_total_price"]=$product_total_price;
            Session::put($this->_ssNameCart,$arrCart);    
          }else{
            $product_quantity=$arrCart[$product_id]["product_quantity"];
            $product_total_price=$arrCart[$product_id]["product_total_price"];            
          }
        }
        $arrCart=array();
        if(Session::has($this->_ssNameCart)){    
          $arrCart = @Session::get($this->_ssNameCart);    
        }  
        ksort($arrCart);
        $dataReturn=array(                            
          'cart'=>$arrCart
        );
        return $dataReturn;
      }   
      public function deleteRowCart(Request $request){      
        $id=$request->id;              
        $arrCart=array();
        if(Session::has($this->_ssNameCart)){
          $arrCart=Session::get($this->_ssNameCart);
        }                
        if(count($arrCart) > 0){
          unset($arrCart[$id]);              
        }             
        Session::put($this->_ssNameCart,$arrCart);     
        $arrCart=array();
        if(Session::has($this->_ssNameCart)){    
          $arrCart = @Session::get($this->_ssNameCart);    
        }  
        ksort($arrCart);
        $dataReturn=array(                            
          'cart'=>$arrCart,
          'product_count'=>(int)count($arrCart)
        );
        return $dataReturn;
      } 
      public function checkoutQuickly(Request $request){
        $flag=1;
        $error=array();
        $success=array();  
        $data=array();       
        $info=array();
        if($request->isMethod('post')){
          $data             =   @$request->all();                    
          $fullname=trim(@$request->customer_name);
          $phone=trim(@$request->customer_phone);
          $address=trim(@$request->customer_address);
          $email=trim(@$request->customer_email);
          $note=trim(@$request->customer_note);                
          if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($email,'UTF-8')   )){
            $error["email"] = 'Email không hợp lệ';            
            $flag = 0;
          }
          if(mb_strlen($fullname) < 6){
            $error["fullname"] = 'Họ tên phải từ 6 ký tự trở lên';            
            $flag = 0;
          }  
          if(mb_strlen($address) < 6){
            $error["address"] = 'Địa chỉ phải từ 6 ký tự trở lên';            
            $flag = 0;
          }  
          if(mb_strlen($phone) < 10){
            $error["phone"] = 'Số điện thoại phải từ 10 ký tự trở lên';            
            $flag = 0;
          }                
          if($flag==1){   
            $item               =   new InvoiceModel; 
            $order_code         =   randomCodeNumber();                  
            $item->code         =   @$order_code;            
            $item->email        =   @$email;
            $item->fullname     =   @$fullname;
            $item->address      =   @$address;
            $item->phone        =   @$phone;       
            $item->note         =   @$note; 
            $arrCart=array();
            $total_quantity=0;
            $total_price=0;
            if(Session::has($this->_ssNameCart)){
              $arrCart=Session::get($this->_ssNameCart);
            }         
            if(count($arrCart) > 0){
              foreach ($arrCart as $key => $value){
                $total_quantity+=(int)@$value['product_quantity'];              
                $total_price+=(float)@$value['product_total_price'];
              }
            }                         
            $item->quantity     =   @$total_quantity;
            $item->total_price  =   @$total_price;
            $item->status       =   0;  
            $item->sort_order   =   1;
            $item->created_at   =   date("Y-m-d H:i:s",time());
            $item->updated_at   =   date("Y-m-d H:i:s",time());
            $item->save();                   
            if(count($arrCart) > 0){
              foreach ($arrCart as $key => $value) {
                $invoice_id=$item->id;
                $product_id=$value["product_id"];    
                $product_code=$value["product_code"];  
                $product_name=$value["product_name"];                                                    
                $product_image=   $value["product_image"] ;        
                $product_price=$value["product_price"];                                  
                $product_quantity=$value["product_quantity"];                         
                $product_total_price=$value["product_total_price"];
                $itemInvoiceDetail=new InvoiceDetailModel;                          
                $itemInvoiceDetail->invoice_id=$invoice_id;
                $itemInvoiceDetail->product_id=$product_id;
                $itemInvoiceDetail->product_code=$product_code;
                $itemInvoiceDetail->product_name=$product_name;
                $itemInvoiceDetail->product_image=$product_image;
                $itemInvoiceDetail->product_price=$product_price;
                $itemInvoiceDetail->product_quantity=$product_quantity;
                $itemInvoiceDetail->product_total_price=$product_total_price;
                $itemInvoiceDetail->created_at=date("Y-m-d H:i:s",time());
                $itemInvoiceDetail->updated_at=date("Y-m-d H:i:s",time());
                $itemInvoiceDetail->save();
              }      
              /* begin load config contact */
              $setting=getSettingSystem();    
              $smtp_host      = @$setting['smtp_host']['field_value'];
              $smtp_port      = @$setting['smtp_port']['field_value'];
              $smtp_auth      = @$setting['authentication']['field_value'];
              $encription     = @$setting['encription']['field_value'];
              $smtp_username  = @$setting['smtp_username']['field_value'];
              $smtp_password  = @$setting['smtp_password']['field_value'];
              $product_width=$setting['product_width']['field_value'];
              $product_height=$setting['product_height']['field_value'];
              $email_from     = @$email;
              $email_to       = @$setting['email_to']['field_value'];
              $contacted_person = @$setting['contacted_person']['field_value'];          
              /* end load config contact */       
              $mail = new PHPMailer(true);
              $mail->SMTPDebug = 0;                           
              $mail->isSMTP();     
              $mail->CharSet = "UTF-8";          
              $mail->Host = $smtp_host; 
              $mail->SMTPAuth = $smtp_auth;                         
              $mail->Username = $smtp_username;             
              $mail->Password = $smtp_password;             
              $mail->SMTPSecure = $encription;                       
              $mail->Port = $smtp_port;                            
              $mail->setFrom($email_from, $fullname);
              $mail->addAddress($email_to, $contacted_person);   
              $mail->Subject = 'Thông tin đặt hàng từ khách hàng '.$fullname.' - '.$phone ;   
              $html_content='';     
              $html_content .='<table border="1" cellspacing="5" cellpadding="5" width="100%">';
              $html_content .='<thead>';
              $html_content .='<tr>';
              $html_content .='<th colspan="2"><h3>Thông tin từ khách hàng</h3></th>';
              $html_content .='</tr>';
              $html_content .='</thead>';
              $html_content .='<tbody>';
              $html_content .='<tr><td width="20%">Mã số đơn hàng</td><td width="80%">'.$order_code.'</td></tr>';
              $html_content .='<tr><td>Họ và tên</td><td>'.$fullname.'</td></tr>';
              $html_content .='<tr><td>Email</td><td>'.$email.'</td></tr>';
              $html_content .='<tr><td>Điện thoại</td><td>'.$phone.'</td></tr>';              
              $html_content .='<tr><td>Địa chỉ</td><td>'.$address.'</td></tr>';
              $html_content .='<tr><td>Nội dung</td><td>'.$note.'</td></tr>';   
              $html_content .='<tr><td>Số lượng</td><td>'.$total_quantity.'</td></tr>';   
              $html_content .='<tr><td>Thành tiền</td><td>'.fnPrice($total_price).'</td></tr>';          
              $html_content .='</tbody>';
              $html_content .='</table>';   
              $html_content .='<table border="1" cellspacing="5" cellpadding="5" width="100%">';
              $html_content .='<thead>';
              $html_content .='<tr>';
              $html_content .='<th>Mã sản phẩm</th>';
              $html_content .='<th>Tên sản phẩm</th>';
              $html_content .='<th>Hình ảnh</th>';
              $html_content .='<th>Đơn giá</th>';
              $html_content .='<th>Số lượng đặt mua</th>';
              $html_content .='<th>Tổng giá</th>';
              $html_content .='</tr>';
              $html_content .='</thead>';
              $html_content .='<tbody>';
              if(count($arrCart) > 0){
                foreach ($arrCart as $key => $value) {
                  $product_id=$value["product_id"];    
                  $product_code=$value["product_code"];  
                  $product_name=$value["product_name"];                                                    
                  $product_image=   $value["product_image"] ;        
                  $product_price=$value["product_price"];                                  
                  $product_quantity=$value["product_quantity"];                         
                  $product_total_price=$value["product_total_price"];
                  $html_content .='<tr>';
                  $html_content .='<td>'.$product_code.'</td>';
                  $html_content .='<td>'.$product_name.'</td>';  
                  $html_content .='<td><center><img width="'.(float)($product_width/4).'" height="'.(float)($product_height/4).'" src="'.get_product_thumbnail($product_image).'" /></center></td>';                
                  $html_content .='<td align="right">'.fnPrice($product_price).'</td>';
                  $html_content .='<td align="right">'.$product_quantity.'</td>';
                  $html_content .='<td align="right">'.fnPrice($product_total_price).'</td>';
                  $html_content .='</tr>';  
                }                
              }          
              $html_content .='</tbody>';
              $html_content .='</table>';                                 
              $mail->msgHTML($html_content);
              if (!$mail->Send()) {                
                $error["exception_error"]='Quá trình gửi dữ liệu gặp sự cố'; 
                $flag=0;
              }           
            }  
            if(Session::has($this->_ssNameCart)){
              Session::forget($this->_ssNameCart);
            }            
          }
        }
        $info = array(                            
          "checked"   => $flag,
          "error"     => $error, 
          "link_redirect"=>url('/')             
        );
        return $info;       
      }
      public function getPaymentmethod(Request $request){
         $id=$request->id;
         $data=array();
         $data=PaymentMethodModel::find((int)@$id);        
         return $data;
      }
}







