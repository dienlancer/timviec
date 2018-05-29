@extends("frontend.master")
@section("content")
<?php 
switch (@$component) {
    case 'viec-lam-moi':
    case 'viec-lam-hap-dan':
    case 'viec-lam-luong-cao':
    case 'viec-lam-duoc-quan-tam':
        ?>
        @include("frontend.source-recruitment")
        <?php
        break;    
}
?>
@endsection()               