<?php
include("admin.php");
include "database.php";
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
$itemsPerPage = 5;
$offset = ($page - 1) * $itemsPerPage;

$query=mysqli_query($con,"SELECT 
    booking.booking_id,booking.packages_id,booking.hotel_id,booking.booking_date,booking.checkin_date,booking.checkout_date,
    booking.total_guest,booking.totalprice,booking.stat,booking.payment,booking.room,booking.action,users.fullname,users.email,users.phone
    FROM users JOIN booking ON booking.user_id=users.id ORDER BY booking.booking_id DESC  LIMIT $itemsPerPage OFFSET $offset");
    
?>
<html>
    <head>
        
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <style>
            .bookinglist{
                width: 99%;
            }
            .Topicbooking{
                color: blue;
                font-weight: 400;
            }
            .bookinglist table{
                width: 100%;
            }
            .bookinglist table th{
                background-color: black;
                text-align: center;
                color: white;
                padding-left:5px;
                height: 50px;
            }
            .bookinglist table tr td{
                text-align: center;
                margin-bottom: 3px;
            }
            .bookinglist table tr:nth-child(even){
                background-color: #e8f5fe;
            }
            .gotpay{
                outline: none;
                text-decoration: none;
                border: none;
                background-color: transparent;
            }
            #next {
                margin-top: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            #next button {
                margin: 10px;
                outline:none;
                height:40px;
                width:60px;
                border: 1px solid green;
                padding: 5px;
                border-radius:5px;
                cursor: pointer;
            }
            #next button:hover{
                background-color:black;
                border:none;
                color:white;
            }
            @media screen and (max-width:1090px) {
                table{
                    width: 100%;
                }
                td,th{
                    width:8%;
                }
                
            }
        </style>
    </head>
    <section class="bookinglist">
        <h3 class="Topicbooking">Booking Lists</h3>
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Name</th>
                <th>Mobile no</th>
                <th>Email</th>
                <th>Type</th>
                <th>Book Date</th>
                <th>From/To</th>
                <th>Guest</th>
                <th>Price</th>
                <th>Room</th>
                <th>Payment</th>
                <th>Status</th>
            </tr>
            <?php
            while($eachrow=mysqli_fetch_array($query)){
            ?>
                <tr>
                    <td>#BK-<?php echo $eachrow['booking_id'];?></td>
                    <td><?php echo $eachrow['fullname'];?></td>
                    <td><?php echo $eachrow['phone'];?></td>
                    <td><?php echo $eachrow['email'];?></td>
                    <td>
                        <?php 
                        if($eachrow['packages_id']==NULL){
                            $hoid=$eachrow['hotel_id'];
                            $quer=mysqli_query($con,"SELECT * FROM hotels WHERE hotel_id='$hoid'");
                            $hname=mysqli_fetch_array($quer);
                            echo $hname['name'];
                        }else{
                            $pkid=$eachrow['packages_id'];
                            $query2=mysqli_query($con,"SELECT * FROM package WHERE packages_id='$pkid'");
                            $pkname=mysqli_fetch_array($query2);
                            echo $pkname['name'];
                        }
                        ?>
                    </td>
                    <td><?php echo $eachrow['booking_date'];?></td>
                    <td><?php echo $eachrow['checkin_date'].'<br>to<br>'.$eachrow['checkout_date'];?></td>
                    <td><?php echo $eachrow['total_guest'];?></td>
                    <td><?php echo (int)$eachrow['totalprice'];?></td>
                    <td><?php echo $eachrow['room'];?></td>
                    <td><?php echo $eachrow['payment'];?></td>
                    <td>                       
                        <?php 
                            if($eachrow['payment']=='cash' && $eachrow['stat']==1){
                                echo "Not Paid";
                            }elseif($eachrow['action']=='cancel'){
                                echo "Cancelled";
                            }else{
                                echo "Paid";
                            }
                        ?>
                    </td>
                </tr>
                <?php
            }
            ?>
        </table>
    </section>
    <div id="next">
        <button id="prevBtn">Prev</button>
        <button id="nextBtn">Next</button>
    </div>
    <script>
        $(document).ready(function(){
            var page = <?php echo $page; ?>;
            var totalPages = <?php echo ceil(mysqli_num_rows(mysqli_query($con,"SELECT * FROM booking ")) / $itemsPerPage); ?>;
            
        console.log("Total Pages:", totalPages);

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
</html>