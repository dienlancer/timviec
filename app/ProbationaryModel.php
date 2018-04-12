<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class ProbationaryModel extends Model {

	protected $table="probationary";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
