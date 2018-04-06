<?php
namespace App\Http\Controllers\adminsystem;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\UserGroupMemberModel;
use App\GroupMemberModel;
use DB;
use Sentinel;
class LoginController extends Controller
{
    public function login(Request $request){                
        if($request->isMethod('post')){            
            Sentinel::authenticate($request->all());
            if(Sentinel::check()){                
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
                if($alias == null){
                    return view('adminsystem.login');
                }else{
                    switch ($alias) {
                        case 'administrator':
                            return redirect()->route('adminsystem.category-article.getList');
                            break;                        
                        default:
                            return redirect()->route('adminsystem.employer.getList');
                            break;
                    }
                }                                
            }else{
                return view('adminsystem.login');
            }      
        }else{            
            return view('adminsystem.login');
        }        
    }   
    public function logout(){
         Sentinel::logout();
         return redirect()->route('adminsystem.login');
    }
}
