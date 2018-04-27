<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class ClassificationModel extends Model {

	protected $table="classification";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
