<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>{$title}</title>
    <link rel="stylesheet" href="{base_url()}/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bungee" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans+JP" />
    <link rel="stylesheet" href="{base_url()}/assets/css/Footer-with-social-media-icons.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="{base_url()}/assets/css/styles.css" />
</head>

<body style="background:rgb(250, 250, 250)">
    <div id="navigation-block">
        <nav class="navbar navbar-light navbar-expand-md">
            <div class="container-fluid">
                <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1" style="width: 0px">
                    <span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <a href="/Home/view/home"><img src="{base_url()}/assets/img/lemauvais.png" style="width: 270px" /></a>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" href="/Home/annonces">Annonces</a>
                        </li>
                        <li class="nav-item"></li>
                        <li class="nav-item"></li>
                    </ul>
                    {if isset($smarty.session.mail)}
                    <ul class="nav navbar-nav ml-auto">
                    
                        {if isset($smarty.session.admin) && $smarty.session.admin}
                        <li class="nav-item">
                            <a class="nav-link active" href="/Admin/admin">Admin</a>
                        </li>
                        {/if}

                        <li class="nav-item">
                            <a class="nav-link active" href="/Account/manage">Compte</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/Account/logout">Déconnexion</a>
                        </li>
                    </ul>    
                    {else}
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="/Account/register">Inscription</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/Account/login">Connexion</a>
                        </li>
                    </ul>
                    {/if}
                </div>
            </div>
        </nav>
        <hr style="height: 2px; color: #ff763b; background-color: #ff763b; width: 50%; border: none;">
        {if isset($smarty.session.success) && !empty($smarty.session.success) }
            <div class="alert alert-success text-center" role="alert">{$smarty.session.success}</div>
        {/if}
        {if isset($smarty.session.error) && is_array($smarty.session.error) && !empty($smarty.session.error) }
            <div class="alert alert-danger text-center" role="alert">{$smarty.session.error[0]}</div>
        {/if}
    </div>