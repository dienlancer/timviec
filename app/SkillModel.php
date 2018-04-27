<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class SkillModel extends Model {

	protected $table="skill";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
