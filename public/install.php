<?php
    if(isset($_POST['hostname']) && isset($_POST['db_user']) && isset($_POST['db_pass']) && isset($_POST['db_name']) && isset($_POST['admin_email']) && isset($_POST['admin_pass']) && !file_exists('../config.json')) {
        
        $datas = [
            'hostname' => $_POST['hostname'],
            'db_user' => $_POST['db_user'],
            'db_pass' => $_POST['db_pass'],
            'db_name' => $_POST['db_name']
        ];

        // Creation de tables + triggers + données de bases (Type de maison et energie)
        $db = new PDO("mysql:host=" . $datas['hostname'] . ";dbname=" . $datas['db_name'], $datas['db_user'], $datas['db_pass']);
        $query = file_get_contents("../database/tables.sql");
        $stmt = $db->prepare($query);

        if ($stmt->execute()){
            $query = file_get_contents("../database/triggers.sql");
            $stmt = $db->prepare($query);

            if($stmt->execute()) {
                $query = file_get_contents("../database/datas.sql");
                $stmt = $db->prepare($query);
    
                if(!$stmt->execute()) {
                    die("Failed to insert datas");
                }

            }else{
                die("Failed to create triggers");
            }

        }else {
            die("Failed to connect bdd or to create tables");
        }

        // Creation du compte adminisateur
        $stmt = $db->prepare("INSERT INTO T_utilisateur VALUES(?, ?, 'Admin', 'Ad', 'min', true);");
        $stmt->execute(array($_POST['admin_email'], password_hash($_POST['admin_pass'], PASSWORD_BCRYPT)));

        // Insertion du jeu de test
        if(isset($_POST['testDatas'])) {
            $query = file_get_contents("../database/tests.sql");
            $stmt = $db->prepare($query);
            if (!$stmt->execute()){
                die("Failed to insert tests datas.");
            }
        }

        $fp = fopen('../config.json', 'w');
        fwrite($fp, json_encode($datas));
        fclose($fp);

        header('Location: index.php');
    }else{
        if(!isset($need_install) || $need_install == false) {
            header('Location: index.php');
        }
    }
?>
<html>

<head>
    <title>Installer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <link rel="stylesheet" href="./assets/bootstrap/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
</head>

<body style="background:rgb(250, 250, 250)">

    <div class="container">
        <br>
        <h1 class="text-center">Installation</h1>
        <br>
        <div style="box-shadow: 0px 2px 5px 2px rgba(0,0,0,0.2);">
            <form action="install.php" method="post">
                <br>
                <div class="form-row">
                    <div class="col" style="margin-left: 30px;">
                        <h3>Configurer la base de données</h3>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col" style="margin-left: 30px;margin-right: 30px;">
                        <div class="form-group">
                            <label>Hostname</label>
                            <input name="hostname" id="hostname" class="form-control" type="text" />
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col" style="margin-left: 30px;margin-right: 30px;">
                        <div class="form-group">
                            <label>Database User</label>
                            <input name="db_user" id="db_user" class="form-control" type="text" />
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col" style="margin-left: 30px;margin-right: 30px;">
                        <div class="form-group">
                            <label>Database Password</label>
                            <input name="db_pass" id="db_pass" class="form-control" type="password" />
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col" style="margin-left: 30px;margin-right: 30px;">
                        <div class="form-group">
                            <label>Database Name</label>
                            <input name="db_name" id="db_name" class="form-control" type="text" />
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col" style="margin-left: 30px;margin-right: 30px;">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="dataCheck" name="testDatas">
                            <label class="form-check-label" for="dataCheck">
                                Inserer les données de test.
                            </label>
                        </div>
                    </div>
                </div>
                <br>
                <div class="form-row">
                    <div class="col" style="margin-left: 30px;">
                        <h3>Configurer le compte administateur</h3>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col" style="margin-left: 30px;margin-right: 30px;">
                        <div class="form-group">
                            <label>Admin Email</label>
                            <input name="admin_email" id="admin_email" class="form-control" type="email" />
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col" style="margin-left: 30px;margin-right: 30px;">
                        <div class="form-group">
                            <label>Admin Password</label>
                            <input name="admin_pass" id="admin_pass" class="form-control" type="password" />
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-xl-12" style="margin-bottom: 30px;margin-left: 30px;"><button class="btn btn-primary" type="submit" style="background: #ff763b;font-size: 18px;">Installer</button></div>
                </div>
            </form>
        </div>
    </div>

</body>

</html>