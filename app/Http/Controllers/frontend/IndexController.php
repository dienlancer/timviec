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
use App\CandidateModel;
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
    $success=array();
    $data=array();       
    if($request->isMethod('post')){
      $data               = @$request->all();
      $email              = trim(@$request->email);
      $password           = @$request->password;
      $password_confirmed = @$request->password_confirmed;
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
          $error["email"]= "Email nhà tuyển dụng đã có trong hệ thống. ";
          $data['email']='';
          $flag = 0;                    
        }
        $source=CandidateModel::whereRaw("trim(lower(email)) = ?",[trim(mb_strtolower($email,'UTF-8'))])->get()->toArray();     
        if (count($source) > 0) {
          $error["email"]= "Email nhà tuyển dụng đã có trong hệ thống. ";
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
          $error["fullname"] = "Tên công ty đã có trong hệ thống. ";
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
          $error["address"] = "Địa chỉ công ty đã có trong hệ thống. ";
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
          $error["phone"] = "Điện thoại công ty đã có trong hệ thống. ";
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
      if(mb_strlen($website) > 0){
        if(!preg_match("#^(https?://(www\.)?|(www\.))[a-z0-9\-]{3,}(\.[a-z]{2,4}){1,2}$#", mb_strtolower($website,'UTF-8')   )){
          $error["website"] = 'Website công ty không hợp lệ';     
          $data['website']='';       
          $flag = 0;
        }else{
          $source=array();
          $source=EmployerModel::whereRaw("trim(lower(website)) = ?",[trim(mb_strtolower($website,'UTF-8'))])->get()->toArray();    
          if (count($source) > 0) {
            $error["website"] = "Website công ty đã có trong hệ thống. ";
            $data['website']='';
            $flag = 0;                    
          }       
        }
      }      
      if(mb_strlen($contacted_name) < 6){
        $error["contacted_name"] = 'Họ tên người liên hệ phải từ 6 ký tự trở lên';   
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
        $item->password     = Hash::make(@$password) ;
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
        $success[]='<span>Đăng ký tài khoản nhà tuyển dụng thành công.</span><span class="margin-left-5">Vui lòng kích hoạt tài khoản trong email</span>';
      }
    }
    return view("frontend.employer-register",compact('data','error','success'));         
  }
  public function registerCandidate(Request $request){             
    $flag=1;
    $error=array();    
    $success=array();
    $data=array();       
    if($request->isMethod('post')){
      $data               = @$request->all();
      $email              = trim(@$request->email);
      $password           = @$request->password;
      $password_confirmed = @$request->password_confirmed;
      $fullname           = trim(@$request->fullname);
      $phone              = trim(@$request->phone);      
      if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($email,'UTF-8')   )){
        $error["email"] = 'Email ứng viên không hợp lệ'; 
        $data['email']='';           
        $flag = 0;
      }
      else{
        $source=array();
        $source=CandidateModel::whereRaw("trim(lower(email)) = ?",[trim(mb_strtolower($email,'UTF-8'))])->get()->toArray();     
        if (count($source) > 0) {
          $error["email"]= "Email ứng viên đã có trong hệ thống. ";
          $data['email']='';
          $flag = 0;                    
        }
        $source=EmployerModel::whereRaw("trim(lower(email)) = ?",[trim(mb_strtolower($email,'UTF-8'))])->get()->toArray();     
        if (count($source) > 0) {
          $error["email"]= "Email ứng viên đã có trong hệ thống. ";
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
      if(mb_strlen($fullname) < 6){
        $error["fullname"] = 'Tên ứng viên phải từ 6 ký tự trở lên';    
        $data['fullname']='';        
        $flag = 0;
      }        
      if(mb_strlen($phone) < 10){
        $error["phone"] = 'Điện thoại ứng viên phải từ 10 ký tự trở lên';   
        $data['phone']='';         
        $flag = 0;
      }else{
        $source=array();
        $source=CandidateModel::whereRaw("trim(lower(phone)) = ?",[trim(mb_strtolower($phone,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $error["phone"] = "Điện thoại ứng viên đã có trong hệ thống. ";
          $data['phone']='';
          $flag = 0;                
        }       
      }        
      if($flag==1){
        $item               = new CandidateModel;
        $item->email        = @$email;
        $item->password     = Hash::make(@$password) ;
        $item->fullname     = @$fullname;
        $item->phone        = @$phone;      
        $item->status =1;
        $item->created_at=date("Y-m-d H:i:s",time());
        $item->updated_at=date("Y-m-d H:i:s",time());   
        $item->save();   
        $success[]='<span>Đăng ký tài khoản ứng viên thành công.</span><span class="margin-left-5">Vui lòng kích hoạt tài khoản trong email</span>';
      }
    }
    return view("frontend.candidate-register",compact('data','error','success'));         
  }    
  public function loginEmployer(Request $request){      
    $error=array();
    $data=array();       
    $arrUser=array();
    $source=array();
    if(Session::has($this->_ssNameUser)){
      $arrUser=Session::get($this->_ssNameUser);
    }         
    if(count($arrUser) > 0){
      $email=@$arrUser['email'];   
      $source=EmployerModel::whereRaw('trim(lower(email)) = ?',[trim(mb_strtolower(@$email,'UTF-8'))])->select('id','email')->get()->toArray();
      if(count($source) > 0){
        return redirect()->route('frontend.index.viewEmployerAccount');
      }      
    }
    if($request->isMethod('post')){                    
      $email              = trim(@$request->email);
      $password           = @$request->password ;
      $source=EmployerModel::whereRaw('trim(lower(email)) = ? and status = ?',[trim(mb_strtolower(@$email,'UTF-8')),1])->select('id','email','password')->get()->toArray();
      if(count($source) > 0){
        $password_hashed=$source[0]['password'];
        if(Hash::check($password,$password_hashed)){
          $arrUser=array("id"=>$source[0]["id"],"email" => $source[0]["email"]);         
          Session::forget($this->_ssNameUser);                                 
          Session::put($this->_ssNameUser,$arrUser);  
          return redirect()->route('frontend.index.viewEmployerAccount'); 
        }else{
          $error[]="Đăng nhập sai mật khẩu";
        }              
      }else{
        $error[]="Đăng nhập sai email";
      }          
    }                          
    return view("frontend.employer-login",compact("error","data"));                       
  }
  public function loginCandidate(Request $request){         
    $error=array();
    $data=array();       
    $arrUser=array();
    $source=array();
    if(Session::has($this->_ssNameUser)){
      $arrUser=Session::get($this->_ssNameUser);
    }     
    if(count($arrUser) > 0){
      $email=@$arrUser['email'];   
      $source=CandidateModel::whereRaw('trim(lower(email)) = ?',[trim(mb_strtolower(@$email,'UTF-8'))])->select('id','email')->get()->toArray();
      if(count($source) > 0){
        return redirect()->route('frontend.index.viewCandidateAccount');
      }      
    }
    if($request->isMethod('post')){                    
      $email              = trim(@$request->email);
      $password           = @$request->password ;
      $source=CandidateModel::whereRaw('trim(lower(email)) = ? and status = ?',[trim(mb_strtolower(@$email,'UTF-8')),1])->select('id','email','password')->get()->toArray();
      if(count($source) > 0){
        $password_hashed=$source[0]['password'];
        if(Hash::check($password,$password_hashed)){
          $arrUser=array("id"=>$source[0]["id"],"email" => $source[0]["email"]);         
          Session::forget($this->_ssNameUser);                                 
          Session::put($this->_ssNameUser,$arrUser);  
          return redirect()->route('frontend.index.viewCandidateAccount'); 
        }else{
          $error[]="Đăng nhập sai mật khẩu";
        }              
      }else{
        $error[]="Đăng nhập sai email";
      }          
    }                       
    return view("frontend.candidate-login",compact("error","data"));         
  }    
  public function viewEmployerAccount(){
    $arrUser=array();
    if(Session::has($this->_ssNameUser)){
      $arrUser=Session::get($this->_ssNameUser);
    }         
    if(count($arrUser) > 0){
      $email=@$arrUser['email'];   
      $source=EmployerModel::whereRaw('trim(lower(email)) = ?',[trim(mb_strtolower(@$email,'UTF-8'))])->select('id','email')->get()->toArray();
      if(count($source) == 0){
        return redirect()->route("frontend.index.employerLogin"); 
      }      
    }else{
    	return redirect()->route("frontend.index.employerLogin"); 
    }
    return view("frontend.employer-account");
  }
  public function viewCandidateAccount(){
  	$arrUser=array();
    if(Session::has($this->_ssNameUser)){
      $arrUser=Session::get($this->_ssNameUser);
    }     
    if(count($arrUser) > 0){
      $email=@$arrUser['email'];   
      $source=CandidateModel::whereRaw('trim(lower(email)) = ?',[trim(mb_strtolower(@$email,'UTF-8'))])->select('id','email')->get()->toArray();
      if(count($source) == 0){
        return redirect()->route("frontend.index.candidateLogin");
      }      
    }else{
    	return redirect()->route("frontend.index.candidateLogin");
    }
    return view("frontend.candidate-account");
  }
  public function logoutEmployer(){
  	$arrUser=array();            
  	if(Session::has($this->_ssNameUser)){
  		$arrUser=Session::get($this->_ssNameUser);
  		Session::forget($this->_ssNameUser);      
  	}    
  	return redirect()->route("frontend.index.employerLogin");
  }
  public function logoutCandidate(){
  	$arrUser=array();            
  	if(Session::has($this->_ssNameUser)){
  		$arrUser=Session::get($this->_ssNameUser);
  		Session::forget($this->_ssNameUser);      
  	}    
  	return redirect()->route("frontend.index.candidateLogin");
  }
}







