<?php
include("database.php");
include("admin.php");

$error="";
$msg="";
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
$itemsPerPage = 3;
$offset = ($page - 1) * $itemsPerPage;

if(isset($_POST['cancel']))
{
 $id = $_POST['temp_id'];
 $query = mysqli_query($con,"UPDATE temp_hotel SET h_action='Cancelled' WHERE temp_id='$id'");
 if ($query) {
     $msg="Hotel is Cancelled..";
 } else {
     $error="Cannot run query..";
 }
}

// Check if the toggle status form is submitted
if (isset($_POST['toggle_status'])) {

     $temp_id = $_POST['temp_id'];
     $new_status = $_POST['toggle_status'];
     
     $result="SELECT * FROM temp_hotel WHERE temp_id='$temp_id'";
     $connection=mysqli_query($con,$result);

     if($connection)
     {
         $row=mysqli_fetch_array($connection);
         
         $name = mysqli_real_escape_string($con,$row['name']);
         $price = (int)$row['price'];
        //  $rating =(int) $row['rating'];
         $room = (int)$row['room'];
         $email=$row['email'];
         $status =$row['status'];
         $image =$row['image'];
         $map =$row['hotel_map'];
         $description = mysqli_real_escape_string($con,$row['description']);
         $location = mysqli_real_escape_string($con, $row['hotel_location']);

         $query1 = mysqli_query($con, "SELECT * FROM hotels WHERE email='$email'");

         if(mysqli_num_rows($query1) > 0) {
             mysqli_begin_transaction($con);
             try{
                 $query = "UPDATE `hotels` SET `location`='$location', `image`='$image', `description`='$description', `price`='$price', `status`='$status', `name`='$name', `room`='$room', `map`='$map' WHERE email='$email'";
                 $process = mysqli_query($con, $query);
                 if($process) {
                     $query = mysqli_query($con, "UPDATE temp_hotel SET h_action='Approved' WHERE temp_id='$temp_id'");
                     $qq1=mysqli_query($con,"SELECT * FROM temp_package WHERE email='$email'");
                     $qq2=mysqli_query($con,"SELECT * FROM package WHERE email='$email'");
                     if ($qq1) {
                        if(mysqli_num_rows($qq1)>0){
                            $qu1 = mysqli_query($con, "UPDATE temp_package SET location='$location',map='$map' WHERE email='$email'");
                            if (!$qu1) {
                                  $error = "Cannot run query..";
                            }
                        }
                     } else {
                         $error = "Cannot run query..";
                     }
                     if ($qq2) {
                        if(mysqli_num_rows($qq2)>0){
                            $qu2 = mysqli_query($con, "UPDATE package SET location='$location',map='$map' WHERE email='$email'");
                            if (!$qu2) {
                                  $error = "Cannot run query..";
                            }
                        }
                     } else {
                         $error = "Cannot run query..";
                     }
                     if ($query) {
                         $msg = "Hotel is Approved..";
                     } else {
                         $error = "Cannot run query..";
                     }
                 } else {
                     $error = "Cannot run query..";
                 }
                 mysqli_commit($con);
                 $msg = "Hotel is Approved..";

             }catch(Exception $e){
                 mysqli_rollback($con);
                 $error = "Cannot Update hotel try later.";
             }
         } else {
             mysqli_begin_transaction($con);
             try{
                 // Hotel doesn't exist, insert a new entry
                 $query = "INSERT INTO `hotels` (`location`, `image`, `description`, `price`, `status`, `email`, `name`,`room`, `map`) VALUES ('$location', '$image', '$description', '$price', '$status', '$email', '$name', '$room', '$map')";
                 $process = mysqli_query($con, $query);
                 if($process) {
                     $query = mysqli_query($con, "UPDATE temp_hotel SET h_action='Approved' WHERE temp_id='$temp_id'");
                     if ($query) {
                         $msg = "Hotel is Approved..";
                     } else {
                         $error = "Cannot run query..";
                     }
                 } else {
                     $error = "Cannot run query..";
                 }
                 mysqli_commit($con);
                 
                 $msg = "Hotel is Approved..";
             }catch(Exception $e){ 
                    mysqli_rollback($con);

                 $error = "Cannot Update hotel try later.";
             }

         }

     }
     else
     {
         $error="Cannot run query..";
     }    
}


$query = "SELECT * FROM temp_hotel WHERE h_action  <> 'Cancelled' ORDER BY (h_action <> 'approved') DESC  LIMIT ? OFFSET ?";
$stmt = mysqli_prepare($con, $query);
mysqli_stmt_bind_param($stmt, 'ii', $itemsPerPage, $offset);
mysqli_stmt_execute($stmt);
$allimg = mysqli_stmt_get_result($stmt);
?>

<!DOCTYPE html>
<html>
    <head>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
section .c {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
    height: 100vh;
    margin: 0;
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
#hotelcrud{
    display: flex;    
    flex-direction: column;
}
#hotelcrud button{
    width:70px;
}
.c .container-fluid {
    width: 100%;
    display: flex;
    justify-content: center;
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
    background-color:black;
    color:white;
    border:none;
    padding: 5px;
    border-radius:5px;
    cursor: pointer;
}
table {
    margin-top: 10px;
    width: 100%;
    border-collapse: collapse;
}

tr:nth-child(even){
            background-color: #e8f5fe;
         }
th, td {
    padding: 4px;
    text-align: left;
}
th {
    background-color: black;
    color: white;
    height: 50px;
}
img{
    width:200px;
    height:150px;
}
.imgpopup {
    display: none; /* Initially hide the popup */
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    z-index: 9999;
    overflow: auto;
}

.imgpopup  h1{
    font-family: italic;
}
.popimg {
    display: flex;
    flex-direction: column;
    margin: 5% auto;
    width: 90%;
    /* max-width: 700px; */
    background-color: white; 
    padding: 20px; 
}

.popimg #close {
    display: flex;
    float: right;
    text-decoration: none;
    top: 10px;
    background: none;
    border: none;
    color: red;
    outline: none;
    font-size: 20px;
    cursor: pointer;
}
.popimg .pim{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    width: 100%;
}
.popimg img {
    margin: 5px;
    width: 250px;
    height: 250px;
}
.name,
.location{
    width:80px;
}
.email,
.price,
.room{
    width: 50px;
}
.description{
    width: 300px;
}

@media screen  and (max-width: 1030px){
    table {
    margin-top: 10px;
    border-collapse: collapse;
    width: 100%;
}
.name,
.location{
    width:10%;
}
.email,
.price,
.room{
    width: 10%;
}
.description{
    width: 40%;
}
tr:nth-child(even){
            background-color: #e8f5fe;
         }
th, td {
    padding: 4px;
    text-align: left;
}
th {
    background-color: black;
    color: white;
    height: 30px;
}
    
}

</style>
</head>
<body>
    <section class="c">
        
		 <?php if($error){?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php } 
				else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>
        <div class="container-fluid">
        <table>
            <tr>
                <th>SN</th>
                <th class="name">Name</th>
                <th class="location">Location</th>
                <th class="image">Image</th>
                <th class="price">price</th>
                <th class="email">Email</th>
                <th class="description">Description</th>
                <th class="room">Room</th>
                <th class="action">Action</th>
            </tr>
            <?php
            $sn = ($page - 1) * $itemsPerPage + 1;
             while ($row = mysqli_fetch_array($allimg)) { ?>
            <tr>
            <td><?php  echo $sn; ?></td>
                <td><?php  echo $row["name"]; ?></td>
                <td><?php  echo $row["hotel_location"]; ?></td>
                <?php
                $img=explode(",",$row['image']);
        foreach ($img as $path) {
        ?>
        <td><img src="../hotelowner/<?php  echo $path; ?>" alt="" onclick="imgpop('imgpopup<?php echo $row['temp_id']; ?>')"></td>
        <?php
        break;
        }
        ?>
                <td><?php  echo $row["price"]; ?></td>
                <td><?php  echo $row["email"]; ?></td>
                <td><?php  echo $row["description"]; ?></td>
                <td><?php  echo $row["room"]; ?></td>
                <td>
                    <?php
                    if($row["h_action"] === 'pending'){
                        ?>                        
                    <form method="POST" id="hotelcrud" action="">
                        <input type="hidden" name="temp_id" value="<?php echo $row['temp_id']; ?>">                      
                        <button class="btn btn-primary mb-2" type="submit" name="toggle_status" value="Approved"><?php echo $row['h_action'];?></button>
                        <button class="btn btn-danger" type="submit" name="cancel">Cancel</button>
                    </form>
    <?php
                    }else{
                    ?>
                        <form method="POST" id="hotelcrud" action="edithotel.php">
                            <input type="hidden" name="delete_id" value="<?php echo $row['temp_id']; ?>">
                            <button class="btn btn-primary mb-2" type="submit" name="edithotel">Edit</button>
                            <button class="btn btn-danger" type="submit" name="deletehotel">Delete</button>
                        </form>
                    </td>

                    <?php } ?>
                </td>
            </tr>
            <div class="imgpopup" id="imgpopup<?php echo $row['temp_id']; ?>">
                    <div class="popimg" id="popimg<?php echo $row['temp_id']; ?>">
                        <form>
                            <button type="reset" class="close" id="close" onclick="imgpop('imgpopup<?php echo $row['temp_id']; ?>')">X</button>  
                        </form>
                        <h1>Photos</h1>
                        <div class="pim">
                        <?php
                        $img = explode(",", $row['image']);
                        $c=0;
                        foreach ($img as $path) {
                            if($c>=6){
                                break;
                            }
                        ?>
                            <img src="../hotelowner/<?php echo $path; ?>" alt="">  
                        <?php $c++; } ?>
                        </div>
                    </div>
                </div>
            <?php 
            $sn++;
         } ?>
        </table>
    </div>
    <div id="prevNext">
        <button id="prevBtn">Prev</button>
        <button id="nextBtn">Next</button>
    </div>
        </section>
<script>
    function imgpop(hotelId) {
    var popup = document.getElementById(hotelId);
    if (popup.display === 'flex') {
        popup.style.display = 'none';
    } else {
        popup.style.display = 'flex';
    }
}
$('.close').click(function() {
    $(this).closest('.imgpopup').hide();
});

        $(document).ready(function(){
            var page = <?php echo $page; ?>;
            var totalPages = <?php echo ceil(mysqli_num_rows(mysqli_query($con, 'SELECT * FROM hotels')) / 3); ?>;

            $('#prevBtn').on('click', function(){
                if (page > 1) {
                    window.location.href = '?page=' + (page - 1);
                }
            });

            $('#nextBtn').on('click', function(){
                if (page < totalPages) {
                    window.location.href = '?page=' + (page + 1);
                }
            });
         });
   </script>

</body>
</html>
