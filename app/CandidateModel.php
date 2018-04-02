<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class CandidateModel extends Model {
	protected $table="candidate";
	protected $fillable=["email","password","fullname","phone","status","created_at","updated_at"];		
}
