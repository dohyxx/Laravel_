<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Laravel 8 CRUD</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" type="text/css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3" style="margin-top: 50px">
            <h4>ADD NEW RECORD | Laravel CRUD</h4>
            <hr>

            @if(Session::get('success')) <!--데이터 저장 확인-->
                <div class="alert alert-success">
                    {{ Session::get('success') }}
                </div>
            @endif

            @if(Session::get('fail'))
                <div class="alert alert-danger">
                    {{ Session::get('fail') }}
                </div>
            @endif

            <form action="add" method="post">
                @csrf
                <div class="form-group">
                    <label for="">Name</label>
                    <input type="text" class="form-control" name="name" placeholder="Enter name" value="{{ old('name') }}">
                    <span style="color:red">@error('name'){{ $message }} @enderror</span> <!--입력 안하면 발생-->
                </div>
                <br>

                <div class="form-group">
                    <label for="">Favorite Color</label>
                    <input type="text" class="form-control" name="favoriteColor" placeholder="Enter Favorite Color"
                           value="{{ old('favoriteColor') }}">
                    <span style="color:red">@error('favoriteColor'){{ $message }} @enderror</span>
                </div>
                <br>

                <div class="form-group">
                    <label for="">email</label>
                    <input type="text" class="form-control" name="email" placeholder="Enter email"
                           value="{{ old('email') }}">
                    <span style="color:red">@error('email'){{ $message }} @enderror</span>
                </div>
                <br>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">SAVE</button>
                </div>
            </form>
            <br>

            <table class="table table-hover">
                <thead>
                    <th>Name</th>
                    <th>Favorite color</th>
                    <th>Email</th>
                    <th>Actions</th>
                </thead>
                <tbody>
                @foreach($list as $item)
                    <tr>
                        <td>{{$item->name}}</td>
                        <td>{{$item->favoriteColor}}</td>
                        <td>{{$item->email}}></td>
                        <td>
                            <div class="btn-group">
                                <a href="delete/{{$item->id}}" class="btn btn-danger btn-xs">Delete</a>
                                <a href="edit/{{$item->id}}" class="btn btn-primary btn-xs">Edit</a>
                            </div>
                        </td>
                    </tr>
                </tbody>
                @endforeach

            </table>

        </div>
    </div>
</div>

</body>
</html>