{include file='templates/header.tpl'}

 <section style="min-height: 80vh;">
        <div class="row register-form">
            <div class="col-md-8 offset-md-2">
                <form class="custom-form" action="{base_url()}/Account/login" method="post">
                    <h1>Connexion</h1>
                    <div class="form-row form-group">
                        <div class="col-sm-4 label-column"><label class="col-form-label" for="mail">Email </label></div>
                        <div class="col-sm-6 input-column"><input class="form-control" type="email" name="mail" id="mail"></div>
                    </div>
                    <div class="form-row form-group">
                        <div class="col-sm-4 label-column"><label class="col-form-label" for="mdp">Mot de passe</label></div>
                        <div class="col-sm-6 input-column"><input class="form-control" type="password" name="mdp" id="mdp"></div>
                    </div>
                    <input class="btn btn-light submit-button" type="submit" value="Valider">
                    <div class="form-group form-row ">
                        <a class="pas-inscrit-decal" href="{base_url()}/Account/register"><button class="btn btn-light float-right pas-inscrit" type="button">Pas inscrit ?</button></a>
                        <a class="pas-inscrit-decal" href="{base_url()}/Account/lost"><button class="btn btn-light" type="button">Mot de passe oublié</button></a>
                    </div>
                </form>
            </div>
        </div>
    </section>

{include file='templates/footer.tpl'}
