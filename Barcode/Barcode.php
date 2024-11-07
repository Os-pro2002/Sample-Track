<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sample Track</title>
    <link rel="stylesheet" href="barcode.css">
</head>
<body>
    <header>
        <img src="../image/right.png" alt="صورة اليمين" />
        <h1>Sample Track</h1>
        <img src="../image/left.png" alt="صورة اليسار" />
    </header>
<br><br>
    <div class="container">
    <div class="links">
            <a href="#">Show</a>
            <a href="../Add sample/AddSample.php" class="add-data">Add Sample</a>
        </div>

        <div class="scan-container">
            <h2>Barcode Scan</h2>
            <form action="Barcode.php" method="POST">
                <input type="text" name="barcode" placeholder="Enter the Barcode ..." required />
                <button type="submit">Search</button>
            </form>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Step Number</th>
                    <th>Recipient Id</th>
                    <th>Department Name</th>
                    <th>Location Name</th>
                    <th>Status Name</th>
                    <th>Date - Time</th> 
                </tr>
            </thead>
            <tbody id="resultsBody">
            <?php
if (isset($_POST['barcode'])) {
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

    $barcode = $_POST['barcode'];

    $query = "
        SELECT 
            ROW_NUMBER() OVER (ORDER BY st.process_date) AS `Step Number`, 
            st.recipient_id AS `Recipient ID`,                             
            d.department_name AS `Department`,                              
            l.location_name AS `Location`,                                  
            s.status_name AS `Status`,                                    
            st.process_date AS `Date and Time`                          
        FROM 
            sample_tracking2 st
        JOIN 
            departments d ON st.department_id = d.department_id            
        JOIN 
            locations l ON st.location_id = l.location_id                 
        JOIN 
            statuses s ON st.status_id = s.status_id                        
        WHERE 
            st.sample_id = '$barcode'; 
    ";

    $result = mysqli_query($connect_database, $query);

    if (!$result) {
        echo "Error: " . mysqli_error($connect_database);
        exit();
    }

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>
                    <td>{$row['Step Number']}</td>
                    <td>{$row['Recipient ID']}</td>
                    <td>{$row['Department']}</td>
                    <td>{$row['Location']}</td>
                    <td>{$row['Status']}</td>
                    <td>{$row['Date and Time']}</td> 
                  </tr>";
        }
    } else {
        echo "<tr><td colspan='6'>No matching records found for the entered barcode.</td></tr>";
    }
}
?>

            </tbody>
        </table>
    </div>
</body>
</html>



