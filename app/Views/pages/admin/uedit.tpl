{include file='templates/header.tpl'}

<section>
    <div class="container" >

        <div class="container">
            {if isset($user)}
            <h1 class="text-center">{$user['U_pseudo']}</h1>
            <br>
            {/if}
            <div style="box-shadow: 0px 2px 5px 2px rgba(0,0,0,0.2);">
                <form action="{base_url()}/Admin/uedit/{$user['U_mail']}" method="post">
                    <br>
                    <div class="form-row">
                        <div class="col" style="margin-left: 30px;">
                        <h3>Modifier le pseudo</h3>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col" style="margin-left: 30px;margin-right: 30px;">
                            <div class="form-group"><label>Pseudo</label><input name="pseudo" id="pseudo" class="form-control" type="text" value="{if isset($user)}{$user['U_pseudo']}{/if}"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-xl-12" style="margin-bottom: 30px;margin-left: 30px;"><button class="btn btn-primary" type="submit" style="background: #ff763b;font-size: 18px;">Modifier</button></div>
                    </div>
                    <input type="hidden" name="type" id="type" value="pseudo" />
                </form>
            </div>
            <br>
            <div style="box-shadow: 0px 2px 5px 2px rgba(0,0,0,0.2);">
                <form action="{base_url()}/Admin/uedit/{$user['U_mail']}" method="post">
                    <br>
                    <div class="form-row">
                        <div class="col" style="margin-left: 30px;">
                        <h3>Modifier les informations</h3>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col" style="margin-left: 30px;margin-right: 30px;">
                            <div class="form-group"><label>Nom</label><input name="nom" id="nom" class="form-control" type="text" value="{if isset($user)}{$user['U_nom']}{/if}"></div>
                            <div class="form-group"><label>Prenom</label><input name="prenom" id="prenom" class="form-control" type="text" value="{if isset($user)}{$user['U_prenom']}{/if}"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-xl-12" style="margin-bottom: 30px;margin-left: 30px;"><button class="btn btn-primary" type="submit" style="background: #ff763b;font-size: 18px;">Modifier</button></div>
                    </div>
                    <input type="hidden" name="type" id="type" value="infos" />
                </form>
            </div>
            <br>
            <div style="box-shadow: 0px 2px 5px 2px rgba(0,0,0,0.2);">
                <form action="{base_url()}/Admin/uedit/{$user['U_mail']}" method="post">
                    <br>
                    <div class="form-row">
                        <div class="col" style="margin-left: 30px;">
                        <h3>Modifier le mot de passe</h3>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col" style="margin-left: 30px;margin-right: 30px;">
                            <div class="form-group"><label>Nouveau</label><input name="mdp_new" id="mdp_new" class="form-control" type="password"></div>
                            <div class="form-group"><label>Confimer</label><input name="mdp_confirm" id="mdp_confirm" class="form-control" type="password"></div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-xl-12" style="margin-bottom: 30px;margin-left: 30px;"><button class="btn btn-primary" type="submit" style="background: #ff763b;font-size: 18px;">Modifier</button></div>
                    </div>
                    <input type="hidden" name="type" id="type" value="password" />
                </form>
            </div>
            <br>
        </div>
        
    </div>
</section>

{include file='templates/footer.tpl'}