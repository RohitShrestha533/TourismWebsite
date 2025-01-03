<?php
include("database.php");
include("hotelowner.php");
error_reporting(E_ALL);
ini_set('display_errors', 1);


$directory = 'temimages/';
$error="";
$msg="";

if(isset($_POST['cancelled'])){
    $id = $_POST['packages_id'];    
    $query = mysqli_query($con,"SELECT * FROM temp_package WHERE packages_id='$id'");
    if ($query) {
        $imageData = mysqli_fetch_assoc($query);
        if ($imageData) {
            $filePath = $imageData['image'];
           $name = $imageData['name'];
           $ema=$imageData['email'];
          
                $deleteQuery3 = mysqli_query($con,"SELECT * FROM package WHERE image='$filePath' AND email='$ema'");
                if(mysqli_num_rows($deleteQuery3)==1) {
                    mysqli_begin_transaction($con);
                    try{
                        $fee=mysqli_fetch_array($deleteQuery3);
                        $name=$fee['name'];
                        $price=$fee['price'];
                        $duration=$fee['duration'];
                        $des=$fee['description'];
                        $ac='Approved';
                        $deleteQuery = mysqli_query($con,"UPDATE temp_package SET action='$ac',name='$name',price='$price',description='$des',duration='$duration' WHERE packages_id='$id'");
                        if($deleteQuery ) {
                        mysqli_commit($con);

                        redirect('package.php');
                        exit();
                        } else {
                            echo "<script>alert('Failed to delete record from database.');</script>";
                        }
                    }catch(Exception $e){
                        
                            mysqli_rollback($con);
                        
                            $error = "Failed to update hotel : " . $e->getMessage();
                        
                            redirect('package.php');
                    }
                }else{
                    $deleteQuery = mysqli_query($con,"DELETE FROM temp_package WHERE packages_id='$id'");
                    if($deleteQuery) {

                    echo "<script>alert('package  $name has been deleted.');</script>";
                        redirect('package.php');
                        exit();
                        } else {
                            echo "<script>alert('Failed to delete record from database.');</script>";
                            redirect('package.php');
                        }
                }


        } else {
            echo "<script>alert('Failed to fetch  data from database.');</script>";
        }
    } else {
    echo "<script>alert('Failed to execute database query.');</script>";
    }
}
if(isset($_POST['delete']))
 {
     $id = $_POST['packages_id'];
     $query = mysqli_query($con,"SELECT * FROM temp_package WHERE packages_id='$id'");
     if ($query) {
          $imageData = mysqli_fetch_assoc($query);
          if ($imageData) {
              $filePath = $imageData['image'];
             $name = $imageData['name'];

                    mysqli_begin_transaction($con);
                    try{
                        $notification_message = 'Package  ' . $name . ' has been deleted: ';
  
                        date_default_timezone_set("Asia/Kathmandu");
                        $create_date = date('Y-m-d');
                        $type="Package";
                                   
                        $pr = $con->prepare("INSERT INTO `notification`(`nFrom`, `ntype`, `message`, `date`) VALUES (?, ?, ?, ?)");
                        $pr->bind_param("ssss",$name,$type,$notification_message,$create_date);
                        $pr->execute();
                        $pr->close();
                     $deleteQuery = mysqli_query($con,"DELETE FROM temp_package WHERE packages_id='$id'");
                      $deleteQuery2 = mysqli_query($con,"DELETE FROM package WHERE image='$filePath' AND name='$name'");
                      if($deleteQuery && $deleteQuery2) {
                         echo "<script>alert('package  $name has been deleted.');</script>";
                         mysqli_commit($con);

                        redirect('package.php');
                        exit();
                     } else {
                         echo "<script>alert('Failed to delete record from database.');</script>";
                    }
                }catch(Exception $e){
                    
                        mysqli_rollback($con);
                    
                        $error = "Failed to update hotel : " . $e->getMessage();
                     
                        redirect('package.php');
                }
          } else {
              echo "<script>alert('Failed to fetch  data from database.');</script>";
          }
     } else {
         echo "<script>alert('Failed to execute database query.');</script>";
     }
 }

if(isset($_POST['cancel'])){
    redirect('package.php');
    exit();
}
if(isset($_POST['update']))
{
    $_SESSION['pid']=$_POST['packages_id'];
}
$packages_id=$_SESSION['pid'];
$query=mysqli_query($con,"SELECT * FROM temp_package WHERE packages_id='$packages_id' ");
$fetch=mysqli_fetch_array($query);
$updated_fields = array();

$current_name = $fetch['name'];
$current_price = $fetch['price'];
$current_duration = $fetch['duration'];
$current_description = $fetch['description'];

if(isset($_POST['submit'])) {
    $submitted_name = $_POST['name'];
    $submitted_price = (int)$_POST['price'];
    $submitted_duration = (int)$_POST['duration'];
    $submitted_description = $_POST['description'];
    date_default_timezone_set("Asia/Kathmandu");
    $updated_at = date('Y-m-d');


    if($submitted_name != $current_name) {
        $updated_fields[] = 'name';
    }
    if($submitted_price != $current_price) {
        $updated_fields[] = 'price';
    }
    if($submitted_duration != $current_duration) {
        $updated_fields[] = 'duration';
    }
    if($submitted_description != $current_description) {
        $updated_fields[] = 'description';
    }

    if(!empty($updated_fields)) {
        $type="Package";
        $action="pending";

        $notification_message = 'Request For Updating Package From ' . $current_name . ' for the following fields: ' . implode(', ', $updated_fields);

        mysqli_begin_transaction($con);
        try{           
            $pre = $con->prepare("INSERT INTO `notification`(`nFrom`, `ntype`, `message`, `date`) VALUES (?, ?, ?, ?)");
            $pre->bind_param("ssss",$current_name,$type,$notification_message,$updated_at);
            $pre->execute();
            $pre->close();
            $stmt = $con->prepare("UPDATE `temp_package` SET `name`=?, `description`=?, `price`=?, `duration`=?, `action`=?, `updated_at`=? WHERE packages_id=?");
            $stmt->bind_param("ssssssi", $submitted_name, $submitted_description, $submitted_price, $submitted_duration,$action, $updated_at, $packages_id);
            $stmt->execute();
            $stmt->close();
            
            mysqli_commit($con);
            redirect('package.php');
        }catch(Exception $e){
            mysqli_rollback($con);
            $error = "Failed to update package Details: " . $e->getMessage();
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

#packageinput {
    display: none;
    width: 90%;
    padding: 20px;
    background-color: #f0f0f0;
    border-radius: 10px;
    z-index: 1000;
}
#packagedinput{
    display: flex;
    width: 90%;
    padding: 20px;
    background-color: #f0f0f0;
    border-radius: 10px;
}

.packageinputform {
    display: flex;
    flex-wrap: wrap;
    flex-direction: column;
    margin-right: 45px;
    width: 100%;
    float: left;
    gap: 10px;
    justify-content: space-between;
}
.packageinputform h1{
    color: blue;
}
.packageinputform .topicpack{
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
.infopackage{
    display: flex;
    width: 100%;
    margin:30px 10px;
    font-size: 0.85em;
    font-weight: 300;
    font-size: larger;
}
.infopackaged{
    display: flex;
    width: 100%;
    margin:10px 10px;
    font-size: 0.75em;
    font-weight: 300;
    font-size: larger;
}
.infopackaged .field{
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
.infopackaged h5,
.infopackage h5{
    width: 20%;
}
.infopackage .fieldfile{
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
.infopackage .field{
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
.infopackage_btn {
    display: flex;
    justify-content: flex-start;
    gap: 15px;
}
.infopackage_btn button{
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
.infopackage_btn button:hover{
    filter: brightness(110%);
}
.infopackage_btn button:active{
    transform: translate(0,0.2rem);
}
#prevNext {
    margin-top: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
}
#prevNext button {
    margin: 10px;
    outline:none;
    height:40px;
    width:60px;
    border: 1px solid green;
    padding: 5px;
    border-radius:5px;
    cursor: pointer;
}
#prevNext button:hover{
    background-color:black;
    border:none;
    color:white;
}

    </style>
</head>
<?php if($error){?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php } 
	else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>
  
<div id="packagedinput">          
            <div class="packageinputform">
                <form action="" method="post" enctype="multipart/form-data">                    
                <hr>                  
                    <div class="infopackage">
                    <h5>Package Name:</h5>
                    <input type="text" class="field" name="name" id="name" placeholder="Package Name" value="<?php echo $current_name; ?>" required>
                    </div>
                    <div class="infopackage">
                    <h5>Package Price :</h5>
                    <input type="text" class="field" name="price" id="price" placeholder="Package Price In Rs" value="<?php echo $current_price; ?>" required>
                    </div>
                    <div class="infopackage">
                    <h5>Package Duration :</h5>
                    <input type="text" class="field" name="duration" id="duration" placeholder="Package Duration" value="<?php echo $current_duration; ?>" required>
                    </div>
                    <div class="infopackaged" style="width:100%;">
                    <h5>Package Description:</h5>
                    <textarea name="description" class="field" id="description" rows="5" placeholder="Packages Details" required><?php echo $current_description; ?></textarea>
                    </div>
                    <hr>
                    <div class="infopackage_btn">
                    <input type="hidden" name="packages_id" value="<?php echo $packages_id; ?>" required>
                        <button type="submit" value="cancel" class="btn btn-danger btn-sm-shadow" name="cancel">cancel</button>
                        <button class="btn btn-success btn-sm-shadow" type="submit" value="update" name="submit">Update</button>
                    </div>
                </form> 
            </div>                   
        </div>
