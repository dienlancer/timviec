<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class WorkingFormModel extends Model {

	protected $table="working_form";
	protected $fillable=["fullname","alias","sort_order","status","created_at","updated_at"];		
}
