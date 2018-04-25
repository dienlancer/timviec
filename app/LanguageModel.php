<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class LanguageModel extends Model {

	protected $table="language";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
