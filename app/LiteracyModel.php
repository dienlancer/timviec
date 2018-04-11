<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class LiteracyModel extends Model {

	protected $table="literacy";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
