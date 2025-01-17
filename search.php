<?php
session_start();
error_reporting(0);
include('includes/config.php');

?>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Diskominfo News</title>
  <link rel="icon" type="image/x-icon" href="asset/Logo.png">

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <?php include('includes/header.php'); ?>

  <!-- Page Content -->
  <div class="container">



    <div class="row" style="margin-top: 4%">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <!-- Blog Post -->
        <?php
        if ($_POST['searchtitle'] != '') {
          $st = $_SESSION['searchtitle'] = $_POST['searchtitle'];
        }
        $st;
        if (isset($_GET['pageno'])) {
          $pageno = $_GET['pageno'];
        } else {
          $pageno = 1;
        }
        $no_of_records_per_page = 8;
        $offset = ($pageno - 1) * $no_of_records_per_page;


        $total_pages_sql = "SELECT COUNT(*) FROM offline_posts";
        $result = mysqli_query($con, $total_pages_sql);
        $total_rows = mysqli_fetch_array($result)[0];
        $total_pages = ceil($total_rows / $no_of_records_per_page);

        $query = mysqli_query($con, "
        SELECT 
        'online' AS source,
        online_posts.id,
        online_posts.link,
        online_posts.title,
        online_posts.posting_date,
        online_post_images.url
    FROM 
        online_posts
    LEFT JOIN 
        online_post_images ON online_posts.id = online_post_images.post_id
    WHERE 
        (
            online_posts.title LIKE '%$st%' OR
            online_posts.description LIKE '%$st%'
        )
    
    UNION
    
    SELECT 
        'offline' AS source,
        offline_posts.id AS offline_id,
        null AS link,
        offline_posts.title AS posttitle,
        offline_posts.posting_date,
        offline_post_images.url AS postimage
    FROM 
        offline_posts
    LEFT JOIN 
        (
            SELECT post_id, MIN(serial_number) AS min_serial_number
            FROM offline_post_images
            GROUP BY post_id
        ) AS min_images ON offline_posts.id = min_images.post_id
    LEFT JOIN 
        offline_post_images ON offline_post_images.post_id = min_images.post_id AND offline_post_images.serial_number = min_images.min_serial_number
    WHERE 
        (
            offline_posts.title LIKE '%$st%' OR
            offline_posts.description LIKE '%$st%'
        ) 
    ORDER BY 
        posting_date DESC;
    ");

        // select offline_posts.id as pid,offline_posts.title as posttitle,tblcategory.CategoryName as category,offline_posts.description as postdetails,offline_posts.posting_date as postingdate from offline_posts left join tblcategory on tblcategory.id=offline_posts.category_id where offline_posts.title like '%$st%' and offline_posts.active=1 LIMIT $offset, $no_of_records_per_page
        $rowcount = mysqli_num_rows($query);
        if ($rowcount == 0) {
          echo "No record found";
        } else {
          while ($row = mysqli_fetch_array($query)) {


        ?>
            <div class="card mb-4">
              <img class="card-img-top" src="admin/<?php echo htmlentities($row['postimage']); ?>" alt="<?php echo htmlentities($row['posttitle']); ?>">
              <div class="card-body">
                <?php if ($row['source'] == 'online') { ?>
                  <h2 class="card-title"><?php echo htmlentities($row['title']); ?></h2>
                  <a href="<?php echo htmlentities($row['link']); ?>" class="btn btn-primary" target="_blank">Read More &rarr;</a>
                <?php } elseif ($row['source'] == 'offline') { ?>
                  <h2 class="card-title"><?php echo htmlentities($row['title']); ?></h2>
                  <a href="news-details.php?id_offline_posts=<?php echo htmlentities($row['id']) ?>" class="btn btn-primary">Read More &rarr;</a>
                <?php } ?>
              </div>
              <div class="card-footer text-muted">
                Posted on <?php echo htmlentities($row['posting_date']); ?>
              </div>
            </div>

          <?php } ?>

          <ul class="pagination justify-content-center mb-4">
            <li class="page-item"><a href="?pageno=1" class="page-link">First</a></li>
            <li class="<?php if ($pageno <= 1) {
                          echo 'disabled';
                        } ?> page-item">
              <a href="<?php if ($pageno <= 1) {
                          echo '#';
                        } else {
                          echo "?pageno=" . ($pageno - 1);
                        } ?>" class="page-link">Prev</a>
            </li>
            <li class="<?php if ($pageno >= $total_pages) {
                          echo 'disabled';
                        } ?> page-item">
              <a href="<?php if ($pageno >= $total_pages) {
                          echo '#';
                        } else {
                          echo "?pageno=" . ($pageno + 1);
                        } ?> " class="page-link">Next</a>
            </li>
            <li class="page-item"><a href="?pageno=<?php echo $total_pages; ?>" class="page-link">Last</a></li>
          </ul>
        <?php }  ?>




        <!-- Pagination -->




      </div>

      <!-- Sidebar Widgets Column -->
      <?php include('includes/sidebar.php'); ?>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <?php include('includes/footer.php'); ?>


  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


  </head>
</body>

</html>