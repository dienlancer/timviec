<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class ScaleModel extends Model {

	protected $table="scale";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
