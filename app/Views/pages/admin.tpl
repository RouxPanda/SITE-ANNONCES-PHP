{include file='templates/header.tpl'}

<section style="min-height: 80vh;">

    <div class="container">
    
        <h1 class="text-center">Administration</h1>

        <br>

        <div class="row">
            <div class="col-sm-6">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Gerer les utilisateurs</h5>
                                <p class="card-text"></p>
                        <a href="{base_url()}/Admin/users" class="btn btn-primary">Go</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Gerer les annonces</h5>
                                <p class="card-text"></p>
                        <a href="{base_url()}/Admin/annonces" class="btn btn-primary">Go</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <br>

</section>

{include file='templates/footer.tpl'}
