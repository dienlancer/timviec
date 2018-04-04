<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class EmployerModel extends Model {
	protected $table="employer";
	protected $fillable=["email",'password',"fullname",'address',"phone",'province_id','scale_id','logo','intro','fax','website','contacted_name','contacted_email','contacted_phone',"status","created_at","updated_at"];		
}
