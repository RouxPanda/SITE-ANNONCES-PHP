{include file='templates/header.tpl'}

<section>

    <div class="container">
    
        <h1 class="text-center">Annonces</h1>

        <br>

        <div class="container">

            <ul class="list-group">
            {foreach from=$datas item=$annonce}
                <li class="list-group-item">
                    <div class="input-group" style="display:table; width:100%;">   
                        <i class="fas fa-home mr-3"></i>
                        {$annonce['A_titre']}
                        <span style="display: table-cell; width: 40px;">
                            <a href="{base_url()}/Annonce/edit/{$annonce['A_idannonce']}" class="btn btn-primary" type="button"><i class="fas fa-pen"></i></a>
                        </span>
                        <span style="padding-left: 5px; display: table-cell; width: 40px;">
                            <a href="{base_url()}/Annonce/delete/{$annonce['A_idannonce']}" class="btn btn-danger" type="button"><i class="fas fa-trash"></i></a>
                        </span>
                    </div>
                </li>
            {/foreach}
            </ul>
        
        </div>

    </div>

    <br>

</section>

{include file='templates/footer.tpl'}
