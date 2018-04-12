<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class JobModel extends Model {

	protected $table="job";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
