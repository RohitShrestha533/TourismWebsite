<?php
include("database.php");
include("hotelowner.php");
error_reporting(E_ALL);
ini_set('display_errors', 1);

$directory = 'temimages/';
$error="";
$msg="";
?>
<?php
if(isset($_POST['delete'])){
    $id = $_POST['delete_id'];    
    $query = mysqli_query($con,"SELECT * FROM temp_hotel WHERE temp_id='$id'");
    if ($query) {
        $imageData = mysqli_fetch_assoc($query);
        if ($imageData) {
            $filePath = $imageData['image'];
           $name = $imageData['name'];
           $emailh = $imageData['email'];
           $pa=explode(",",$filePath);
          
           $deleteQuer = mysqli_query($con,"SELECT * FROM hotels WHERE name='$name' AND email='$emailh'");
           if(mysqli_num_rows($deleteQuer)>0) {
                    mysqli_begin_transaction($con);
                    try{
                        
                        $filePath = $imageData['image'];
                        $name = $imageData['name'];
                        $emailh = $imageData['email'];
                        $pa=explode(",",$filePath);
                        foreach($pa as $fPath){
                            unlink($fPath);
                        }
                        
                        date_default_timezone_set("Asia/Kathmandu");
                        $updated_at = date('Y-m-d');
                        $fe=mysqli_fetch_array($deleteQuer);
                        $hotelid=$fe['hotel_id'];
                        $deleteQuery = mysqli_query($con,"DELETE FROM temp_hotel WHERE email='$emailh'");
                        $deleteQuery2 = mysqli_query($con,"DELETE FROM hotels WHERE email='$emailh' ");
                        $deleteQuery3 = mysqli_query($con,"DELETE FROM package WHERE email='$emailh' ");
                        $deleteQuery4 = mysqli_query($con,"DELETE FROM temp_package WHERE email='$emailh' ");
                        $notification_message = ' hotel ' . $name . ' Has been deleted by hotel Owner: ';
                        $insertQuery2=mysqli_query($con,"INSERT INTO `notification`(`nFrom`, `ntype`, `message`, `date`)
                        VALUES ('$name','Hotel','$notification_message','$updated_at')");

                        if($deleteQuery3 && $deleteQuery2 && $insertQuery2 && $deleteQuery && $deleteQuery4) {
                        echo "<script>alert('hotel  $name has been deleted.');</script>";
                        mysqli_commit($con);

                        redirect('hotel.php');
                        exit();
                        } else {
                            echo "<script>alert('Failed to delete record from database.');</script>";
                        }     
                        mysqli_commit($con);
                            redirect('hotel.php');
                      
                    }catch(Exception $e){
                        
                            mysqli_rollback($con);
                        
                            $error = "Failed to update hotel : " . $e->getMessage();
                        
                            redirect('hotel.php');
                    }
                }else{
                    mysqli_begin_transaction($con);
                    try{
                    date_default_timezone_set("Asia/Kathmandu");
                    include("database.php");
                    
                    $filePath = $imageData['image'];
                    $name = $imageData['name'];
                    $emailh = $imageData['email'];
                    $pa=explode(",",$filePath);
                    $updated_at = date('Y-m-d');
                    $deleteQuery = mysqli_query($con,"DELETE FROM temp_hotel WHERE email='$emailh'");
                    
                    $notification_message = ' hotel ' . $name . ' Has been deleted by hotel Owner: ';
                    $insertQuery2=mysqli_query($con,"INSERT INTO `notification`(`nFrom`, `ntype`, `message`, `date`)
                    VALUES ('$name','Hotel','$notification_message','$updated_at')");
                    if($deleteQuery && $insertQuery2) {
                        
                        foreach($pa as $fPath){
                            unlink($fPath);
                        }
                        echo "<script>alert('hotel  $name has been deleted.');</script>";    
                           
                        redirect('hotel.php');
                        exit();
                        } else { 
                            throw new Exception("Failed to delete record from database.");                         
                        }
                        mysqli_commit($con);
                        redirect('hotel.php');
                }catch(Exception $e){
                    
                    mysqli_rollback($con);
                        
                    $error = "Failed to update hotel : " . $e->getMessage();
                
                    redirect('hotel.php');
                }}

        } else {
            echo "<script>alert('Failed to fetch  data from database.');</script>";
            redirect('hotel.php');
        }
    } else {
    echo "<script>alert('Failed to execute database query.');</script>";
    redirect('hotel.php');
    }
}



if(isset($_POST['cancel'])){
    $temphotelid=$_POST['delete_id'];
    mysqli_begin_transaction($con);
    try{
    $q=mysqli_query($con,"SELECT * FROM temp_hotel WHERE temp_id='$temphotelid'");
    if(!$q){
        alerting('please try later..');
        redirect('hotel.php');
    }else{
        $fe=mysqli_fetch_array($q);
        $em=$fe['email'];
        $q1=mysqli_query($con,"SELECT * FROM `temp_hotel` JOIN hotels ON hotels.email=temp_hotel.email WHERE temp_hotel.email='$em';");
        if($q1){
            if(mysqli_num_rows($q1)==1){
                $q2=mysqli_query($con,"SELECT * FROM  hotels  WHERE email='$em';");
                if($q2){
                    $fetch=mysqli_fetch_array($q2);
                    $na=$fetch['name'];
                    $pr=$fetch['price'];
                    $ma=$fetch['map'];
                    $ro=$fetch['room'];
                    $de=$fetch['description'];
                    $lo=$fetch['location'];
                    $ac='Approved';
                    
                   $q3=mysqli_query($con,"UPDATE temp_hotel SET name='$na',price='$pr' ,room='$ro' ,description='$de' ,h_action='$ac' ,hotel_location='$lo',hotel_map='$ma'  WHERE email='$em';");

                   redirect('hotel.php');
                }else{
                    alerting('please try later..');
                   redirect('hotel.php');
                }                
            }else{          
             $quer=mysqli_query($con,"SELECT * FROM temp_hotel WHERE temp_id='$temphotelid' ");
             if(!$quer){
                alerting('please try later..');
               redirect('hotel.php');
             }
             $ro=mysqli_fetch_array($quer);
             $allpath=$ro['image'];
             $path=explode(",",$allpath);
             foreach($path as $img){
                unlink($img);
             }
             $que=mysqli_query($con,"DELETE FROM temp_hotel WHERE temp_id='$temphotelid' ");
             if(!$que){
                
            alerting('please try later..');
            redirect('hotel.php');
             }
            }
        }else{       
            alerting('please try later..');
            redirect('hotel.php');
        }
        mysqli_commit($con);
        redirect('hotel.php');
    }}catch(Exception $e){
        mysqli_rollback($con);
        $error = "Failed to update hotel Details: " . $e->getMessage();
    }
}
if(isset($_POST['cancelled'])){
    redirect('hotel.php');
}
if(isset($_POST['update']))
{
    $_SESSION['temphid']=$_POST['delete_id'];
}
$temp_id=$_SESSION['temphid'];
$query=mysqli_query($con,"SELECT * FROM temp_hotel WHERE temp_id='$temp_id' ");
$fetch=mysqli_fetch_array($query);
$updated_fields = array();

$current_name = $fetch['name'];
$current_price = $fetch['price'];
$current_room = $fetch['room'];
$current_image = $fetch['image'];
$current_description = $fetch['description'];
$current_map = $fetch['hotel_map'];
$current_location = $fetch['hotel_location'];

if(isset($_POST['submit'])) {
    $submitted_name = $_POST['name'];
    $submitted_price = (int)$_POST['price'];
    $submitted_room = (int)$_POST['room'];
    $submitted_description = $_POST['description'];
    $submitted_location = $_POST['location'];
    $submitted_map = $_POST['map'];
    date_default_timezone_set("Asia/Kathmandu");
    $updated_at = date('Y-m-d');



    // Identify updated fields
    if($submitted_name != $current_name) {
        $updated_fields[] = 'name';
    }
    if($submitted_price != $current_price) {
        $updated_fields[] = 'price';
    }
    if($submitted_room != $current_room) {
        $updated_fields[] = 'room';
    }
    if($submitted_map != $current_map) {
        $updated_fields[] = 'map';
    }
    if($submitted_location != $current_location) {
        $updated_fields[] = 'location';
    }
    if($submitted_description != $current_description) {
        $updated_fields[] = 'description';
    }

    if(!empty($updated_fields)) {
        $type="hotel";
        $action="pending";

        $notification_message = 'Request For Updating hotel From ' . $current_name . ' for the following fields: ' . implode(', ', $updated_fields);

        mysqli_begin_transaction($con);
        try{           
            $pre = $con->prepare("INSERT INTO `notification`(`nFrom`, `ntype`, `message`, `date`) VALUES (?, ?, ?, ?)");
            $pre->bind_param("ssss",$current_name,$type,$notification_message,$updated_at);
            if (!$pre->execute()) {
                $error = "Error executing query: " . $pre->error;
                echo $error;
                $pre->close();
            }
            $stmt = $con->prepare("UPDATE `temp_hotel` SET `name`=?, `description`=?, `price`=?,`hotel_location`=?,`hotel_map`=?, `room`=?,`h_action`=? ,`updated_at`=? WHERE temp_id=?");
            $stmt->bind_param("ssssssssi", $submitted_name, $submitted_description, $submitted_price,$submitted_location,$submitted_map, $submitted_room,$action, $updated_at, $temp_id);
            if (!$stmt->execute()) {
                $error = "Error executing query: " . $stmt->error;
                echo $error;
            }
            $stmt->close();

        //     $up = $con->prepare("UPDATE `package` SET `location`=?,`map`=?, `updated_at`=? WHERE map=? AND name=?");
        //     $up->bind_param("sssss",$submitted_location,$submitted_map,  $updated_at, $current_map,$current_name);
        //     if (!$up->execute()) {
        //         $error = "Error executing query: " . $up->error;
        //         echo $error;
        //     }
        //     $up->close();
        //     mysqli_commit($con);         
        //    $up = $con->prepare("UPDATE `temp_package` SET `location`=?,`map`=?,`updated_at`=? WHERE map=? AND name=?");
        //     $up->bind_param("sssss",$submitted_location,$submitted_map, $updated_at, $current_map,$current_name);
        //     if (!$up->execute()) {
        //         $error = "Error executing query: " . $up->error;
        //         echo $error;
        //     }
         //   $up->close();
            mysqli_commit($con);
            redirect('hotel.php');
        }catch(Exception $e){
            mysqli_rollback($con);
            $error = "Failed to update hotel Details: " . $e->getMessage();
        }      
}
}
?>
<head>
    <style>
        
section .pack {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
    margin: 0;
}
.errorWrap {
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #dd3d36;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #5cb85c;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
#addbtn{
    width:100%;
    margin:5px 0;
}
#addbtn button{
    float:right;
    display: flex;
    align-items: flex-end;
}

#hotelinput {
    display: none;
    width: 90%;
    padding: 20px;
    background-color: #f0f0f0;
    border-radius: 10px;
    z-index: 1000;
}
#hoteldinput{
    display: flex;
    width: 90%;
    padding: 20px;
    background-color: #f0f0f0;
    border-radius: 10px;
}

.hotelinputform {
    display: flex;
    flex-wrap: wrap;
    flex-direction: column;
    margin-right: 45px;
    width: 100%;
    float: left;
    gap: 10px;
    justify-content: space-between;
}
.hotelinputform h1{
    color: blue;
}
.hotelinputform .topicpack{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}
.topicpack img{
    width: 200px;
    height:200px;
    object-fit: cover
}
.statusbtn{
    display: flex;
    flex-direction: column;
    align-items: center;
}
.statusbtn ul{
    display: flex;
    margin-top: 6px;
    flex-direction: row;
    gap: 3px;
}
.statusbtn li{
    list-style: none;
    font-size: larger;
    font-weight: 300;
}
.infohotel{
    display: flex;
    width: 100%;
    margin:30px 10px;
    font-size: 0.85em;
    font-weight: 300;
    font-size: larger;
}
.infohoteld{
    display: flex;
    width: 100%;
    margin:10px 10px;
    font-size: 0.75em;
    font-weight: 300;
    font-size: larger;
}
.infohoteld .field{
    border: 3px solid #edecec;
    padding: 5px 8px;
    color: #616161;
    width: 75%;
    font-size: 0.85em;
    font-weight: 300;
    height: 100px;
    outline: none;
    box-shadow: none !important;
}
.infohoteld h5,
.infohotel h5{
    width: 20%;
}
.infohotel .fieldfile{
    border: 3px solid #edecec;
    padding: 5px 8px;
    color: #616161;
    width: 80%;
    font-size: 0.85em;
    font-weight: 300;
    height: 40px;
    outline: none;
    box-shadow: none !important;
}
.infohotel .field{
    border: 3px solid #edecec;
    padding: 5px 8px;
    color: #616161;
    width: 75%;
    font-size: 0.85em;
    font-weight: 300;
    height: 40px;
    outline: none;
    box-shadow: none !important;
}
form hr {
    width: 100%;
    margin-top: 10px;
    margin-bottom: 10px;
    height:10px;
}
.infohotel_btn {
    display: flex;
    justify-content: flex-start;
    gap: 15px;
}
.infohotel_btn button{
    cursor: pointer;
    font-size: 1.2rem;
    height: 2.5rem;
    border: none;
    border-radius: 10px;
    color: white;
    outline: none;
    padding: 0 0.3rem;
    box-shadow: 0 0.3rem rgba(121,121,121,0.65);
}
.infohotel_btn button:hover{
    filter: brightness(110%);
}
.infohotel_btn button:active{
    transform: translate(0,0.2rem);
}

    </style>
</head>
<?php if($error){?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php } 
	else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>
  
<div id="hoteldinput">          
            <div class="hotelinputform">
                <form action="" method="post" enctype="multipart/form-data">                    
                <hr>                   
                    <div class="infohotel">
                    <h5>Hotel Name:</h5>
                    <input type="text" class="field" name="name" id="name" placeholder="hotel Name" value="<?php echo $current_name; ?>" required>
                    </div>
                    <div class="infohotel">
                    <h5>Hotel Price :</h5>
                    <input type="text" class="field" name="price" id="price" placeholder="hotel Price In Rs" value="<?php echo $current_price; ?>" required>
                    </div>
                    <div class="infohotel">
                    <h5>Number Of Room :</h5>
                    <input type="text" class="field" name="room" id="room" placeholder="hotel room" value="<?php echo $current_room; ?>" required>
                    </div>
                    <div class="infohotel">
                    <h5>Hotel map:</h5>
                    <input type="text" class="field" name="map" id="map" placeholder="hotel Map Link" value="<?php echo $current_map; ?>"required>
                    </div>
                    <div class="infohotel">
                    <h5>Hotel Location:</h5>
                    <input type="text" class="field" name="location" id="location" placeholder="hotel Location"value="<?php echo $current_location; ?>" required>
                    </div>
                    <div class="infohoteld" style="width:100%;">
                    <h5>Hotel Description:</h5>
                    <textarea name="description" class="field" id="description" rows="5" placeholder="hotels Details" required><?php echo $current_description; ?></textarea>
                    </div>
                    <hr>
                    <div class="infohotel_btn">
                    <input type="hidden" name="temp_id" value="<?php echo $temp_id; ?>" required>
                        <button type="submit" value="cancel" class="btn btn-danger btn-sm-shadow" name="cancelled">cancel</button>
                        <button class="btn btn-success btn-sm-shadow" type="submit" value="update" name="submit">Update</button>
                    </div>
                </form> 
            </div>                   
        </div>
