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

  <style>
    .card-img-top {
      object-fit: cover;
    }
  </style>

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
        $cid = $_GET['catid'];
        if ($_GET['catid'] != '') {
          $_SESSION['catid'] = intval($_GET['catid']);
        }
        if (isset($_GET['pageno'])) {
          $pageno = $_GET['pageno'];
        } else {
          $pageno = 1;
        }
        $no_of_records_per_page = 5;
        $offset = ($pageno - 1) * $no_of_records_per_page;

        $total_pages_sql = "SELECT COUNT(*) FROM offline_posts";
        // $total_pages_sql = "SELECT COUNT(*) FROM tblposts";
        $result = mysqli_query($con, $total_pages_sql);
        $total_rows = mysqli_fetch_array($result)[0];
        $total_pages = ceil($total_rows / $no_of_records_per_page);

        $query = mysqli_query($con, "
        -- Select specific columns from online_posts with corresponding url from online_post_images
        SELECT 'online' AS source, online_posts.id, online_posts.link, online_posts.title, online_posts.posting_date, online_post_images.url
        FROM online_posts
        LEFT JOIN online_post_images ON online_posts.id = online_post_images.post_id
        WHERE online_posts.category_id = $cid AND online_post_images.serial_number = 1
        
        UNION
        
        -- Select specific columns from offline_posts with corresponding url from offline_post_images
        SELECT 'offline' AS source, offline_posts.id AS offline_id, null AS link, offline_posts.title, offline_posts.posting_date, offline_post_images.url
        FROM offline_posts
        LEFT JOIN offline_post_images ON offline_posts.id = offline_post_images.post_id
        WHERE offline_posts.category_id = $cid AND offline_post_images.serial_number = 1
        
        -- Order the combined result by posting_date in descending order
        ORDER BY posting_date DESC;        
");

        $rowcount = mysqli_num_rows($query);
        if ($rowcount == 0) {
          echo "No record found";
        } else {
          while ($row = mysqli_fetch_array($query)) {
        ?>

            <h1><?php echo htmlentities($row['category']); ?> News</h1>
            <div class="card mb-4">
              <img class="card-img-top" src="admin/<?php echo htmlentities($row['url']); ?>" height="350px" alt="<?php echo htmlentities($row['title']); ?>">
              <div class="card-body">
                <h2 class="card-title"><?php echo htmlentities($row['title']); ?></h2>
                <?php if ($row['source'] == 'online') { ?>
                  <a href="<?php echo htmlentities($row['link']); ?>" class="btn btn-primary" target="_blank">Read More &rarr;</a>
                <?php } else { ?>
                  <a href="news-details.php?id_offline_posts=<?php echo htmlentities($row['id']); ?>" class="btn btn-primary">Read More &rarr;</a>
                <?php } ?>
              </div>
              <div class="card-footer text-muted">
                Posted on <?php echo htmlentities($row['postingdate']); ?>

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
        <?php } ?>


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