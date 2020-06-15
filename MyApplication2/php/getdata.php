<?php

define('HOST','localhost');
 define('USER','root');
 define('PASS','');
 define('DB','db_singuji');
 
 //membuat koneksi dengan database
 $con = mysqli_connect(HOST,USER,PASS,DB) or die('Unable to Connect');?>
   

 
    $query = "SELECT * FROM tb_jurusan"; //select table in database
    $sql = mysqli_query($con, $query);
    $arraydata = array();
    while ($data = mysqli_fetch_array($sql)) {
        $arraydata[] = $data;
    }
 
    echo json_encode($arraydata);
 
?>