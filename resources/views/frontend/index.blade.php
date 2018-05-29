@extends("frontend.master")
@section("content")
<?php 
switch (@$component) {
    case 'viec-lam-moi':
        ?>
        @include("frontend.source-recruitment")
        <?php
        break;    
}
?>
@endsection()               