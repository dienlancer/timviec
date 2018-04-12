<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class SalaryModel extends Model {

	protected $table="salary";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}