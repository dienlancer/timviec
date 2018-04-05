<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class CandidateModel extends Model {
	protected $table="candidate";
	protected $fillable=["email","password","fullname","phone","birthday","sex_id","marriage_id","province_id","address","avatar","status","created_at","updated_at"];		
}
