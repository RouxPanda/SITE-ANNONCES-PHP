{include file='templates/header.tpl'}

 <section>
        <div class="row register-form">
            <div class="col-md-8 offset-md-2">
                <form class="custom-form" action="{base_url()}/Account/login" method="post">
                    <h1>Connexion</h1>
                    <div class="form-row form-group">
                        <div class="col-sm-4 label-column"><label class="col-form-label" for="email-input-field">Email </label></div>
                        <div class="col-sm-6 input-column"><input class="form-control" type="email" name="mail" id="mail"></div>
                    </div>
                    <div class="form-row form-group">
                        <div class="col-sm-4 label-column"><label class="col-form-label" for="pawssword-input-field">Mot de passe</label></div>
                        <div class="col-sm-6 input-column"><input class="form-control" type="password" name="mdp" id="mdp"></div>
                    </div>
                    <input class="btn btn-light submit-button" type="submit" value="Valider" name="connexion">
                    <div class="form-group form-row ">
                        <a class="pas-inscrit-decal" href="/Account/register"><button class="btn btn-light float-right pas-inscrit" type="button">Pas inscrit ?</button></a>
                    </div>
                </form>
            </div>
        </div>
    </section>

{include file='templates/footer.tpl'}
