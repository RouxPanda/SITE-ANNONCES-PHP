{include file='templates/header.tpl'}

<section>
        <div class="row register-form">
            <div class="col-md-8 offset-md-2">
                <form class="custom-form">
                    <h1>Modifier ses infos</h1>
                    <div class="form-row form-group">
                        <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Nom</label></div>
                        <div class="col-sm-6 input-column"><input class="form-control" type="text" value="{$nom}"></div>
                    </div>
                    <div class="form-row form-group">
                        <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Prenom</label></div>
                        <div class="col-sm-6 input-column"><input class="form-control" type="text" value="{$prenom}"></div>
                    </div>
                    <div class="form-row form-group">
                        <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Pseudo</label></div>
                        <div class="col-sm-6 input-column"><input class="form-control" type="text" value="{$pseudo}"></div>
                    </div>
                    <div class="form-row"></div>
                    <div class="form-row form-group">
                        <div class="col-sm-4 label-column"><label class="col-form-label" for="repeat-pawssword-input-field">Mot de passe pour validation&nbsp;</label></div>
                        <div class="col-sm-6 input-column"><input class="form-control" type="password"></div>
                    </div><button class="btn btn-light submit-button" type="button">Enregistrer</button>
                </form>
            </div>
        </div>
    </section>

    {include file='templates/footer.tpl'}