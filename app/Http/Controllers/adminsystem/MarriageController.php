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
use App\MarriageModel;
use App\CandidateModel;
use DB;
class MarriageController extends Controller {
  	var $_controller="marriage";	
  	var $_title="Tình trạng hôn nhân";
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
          return view("adminsystem.no-access",compact('controller'));
        }
  	}	    
  	public function loadData(Request $request){
        $filter_search="";            
        if(!empty(@$request->filter_search)){      
          $filter_search=trim(@$request->filter_search) ;    
        }        
        $data=DB::table('marriage')                  
                ->select('marriage.id','marriage.fullname','marriage.sort_order','marriage.status','marriage.created_at','marriage.updated_at')                
                ->where('marriage.fullname','like','%'.trim(mb_strtolower($filter_search,'UTF-8')).'%')                     
                ->groupBy('marriage.id','marriage.fullname','marriage.sort_order','marriage.status','marriage.created_at','marriage.updated_at')   
                ->orderBy('marriage.sort_order', 'asc')                
                ->get()->toArray();              
        $data=convertToArray($data);    
        $data=marriageConverter($data,$this->_controller);            
        return $data;
    } 
    public function getForm($task,$id=""){     
        $controller=$this->_controller;     
        $title="";
        $icon=$this->_icon; 
        $arrRowData=array();        
        $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-form";  
        if(in_array($requestControllerAction, $arrPrivilege)){
          switch ($task) {
           case 'edit':
              $title=$this->_title . " : Update";
              $arrRowData=MarriageModel::find((int)@$id)->toArray();                     
           break;
           case 'add':
              $title=$this->_title . " : Add new";
           break;     
        }                  
        return view("adminsystem.".$this->_controller.".form",compact("arrRowData","controller","task","title","icon"));
        }else{
          return view("adminsystem.no-access",compact('controller'));
        }        
    }
     public function save(Request $request){
          $id 					        =		trim($request->id);        
          $fullname 				    =		trim($request->fullname);    
          $alias                =   trim($request->alias);                          
          $sort_order           =   trim($request->sort_order);
          $status               =   trim($request->status);          
          $data 		            =   array();
          $info 		            =   array();
          $error 		            =   array();
          $item		              =   null;
          $checked 	            =   1;              
          if(empty($fullname)){
                 $checked = 0;
                 $error["fullname"]["type_msg"] = "has-error";
                 $error["fullname"]["msg"] = "Thiếu tên";
          }                   
          if(empty($sort_order)){
             $checked = 0;
             $error["sort_order"]["type_msg"] 	= "has-error";
             $error["sort_order"]["msg"] 		= "Thiếu sắp xếp";
          }
          if((int)$status==-1){
             $checked = 0;
             $error["status"]["type_msg"] 		= "has-error";
             $error["status"]["msg"] 			= "Thiếu trạng thái";
          }
          if ($checked == 1) {    
                if(empty($id)){
                    $item         =   new MarriageModel;       
                    $item->created_at   = date("Y-m-d H:i:s",time());        
                      
                } else{
                    $item       = MarriageModel::find((int)@$id);   
                                  
                }  
                $item->fullname 		    =	@$fullname;  
                $item->alias            = @$alias;                                         
                $item->sort_order 		  =	(int)@$sort_order;
                $item->status 			    =	(int)@$status;    
                $item->updated_at 		  =	date("Y-m-d H:i:s",time());    	        	
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
                  $item           =       MarriageModel::find((int)@$id);        
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
            $data                   =   CandidateModel::whereRaw("marriage_id = ?",[(int)@$id])->get()->toArray();  
            if(count($data) > 0){
              $checked     =   0;
              $type_msg           =   "alert-warning";            
              $msg                    =   "Phần tử này có dữ liệu con. Vui lòng không xoá";
            }                  
            if($checked == 1){
              $item = MarriageModel::find((int)@$id);
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
              $item=MarriageModel::find($value);
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
        foreach ($arrID as $key => $value){
          $data                   =   CandidateModel::whereRaw("marriage_id = ?",[(int)@$value])->get()->toArray();  
            if(count($data) > 0){
              $checked     =   0;
              $type_msg           =   "alert-warning";            
              $msg                    =   "Phần tử này có dữ liệu con. Vui lòng không xoá";
            }
        } 
        if($checked == 1){                                  

          DB::table('marriage')->whereIn('id',@$arrID)->delete();                                      
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
      public function sortOrder(Request $request){
            $sort_json              =   $request->sort_json;           
            $data_order             =   json_decode($sort_json);       
          
            $checked                =   1;
            $type_msg               =   "alert-success";
            $msg                    =   "Cập nhật thành công";      
            if(count($data_order) > 0){              
              foreach($data_order as $key => $value){      
                if(!empty($value)){
                  $item=MarriageModel::find((int)@$value->id);                
                $item->sort_order=(int)$value->sort_order;                         
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
      public function createAlias(Request $request){
          $id                =  trim($request->id)  ; 
          $fullname                =  trim($request->fullname)  ;        
          $data                    =  array();
          $info                    =  array();
          $error                   =  array();
          $item                    =  null;
          $checked  = 1;   
          $alias='';                     
          if(empty($fullname)){
           $checked = 0;
           $error["fullname"]["type_msg"] = "has-error";
           $error["fullname"]["msg"] = "Thiếu tên bài viết";
         }else{          
          $alias=str_slug($fullname,'-');          
          $dataMarriage=array();
          $checked_trung_alias=0;          
          if (empty($id)) {              
              $dataMarriage=MarriageModel::whereRaw("trim(lower(alias)) = ?",[trim(mb_strtolower($alias,'UTF-8'))])->get()->toArray();             
            }else{
              $dataMarriage=MarriageModel::whereRaw("trim(lower(alias)) = ? and id != ?",[trim(mb_strtolower($alias,'UTF-8')),(int)@$id])->get()->toArray();    
            }  
           
           if (count($dataMarriage) > 0) {
            $checked_trung_alias=1;
          }
          if((int)$checked_trung_alias == 1){
            $code_alias=rand(1,999999);
            $alias=$alias.'-'.$code_alias;
          }
        }
        if ($checked == 1){
          $info = array(
            'type_msg'      => "has-success",
            'msg'         => 'Lưu dữ liệu thành công',
            "checked"       => 1,
            "error"       => $error,
            
            "alias"       =>$alias
          );
        }else {
          $info = array(
            'type_msg'      => "has-error",
            'msg'         => 'Nhập dữ liệu có sự cố',
            "checked"       => 0,
            "error"       => $error,
            "alias"        => $alias
          );
        }    
        return $info;
      }  
}
?>
