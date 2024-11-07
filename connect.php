<?php
$host = "localhost";
$username = "root";
$password = "";
$dbname = "mayar_sample";

// الاتصال بقاعدة البيانات
$connect_database = mysqli_connect($host, $username, $password, $dbname);

if (mysqli_connect_errno()) {
    echo "غير متصل: " . mysqli_connect_error();
    exit();
}

// التحقق من باركود
if (isset($_POST['barcode'])) {
    $barcode = $_POST['barcode'];
    
    $query = "SELECT * FROM `sampletrack` WHERE number=?";
    $stmt = $connect_database->prepare($query);
    $stmt->bind_param("s", $barcode);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                                    <td>{$row['tracking_id']}</td>
                                    <td>{$row['recipient_id']}</td>
                                    <td>{$row['department_id']}</td>
                                    <td>{$row['location_id']}</td>
                                    <td>{$row['status_id']}</td>
                                    <td>{$row['process_date']}</td> 
                                  </tr>";
        }
    } else {
        echo "No Data Found!";
    }
    $stmt->close();
}

mysqli_close($connect_database);
?>
