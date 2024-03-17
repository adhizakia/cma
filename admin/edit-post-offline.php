<?php
session_start();
error_reporting(0);
include('includes/config.php');
$pid = $_GET['pid'];

if (isset($_POST['update'])) {
    // Ambil data dari form
    $title = $_POST['title'];
    $source = $_POST['source_id'];
    $category_id = $_POST['category_id'];
    $description = $_POST['description'];

    // Generate slug dari judul
    $slug = strtolower(str_replace(' ', '_', $title));

    // Set last_updated_by sebagai Admin (sesuaikan jika perlu)
    $last_updated_by = 'Admin';

    // Hapus semua gambar terkait postingan
    $delete_query_images = "DELETE FROM offline_post_images WHERE post_id='$pid'";
    $delete_result_images = mysqli_query($con, $delete_query_images);

    // Inisialisasi variabel untuk menampung pesan kesalahan
    $error = "";

    // Jika terjadi kesalahan saat menghapus gambar terkait postingan
    if (!$delete_result_images) {
        $error = "Error deleting post images: " . mysqli_error($con);
    }

    // Jika ada file yang diunggah
    if (!empty($_FILES['images']['tmp_name'][0])) {
        // Inisialisasi nomor serial
        $serialNumber = 1;

        // Loop melalui setiap file yang diunggah
        foreach ($_FILES['images']['tmp_name'] as $key => $tmp_name) {
            $name = $_FILES['images']['name'][$key];
            $extension = pathinfo($name, PATHINFO_EXTENSION);
            $imgnewfile = md5($name) . ".$extension";
            $url = "postimages/" . $imgnewfile;

            // Pindahkan file yang diunggah ke direktori tujuan
            move_uploaded_file($tmp_name, $url);

            // Simpan data gambar ke database
            $insertQuery = "INSERT INTO offline_post_images (post_id, name, serial_number, url) VALUES ('$pid', '$name', '$serialNumber', '$url')";
            $insertResult = mysqli_query($con, $insertQuery);

            // Jika terjadi kesalahan saat menyimpan data gambar ke database
            if (!$insertResult) {
                $error .= "<br>Error inserting post image: " . mysqli_error($con);
            }

            // Increment nomor serial untuk file berikutnya
            $serialNumber++;
        }
    } else {
        // Jika tidak ada gambar yang diunggah
        $error .= "<br>Tidak ada gambar yang diunggah.";
    }

    // Jika tidak terjadi kesalahan selama proses penghapusan dan penambahan gambar
    if (empty($error)) {
        // Update data pada tabel offline_posts
        $update_query_posts = "UPDATE offline_posts SET title='$title', source_id='$source', category_id='$category_id', description='$description', slug='$slug', last_updated_by='$last_updated_by', updated_date=NOW() WHERE id='$pid'";
        $update_result_posts = mysqli_query($con, $update_query_posts);

        // Jika terjadi kesalahan saat melakukan pembaruan data postingan
        if (!$update_result_posts) {
            $error = "Error updating post: " . mysqli_error($con);
        } else {
            $msg = "Data berhasil diperbarui.";
        }
    }
}


// Fetch post data from the database
$query = "SELECT * FROM offline_posts AS op LEFT JOIN offline_post_images AS opi ON op.id = opi.post_id WHERE op.id = $pid";
$result = mysqli_query($con, $query);

if ($result) {
    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
    } else {
        echo "No post found.";
        exit; // Stop execution if no post found
    }
} else {
    echo "Error executing query: " . mysqli_error($con);
    exit; // Stop execution if query fails
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">

    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">
    <!-- App title -->
    <title>Sunting Berita Offline</title>
    <link rel="icon" type="image/x-icon" href="../asset/Logo.png">

    <!-- Summernote css -->
    <link href="../plugins/summernote/summernote.css" rel="stylesheet" />

    <!-- Select2 -->
    <link href="../plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />

    <!-- Jquery filer css -->
    <link href="../plugins/jquery.filer/css/jquery.filer.css" rel="stylesheet" />
    <link href="../plugins/jquery.filer/css/themes/jquery.filer-dragdropbox-theme.css" rel="stylesheet" />

    <!-- App css -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/core.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/components.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/pages.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/menu.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../plugins/switchery/switchery.min.css">
    <script src="assets/js/modernizr.min.js"></script>
    <style>
        .image-input {
            display: none;
        }

        .image-preview {
            margin-top: 10px;
        }

        .editimage {
            width: 400px;
        }
    </style>


</head>


<body class="fixed-left">

    <!-- Begin page -->
    <div id="wrapper">

        <!-- Top Bar Start -->
        <!-- ========== Left Sidebar Start ========== -->
        <!-- Left Sidebar End -->
        <!-- Top Bar Start -->
        <?php include('includes/topheader.php'); ?>
        <!-- ========== Left Sidebar Start ========== -->
        <?php include('includes/leftsidebar.php'); ?>


        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->
        <div class="content-page">
            <!-- Start content -->
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="page-title-box">
                                <h4 class="page-title">Sunting Berita Offline</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-sm-6">
                            <!---Success Message--->
                            <?php if ($msg) { ?>
                                <div class="alert alert-success" role="alert">
                                    <strong>Well done!</strong> <?php echo htmlentities($msg); ?>
                                </div>
                            <?php } ?>

                            <!---Error Message--->
                            <?php if ($error) { ?>
                                <div class="alert alert-danger" role="alert">
                                    <strong>Oh snap!</strong> <?php echo htmlentities($error); ?>
                                </div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="p-6">
                                <div class="">
                                    <?php
                                    $pid = $_GET['pid'];
                                    // Feching active categories
                                    $sql = mysqli_query($con, "SELECT * FROM `offline_posts` WHERE id='$pid'");
                                    while ($row = mysqli_fetch_array($sql)) {
                                    ?>
                                        <form name="addpost" method="post" enctype="multipart/form-data">
                                            <div class="form-group m-b-20">
                                                <label for="exampleInputEmail1">Judul Berita</label>
                                                <input type="text" class="form-control" id="title" value="<?= $row['title'] ?>" name="title" placeholder="Enter title" required>
                                            </div>
                                            <div class="form-group m-b-20">
                                                <label for="exampleInputEmail1">Sumber Berita</label>
                                                <select class="form-control" name="source_id" id="source_id" onChange="getSubCat(this.value);" required>
                                                    <?php
                                                    // Fetching all source_ids
                                                    $ret = mysqli_query($con, "SELECT id, name FROM sources WHERE active=1");
                                                    while ($result = mysqli_fetch_array($ret)) {
                                                        $selected = ($row['category_id_id'] == $result['id']) ? 'selected' : '';
                                                    ?>
                                                        <option value="<?php echo htmlentities($result['id']); ?>" <?php echo $selected; ?>><?php echo htmlentities($result['name']); ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>

                                            <div class="form-group m-b-20">
                                                <label for="exampleInputEmail1">Kategori</label>
                                                <select class="form-control" name="category_id" id="category_id" onChange="getSubCat(this.value);" required>
                                                    <?php
                                                    // Fetching all categories
                                                    $ret = mysqli_query($con, "SELECT id, name FROM categories WHERE active=1");
                                                    while ($result = mysqli_fetch_array($ret)) {
                                                        $selected = ($row['category_id_id'] == $result['id']) ? 'selected' : '';
                                                    ?>
                                                        <option value="<?php echo htmlentities($result['id']); ?>" <?php echo $selected; ?>><?php echo htmlentities($result['name']); ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="card-box">
                                                        <h4 class="m-b-30 m-t-0 header-title"><b>Deskripsi Berita</b></h4>
                                                        <textarea class="summernote" name="description" required><?php echo $row['description']; ?></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="card-box">
                                                        <h4 class="m-b-30 m-t-0 header-title"><b>Gambar Terkait</b></h4>
                                                        <?php
                                                        // Fetching active categories
                                                        $ret = mysqli_query($con, "SELECT * FROM offline_post_images WHERE post_id = $pid");
                                                        while ($result = mysqli_fetch_array($ret)) {
                                                        ?>
                                                            <div class="image-upload-container">
                                                                <input type="file" class="form-control image-input" name="images[]" multiple>
                                                                <div class="image-preview mt-3">
                                                                    <img class="editimage" src="<?php echo $result['url']; ?>" alt="">
                                                                </div>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="card-box">
                                                        <h4 class="m-b-30 m-t-0 header-title"><b>Gambar Terkait</b></h4>
                                                        <div class="image-upload-container">
                                                            <input type="file" class="form-control image-input" name="images[]" multiple>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> -->
                                            <button type="submit" name="update" class="btn btn-success waves-effect waves-light"> Update</button>
                                        </form>
                                    <?php } ?>
                                </div>
                            </div> <!-- end p-20 -->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                </div> <!-- container -->

            </div> <!-- content -->

            <?php include('includes/footer.php'); ?>

        </div>

        <!-- ============================================================== -->
        <!-- End Right content here -->
        <!-- ============================================================== -->

    </div>
    <!-- END wrapper -->



    <script>
        var resizefunc = [];
    </script>

    <!-- jQuery  -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/detect.js"></script>
    <script src="assets/js/fastclick.js"></script>
    <script src="assets/js/jquery.blockUI.js"></script>
    <script src="assets/js/waves.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="../plugins/switchery/switchery.min.js"></script>

    <!--Summernote js-->
    <script src="../plugins/summernote/summernote.min.js"></script>
    <!-- Select 2 -->
    <script src="../plugins/select2/js/select2.min.js"></script>
    <!-- Jquery filer js -->
    <script src="../plugins/jquery.filer/js/jquery.filer.min.js"></script>

    <!-- page specific js -->
    <script src="assets/pages/jquery.blog-add.init.js"></script>

    <!-- App js -->
    <script src="assets/js/jquery.core.js"></script>
    <script src="assets/js/jquery.app.js"></script>

    <script>
        jQuery(document).ready(function() {

            $('.summernote').summernote({
                height: 240, // set editor height
                minHeight: null, // set minimum height of editor
                maxHeight: null, // set maximum height of editor
                focus: false // set focus to editable area after initializing summernote
            });
            // Select2
            $(".select2").select2();

            $(".select2-limiting").select2({
                maximumSelectionLength: 2
            });
        });
    </script>
    <script src="../plugins/switchery/switchery.min.js"></script>

    <!--Summernote js-->
    <script src="../plugins/summernote/summernote.min.js"></script>


    <script>
        document.getElementById('images').addEventListener('change', function(e) {
            var container = document.getElementById('image-preview-container');
            container.innerHTML = ''; // Bersihkan container

            for (var i = 0; i < e.target.files.length; i++) {
                var reader = new FileReader();
                reader.onload = function(event) {
                    var img = document.createElement('img');
                    img.src = event.target.result;
                    img.classList.add('img-thumbnail', 'mr-2', 'mb-2');
                    container.appendChild(img);
                };
                reader.readAsDataURL(e.target.files[i]);
            }
        });
    </script>

</body>

</html>