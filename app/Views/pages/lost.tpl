{include file='templates/header.tpl'}

 <section style="min-height: 80vh;">
    <div class="row register-form">
        <div class="col-md-8 offset-md-2">
            <form class="custom-form" action="{base_url()}/Account/lost" method="post">
                <h1>Mot de passe oublié</h1>
                <div class="form-row form-group">
                    <div class="col-sm-4 label-column"><label class="col-form-label" for="mail">Email </label></div>
                    <div class="col-sm-6 input-column"><input class="form-control" type="email" name="mail" id="mail"></div>
                </div>
                <input class="btn btn-light submit-button" type="submit" value="Recuprer">
            </form>
        </div>
    </div>
</section>

{include file='templates/footer.tpl'}
