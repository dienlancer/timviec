<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class ExperienceModel extends Model {

	protected $table="experience";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
