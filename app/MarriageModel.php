<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class MarriageModel extends Model {

	protected $table="marriage";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
