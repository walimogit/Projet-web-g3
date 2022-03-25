<?php
include'model.php';
if(isset($_POST['submit'])){
    $NamePilot=$_POST['NameStudent'];
    $LastNamePilot=$_POST['LastNamePilot'];
    $UsernameP=$_POST['UsernameP'];
    $PasswordP=$_POST['PasswordP'];
    $Center=$_POST['Center'];
    $IdCompany=$_POST['IdCompany'];

    $sql="insert into pilot (NamePilot,LastNamePilot,UsernameP,PasswordP,Center,IdCompany)
    values('$NamePilot','$LastNamePilot','$UsernameP','$PasswordP','$Center',$IdCompany)";
    $result=mysqli_query($con,$sql);{
        if ($result) {

            header('location:ViewSelect.php');
        } else {
            die(mysqli_error($con));
        }
    }
}
?>