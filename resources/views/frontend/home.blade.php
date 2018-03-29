@extends("frontend.master")
@section("content")
<?php 
use Illuminate\Support\Facades\DB;
$setting=getSettingSystem();
$seo=getSeo();
$telephone=$setting['telephone']['field_value'];
$email_to=$setting['email_to']['field_value'];
$facebook_url=$setting['facebook_url']['field_value'];
$twitter_url=$setting['twitter_url']['field_value'];
$google_plus=$setting['google_plus']['field_value'];
$youtube_url=$setting['youtube_url']['field_value'];
$instagram_url=$setting['instagram_url']['field_value'];
$pinterest_url=$setting['pinterest_url']['field_value'];   
$company=$setting['contacted_person']['field_value'];
?>
<h1 style="display: none;"><?php echo $seo["title"]; ?></h1>
<div class="bg-startup">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="co-hoi">Cơ hội việc làm</div>
				<div class="tim-kiem-cv-mo-uoc">
					Tìm kiếm công việc mơ ước của bạn với <b><font color="#E30000">149</font></b> việc làm mới trong <b><font color="#E30000">52057</font></b>  việc làm đang tuyển dụng! 
				</div>	
			</div>			
		</div>
	</div>	
</div>
<div class="container margin-top-15">
	<div class="row">
		<div class="col-lg-2 dk">
			<a  href="javascript:void(0);">
				<div><center><i class="fas fa-sign-in-alt"></i></center></div>
				<div><center>ĐĂNG NHẬP</center> </div>
			</a>
		</div>
		<div class="col-lg-2 dk">
			<a  href="javascript:void(0);">
				<div><center><i class="fas fa-lock"></i></center></div>
				<div><center>ĐĂNG KÝ</center> </div>
			</a>
		</div>		
		<div class="col-lg-4 tao-ho-so">
			<a  href="javascript:void(0);">
				<div class="row">
					<div class="col-xs-6">
						<div class="ths">TẠO HỒ SƠ</div>
						<div class="sloganthsmp">Tạo hồ sơ miễn phí, có ngay việc làm ưng ý</div>
					</div>
					<div class="col-xs-6">
						<div class="mica"><i class="fas fa-address-book"></i></div>
					</div>
				</div>
			</a>
		</div>
		<div class="col-lg-4 dang-tin-mien-phi"></div>
	</div>
</div>
@endsection()               