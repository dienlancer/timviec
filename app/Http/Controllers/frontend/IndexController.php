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
use App\RecruitmentModel;
use App\RecruitmentJobModel;
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
    $msg=array();        
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
        $msg["email"] = 'Email nhà tuyển dụng không hợp lệ'; 
        $data['email']='';           
        $flag = 0;
      }
      else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(email)) = ?",[trim(mb_strtolower($email,'UTF-8'))])->get()->toArray();     
        if (count($source) > 0) {
          $msg["email"]= "Email nhà tuyển dụng đã có trong hệ thống. ";
          $data['email']='';
          $flag = 0;                    
        }
        $source=CandidateModel::whereRaw("trim(lower(email)) = ?",[trim(mb_strtolower($email,'UTF-8'))])->get()->toArray();     
        if (count($source) > 0) {
          $msg["email"]= "Email nhà tuyển dụng đã có trong hệ thống. ";
          $data['email']='';
          $flag = 0;                    
        }       
      }
      if(mb_strlen($password) < 10 ){
        $msg["password"] = "Mật khẩu tối thiểu phải 10 ký tự";
        $data['password']='';
        $data['password_confirmed']='';
        $flag = 0;                
      }else{
        if(strcmp($password, $password_confirmed) !=0 ){
          $msg["password"] = "Xác nhận mật khẩu không trùng khớp";
          $data['password']='';
          $data['password_confirmed']='';
          $flag = 0;                  
        }
      }    
      if(mb_strlen($fullname) < 15){
        $msg["fullname"] = 'Tên công ty phải từ 15 ký tự trở lên';    
        $data['fullname']='';        
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(fullname)) = ?",[trim(mb_strtolower($fullname,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $msg["fullname"] = "Tên công ty đã có trong hệ thống. ";
          $data['fullname']='';
          $flag = 0;                    
        }       
      }  
      if(mb_strlen($address) < 15){
        $msg["address"] = 'Địa chỉ phải từ 15 ký tự trở lên';      
        $data['address']='';      
        $flag = 0;
      }   
      if(mb_strlen($phone) < 10){
        $msg["phone"] = 'Điện thoại công ty phải từ 10 ký tự trở lên';   
        $data['phone']='';         
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(phone)) = ?",[trim(mb_strtolower($phone,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $msg["phone"] = "Điện thoại công ty đã có trong hệ thống. ";
          $data['phone']='';
          $flag = 0;                
        }       
      }  
      if((int)@$request->province_id == 0){
        $msg["province_id"] = 'Vui lòng chọn tỉnh thành phố';            
        $data['province_id']=0;
        $flag = 0;
      }
      if((int)@$request->scale_id == 0){
        $msg["scale_id"] = 'Vui lòng chọn quy mô công ty';    
        $data['scale_id']=0;        
        $flag = 0;
      }      
      if(mb_strlen($website) > 0){
        if(!preg_match("#^(https?://(www\.)?|(www\.))[a-z0-9\-]{3,}(\.[a-z]{2,4}){1,2}$#", mb_strtolower($website,'UTF-8')   )){
          $msg["website"] = 'Website công ty không hợp lệ';     
          $data['website']='';       
          $flag = 0;
        }
      }      
      if(mb_strlen($contacted_name) < 6){
        $msg["contacted_name"] = 'Họ tên người liên hệ phải từ 6 ký tự trở lên';   
        $data['contacted_name']='';         
        $flag = 0;
      } 
      if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($contacted_email,'UTF-8')   )){
        $msg["contacted_email"] = 'Email người liên hệ không hợp lệ';     
        $data['contacted_email']='';       
        $flag = 0;
      }
      if(mb_strlen($contacted_phone) < 10){
        $msg["contacted_phone"] = 'Số điện thoại người liên hệ phải từ 10 ký tự trở lên';            
        $data['contacted_phone']='';
        $flag = 0;
      }
      if($flag==1){
        $item               = new EmployerModel;
        $item->email        = @$email;
        $item->password     = Hash::make(@$password) ;
        $item->fullname     = @$fullname;
        /* begin save alias */
        $alias=str_slug(@$fullname,'-');
        $checked_trung_alias=0;
        $data_employer=array();        
        $data_employer=EmployerModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower(@$alias,'UTF-8'))])->get()->toArray();        
        if (count(@$data_employer) > 0) {
          $checked_trung_alias=1;
        }        
        if((int)@$checked_trung_alias == 1){
          $code_alias=rand(1,999999);
          $alias=$alias.'-'.$code_alias;
        } 
        $item->alias=@$alias;
        /* end save alias */
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
        $msg['success']='<span>Đăng ký tài khoản nhà tuyển dụng thành công.</span><span class="margin-left-5">Vui lòng kích hoạt tài khoản trong email</span>';
      }
    }
    return view("frontend.employer-register",compact('data','msg','flag'));         
  }
  public function registerCandidate(Request $request){             
    $flag=1;
    $msg=array();        
    $data=array();       
    if($request->isMethod('post')){
      $data               = @$request->all();
      $email              = trim(@$request->email);
      $password           = @$request->password;
      $password_confirmed = @$request->password_confirmed;
      $fullname           = trim(@$request->fullname);
      $phone              = trim(@$request->phone);      
      if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($email,'UTF-8')   )){
        $msg["email"] = 'Email ứng viên không hợp lệ'; 
        $data['email']='';           
        $flag = 0;
      }
      else{
        $source=array();
        $source=CandidateModel::whereRaw("trim(lower(email)) = ?",[trim(mb_strtolower($email,'UTF-8'))])->get()->toArray();     
        if (count($source) > 0) {
          $msg["email"]= "Email ứng viên đã có trong hệ thống. ";
          $data['email']='';
          $flag = 0;                    
        }
        $source=EmployerModel::whereRaw("trim(lower(email)) = ?",[trim(mb_strtolower($email,'UTF-8'))])->get()->toArray();     
        if (count($source) > 0) {
          $msg["email"]= "Email ứng viên đã có trong hệ thống. ";
          $data['email']='';
          $flag = 0;                    
        }       
      }
      if(mb_strlen($password) < 10 ){
        $msg["password"] = "Mật khẩu tối thiểu phải 10 ký tự";
        $data['password']='';
        $data['password_confirmed']='';
        $flag = 0;                
      }else{
        if(strcmp($password, $password_confirmed) !=0 ){
          $msg["password"] = "Xác nhận mật khẩu không trùng khớp";
          $data['password']='';
          $data['password_confirmed']='';
          $flag = 0;                  
        }
      }    
      if(mb_strlen($fullname) < 6){
        $msg["fullname"] = 'Tên ứng viên phải từ 6 ký tự trở lên';    
        $data['fullname']='';        
        $flag = 0;
      }        
      if(mb_strlen($phone) < 10){
        $msg["phone"] = 'Điện thoại ứng viên phải từ 10 ký tự trở lên';   
        $data['phone']='';         
        $flag = 0;
      }else{
        $source=array();
        $source=CandidateModel::whereRaw("trim(lower(phone)) = ?",[trim(mb_strtolower($phone,'UTF-8'))])->get()->toArray();    
        if (count($source) > 0) {
          $msg["phone"] = "Điện thoại ứng viên đã có trong hệ thống. ";
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
        $msg['success']='<span>Đăng ký tài khoản ứng viên thành công.</span><span class="margin-left-5">Vui lòng kích hoạt tài khoản trong email</span>';
      }
    }
    return view("frontend.candidate-register",compact('data','msg','flag'));         
  }    
  public function loginEmployer(Request $request){      
    $msg=array();
    $data=array();     
    $flag=1;  
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
          $flag=0;
          $msg['success']="Đăng nhập sai mật khẩu";
        }              
      }else{
        $flag=0;
        $msg['success']="Đăng nhập sai email hoặc tài khoản chưa được kích hoạt";
      }          
    }                          
    return view("frontend.employer-login",compact('msg',"data",'flag'));                       
  }
  public function loginCandidate(Request $request){         
    $msg=array();
    $flag=1;
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
          $msg['success']="Đăng nhập sai mật khẩu";
          $flag=0;
        }              
      }else{
        $msg['success']="Đăng nhập sai email hoặc tài khoản chưa được kích hoạt";
        $flag=0;
      }          
    }                       
    return view("frontend.candidate-login",compact('msg',"data",'flag'));                       
  }    
  public function viewEmployerAccount(Request $request){
    $flag=1;
    $msg=array();        
    $data=array();       
    $arrUser=array();    
    if(Session::has($this->_ssNameUser)){
      $arrUser=Session::get($this->_ssNameUser);
    }         
    if(count($arrUser) > 0){
      $email=@$arrUser['email'];   
      $source=EmployerModel::whereRaw('trim(lower(email)) = ?',[trim(mb_strtolower(@$email,'UTF-8'))])->select('id','email')->get()->toArray();
      if(count($source) == 0){
        return redirect()->route("frontend.index.employerLogin"); 
      }else{
        $data=EmployerModel::find((int)@$source[0]['id'])->toArray();        
      }      
    }else{
    	return redirect()->route("frontend.index.employerLogin"); 
    }
    if($request->isMethod('post')){
      $data               = @$request->all();          
      $fullname           = trim(@$request->fullname);
      $address            = trim(@$request->address);
      $phone              = trim(@$request->phone);
      $province_id        = trim(@$request->province_id);
      $scale_id           = trim(@$request->scale_id);
      $image_file           =   null;
      if(isset($_FILES["image"])){
      	$image_file         =   $_FILES["image"];
      }                 
      $image_hidden         =   trim($request->image_hidden);
      $data['logo']=$image_hidden;
      $intro              = trim(@$request->intro);
      $fax                = trim(@$request->fax);
      $website            = trim(@$request->website);
      $contacted_name     = trim(@$request->contacted_name);
      $contacted_email    = trim(@$request->contacted_email);
      $contacted_phone    = trim(@$request->contacted_phone);
      if(mb_strlen($fullname) < 15){
        $msg["fullname"] = 'Tên công ty phải từ 15 ký tự trở lên';    
        $data['fullname']='';        
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(fullname)) = ? and id != ?",[trim(mb_strtolower($fullname,'UTF-8')),(int)@$arrUser['id']])->get()->toArray();    
        if (count($source) > 0) {
          $msg["fullname"] = "Tên công ty đã có trong hệ thống. ";
          $data['fullname']='';
          $flag = 0;                    
        }       
      }  
      if(mb_strlen($address) < 15){
        $msg["address"] = 'Địa chỉ phải từ 15 ký tự trở lên';      
        $data['address']='';      
        $flag = 0;
      }       
      if(mb_strlen($phone) < 10){
        $msg["phone"] = 'Điện thoại công ty phải từ 10 ký tự trở lên';   
        $data['phone']='';         
        $flag = 0;
      }else{
        $source=array();
        $source=EmployerModel::whereRaw("trim(lower(phone)) = ? and id != ?",[trim(mb_strtolower($phone,'UTF-8')),(int)@$arrUser['id']])->get()->toArray();    
        if (count($source) > 0) {
          $msg["phone"] = "Điện thoại công ty đã có trong hệ thống. ";
          $data['phone']='';
          $flag = 0;                
        }       
      }  
      if((int)@$request->province_id == 0){
        $msg["province_id"] = 'Vui lòng chọn tỉnh thành phố';            
        $data['province_id']=0;
        $flag = 0;
      }
      if((int)@$request->scale_id == 0){
        $msg["scale_id"] = 'Vui lòng chọn quy mô công ty';    
        $data['scale_id']=0;        
        $flag = 0;
      }      
      if(mb_strlen($website) > 0){
        if(!preg_match("#^(https?://(www\.)?|(www\.))[a-z0-9\-]{3,}(\.[a-z]{2,4}){1,2}$#", mb_strtolower($website,'UTF-8')   )){
          $msg["website"] = 'Website công ty không hợp lệ';     
          $data['website']='';       
          $flag = 0;
        }
      }      
      if(mb_strlen($contacted_name) < 6){
        $msg["contacted_name"] = 'Họ tên người liên hệ phải từ 6 ký tự trở lên';   
        $data['contacted_name']='';         
        $flag = 0;
      } 
      if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower($contacted_email,'UTF-8')   )){
        $msg["contacted_email"] = 'Email người liên hệ không hợp lệ';     
        $data['contacted_email']='';       
        $flag = 0;
      }
      if(mb_strlen($contacted_phone) < 10){
        $msg["contacted_phone"] = 'Số điện thoại người liên hệ phải từ 10 ký tự trở lên';            
        $data['contacted_phone']='';
        $flag = 0;
      }
      if($flag==1){
        $item               = EmployerModel::find((int)@$arrUser['id']);
        $item->fullname     = @$fullname;
        $item->address      = @$address;
        $item->phone        = @$phone;
        $item->province_id  = @$province_id;
        $item->scale_id     = @$scale_id;
        /* begin upload logo */
        $setting= getSettingSystem();
        $width=$setting['product_width']['field_value'];
        $height=$setting['product_height']['field_value'];  
        $image_name='';
        if($image_file != null){          
        	if(!empty($image_file['name'])){
        		$image_name=uploadImage($image_file['name'],$image_file['tmp_name'],$width,$height);
        	}   	        	
        }
        $item->logo=null;                       
        if(!empty($image_hidden)){
          $item->logo =$image_hidden;          
        }
        if(!empty($image_name))  {
          $item->logo=$image_name;                                                
        }   
        /* end upload logo */
        $item->intro        = @$intro;
        $item->fax          = @$fax;
        $item->website      = @$website;
        $item->contacted_name   = @$contacted_name;
        $item->contacted_email  = @$contacted_email;
        $item->contacted_phone  = @$contacted_phone;               
        $item->updated_at=date("Y-m-d H:i:s",time());   
        $item->save();   
        $data=EmployerModel::find((int)@$arrUser['id'])->toArray();
        $msg['success']='<span>Cập nhật tài khoản nhà tuyển dụng thành công.</span>';
      }
    }
    return view("frontend.employer-account",compact('data','msg','flag'));         
  }
  public function viewCandidateAccount(Request $request){
  	$flag=1;
    $msg=array();        
    $data=array();       
    $arrUser=array();
    if(Session::has($this->_ssNameUser)){
      $arrUser=Session::get($this->_ssNameUser);
    }     
    if(count($arrUser) > 0){
      $email=@$arrUser['email'];   
      $source=CandidateModel::whereRaw('trim(lower(email)) = ?',[trim(mb_strtolower(@$email,'UTF-8'))])->select('id','email')->get()->toArray();
      if(count($source) == 0){
        return redirect()->route("frontend.index.candidateLogin");
      }else{
        $data=CandidateModel::find((int)@$source[0]['id'])->toArray();  
        $birthday=$data['birthday'];
        $arrDate    = date_parse_from_format('Y-m-d', $birthday) ;     
        $data['day']=(int)@$arrDate['day'];
        $data['month']=(int)@$arrDate['month'];
        $data['year']=(int)@$arrDate['year']; 
      }       
    }else{
    	return redirect()->route("frontend.index.candidateLogin");
    }
    if($request->isMethod('post')){
      $data               = @$request->all();      
      $fullname           = trim(@$request->fullname);
      $phone              = trim(@$request->phone);   
      /* begin avatar */
      $image_file           =   null;
      if(isset($_FILES["image"])){
      	$image_file         =   $_FILES["image"];
      }                 
      $image_hidden         =   trim($request->image_hidden);    
      $data['avatar']=$image_hidden;     
      /* end avatar */
      $day=(int)@$request->day;
      $month=(int)@$request->month;
      $year=(int)@$request->year;     
      $sex_id=trim(@$request->sex_id);
      $marriage_id=trim(@$request->marriage_id);
      $province_id=trim(@$request->province_id); 
      $address=trim(@$request->address);
      if(mb_strlen($fullname) < 6){
        $msg["fullname"] = 'Tên ứng viên phải từ 6 ký tự trở lên';    
        $data['fullname']='';        
        $flag = 0;
      }        
      if(mb_strlen($phone) < 10){
        $msg["phone"] = 'Điện thoại ứng viên phải từ 10 ký tự trở lên';   
        $data['phone']='';         
        $flag = 0;
      }else{
        $source=array();
        $source=CandidateModel::whereRaw("trim(lower(phone)) = ? and id != ?",[trim(mb_strtolower($phone,'UTF-8')),(int)@$arrUser['id']])->get()->toArray();    
        if (count($source) > 0) {
          $msg["phone"] = "Điện thoại ứng viên đã có trong hệ thống. ";
          $data['phone']='';
          $flag = 0;                
        }       
      }        
      if($day==0){
        $msg["day"] = 'Thiếu ngày sinh';    
        $data['day']='';        
        $flag = 0;
      }
      if($month==0){
        $msg["month"] = 'Thiếu tháng sinh';    
        $data['month']='';        
        $flag = 0;
      }
      if($year==0){
        $msg["year"] = 'Thiếu năm sinh';    
        $data['year']='';        
        $flag = 0;
      }
      if((int)@$request->sex_id == 0){
        $msg["sex_id"] = 'Vui lòng chọn giới tính';            
        $data['sex_id']=0;
        $flag = 0;
      }
      if((int)@$request->marriage_id == 0){
        $msg["marriage_id"] = 'Vui lòng chọn tình trạng hôn nhân';            
        $data['marriage_id']=0;
        $flag = 0;
      }
      if((int)@$request->province_id == 0){
        $msg["province_id"] = 'Vui lòng chọn tỉnh thành phố';            
        $data['province_id']=0;
        $flag = 0;
      }
      if(mb_strlen(@$address) < 10){
        $msg["address"] = 'Vui lòng nhập chỗ ở hiện tại';            
        $data['address']='';
        $flag = 0;
      }
      if($flag==1){
        $item               = CandidateModel::find((int)@$arrUser['id']);
        $item->fullname     = @$fullname;
        $item->phone        = @$phone;   
        /* begin ngày sinh nhật */        
        $ts=mktime(0,0,0,$month,$day,$year);        
        $birthday=date('Y-m-d', $ts);
        $item->birthday=$birthday;
        /* end ngày sinh nhật */ 
        $item->sex_id=(int)@$sex_id;
        $item->marriage_id=(int)@$marriage_id;
        $item->province_id=(int)@$province_id;
        $item->address=@$address;
        /* begin upload avatar */
        $setting= getSettingSystem();
        $width=$setting['product_width']['field_value'];
        $height=$setting['product_height']['field_value'];  
        $image_name='';
        if($image_file != null){          
        	if(!empty($image_file['name'])){
        		$image_name=uploadImage($image_file['name'],$image_file['tmp_name'],$width,$height);
        	}   	        	
        }
        $item->avatar=null;                       
        if(!empty($image_hidden)){
          $item->avatar =$image_hidden;          
        }
        if(!empty($image_name))  {
          $item->avatar=$image_name;                                                
        } 
        /* end upload avatar */                         
        $item->updated_at=date("Y-m-d H:i:s",time());   
        $item->save();   
        $data               = CandidateModel::find((int)@$arrUser['id']);
        $data['day']=(int)@$day;
        $data['month']=(int)@$month;
        $data['year']=(int)@$year;
        $msg['success']='<span>Cập nhật tài khoản ứng viên thành công.</span>';
      }
    }
    return view("frontend.candidate-account",compact('data','msg','flag'));         
  }
  public function viewEmployerSecurity(Request $request){   
    $flag=1;
    $msg=array();        
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
    if($request->isMethod('post')){
      $password           = @$request->password;
      $password_confirmed = @$request->password_confirmed;
      if(mb_strlen($password) < 10 ){
        $msg["password"] = "Mật khẩu tối thiểu phải 10 ký tự";
        $flag = 0;                
      }else{
        if(strcmp($password, $password_confirmed) !=0 ){
          $msg["password"] = "Xác nhận mật khẩu không trùng khớp";
          $flag = 0;                  
        }
      }  
      if($flag==1){
        $item               = EmployerModel::find((int)@$arrUser['id']);
        $item->password     = Hash::make(@$password) ;
        $item->save();   
        $msg['success']='<span>Đổi mật khẩu thành công.</span>';
      } 
    }
    return view("frontend.employer-security",compact('msg','flag'));                               
  }
  public function viewCandidateSecurity(Request $request){   
    $flag=1;
    $msg=array();          
    $arrUser=array();    
    if(Session::has($this->_ssNameUser)){
      $arrUser=Session::get($this->_ssNameUser);
    }         
    if(count($arrUser) > 0){
      $email=@$arrUser['email'];   
      $source=candidateModel::whereRaw('trim(lower(email)) = ?',[trim(mb_strtolower(@$email,'UTF-8'))])->select('id','email')->get()->toArray();
      if(count($source) == 0){
        return redirect()->route("frontend.index.candidateLogin"); 
      }     
    }else{
      return redirect()->route("frontend.index.candidateLogin"); 
    }
    if($request->isMethod('post')){
      $password           = @$request->password;
      $password_confirmed = @$request->password_confirmed;
      if(mb_strlen($password) < 10 ){
        $msg["password"] = "Mật khẩu tối thiểu phải 10 ký tự";
        $flag = 0;                
      }else{
        if(strcmp($password, $password_confirmed) !=0 ){
          $msg["password"] = "Xác nhận mật khẩu không trùng khớp";
          $flag = 0;                  
        }
      }  
      if($flag==1){
        $item               = CandidateModel::find((int)@$arrUser['id']);
        $item->password     = Hash::make(@$password) ;
        $item->save();   
        $msg['success']='<span>Đổi mật khẩu thành công.</span>';
      } 
    }
    return view("frontend.candidate-security",compact('msg','flag'));                                   
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
  
  public function postRecruitment(Request $request,$task,$id){
    $flag=1;
    $msg=array();        
    $data=array();
    
    $arrUser=array();    
    if(Session::has($this->_ssNameUser)){
      $arrUser=Session::get($this->_ssNameUser);
    }         
    if(count($arrUser) == 0){
      return redirect()->route("frontend.index.employerLogin"); 
    }
    $email=@$arrUser['email'];       
    $source=EmployerModel::whereRaw('trim(lower(email)) = ?',[trim(mb_strtolower(@$email,'UTF-8'))])->select('id','email','contacted_name','contacted_email','address','contacted_phone')->get()->toArray();
    if(count($source) == 0){
      return redirect()->route("frontend.index.employerLogin"); 
    }           
    if($task == 'edit'){
      $data=RecruitmentModel::find((int)@$id)->toArray();
      $source_recruitment_job=RecruitmentJobModel::whereRaw('recruitment_id = ?',[(int)@$id])->select('job_id')->get()->toArray();
      $source_job_id=array();
      if(count($source_recruitment_job) > 0){
        foreach ($source_recruitment_job as $key => $value) {
          $source_job_id[]=$value['job_id'];
        }
      }      
      $data['job_id']=$source_job_id;
      $data['duration']=datetimeConverterVn($data['duration']);      
    }
    $data['contacted_name']=@$source[0]['contacted_name'];
    $data['contacted_email']=@$source[0]['contacted_email'];
    $data['address']=@$source[0]['address'];
    $data['contacted_phone']=@$source[0]['contacted_phone'];
    if($request->isMethod('post')){
      $data             =   @$request->all();              
      $fullname         =   trim(@$request->fullname);
      $quantity         =   trim(@$request->quantity);
      $sex_id           =   trim(@$request->sex_id);  
      $description      =   trim(@$request->description);
      $requirement      =   trim(@$request->requirement);
      $work_id          =   trim(@$request->work_id);
      $literacy_id      =   trim(@$request->literacy_id);
      $experience_id    =   trim(@$request->experience_id);
      $salary_id        =   trim(@$request->salary_id);
      $commission_from  =   trim(@$request->commission_from);
      $commission_to    =   trim(@$request->commission_to);
      $working_form_id  =   trim(@$request->working_form_id);
      $probationary_id  =   trim(@$request->probationary_id);
      $benefit          =   trim(@$request->benefit);
      $job_id           =   @$request->job_id;
      $province_id      =   trim(@$request->province_id);
      $duration         =   trim(@$request->duration);
      $status           =   trim(@$request->status); 
      $contacted_name   =   trim(@$request->contacted_name);
      $contacted_email  =   trim(@$request->contacted_email);
      $address          =   trim(@$request->address);
      $contacted_phone  =   trim(@$request->contacted_phone);     
      if(mb_strlen(@$fullname) < 15){
        $msg["fullname"] = 'Tiêu đề phải từ 15 ký tự trở lên';    
        $data['fullname']='';        
        $flag = 0;
      }    
      if((int)@$quantity == 0){
        $msg["quantity"] = 'Số lượng cần tuyển phải lớn hơn 0';    
        $data['quantity']='';        
        $flag = 0;
      } 
      if((int)@$sex_id == 0){
        $msg["sex_id"] = 'Vui lòng chọn giới tính';    
        $data['sex_id']='';        
        $flag = 0;
      }
      if(mb_strlen(@$description) == 0){
        $msg["description"] = 'Vui lòng nhập mô tả công việc';    
        $data['description']='';        
        $flag = 0; 
      }
      if(mb_strlen(@$requirement) == 0){
        $msg["requirement"] = 'Vui lòng nhập yêu cầu công việc';    
        $data['requirement']='';        
        $flag = 0; 
      }
      if((int)@$work_id == 0){
        $msg["work_id"] = 'Vui lòng chọn tính chất công việc';    
        $data['work_id']='';        
        $flag = 0;  
      }
      if((int)@$literacy_id == 0){
        $msg["literacy_id"] = 'Vui lòng chọn trình độ học vấn';    
        $data['literacy_id']='';        
        $flag = 0;   
      }
      if((int)@$experience_id == 0){
        $msg["experience_id"] = 'Vui lòng chọn kinh nghiệm';    
        $data['experience_id']='';        
        $flag = 0;    
      }
      if((int)@$salary_id == 0){
        $msg["salary_id"] = 'Vui lòng chọn mức lương';    
        $data['salary_id']='';        
        $flag = 0;     
      }
      if((int)@$commission_from != 0 || (int)@$commission_to != 0){
        if((int)@$commission_to <= (int)@$commission_from){
          $msg["commission_from"] = 'Mức hoa hồng không hợp lệ';    
          $data['commission_from']='';        
          $data['commission_to']='';        
          $flag = 0;     
        }
      }
      if((int)@$working_form_id == 0){
        $msg["working_form_id"] = 'Vui lòng chọn hình thức công việc';    
        $data['working_form_id']='';        
        $flag = 0;      
      }
      if((int)@$probationary_id == 0){
        $msg["probationary_id"] = 'Vui lòng chọn thời gian thử việc';    
        $data['probationary_id']='';        
        $flag = 0;      
      }
      if(mb_strlen(@$benefit)  == 0){
        $msg["benefit"] = 'Vui lòng nhập quyền lợi';    
        $data['benefit']='';        
        $flag = 0;      
      }
      if(count(@$job_id) == 0){
        $msg["job_id"] = 'Vui lòng chọn ngành nghề';    
        $data['job_id']='';        
        $flag = 0;      
      }else{
        if((int)@$job_id[0]==0){
          $msg["job_id"] = 'Vui lòng chọn ngành nghề';    
          $data['job_id']='';        
          $flag = 0;      
        }
      }
      if((int)@$province_id == 0){
        $msg["province_id"] = 'Vui lòng chọn nơi làm việc';    
        $data['province_id']='';        
        $flag = 0;      
      }
      if(mb_strlen(@$duration)  == 0){
        $msg["duration"] = 'Vui lòng chọn thời gian hết hạn';    
        $data['duration']='';        
        $flag = 0;      
      }
      if((int)@$status == -1){
        $msg["status"] = 'Vui lòng chọn trạng thái hiển thị tin';    
        $data['status']='';        
        $flag = 0;      
      } 
      if(mb_strlen(@$contacted_name) < 6){
        $msg["contacted_name"] = 'Họ tên người liên hệ phải từ 6 ký tự trở lên';   
        $data['contacted_name']='';         
        $flag = 0;
      } 
      if(!preg_match("#^[a-z][a-z0-9_\.]{4,31}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$#", mb_strtolower(@$contacted_email,'UTF-8')   )){
        $msg["contacted_email"] = 'Email người liên hệ không hợp lệ';     
        $data['contacted_email']='';       
        $flag = 0;
      }
      if(mb_strlen(@$address) < 15){
        $msg["address"] = 'Địa chỉ phải từ 15 ký tự trở lên';      
        $data['address']='';      
        $flag = 0;
      }  
      if(mb_strlen(@$contacted_phone) < 10){
        $msg["contacted_phone"] = 'Số điện thoại người liên hệ phải từ 10 ký tự trở lên';            
        $data['contacted_phone']='';
        $flag = 0;
      }   
      if($flag==1){
        $item=null;
        switch ($task) {
          case 'add':            
          $item                   = new RecruitmentModel;
          break;
          case 'edit':
          $item                   = RecruitmentModel::find((int)@$id);
          break;          
        }              
        $item->fullname           = @$fullname;
        /* begin save alias */
        $alias=str_slug(@$fullname,'-');
        $checked_trung_alias=0;
        $data_employer=array();        
        $data_employer=RecruitmentModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower(@$alias,'UTF-8'))])->get()->toArray();        
        if (count(@$data_employer) > 0) {
          $checked_trung_alias=1;
        }        
        if((int)@$checked_trung_alias == 1){
          $code_alias=rand(1,999999);
          $alias=$alias.'-'.$code_alias;
        } 
        $item->alias=@$alias;
        /* end save alias */
        $item->alias            = @$alias;
        $item->quantity         = (int)@$quantity;
        $item->sex_id           = (int)@$sex_id;
        $item->description      = @$description;
        $item->requirement      = @$requirement;
        $item->work_id          = (int)@$work_id;
        $item->literacy_id      = (int)@$literacy_id;
        $item->experience_id    = (int)@$experience_id;
        $item->salary_id        = (int)@$salary_id;
        $item->commission_from  = (int)@$commission_from;
        $item->commission_to    = (int)@$commission_to;
        $item->working_form_id  = (int)@$working_form_id;
        $item->probationary_id  = (int)@$probationary_id;
        $item->benefit          = @$benefit;
        $item->province_id      = (int)@$province_id;
        /* begin duration */
        $arrDate                = date_parse_from_format('d/m/Y',@$duration) ;
        $ts                     = mktime(@$arrDate["hour"],@$arrDate["minute"],@$arrDate["second"],@$arrDate['month'],@$arrDate['day'],@$arrDate['year']);
        $real_date                 = date('Y-m-d', $ts);
        /* end duration */
        $item->duration         = @$real_date;        
        $item->employer_id      = (int)@$arrUser['id'];        
        $item->status           = (int)@$status;
        $item->created_at=date("Y-m-d H:i:s");
        $item->updated_at=date("Y-m-d H:i:s");   
        $item->save();   
        RecruitmentJobModel::whereRaw("recruitment_id = ?",[(int)@$item->id])->delete();  
        foreach ($job_id as $key => $value) {
          $item2=new RecruitmentJobModel;
          $item2->recruitment_id = (int)@$item->id;
          $item2->job_id         = (int)@$value;
          $item2->save();
        }
        $item3=EmployerModel::find((int)@$arrUser['id']);
        $item3->contacted_name   = @$contacted_name;
        $item3->contacted_email  = @$contacted_email;
        $item3->address          = @$address;
        $item3->contacted_phone  = @$contacted_phone; 
        $item3->save();
        switch ($task) {
          case 'add':            
            $msg['success']='<span>Đăng tin thành công.&nbsp;</span><span class="margin-left-5 review"><a target="_blank" href="'.route('frontend.index.postRecruitment',['edit',@$id]).'">Xem tin đã đăng</a></span>';
            break;
          case 'edit':            
            $msg['success']='<span>Cập nhật tin đăng thành công</span>';
            break;          
        }        
      }  
    }
    return view('frontend.recruitment',compact('data','msg','flag','task'));     
  }
  public function manageRecruitment(Request $request){
    $flag=1;
    $msg=array();        
    $data=array();       
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

    $totalItems=0;
    $totalItemsPerPage=20;
    $pageRange=0;      
    $currentPage=1;  
    $pagination ='';            
    
    $query=DB::table('recruitment')   ;     
    $query->where('recruitment.employer_id',(int)@$arrUser['id']);    
    $data=$query->select('recruitment.id')
    ->groupBy('recruitment.id')                
    ->get()->toArray();
    $data=convertToArray($data);
    $totalItems=count($data);    
    $pageRange=$this->_pageRange;
    if(isset($request->filter_page)){
      if(!empty(@$request->filter_page)){
        $currentPage=@$request->filter_page;
      }
    }          
    $arrPagination=array(
      "totalItems"=>$totalItems,
      "totalItemsPerPage"=>$totalItemsPerPage,
      "pageRange"=>$pageRange,
      "currentPage"=>$currentPage   
    );           
    $pagination=new PaginationModel($arrPagination);
    $position   = ((int)@$currentPage-1)*$totalItemsPerPage;     

    $data=$query->select('recruitment.id','recruitment.fullname')
    ->groupBy('recruitment.id','recruitment.fullname')
    ->orderBy('recruitment.id', 'desc')
    ->skip($position)
    ->take($totalItemsPerPage)
    ->get()->toArray();   
    $data=convertToArray($data);      

    return view('frontend.manage-recruitment',compact('data','msg','flag',"pagination"));     
  }
  public function reviewRecruitment(Request $request){

  }
}







