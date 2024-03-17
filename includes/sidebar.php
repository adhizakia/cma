<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<div class="col-md-4">
  <!-- Search Widget -->
  <div class="card mb-4">
    <h5 class="card-header">Search</h5>
    <div class="card-body">
      <form name="search" action="search.php" method="post">
        <div class="input-group">
          <input type="text" name="searchtitle" class="form-control rounded me-3" placeholder="Masukkan Kata Kunci" required>
          <span class="input-group-btn">
            <button class="btn btn-info ps-3 pe-3 rounded-2" type="submit">Cari</button>
          </span>
        </div>
      </form>
    </div>
  </div>

  <!-- Categories Widget -->
  <div class="card my-4">
    <h5 class="card-header">Categories</h5>
    <div class="card-body">
      <div class="row">
        <div class="col-lg-6">
          <ul class="list-unstyled mb-0">
            <?php
            $query = mysqli_query($con, "select categories.id as catid,name from categories");
            while ($row = mysqli_fetch_array($query)) {
            ?>

              <li class="mb-2">
                <a href="category.php?catid=<?php echo htmlentities($row['catid']) ?>" class="text-dark"><?php echo htmlentities($row['name']); ?></a>
              </li>
            <?php } ?>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <!-- Side Widget -->
  <div class="card my-4">
    <h5 class="card-header">Recent News</h5>
    <div class="card-body">
      <ul class="mb-0 list-unstyled">
        <?php
        // Your SQL query to fetch data from the tables
        $sql = "
            -- Select specific columns from online_posts
            SELECT 'online' AS source, id, link, title, posting_date FROM online_posts
            UNION
            -- Select specific columns from offline_posts
            SELECT 'offline' AS source, id, null AS link, title, posting_date FROM offline_posts
            -- Order the combined result by posting_date in descending order
            ORDER BY posting_date DESC
            -- Limit the result to 5 rows
            LIMIT 5;
            "; // Adjust the JOIN condition based on your table structure

        $result = mysqli_query($con, $sql);
        if ($result->num_rows > 0) {
          while ($row = $result->fetch_assoc()) {
        ?>
            <li class="d-flex mb-2 align-items-center">
              <?php if ($row['source'] == 'online') { ?>
                <a href="<?php echo htmlentities($row['link']) ?>" class="text-dark" target="_blank">
                  <?php echo htmlentities($row['title']); ?>
                </a>
              <?php } else { ?>
                <a href="news-details.php?id_offline_posts=<?php echo htmlentities($row['id']) ?>" class="text-dark">
                  <?php echo htmlentities($row['title']); ?>
                </a>
              <?php } ?>
            </li>
        <?php
          }
        }
        ?>
      </ul>
    </div>
  </div>


  <!-- Side Widget -->
  <div class="card my-4">
    <h5 class="card-header">Popular News</h5>
    <div class="card-body">
      <ul class="list-unstyled">
        <?php
        // Your SQL query to fetch data from the tables
        $query1 = mysqli_query($con, "
                SELECT 'online' AS source, id, link, title, posting_date, view_counter FROM online_posts
                UNION
                SELECT 'offline' AS source, id, null AS link, title, posting_date, view_counter FROM offline_posts
                ORDER BY view_counter DESC
                LIMIT 5;
            "); // Adjust the JOIN condition based on your table structure

        // Check if the query was successful
        if ($query1) {
          // Check if there are any rows
          if (mysqli_num_rows($query1) > 0) {
            // Fetch the results
            while ($row = mysqli_fetch_assoc($query1)) {
        ?>
              <li class="d-flex mb-2 align-items-center">
                <?php if ($row['source'] == 'online') { ?>
                  <a href="<?php echo htmlentities($row['link']) ?>" class="text-dark" target="_blank">
                    <?php echo htmlentities($row['title']); ?>
                  </a>
                  <?php
                  // Update view counter for online post
                  $updateSql = "
                  UPDATE online_posts
SET view_counter = view_counter + 1
WHERE id = {$row['id']};
                  ";
                  mysqli_query($con, $updateSql);
                  ?>
                <?php } else { ?>
                  <a href="news-details.php?id_offline_posts=<?php echo htmlentities($row['id']) ?>" class="text-dark">
                    <?php echo htmlentities($row['title']); ?>
                  </a>
                <?php } ?>
              </li>
        <?php
            }
          } else {
            echo "No results found.";
          }
        } else {
          echo "Query failed: " . mysqli_error($con);
        }
        ?>
      </ul>
    </div>
  </div>
</div>
</div>