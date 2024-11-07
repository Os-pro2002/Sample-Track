<?php
$host = "localhost";
$username = "root";
$password = "";
$dbname = "mayar_sample";

$connect_database = mysqli_connect($host, $username, $password, $dbname);

if (!$connect_database) {
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $sample_id = isset($_POST['sample_id']) ? $_POST['sample_id'] : null;
    $recipient_id = isset($_POST['recipient_id']) ? $_POST['recipient_id'] : null;
    $department_id = isset($_POST['department_id']) ? $_POST['department_id'] : null; // تغيير هنا
    $location_id = isset($_POST['location_id']) ? $_POST['location_id'] : null; // تغيير هنا
    $status_id = isset($_POST['status_id']) ? $_POST['status_id'] : null; // تغيير هنا
    $process_date = isset($_POST['date_time']) ? $_POST['date_time'] : null; 

    $sql = "INSERT INTO sample_tracking2(sample_id, recipient_id, department_id, location_id, status_id, process_date) 
            VALUES (?, ?, ?, ?, ?, ?)";
    
    $stmt = $connect_database->prepare($sql);
    if (!$stmt) {
        die("تحضير الاستعلام فشل: " . $connect_database->error);
    }

    $stmt->bind_param("ssssss", $sample_id, $recipient_id, $department_id, $location_id, $status_id, $process_date);

    if ($stmt->execute()) {
        echo "تم إدخال البيانات بنجاح!";
    } else {
        echo "حدث خطأ: " . $stmt->error;
    }

    $stmt->close();
}

mysqli_close($connect_database);
?>


<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Sample</title>
    <link rel="stylesheet" href="addsample.css">
</head>
<body>
    <header>
        <img src="../image/right.png" alt="Right Image" />
        <h1>Sample Track</h1>
        <img src="../image/left.png" alt="Left Image" />
    </header>
    
    <div class="container">
        <div class="links">
            <a href="../barcode/Barcode.php">Show</a>
            <a href="#" class="add-data">Add Sample</a>
        </div>

        <div class="track-container">
        <h2>Add New Sample Track</h2>
        <form action="AddSample.php" method="POST">
                <input type="text" name="sample_id" required placeholder="Sample ID">
              
                <div class="checkbox-group">
                    <label>
                        <input type="checkbox" name="option1"> Option 1
                    </label>
                    <label>
                        <input type="checkbox" name="option2"> Option 2
                    </label>
                    <label>
                        <input type="checkbox" name="option3"> Option 3
                    </label>
                </div>
                
                <div class="checkbox-group-2">
                    <label>
                        <input type="checkbox" name="option4"> Option 4
                    </label>
                    <label>
                        <input type="checkbox" name="option5"> Option 5
                    </label>
                </div>

                <button type="submit">Submit</button>
            </form>
</div>


    </div>

    <script src="addsample.js"></script>
</body>
</html>