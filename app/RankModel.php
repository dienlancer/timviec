<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class RankModel extends Model {

	protected $table="rank";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
