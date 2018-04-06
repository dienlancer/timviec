<?php namespace App\Http\Controllers\adminsystem;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\CategoryArticleModel;
use App\CategoryProductModel;
use App\ArticleModel;
use App\ProductModel;
use App\PageModel;
use App\MenuModel;
use App\ProjectModel;
use App\ProjectArticleModel;
use App\ArticleCategoryModel;
use App\PaymentMethodModel;
use App\SupporterModel;
use App\EmployerModel;
use App\ProvinceModel;
use App\ScaleModel;
use App\User;
use DB;
use Hash;
class EmployerController extends Controller {
  	var $_controller="employer";	
  	var $_title="Nhà tuyển dụng";
  	var $_icon="icon-settings font-dark";    
  	public function getList(){		
    		$controller=$this->_controller;	
    		$task="list";
    		$title=$this->_title;
    		$icon=$this->_icon;		        
        $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-list";         
        if(in_array($requestControllerAction,$arrPrivilege)){
          return view("adminsystem.".$this->_controller.".list",compact("controller","task","title","icon")); 
        }
        else{
          return view("adminsystem.no-access");
        }
  	}	    
  	public function loadData(Request $request){
        $filter_search="";            
        if(!empty(@$request->filter_search)){      
          $filter_search=trim(@$request->filter_search) ;    
        }        
        $data=DB::table('employer')  
              ->leftJoin('users','employer.user_id','=','users.id')                
                ->select('employer.id','employer.fullname','employer.email','users.fullname as user_fullname','employer.status','employer.created_at','employer.updated_at')                
                ->where('employer.fullname','like','%'.trim(mb_strtolower($filter_search,'UTF-8')).'%')                     
                ->groupBy('employer.id','employer.fullname','employer.email','users.fullname','employer.status','employer.created_at','employer.updated_at')   
                ->orderBy('employer.created_at', 'desc')                
                ->get()->toArray();              
        $data=convertToArray($data);    
        $data=employerConverter($data,$this->_controller);            
        return $data;
    } 
    public function getForm($task,$id=""){     
      $controller=$this->_controller;     
      $title="";
      $icon=$this->_icon; 
      $arrRowData=array();        
      $arrPrivilege=getArrPrivilege();
      $requestControllerAction=$this->_controller."-form";  
      $arrUser=User::select("id","fullname")->orderBy("fullname","asc")->get()->toArray(); 
      if(in_array($requestControllerAction, $arrPrivilege)){
        switch ($task) {
         case 'edit':
         $title=$this->_title . " : Update";
         $arrRowData=EmployerModel::find((int)@$id)->toArray();                     
         break;
         case 'add':
         $title=$this->_title . " : Add new";
         break;     
       }                  
       return view("adminsystem.".$this->_controller.".form",compact("arrRowData","arrUser","controller","task","title","icon"));
     }else{
      return view("adminsystem.no-access");
    }        
  }
            public function save(Request $request){
              $id 					        =		trim(@$request->id);              
              $password             =   (@$request->password);
              $password_confirmed     =   (@$request->password_confirmed);
              $alias                =   trim(@$request->alias);    
              $meta_keyword 				=		trim(@$request->meta_keyword);
              $meta_description     =   trim(@$request->meta_description);    
              $user_id              =   trim(@$request->user_id); 
              $image_file           =   null;
              if(isset($_FILES["image"])){
                $image_file         =   $_FILES["image"];
              }
              $image_hidden         =   trim(@$request->image_hidden);      
              $status               =   trim(@$request->status);          
              $data 		            =   array();
              $info 		            =   array();
              $error 		            =   array();
              $item		              =   null;
              $checked 	            =   1;      
              $setting= getSettingSystem();
              $width=$setting['product_width']['field_value'];
              $height=$setting['product_height']['field_value'];   
              if($password != null){
                if(mb_strlen($password) < 10 ){
                  $checked = 0;
                  $error["password"]["type_msg"] = "has-error";
                  $error["password"]["msg"] = "Mật khẩu tối thiểu phải 10 ký tự";
                }else{
                  if(strcmp($password, $password_confirmed) !=0 ){
                    $checked = 0;
                    $error["password"]["type_msg"] = "has-error";
                    $error["password"]["msg"] = "Xác nhận mật khẩu không trùng khớp";
                  }
                }
              }                       
              if($alias == null){
                $checked = 0;
                $error["alias"]["type_msg"] = "has-error";
                $error["alias"]["msg"] = "Thiếu alias";
              }
              if((int)$status==-1){
               $checked = 0;
               $error["status"]["type_msg"] 		= "has-error";
               $error["status"]["msg"] 			= "Thiếu trạng thái";
             }
             if ($checked == 1) {   
              $image_name='';
              if($image_file != null){                      
                $image_name=uploadImage($image_file['name'],$image_file['tmp_name'],$width,$height);
              } 
              if(empty($id)){
                $item         =   new EmployerModel;       
                $item->created_at   = date("Y-m-d H:i:s",time());        
                if(!empty($image_name)){
                  $item->logo    =   trim($image_name) ;  
                } 
              } else{
                $item       = EmployerModel::find((int)@$id);   
                $item->logo=null;                       
                if(!empty($image_hidden)){
                  $item->logo =$image_hidden;          
                }
                if(!empty($image_name))  {
                  $item->logo=$image_name;                                                
                }  
              }  
              if($password != null){
                $item->password         = Hash::make($password);
              }
              $item->alias              = @$alias;
              $item->meta_keyword       = @$meta_keyword;
              $item->meta_description   = @$meta_description;
              $item->user_id            = (int)@$user_id;
              $item->status 			      =	(int)@$status;    
              $item->updated_at 		    =	date("Y-m-d H:i:s",time());    	        	
              $item->save();                                  
              $info = array(
                'type_msg' 			=> "has-success",
                'msg' 				=> 'Lưu dữ liệu thành công',
                "checked" 			=> 1,
                "error" 			=> $error,
                "id"    			=> $id
              );
            }else {
              $info = array(
                'type_msg' 			=> "has-error",
                'msg' 				=> 'Lưu dữ liệu thất bại',
                "checked" 			=> 0,
                "error" 			=> $error,
                "id"				=> ""
              );
            }        		 			       
            return $info;       
          }
          public function changeStatus(Request $request){
                  $id             =       (int)$request->id;     
                  $checked                =   1;
                  $type_msg               =   "alert-success";
                  $msg                    =   "Cập nhật thành công";              
                  $status         =       (int)@$request->status;
                  $item           =       EmployerModel::find((int)@$id);        
                  $item->status   =       $status;
                  $item->save();
                  $data                   =   $this->loadData($request);
                  $info = array(
                    'checked'           => $checked,
                    'type_msg'          => $type_msg,                
                    'msg'               => $msg,                
                    'data'              => $data
                  );
                  return $info;
          }
        
      public function deleteItem(Request $request){
            $id                     =   (int)$request->id;              
            $checked                =   1;
            $type_msg               =   "alert-success";
            $msg                    =   "Xóa thành công";                             
            if($checked == 1){
              $item = EmployerModel::find((int)@$id);
                $item->delete();                                                
            }        
            $data                   =   $this->loadData($request);
            $info = array(
              'checked'           => $checked,
              'type_msg'          => $type_msg,                
              'msg'               => $msg,                
              'data'              => $data
            );
            return $info;
      }
      public function updateStatus(Request $request){
        $strID                 =   $request->str_id;     
        $status                 =   $request->status;            
        $checked                =   1;
        $type_msg               =   "alert-success";
        $msg                    =   "Cập nhật thành công";                  
        $strID=substr($strID, 0,strlen($strID) - 1);
        $arrID=explode(',',$strID);                 
        if(empty($strID)){
          $checked                =   0;
          $type_msg               =   "alert-warning";            
          $msg                    =   "Vui lòng chọn ít nhất một phần tử";
        }
        if($checked==1){
          foreach ($arrID as $key => $value) {
            if(!empty($value)){
              $item=EmployerModel::find($value);
              $item->status=$status;
              $item->save();      
            }            
          }
        }                 
        $data                   =   $this->loadData($request);
        $info = array(
          'checked'           => $checked,
          'type_msg'          => $type_msg,                
          'msg'               => $msg,                
          'data'              => $data
        );
        return $info;
      }
      public function trash(Request $request){
        $strID                 =   $request->str_id;               
        $checked                =   1;
        $type_msg               =   "alert-success";
        $msg                    =   "Xóa thành công";                  
        $strID=substr($strID, 0,strlen($strID) - 1);
        $arrID=explode(',',$strID); 
        if(empty($strID)){
          $checked     =   0;
          $type_msg           =   "alert-warning";            
          $msg                =   "Vui lòng chọn ít nhất một phần tử";
        }                    
        if($checked == 1){                                  

          DB::table('employer')->whereIn('id',@$arrID)->delete();                                      
        }
        $data                   =   $this->loadData($request);
        $info = array(
          'checked'           => $checked,
          'type_msg'          => $type_msg,                
          'msg'               => $msg,                
          'data'              => $data
        );
        return $info;
      }            
}
?>
