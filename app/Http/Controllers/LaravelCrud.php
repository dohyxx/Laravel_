<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LaravelCrud extends Controller
{
    //
    function index(){
        return view('crud.index');
    }

    function add(Request $request){

        $request->validate([
           'name'=>'required',
            'favoriteColor'=>'required',
            'email'=>'required|email|unique:crud_tests'
        ]);

        $query = DB::table('crud_tests')->insert([
            'name'=>$request->input('name'),
            'favoriteColor'=>$request->input('favoriteColor'),
            'email'=>$request->input('email')
        ]);

        if ($query){

            return back()->with('success', 'Data have been successfuly inserted');
        }else{
            return back()->with('fail', 'Something went wrong');
        }
    }
}
