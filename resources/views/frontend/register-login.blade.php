@extends("frontend.master")
@section("content")
<?php 
use Illuminate\Support\Facades\DB;
$employer_link='';
$employer_link='';
$candidate_text='';
$candidate_link='';
$login_register_link='';
$login_register_text='';
switch ($status) {
	case 'register':
		$employer_text='ĐĂNG KÝ NHÀ TUYỂN DỤNG';
		$employer_link=route('frontend.index.employerRegister');
		$candidate_text='ĐĂNG KÝ ỨNG VIÊN';
		$candidate_link=route('frontend.index.candidateRegister');
		$login_register_link=route('frontend.index.registerLogin',['login']);
		$login_register_text='ĐĂNG NHẬP';
		break;
	case 'login':
		$employer_text='ĐĂNG NHẬP NHÀ TUYỂN DỤNG';
		$employer_link=route('frontend.index.employerLogin');
		$candidate_text='ĐĂNG NHẬP ỨNG VIÊN';
		$candidate_link=route('frontend.index.candidateLogin');
		$login_register_link=route('frontend.index.registerLogin',['register']);
		$login_register_text='ĐĂNG KÝ';
		break;	
}
?>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="lilikati">
				<div class="row">
					<div class="col-lg-4">
						<div class="box-dk-dn padding-bottom-10">
							<div>
								<ul class="thong-tin-dn-dk">
									<li><i class="far fa-check-circle"></i><span>1,000,000 ứng viên tiếp cận thông tin tuyển dụng</span></li>
									<li><i class="far fa-check-circle"></i><span>Không giới hạn tương tác với ứng viên qua hệ thống nhắn tin nội bộ MIỄN PHÍ</span></li>
									<li><i class="far fa-check-circle"></i><span>Quảng cáo thông minh giúp tin tuyển dụng được phủ rộng trên toàn bộ hệ thống</span></li>
									<li><i class="far fa-check-circle"></i><span>Quảng cáo công ty trên Fanpage số 1 về việc làm – tuyển dụng</span> </li>                
								</ul>
							</div>
							<div class="box-btn-dn-dk terran"><center><a href="<?php echo $employer_link; ?>"><?php echo $employer_text; ?></a></center></div>	
						</div>
					</div>
					<div class="col-lg-4">
						<div class="box-dk-dn padding-bottom-10">
							<div>
								<ul class="thong-tin-dn-dk">
									<li><i class="far fa-check-circle"></i><span>+ 1,500,000 công việc được cập nhật thường xuyên</span></li>
									<li><i class="far fa-check-circle"></i><span>Ứng tuyển công việc yêu thích HOÀN TOÀN MIỄN PHÍ</span></li>
									<li><i class="far fa-check-circle"></i><span>Hiển thị thông tin hồ sơ với nhà tuyển dụng hàng đầu</span></li>
									<li><i class="far fa-check-circle"></i><span>Nhận bản tin công việc phù hợp định kỳ</span></li>                
								</ul>
							</div>
							<div class="box-btn-dn-dk riba"><center><a href="<?php echo $candidate_link; ?>"><?php echo $candidate_text; ?></a></center></div>	
						</div>
					</div>
					<div class="col-lg-4">
						<div class="dk-dn-r">
							<a  href="<?php echo $login_register_link; ?>">
								<div class="caramba">
									<div class="dk-dn-login"><?php echo $login_register_text; ?></div>
									<div class="dk-dn-icon"><i class="fas fa-sign-in-alt"></i></div>									
								</div>																							
							</a>
						</div>	
						<div class="dk-dn-r margin-top-10">
							<a  href="javascript:void(0);">
								<div class="caramba">
									<div class="dk-dn-login">ĐĂNG TIN MIỄN PHÍ</div>
									<div class="dk-dn-icon"><i class="far fa-address-card"></i></div>									
								</div>																							
							</a>
						</div>	
						<div class="tao-ho-so-r margin-top-10">
							<a  href="javascript:void(0);">
								<div class="caramba">
									<div class="dk-dn-login">TẠO HỒ SƠ</div>
									<div class="dk-dn-icon"><i class="far fa-folder-open"></i></div>									
								</div>																							
							</a>
						</div>					
					</div>
				</div>		
			</div>
		</div>
	</div>	
</div>
@endsection()               