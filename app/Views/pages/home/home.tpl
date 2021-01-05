{include file='templates/header.tpl'}

    <div style="background: #ffffff">
        <div class="row">
            <div class="col">
                <p style="text-align: center; font-size: 13px; color: rgb(65, 76, 88)">
                    Le site des petites annonces le plus compétents depuis aujourd'hui.
                </p>
            </div>
        </div>
        <div class="row" style="background: #ff792e">
            <div class="col">
                <p style="text-align: center; padding-top: 0px; border-style: none">
                    <br />Trouvez la bonne affaire parmi les millions de petites
                    annonces lemauvaiscoin.<br />
                </p>
            </div>
        </div>
    </div>
    <section>
        <div class="row" style="text-align: left">
            {foreach from=$datas item=$annonce}
            
            <div class="col" id="cartes">
                <a style="text-decoration: none;"class="card" href="{base_url()}/Annonce/view/{$annonce.A_idannonce}">
                    <div class="card-body {if $annonce.A_auteur == $smarty.session.mail}annonce_proprietaire{/if}">
                        <h4 class="card-title" style="color:black;">{$annonce.A_titre}</h4>
                        <p class="card-text">
                            {$annonce.A_description}
                        </p>
                        <P style="text-align:center"><img class="card-image" src="{base_url()}/assets/img/maison2.jpg" style="height: 300px" /></P>
                        <h3 class="card-text">{$annonce.A_cout_loyer} €</h3>
                    </div>
                </a>
            </div>
            {/foreach}
        </div>
        <div class="row">
            <a style="text-decoration: none; margin-left: auto; margin-right: auto;margin-top: 30px;margin-bottom: 60px;" href="{base_url()}/Home/view/annonces">
                <button class="btn btn-primary" style="font-size: 20px; border:none; background: linear-gradient(-9deg, rgba(255,255,255,0.27), rgb(255,107,0)), var(--orange);" type="button">Voir plus <i class="fas fa-chevron-down"></i></button>
            </a>
        </div>/
    </section>
    
{include file='templates/footer.tpl'}