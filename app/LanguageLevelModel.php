<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class LanguageLevelModel extends Model {

	protected $table="language_level";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
