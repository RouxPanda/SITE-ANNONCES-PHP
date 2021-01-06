{include file='templates/header.tpl'}

    <section>
        <div class="row centre_bas_page">
            <form class="custom-form" action="{base_url()}/Home/annonces" method="post" style="width:40%;">
                <div class="input-group md-form form-sm form-1 pl-0">
                  <div class="input-group-prepend">
                    <button class="input-group-text cyan lighten-2" type="submit" id="basic-text1">
                        <i class="fas fa-search text-white" aria-hidden="true"></i></button>
                  </div>
                  <input class="form-control my-0 py-1" type="text" name="rchr" placeholder="Recherche" aria-label="Recherche">
                </div>
            </form>
        </div>
        <div class="row" style="text-align: left">
            {foreach from=$datas item=$annonce}
                {include file='templates/annonce.tpl'}
            {/foreach}
        </div>
        <div class="row centre_bas_page" style="margin-top:30px; margin-bottom:60px;">
            {if isset($numero) && $numero>0}
            <a href="{base_url()}/Home/annonces/{$numero-1}">
                <button class="btn btn-primary" style="font-size: 20px; border:none; background:orange;" type="button"><i class="fas fa-chevron-left"></i></button>
            </a>
            {/if}
            <a style="margin-left:15px; margin-right:15px;">
                <button class="btn btn-primary" style="font-size: 20px; border:none; background:orange;" type="button">{$numero}</button>
            </a>
            {if isset($numero) && $numero*16 <= $total}
            <a href="{base_url()}/Home/annonces/{$numero+1}">
                <button class="btn btn-primary" style="font-size: 20px; border:none; background:orange;" type="button"><i class="fas fa-chevron-right"></i></button>
            </a>
            {/if}
        </div>
    </section>

{include file='templates/footer.tpl'}
