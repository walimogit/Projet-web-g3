<?php
include 'model.php';
$IdPilot = $_GET['updateid'];
$sql = "select * from pilot where IdPilot=$IdPilot";
$result = mysqli_query($con, $sql);
$row = mysqli_fetch_assoc($result);
$NamePilot = $row['NamePilot'];
$LastNamePilot = $row['LastNamePilot'];
$UsernameP = $row['UsernameP'];
$PasswordP = $row['PasswordP'];
$Center = $row['Center'];
$IdCompany = $row['IdCompany'];

if (isset($_POST['submit'])) {
    $NamePilot= $_POST['NamePilot'];
    $LastNamePilot = $_POST['LastNamePilot'];
    $UsernameP = $_POST['UsernameP'];
    $PasswordP = $_POST['PasswordP'];
    $Center = $_POST['Center'];
    $IdCompany = $_POST['IdCompany'];

    $sql = "UPDATE pilot set IdPilot=$IdPilot, NamePilot='$NamePilot', LastNamePilot='$LastNamePilot', UsernameP='$UsernameP', PasswordP='$PasswordP', Center=$Center, IdCompany=$IdCompany WHERE IdPilot=$IdPilot";
    $result = mysqli_query($con, $sql); {
        if ($result) {  
            header('location:ViewSelect.php');
        } else {
            die(mysqli_error($con));
        }
    }
}
?>