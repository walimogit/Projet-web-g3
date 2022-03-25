<?php
include 'ControllerUpdate.php';
?>



<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <title>Add Pilots</title>
</head>

<body>
    <div class="container my-5">
        <form method="post">
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" placeholder="Enter name" name="NamePilot" value=<?php echo $NamePilot ?> >
            </div>

            <div class="form-group">
                <label>Lastname</label>
                <input type="text" class="form-control" placeholder="Enter Last name" name="LastNamePilot" value=<?php echo $LastNamePilot ?>>
            </div>

            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" placeholder="Enter a username" name="UsernameP" value=<?php echo $UsernameP ?>>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="text" class="form-control" placeholder="Enter a password" name="PasswordP" value=<?php echo $PasswordP ?>>
            </div>

            <div class="form-group">
                <label>Center</label>
                <select name="Center" class="form-control">
                    <option value="1">Alger</option>
                    <option value="2">Oran</option>
                </select>
            </div>
            <div class="form-group">
                <label>Promo</label>
                <select name="IdCompany" class="form-control">
                    <option value="1">BMS-Electrique</option>
                </select>
            </div>

            </br>
            <button id="1" type="submit" class="btn btn-primary" name="submit">Update</button>
        </form>
    </div>

</body>

</script>

</html>