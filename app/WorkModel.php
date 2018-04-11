<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class WorkModel extends Model {

	protected $table="work";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
