{include file='templates/header.tpl'}

<section>
    <div class="row register-form">
        <div class="col-md-8 offset-md-2">
            <form class="custom-form" action="{base_url()}/Account/register" method="post">
                <h1>Enregistrement</h1>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Pseudo</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="pseudo" id="pseudo" ></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Nom</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="nom" id="nom"></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Prénom</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="text" name="prenom" id="prenom" ></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="email-input-field">Email </label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="email" name="mail" id="mail"></div>
                </div>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="pawssword-input-field">Mot de passe</label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="password" name="mdp" id="mdp"></div>
                </div>
                <!--{if !empty($erreur)}
                    prout
                {/if}-->
                <div class="form-check"><input class="form-check-input" type="checkbox" id="formCheck-1"><label class="form-check-label" for="formCheck-1">Si un jour on veux des conditions d'utilisations</label></div>
                <input class="btn btn-light submit-button" type="submit" value="Valider" name="enregistrement">
            </form>
        </div>
    </div>
</section>

{include file='templates/footer.tpl'}
