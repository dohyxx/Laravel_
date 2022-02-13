<?php
/*
 * File name: web.php
 * Last modified: 2021.11.02 at 13:04:47
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2021
 */

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('crud', [\App\Http\Controllers\LaravelCrud::class, 'index']);
Route::post('add', [\App\Http\Controllers\LaravelCrud::class, 'add']);

Route::get('edit/{id}', [\App\Http\Controllers\LaravelCrud::class, 'edit']);
Route::post('update', [\App\Http\Controllers\LaravelCrud::class, 'update'])->name('update');

Route::get('delete/{id}', [\App\Http\Controllers\LaravelCrud::class, 'delete']);
