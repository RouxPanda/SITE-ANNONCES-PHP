{include file='templates/header.tpl'}

<section style="min-height: 80vh;">
<div>
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
    <br>
    <div class="row">
        <div class="col"></div>
        <div class="col-8">
            <div class="row" style="text-align: left;">
                {foreach from=$datas item=$annonce}
                    {include file='templates/annonce.tpl'}
                {/foreach}
            </div>
        </div>
        <div class="col"></div>
    </div>
    <div class="row centre_bas_page">
        <a style="margin-top: 30px;margin-bottom: 60px;" href="{base_url()}/Home/annonces">
            <button class="btn btn-primary" style="font-size: 20px; border:none; background: linear-gradient(-9deg, rgba(255,255,255,0.27), rgb(255,107,0)), var(--orange);" type="button">Voir plus <i class="fas fa-chevron-down"></i></button>
        </a>
    </div>
</section>

</section>
    
{include file='templates/footer.tpl'}