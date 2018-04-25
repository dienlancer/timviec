<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class GraduationModel extends Model {

	protected $table="graduation";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
