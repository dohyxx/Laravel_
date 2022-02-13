<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LaravelCrud extends Controller
{

    // View, getList
    function index(){

        $data = array(
            'list'=> DB::table('crud_tests')->get()
        );

        return view('crud.index', $data);
    }


    //User Form -> DB insert
    function add(Request $request){

        //필수 입력값
        $request->validate([
           'name'=>'required',
            'favoriteColor'=>'required',
            'email'=>'required|email|unique:crud_tests'
        ]);

        // form data save
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

    //Update Form
    function edit($id){

        $row = DB::table('crud_tests')
            ->where('id', $id)
            ->first();

        // View 전달
        $data = [
            'Info'=>$row,
            'Title'=>'Edit'
        ];

        return view('crud.edit', $data);
    }

    // Redirect after update
    function update(Request $request){

        //유효성 검사
        $request->validate([
           'name'=>'required',
           'favoriteColor'=>'required',
            'email'=>'required|email'
        ]);

        $updating = DB::table('crud_tests')
            ->where('id', $request->input('cid'))
            ->update([
                'name'=>$request->input('name'),
                'favoriteColor'=>$request->input('favoriteColor'),
                'email'=>$request->input('email')
            ]);

        return redirect('crud');
    }


    //delete
    function delete($id){

        $delete = DB::table('crud_tests')
            ->where('id', $id)
            ->delete();

        return redirect('crud');
    }
}
