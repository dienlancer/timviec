<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class SexModel extends Model {

	protected $table="sex";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
