<?php
/*
 * File name: Notification.php
 * Last modified: 2021.08.10 at 18:03:34
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * Class Notification
 * @package App\Models
 * @version September 4, 2019, 10:30 am UTC
 *
 * @property User user
 * @property string type
 * @property string read
 */
class Notification extends Model
{

    public $table = 'notifications';
    protected $primaryKey = 'id'; // or null
    public $incrementing = false;



    public $fillable = [
        'type',
        'read_at'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'type' => 'string',
        'read_at' => 'datetime',
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'type' => 'required',
    ];

    /**
     * @return BelongsTo
     **/
    public function user()
    {
        return $this->belongsTo(User::class, 'notifiable_id', 'id');
    }

}
