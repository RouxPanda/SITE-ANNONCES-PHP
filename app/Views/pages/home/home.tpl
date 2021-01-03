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
            <div class="col" id=cartes>
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">{$annonce.A_titre}</h4>
                        <p class="card-text">
                            {$annonce.A_description}
                        </p>
                        <P style="text-align:center"><img class="card-image" src="{base_url()}/assets/img/maison2.jpg" style="height: 300px" /></P>
                        <a class="card-link" href="#">Link</a>
                    </div>
                </div>
            </div>
            {/foreach}
        </div>
    </section>
    
{include file='templates/footer.tpl'}