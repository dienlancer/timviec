<?php namespace App\Http\Controllers\frontend;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\InvoiceModel;
use App\InvoiceDetailModel;
use App\PaymentMethodModel;
use DB;
use Sentinel;
class InvoiceController extends Controller {
    	var $_controller="invoice";	
    	var $_title="Đơn đặt hàng";
    	var $_icon="icon-settings font-dark";
    	public function getList(){		
    		$component="list-invoice";
        $layout="two-column";
        $controller=$this->_controller; 
        $arrUser=array();              
        $user = Sentinel::forceCheck(); 
        if(!empty($user)){                
          $arrUser = $user->toArray();    
        }      
        if(count($arrUser) == 0){
          return redirect()->route("frontend.index.login"); 
        }              
        return view("frontend.index",compact("component","layout","controller"));
    	}	
    	public function loadData(Request $request){ 
        $arrUser=array();              
        $user = Sentinel::forceCheck(); 
        if(!empty($user)){                
          $arrUser = $user->toArray();    
        }                
        $query=DB::table('invoice');                
        $query->where('invoice.customer_id',(int)@$arrUser['id']);
        $data=$query->select('invoice.id','invoice.code','invoice.username','invoice.email','invoice.fullname','invoice.address','invoice.phone','invoice.quantity','invoice.total_price','invoice.status','invoice.sort_order','invoice.created_at','invoice.updated_at')
        ->groupBy('invoice.id','invoice.code','invoice.username','invoice.email','invoice.fullname','invoice.address','invoice.phone','invoice.quantity','invoice.total_price','invoice.status','invoice.sort_order','invoice.created_at','invoice.updated_at')
        ->orderBy('invoice.sort_order', 'asc')->get()->toArray()     ;              
        $data=convertToArray($data);    
        $data=invoice2Converter($data,$this->_controller);   
        //echo "<pre>".print_r($data,true)."</pre>";         die();
        return $data;
      }   	
      public function getForm($task,$id=""){		 
        $component="form-invoice";
        $layout="two-column";
        $controller=$this->_controller;  
        $arrUser=array();              
        $user = Sentinel::forceCheck(); 
        if(!empty($user)){                
          $arrUser = $user->toArray();    
        }      
        if(count($arrUser) == 0){
          return redirect()->route("frontend.index.login"); 
        }
        $arrRowData=array();
        $arrInvoiceDetail=array();  
        $dataPaymentMethod=array();        
        switch ($task) {
          case 'edit':
          $title=$this->_title . " : Update";
          $arrRowData=InvoiceModel::find((int)@$id)->toArray();           
          $arrInvoiceDetail=InvoiceDetailModel::whereRaw("invoice_id = ?",[(int)@$id])->select()->get()->toArray();
          $dataPaymentMethod=PaymentMethodModel::select('id','fullname','alias')->get()->toArray();
          break;
          case 'add':
          $title=$this->_title . " : Add new";
          break;     
        }
        return view("frontend.index",compact("component","layout","controller","arrRowData","arrInvoiceDetail","dataPaymentMethod"));  
      }
    public function save(Request $request){
        $id 					           =	trim($request->id)	;        
        $fullname 				       =	trim($request->fullname)	;
        $address 					       = 	trim($request->address);
        $phone	                 =	trim($request->phone);
        
        $sort_order 			       =	trim($request->sort_order);
        $status 				         =  trim($request->status);        
        $data 		               =  array();
        $info 		               =  array();
        $error 		               =  array();
        $item		                 =  null;
        
        $checked 	= 1;                      
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
              $item 				= 	new InvoiceModel;       
              $item->created_at 	=	date("Y-m-d H:i:s",time());                      			
        } else{
              $item				=	InvoiceModel::find((int)@$id);                         
        }  
        $item->fullname 		=	$fullname;
        $item->address 			=	$address;
        $item->phone 		    =	$phone;            
        
        $item->sort_order 	=	(int)@$sort_order;
        $item->status 			=	(int)@$status;    
        $item->updated_at 	=	date("Y-m-d H:i:s",time());    	        	
        $item->save();  	
        
        $info = array(
          'type_msg' 			=> "has-success",
          'msg' 				=> 'Lưu dữ liệu thành công',
          "checked" 			=> 1,
          "error" 			=> $error,
          "id"    			=> $id
        );
      } else {
            $info = array(
              'type_msg' 			=> "has-error",
              'msg' 				=> 'Nhập dữ liệu gặp sự cố',
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
            $arrUser=array();              
            $user = Sentinel::forceCheck(); 
            if(!empty($user)){                
              $arrUser = $user->toArray();    
            }                                
            if($checked == 1){
                $data = InvoiceModel::whereRaw('id = ? and user_id = ?',[(int)@$id,(int)@$arrUser['id']])->select('id')->get();
                if(count($data) > 0){
                  InvoiceModel::whereRaw('id = ? and user_id = ?',[(int)@$id,(int)@$arrUser['id']])->delete();
                  InvoiceDetailModel::whereRaw("invoice_id = ?",[(int)@$id])->delete();
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
      public function updateStatus(Request $request){
            $str_id                 =   $request->str_id;   
            $status                 =   $request->status;  
            $arrID                 =   explode(",", $str_id)  ;
            $checked                =   1;
            $type_msg               =   "alert-success";
            $msg                    =   "Cập nhật thành công";             
            if(empty($str_id)){
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
            $str_id                 =   $request->str_id;   
            $checked                =   1;
            $type_msg               =   "alert-success";
            $msg                    =   "Xóa thành công";      
            $arrID                  =   explode(",", $str_id)  ; 
            $arrUser=array();              
            $user = Sentinel::forceCheck(); 
            if(!empty($user)){                
              $arrUser = $user->toArray();    
            }     
            if(empty($str_id)){
              $checked     =   0;
              $type_msg           =   "alert-warning";            
              $msg                =   "Vui lòng chọn ít nhất 1 phần tử";
            }
            if($checked == 1){                
              $strID = implode(',',$arrID);       
              $strID = substr($strID, 0,strlen($strID) - 1); 
              $sqlDeleteInvoice       = "DELETE FROM `invoice`        WHERE `id`          IN (".$strID.")";        
              $sqlDeleteInvoiceDetail = "DELETE FROM `invoice_detail` WHERE `invoice_id`  IN (".$strID.")";       
              DB::statement($sqlDeleteInvoice);
              DB::statement($sqlDeleteInvoiceDetail);                      
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
                $item=InvoiceModel::find((int)@$value->id);                
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
    
}
?>
