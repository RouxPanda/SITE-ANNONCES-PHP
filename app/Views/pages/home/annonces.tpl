{include file='templates/header.tpl'}

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
        <div class="row centre_bas_page" style="margin-top:30px; margin-bottom:60px;">
            {if $numero>0}
            <a href="{base_url()}/Home/annonces/{$numero-1}">
                <button class="btn btn-primary" style="font-size: 20px; border:none; background:orange;" type="button"><i class="fas fa-chevron-left"></i></button>
            </a>
            {/if}
            <a style="margin-left:15px; margin-right:15px;">
                <button class="btn btn-primary" style="font-size: 20px; border:none; background:orange;" type="button">{$numero}</button>
            </a>
            {if $numero*16 <= $total}
            <a href="{base_url()}/Home/annonces/{$numero+1}">
                <button class="btn btn-primary" style="font-size: 20px; border:none; background:orange;" type="button"><i class="fas fa-chevron-right"></i></button>
            </a>
            {/if}
        </div>
    </section>

{include file='templates/footer.tpl'}
