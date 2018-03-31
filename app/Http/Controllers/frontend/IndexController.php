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

    \Artisan::call('sitemap:auto');   
    return view("frontend.home");        
  } 
  public function registerLogin(Request $request,$status){             
    return view("frontend.register-login",compact('status'));         
  }
  public function registerEmployer(Request $request){             
    return view("frontend.employer-register");         
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
}







