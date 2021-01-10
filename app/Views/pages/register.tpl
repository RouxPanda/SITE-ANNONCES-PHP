{include file='templates/header.tpl'}

<section style="min-height: 80vh;">
    <div class="row register-form">
        <div class="col-md-8 offset-md-2">
            <form class="custom-form" action="{base_url()}/Account/register" method="post">
                <h1>Enregistrement</h1>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="pseudo">Pseudo</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="pseudo" id="pseudo" ></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="nom">Nom</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="nom" id="nom"></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="prenom">Prénom</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="prenom" id="prenom" ></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="mail">Email </label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="email" name="mail" id="mail"></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="mdp">Mot de passe</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="password" name="mdp" id="mdp"></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="mdp_confirm">Confirmer</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="password" name="mdp_confirm" id="mdp_confirm"></div>
                </div>
                <input class="btn btn-light submit-button" type="submit" value="Valider" name="enregistrement">
            </form>
        </div>
    </div>
</section>

{include file='templates/footer.tpl'}
