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

            @if(Session::get('success'))
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
                <div class="form-grop">
                    <label for="">Name</label>
                    <input type="text" class="form-control" name="name" placeholder="Enter name" value="{{ old('name') }}">
                    <span style="color:red">@error('name'){{ $message }} @enderror</span>
                </div>

                <div class="form-grop">
                    <label for="">Favorite Color</label>
                    <input type="text" class="form-control" name="favoriteColor" placeholder="Enter Favorite Color"
                           value="{{ old('favoriteColor') }}">
                    <span style="color:red">@error('favoriteColor'){{ $message }} @enderror</span>
                </div>

                <div class="form-grop">
                    <label for="">email</label>
                    <input type="text" class="form-control" name="email" placeholder="Enter email"
                           value="{{ old('email') }}">
                    <span style="color:red">@error('email'){{ $message }} @enderror</span>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">SAVE</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>