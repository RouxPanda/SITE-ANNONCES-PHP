{include file='templates/header.tpl'}

    <section>
        <div class="row" style="text-align: left">
            {foreach from=$datas item=$annonce}
            
            <div class="col" id="cartes">
                <a style="text-decoration: none;"class="card" href="{base_url()}/Annonce/id/{$annonce.A_idannonce}">
                    <div class="card-body">
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
    </section>

{include file='templates/footer.tpl'}
