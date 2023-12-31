<?php
if (!isset($_SESSION)) {
    session_start();
}
if (!isset($_SESSION['nama_pasien'])) {
    // Jika pengguna sudah login, tampilkan tombol "Logout"
    header("Location: index.php?page=loginPasien");
    exit;
}
?>

<!DOCTYPE html>
<html>

<head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Sistem Informasi Rumah Sakit</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="index.php">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">Menu</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href="daftar_poli.php?page=dokter">Mendaftar ke Poli</a>
                                    <!-- <a class="dropdown-item" href="obat.php?page=obat">Obat</a>
                                    <a class="dropdown-item" href="admin.php?page=admin">Admin</a>
                                    <a class="dropdown-item" href="poli.php?page=poli">Poli</a>
                                    <a class="dropdown-item" href="pasien.php?page=pasien">Pasien</a> -->
                                </li>
                            </ul>
                        </li>
                    <?php
                    if (isset($_SESSION['no_rm'])) {
                        //menu master jika user sudah login
                        ?>
                        <!-- Tambahkan menu lain jika diperlukan -->
                        <?php
                    }
                    ?>
                </ul>
                <?php
                if (isset($_SESSION['nama_pasien'])) {
                    // Jika pengguna sudah login, tampilkan tombol "Logout"
                    ?>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Logout.php">Logout (
                                <?php echo $_SESSION['nama_pasien'] ?>)
                            </a>
                        </li>
                    </ul>
                    <?php
                } else {
                    // Jika pengguna belum login, tampilkan tombol "Login" dan "Register"
                    ?>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?page=loginPasien">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?page=registerPasien">Registrasi Pasien</a>
                        </li>
                    </ul>
                    <?php
                }
                ?>
            </div>
        </div>
    </nav>

    <title>Daftar Poli RS</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container mt-5">
        <h2>Daftar Poli Rumah Sakit</h2>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">No.</th>
                    <th scope="col">Nama Poli</th>
                    <th scope="col">Keterangan</th>
                    <th scope="col">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $mysqli = new mysqli("localhost", "root", "", "poli"); // Ganti dengan informasi koneksi database yang benar
                
                if ($mysqli->connect_error) {
                    die("Koneksi database gagal: " . $mysqli->connect_error);
                }

                $query = "SELECT * FROM poli"; // Ubah "poli" sesuai dengan nama tabel di database Anda
                $stmt = $mysqli->prepare($query);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    $count = 1;
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $count . "</td>";
                        echo "<td>" . htmlspecialchars($row['nama_poli']) . "</td>";
                        echo "<td>" . htmlspecialchars($row['keterangan']) . "</td>";
                        echo "<td><a href='mendaftar_poli.php?id=" . $row['id'] . "' class='btn btn-primary'>Daftar</a></td>";

                        // Tambahkan kolom lain jika diperlukan
                        echo "</tr>";
                        $count++;
                    }
                } else {
                    echo "<tr><td colspan='3'>Tidak ada data poli</td></tr>";
                }

                $stmt->close();
                $mysqli->close();
                ?>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>
