<?php
include('model.php');
if(isset($_GET['deleteid'])){
    $IdPilot=$_GET['deleteid'];
    $sql="delete from pilot where IdPilot=$IdPilot";
    $result=mysqli_query($con,$sql);
    if($result){
        //echo"Deleted successfully";
        header('location:ViewSelect.php');
    }
    else{
        die(mysqli_error($con));
    }
}

?>