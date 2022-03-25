<?php
include 'ControllerSelect.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Pilots</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
  <div class="container my-5"> 
      <button class="btn btn-primary" ><a href="ViewCreate.php" class="text-light">Add Pilot</a></button>
      </br>
          <table class="table ">

  <thead class="table-dark"> 
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Username</th>
      <th scope="col">Password</th>
      <th scope="col">Center</th>
      <th scope="col">Company</th>
      <th scope="col">operations</th>
    </tr>
  </thead>
  <tbody>

  <?php
    $sql="select * from Pilot";
    $result=mysqli_query($con,$sql);
if($result){
    while($row=mysqli_fetch_assoc($result)){
        $IdPilot=$row['IdPilot'];
        $NamePilot=$row['NamePilot'];
        $LastNamePilot=$row['LastNamePilot'];
        $UsernameP=$row['UsernameP'];
        $PasswordP=$row['PasswordP'];
        $Center=$row['Center'];
        $IdCompany=$row['IdCompany'];
        echo'    
        <tr>
        <th scope="row">'.$IdPilot.'</th>
        <td>'.$NamePilot.'</td>
        <td>'.$LastNamePilot.'</td>
        <td>'.$UsernameP.'</td>
        <td>'.$PasswordP.'</td>
        <td>'.$Center.'</td>
        <td>'.$IdCompany.'</td>
        <td>
        <button class="btn btn-primary"><a href="ViewUpdate.php?updateid='.$IdPilot.'" class="text-light">Update</a></button> 
        <button class="btn btn-danger"> <a href="ControllerDelete.php?deleteid='.$IdPilot.'" class="text-light">Delete</a></button>
        </td>
      </tr>';
    }      
}
      ?>

     
  </tbody>
</table>
  </div>  
</body>
</html>