<?php
/*
 * File name: Currency.php
 * Last modified: 2021.08.10 at 18:03:34
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

namespace App\Models;

use App\Traits\HasTranslations;
use Eloquent as Model;

/**
 * Class Currency
 * @package App\Models
 * @version October 22, 2019, 2:46 pm UTC
 *
 * @property int id
 * @property string name
 * @property string symbol
 * @property string code
 * @property integer decimal_digits
 * @property integer rounding
 */
class Currency extends Model
{
    use HasTranslations;

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required',
        'symbol' => 'required',
        'code' => 'required',
    ];
    public $translatable = [
        'name',
        'symbol',
        'code',
    ];
    public $table = 'currencies';
    public $fillable = [
        'name',
        'symbol',
        'code',
        'decimal_digits',
        'rounding'
    ];
    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'string',
        'symbol' => 'string',
        'code' => 'string'
    ];
    /**
     * New Attributes
     *
     * @var array
     */
    protected $appends = [
        'name_symbol',

    ];

    public function getNameSymbolAttribute()
    {
        return $this->name . ' - ' . $this->symbol;
    }


}
