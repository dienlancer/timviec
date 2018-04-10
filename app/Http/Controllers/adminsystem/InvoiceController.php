<?php namespace App\Http\Controllers\adminsystem;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\InvoiceModel;
use App\InvoiceDetailModel;
use DB;
class InvoiceController extends Controller {
    	var $_controller="invoice";	
    	var $_title="Đơn đặt hàng";
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
        $query=DB::table('invoice');        
        if(!empty(@$request->filter_search)){
          $query->where('invoice.fullname','like','%'.trim(@$request->filter_search).'%');
        }
        $data=$query->select('invoice.id','invoice.code','invoice.email','invoice.fullname','invoice.address','invoice.phone','invoice.quantity','invoice.total_price','invoice.status','invoice.created_at','invoice.updated_at')
        ->groupBy('invoice.id','invoice.code','invoice.email','invoice.fullname','invoice.address','invoice.phone','invoice.quantity','invoice.total_price','invoice.status','invoice.created_at','invoice.updated_at')
        ->orderBy('invoice.created_at', 'desc')->get()->toArray()     ;              
        $data=convertToArray($data);    
        $data=invoiceConverter($data,$this->_controller);            
        return $data;
      }   	
      public function getForm($task,$id=""){		 
          $controller=$this->_controller;			
          $title="";
          $icon=$this->_icon; 
          $arrRowData=array();    
          $arrInvoiceDetail=array();  
          
          $arrPrivilege=getArrPrivilege();
        $requestControllerAction=$this->_controller."-form";  
        if(in_array($requestControllerAction, $arrPrivilege)){
          switch ($task) {
            case 'edit':
                $title=$this->_title . " : Update";
                $arrRowData=InvoiceModel::find((int)@$id)->toArray();           
                $arrInvoiceDetail=InvoiceDetailModel::whereRaw("invoice_id = ?",[(int)@$id])->select()->get()->toArray();
                
            break;
            case 'add':
                $title=$this->_title . " : Add new";
            break;      
         }             
         return view("adminsystem.".$this->_controller.".form",compact("arrRowData","arrInvoiceDetail","controller","task","title","icon"));
        }else{
          return view("adminsystem.no-access",compact('controller'));
        }
          
     }
    public function save(Request $request){
        $id 					           =	trim($request->id)	;        
        $fullname 				       =	trim($request->fullname)	;
        $address 					       = 	trim($request->address);
        $phone	                 =	trim($request->phone);                
        
        $status 				         =  trim($request->status);        
        $data 		               =  array();
        $info 		               =  array();
        $msg 		               =  array();
        $item		                 =  null;
        $checked 	= 1;                              
        if((int)$status==-1){
             $checked = 0;
             $msg["status"]["type_msg"] 		= "has-error";
             $msg["status"]["msg"] 			= "Thiếu trạng thái";
        }
        if ($checked == 1) {    
             if(empty($id)){
              $item 				= 	new InvoiceModel;       
              $item->created_at 	=	date("Y-m-d H:i:s",time());                      			
        } else{
              $item				=	InvoiceModel::find((int)@$id);                         
        }  
        $item->fullname 		=	$fullname;
        $item->address 			=	$address;
        $item->phone 		    =	$phone;            
        
                   
        
        $item->status 			=	(int)@$status;    
        $item->updated_at 	=	date("Y-m-d H:i:s",time());    	        	
        $item->save();  	
        $info = array(
          "checked"       => $checked,          
        'msg'       => $msg,       
          "id"    			=> $id
        );
      } else {
            $info = array(
              "checked"       => $checked,          
        'msg'       => $msg,       
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
            $status         =       (int)$request->status;
            $item           =       InvoiceModel::find((int)@$id);        
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
          $item               =   InvoiceModel::find((int)@$id);
          $item->delete();            
          InvoiceDetailModel::whereRaw("invoice_id = ?",[(int)@$id])->delete();
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
          $msg                    =   "Vui lòng chọn ít nhất 1 phần tử";
        }
        if($checked==1){
          foreach ($arrID as $key => $value) {
            if(!empty($value)){
              $item=InvoiceModel::find($value);
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
              $msg                =   "Vui lòng chọn ít nhất 1 phần tử";
            }
            if($checked == 1){                              
              DB::table('invoice')->whereIn('id',@$arrID)->delete();   
              DB::table('invoice_detail')->whereIn('invoice_id',@$arrID)->delete();   
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
