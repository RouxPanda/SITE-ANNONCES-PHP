{include file='templates/header.tpl'}

    <section>
        <div class="row" style="text-align: left">
            {foreach from=$datas item=$annonce}
            <div class="col" id=cartes>
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" style="color:black;">{$annonce.A_titre}</h4>
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
