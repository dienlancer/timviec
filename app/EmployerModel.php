<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class EmployerModel extends Model {
	protected $table="employer";
	protected $fillable=["email",'password',"fullname",'alias','meta_keyword','meta_description','address',"phone",'province_id','scale_id','logo','intro','fax','website','contacted_name','contacted_email','contacted_phone','user_id',"status",'status_authentication',"created_at","updated_at"];		
}
