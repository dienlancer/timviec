<?php namespace App\Http\Controllers\frontend;
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
use App\EmployerModel;
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
    \Artisan::call('sitemap:auto');   
    return view("frontend.home");        
  } 
  public function registerLogin(Request $request,$status){             
    return view("frontend.register-login",compact('status'));         
  }
  public function registerEmployer(Request $request){        
    $flag=1;
    $error=array();    
    $data=array();       
    if($request->isMethod('post')){
      $data               = @$request->all();
      $email              = trim(@$request->email);
      $password           = trim(@$request->password);
      $password_confirmed = trim(@$request->password_confirmed);
      $fullname           = trim(@$request->fullname);
      $address            = trim(@$request->address);
      $phone              = trim(@$request->phone);
      $province_id        = trim(@$request->province_id);
      $scale_id           = trim(@$request->scale_id);
      $intro              = trim(@$request->intro);
      $fax                = trim(@$request->fax);
      $website            = trim(@$request->website);
      $contacted_name     = trim(@$request->contacted_name);
      $contacted_email    = trim(@$request->contacted_email);
      $contacted_phone    = trim(@$request->contacted_phone);
      if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($email,'UTF-8')   )){
        $error["email"] = 'Email nhà tuyển dụng không hợp lệ'; 
        $data['email']='';           
        $flag = 0;
      }
      else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(email)) = ?",[trim(mb_strtolower($email,'UTF-8'))])->get()->toArray();     
        if (count($source) > 0) {
          $error["email"]= "Email nhà tuyển dụng đã tồn tại";
          $data['email']='';
          $flag = 0;                    
        }       
      }
      if(mb_strlen($password) < 10 ){
        $error["password"] = "Mật khẩu tối thiểu phải 10 ký tự";
        $data['password']='';
        $data['password_confirmed']='';
        $flag = 0;                
      }else{
        if(strcmp($password, $password_confirmed) !=0 ){
          $error["password"] = "Xác nhận mật khẩu không trùng khớp";
          $data['password']='';
          $data['password_confirmed']='';
          $flag = 0;                  
        }
      }    
      if(mb_strlen($fullname) < 15){
        $error["fullname"] = 'Tên công ty phải từ 15 ký tự trở lên';    
        $data['fullname']='';        
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(fullname)) = ?",[trim(mb_strtolower($fullname,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $error["fullname"] = "Tên công ty đã tồn tại";
          $data['fullname']='';
          $flag = 0;                    
        }       
      }  
      if(mb_strlen($address) < 15){
        $error["address"] = 'Địa chỉ phải từ 15 ký tự trở lên';      
        $data['address']='';      
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(address)) = ?",[trim(mb_strtolower($address,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $error["address"] = "Địa chỉ công ty đã tồn tại";
          $data['address']='';
          $flag = 0;                    
        }       
      }          
      if(mb_strlen($phone) < 10){
        $error["phone"] = 'Điện thoại công ty phải từ 10 ký tự trở lên';   
        $data['phone']='';         
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(phone)) = ?",[trim(mb_strtolower($phone,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $error["phone"] = "Điện thoại công ty đã tồn tại";
          $data['phone']='';
          $flag = 0;                
        }       
      }  
      if((int)@$request->province_id == 0){
        $error["province_id"] = 'Vui lòng chọn tỉnh thành phố';            
        $data['province_id']=0;
        $flag = 0;
      }
      if((int)@$request->scale_id == 0){
        $error["scale_id"] = 'Vui lòng chọn quy mô công ty';    
        $data['scale_id']=0;        
        $flag = 0;
      }
      if(mb_strlen($intro) < 20){
        $error["intro"] = 'Sơ lược về công ty tối thiểu 20 ký tự trở lên';     
        $data['intro']='';       
        $flag = 0;
      }
      if(mb_strlen($fax) < 10){
        $error["fax"] = 'Fax ít nhất 10 ký tự trở lên';     
        $data['fax']='';       
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(fax)) = ?",[trim(mb_strtolower($fax,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $error["fax"] = "Fax công ty đã tồn tại";
          $data['fax']='';
          $flag = 0;                  
        }       
      }  
      if(!preg_match("#^(https?://(www\.)?|(www\.))[a-z0-9\-]{3,}(\.[a-z]{2,4}){1,2}$#", mb_strtolower($website,'UTF-8')   )){
        $error["website"] = 'Website không hợp lệ';     
        $data['website']='';       
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(website)) = ?",[trim(mb_strtolower($website,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $error["website"] = "Website công ty đã tồn tại";
          $data['website']='';
          $flag = 0;                    
        }       
      }
      if(mb_strlen($contacted_name) < 6){
        $error["contacted_name"] = 'Họ tên phải từ 6 ký tự trở lên';   
        $data['contacted_name']='';         
        $flag = 0;
      } 
      if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($contacted_email,'UTF-8')   )){
        $error["contacted_email"] = 'Email người liên hệ không hợp lệ';     
        $data['contacted_email']='';       
        $flag = 0;
      }
      if(mb_strlen($contacted_phone) < 10){
        $error["contacted_phone"] = 'Số điện thoại người liên hệ phải từ 10 ký tự trở lên';            
        $data['contacted_phone']='';
        $flag = 0;
      }
      if($flag==1){
        $item               =   new EmployerModel;
        $item->email        = @$email;
        $item->password     = md5(@$password);
        $item->fullname     = @$fullname;
        $item->address      = @$address;
        $item->phone        = @$phone;
        $item->province_id  = @$province_id;
        $item->scale_id     = @$scale_id;
        $item->intro        = @$intro;
        $item->fax          = @$fax;
        $item->website      = @$website;
        $item->contacted_name   = @$contacted_name;
        $item->contacted_email  = @$contacted_email;
        $item->contacted_phone  = @$contacted_phone; 
        $item->status = 1;
        $item->created_at=date("Y-m-d H:i:s",time());
        $item->updated_at=date("Y-m-d H:i:s",time());   
        $item->save();   
      }
    }
    return view("frontend.employer-register",compact('data','error'));         
  }
  public function registerCandidate(Request $request){             
    return view("frontend.candidate-register");         
  }    
  public function loginEmployer(Request $request){             
    return view("frontend.employer-login");         
  }
  public function loginCandidate(Request $request){             
    return view("frontend.candidate-login");         
  }    
  public function registerEmployerAjax(Request $request){
    $flag=1;
    $error=array();
    $success=array();  
    $data=array();       
    $info=array();
    if($request->isMethod('post')){
      $data               = @$request->all();
      $email              = trim(@$request->email);
      $password           = trim(@$request->password);
      $password_confirmed = trim(@$request->password_confirmed);
      $fullname           = trim(@$request->fullname);
      $address            = trim(@$request->address);
      $phone              = trim(@$request->phone);
      $province_id        = trim(@$request->province_id);
      $scale_id           = trim(@$request->scale_id);
      $intro              = trim(@$request->intro);
      $fax                = trim(@$request->fax);
      $website            = trim(@$request->website);
      $contacted_name     = trim(@$request->contacted_name);
      $contacted_email    = trim(@$request->contacted_email);
      $contacted_phone    = trim(@$request->contacted_phone);
      if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($email,'UTF-8')   )){
        $error["email"] = 'Email nhà tuyển dụng không hợp lệ';            
        $flag = 0;
      }
      else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(email)) = ?",[trim(mb_strtolower($email,'UTF-8'))])->get()->toArray();     
        if (count($source) > 0) {
          $error["email"]= "Email nhà tuyển dụng đã tồn tại";
          $flag = 0;                    
        }       
      }
      if(mb_strlen($password) < 6 ){
        $error["password"] = "Mật khẩu tối thiểu phải 6 ít tự";
        $flag = 0;                
      }else{
        if(strcmp($password, $password_confirmed) !=0 ){
          $error["password"] = "Xác nhận mật khẩu không trùng khớp";
          $flag = 0;                  
        }
      }    
      if(mb_strlen($fullname) < 6){
        $error["fullname"] = 'Tên công ty phải từ 6 ký tự trở lên';            
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(fullname)) = ?",[trim(mb_strtolower($fullname,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $error["fullname"] = "Tên công ty đã tồn tại";
          $flag = 0;                    
        }       
      }  
      if(mb_strlen($address) < 6){
        $error["address"] = 'Địa chỉ phải từ 6 ký tự trở lên';            
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(address)) = ?",[trim(mb_strtolower($address,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $error["address"] = "Địa chỉ công ty đã tồn tại";
          $flag = 0;                    
        }       
      }          
      if(mb_strlen($phone) < 10){
        $error["phone"] = 'Số điện thoại phải từ 10 ký tự trở lên';            
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(phone)) = ?",[trim(mb_strtolower($phone,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $error["phone"] = "Điện thoại công ty đã tồn tại";
          $flag = 0;                
        }       
      }  
      if((int)@$request->province_id == 0){
        $error["province_id"] = 'Vui lòng chọn tỉnh thành phố';            
        $flag = 0;
      }
      if((int)@$request->scale_id == 0){
        $error["scale_id"] = 'Vui lòng chọn quy mô công ty';            
        $flag = 0;
      }
      if(mb_strlen($intro) < 10){
        $error["intro"] = 'Sơ lược về công ty tối thiểu 10 ký tự trở lên';            
        $flag = 0;
      }
      if(mb_strlen($fax) < 10){
        $error["fax"] = 'Fax ít nhất 10 ký tự trở lên';            
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(fax)) = ?",[trim(mb_strtolower($fax,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $error["fax"] = "Fax công ty đã tồn tại";
          $flag = 0;                  
        }       
      }  
      if(!preg_match("#^(https?://(www\.)?|(www\.))[a-z0-9\-]{3,}(\.[a-z]{2,4}){1,2}$#", mb_strtolower($website,'UTF-8')   )){
        $error["website"] = 'Website không hợp lệ';            
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(website)) = ?",[trim(mb_strtolower($website,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $error["website"] = "Website công ty đã tồn tại";
          $flag = 0;                    
        }       
      }
      if(mb_strlen($contacted_name) < 6){
        $error["contacted_name"] = 'Họ tên phải từ 6 ký tự trở lên';            
        $flag = 0;
      } 
      if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($contacted_email,'UTF-8')   )){
        $error["contacted_email"] = 'Email người liên hệ không hợp lệ';            
        $flag = 0;
      }
      if(mb_strlen($contacted_phone) < 10){
        $error["contacted_phone"] = 'Số điện thoại người liên hệ phải từ 10 ký tự trở lên';            
        $flag = 0;
      }
      if($flag==1){
        $item               =   new EmployerModel;
        $item->email        = @$email;
        $item->password     = md5(@$password);
        $item->fullname     = @$fullname;
        $item->address      = @$address;
        $item->phone        = @$phone;
        $item->province_id  = @$province_id;
        $item->scale_id     = @$scale_id;
        $item->intro        = @$intro;
        $item->fax          = @$fax;
        $item->website      = @$website;
        $item->contacted_name   = @$contacted_name;
        $item->contacted_email  = @$contacted_email;
        $item->contacted_phone  = @$contacted_phone; 
        $item->status = 1;
        $item->created_at=date("Y-m-d H:i:s",time());
        $item->updated_at=date("Y-m-d H:i:s",time());   
        $item->save();   
      }
    }
    $info = array(                            
      "checked"   => $flag,
      "error"     => $error, 
      "link_redirect"=>url('/')             
    );
    return $info;       
  }  
  public function registerCandidateAjax(Request $request){

  }
}







