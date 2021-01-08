{include file='templates/header.tpl'}

 <section>
    <div class="row register-form">
        <div class="col-md-8 offset-md-2">
            <form class="custom-form" action="{base_url()}/Account/recover/{if isset($token)}{$token}{/if}" method="post">
                <h1>Nouveau mot de passe</h1>
                 <div class="form-row">
                    <div class="col" style="margin-left: 30px;margin-right: 30px;">
                        <div class="form-group"><label>Nouveau</label><input name="mdp_new" id="mdp_new" class="form-control" type="password"></div>
                        <div class="form-group"><label>Confimer</label><input name="mdp_confirm" id="mdp_confirm" class="form-control" type="password"></div>
                    </div>
                </div>
                <input class="btn btn-light submit-button" type="submit" value="Modifier">
            </form>
        </div>
    </div>
</section>

{include file='templates/footer.tpl'}
