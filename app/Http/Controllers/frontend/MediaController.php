<?php namespace App\Http\Controllers\frontend;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Session;
use DB;
use Hash;
use Sentinel;
class MediaController extends Controller {	
	var $_controller="media";	
	public function getList(){		    		           
		$component="list-media";
		$layout="two-column";
		$arrUser=array();              
		$user = Sentinel::forceCheck(); 
		if(!empty($user)){                
			$arrUser = $user->toArray();    
		}      
		if(count($arrUser) == 0){
			return redirect()->route("frontend.index.login"); 
		}
		$controller=$this->_controller;		
		return view("frontend.index",compact("component","layout","controller"));                  
	}	   
  	public function loadData(Request $request){
  		$arrUser=array();              
	    $user = Sentinel::forceCheck(); 
	    if(!empty($user)){                
	      $arrUser = $user->toArray();    
	    }      
	    $folder_user='vip-'.(int)@$arrUser['id'];
	    $folder_vip='vip-member'.DS.$folder_user;
  		$strDirUpload=base_path($folder_vip);
  		$data = scandir($strDirUpload);		  		
  		$data=media2Converter($data,$this->_controller,$folder_vip);		           		
  		return $data;
  	}	 
  	public function getForm($task){	
  		$component="form-media";
  		$layout="two-column";
  		$arrUser=array();              
  		$user = Sentinel::forceCheck(); 
  		if(!empty($user)){                
  			$arrUser = $user->toArray();    
  		}      
  		if(count($arrUser) == 0){
  			return redirect()->route("frontend.index.login"); 
  		}	 
  		$controller=$this->_controller;	
  				
  		return view("frontend.index",compact("component","layout","controller","task"));
  	}
  	
	public function trash(Request $request){
		$str_id                 =   $request->str_id;   
		$checked                =   1;
		$type_msg               =   "alert-success";
		$msg                    =   "Xóa thành công";      
		if(empty($str_id)){
			$checked     =   0;
			$type_msg           =   "alert-warning";            
			$msg                =   "Vui lòng chọn ít nhất một phần tử để xóa";
		}
		$arrUser=array();              
	    $user = Sentinel::forceCheck(); 
	    if(!empty($user)){                
	      $arrUser = $user->toArray();    
	    }      
	    $folder_name='vip-'.(int)@$arrUser['id'];
	    $directory='vip-member'.DS.$folder_name;
		if($checked == 1){                                  
			$str_id=substr($str_id, 0,strlen($str_id) - 1);      
			$arrID                  =   explode(",", $str_id)  ;
			foreach ($arrID as $key => $value) {
				if(!empty($value)){

					$pathFile=base_path($directory.DS.$value);
					if(file_exists($pathFile)){
						unlink($pathFile);
					}	
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
	public function deleteItem(Request $request){
		$id                     =   $request->id;              
		$checked                =   1;
		$type_msg               =   "alert-success";
		$msg                    =   "Xóa thành công";    
		$arrUser=array();              
	    $user = Sentinel::forceCheck(); 
	    if(!empty($user)){                
	      $arrUser = $user->toArray();    
	    }      
	    $folder_name='vip-'.(int)@$arrUser['id'];
	    $directory='vip-member'.DS.$folder_name;               
		$pathFile 				= 	base_path($directory.DS.$id);			
		if(!file_exists($pathFile)){
			$checked=0;
		}			         	    
		if($checked == 1){
			unlink($pathFile);
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

