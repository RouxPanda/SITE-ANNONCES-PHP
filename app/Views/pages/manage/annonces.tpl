{include file='templates/header.tpl'}

<section>
    <div class="container" >
        
        {include file='templates/manage_menu.tpl'}
        <br>

        <div class="container">
    
            <ul class="list-group">
            {foreach from=$datas item=$annonce}
                <li class="list-group-item">
                    <div class="input-group" style="display:table; width:100%;">   
                        <i class="fas fa-home mr-3"></i>
                        {$annonce['A_titre']}
                        <span style="padding-left: 5px;display: table-cell; width: 40px;">
                            <a href="{base_url()}/Annonce/view/{$annonce['A_idannonce']}" class="btn btn-info" type="button"><i class="fas fa-eye"></i></a>
                        </span>
                        <span style="padding-left: 5px;display: table-cell; width: 40px;">
                            <a href="{base_url()}/Annonce/edit/{$annonce['A_idannonce']}" class="btn btn-primary" type="button"><i class="fas fa-pen"></i></a>
                        </span>
                        
                        <span style="padding-left: 5px; display: table-cell; width: 40px;">
                            <a href="{base_url()}/Annonce/delete/{$annonce['A_idannonce']}" class="btn btn-danger" type="button"><i class="fas fa-trash"></i></a>
                        </span>
                        {if $annonce['A_etat'] == 2}
                        <span style="padding-left: 5px;display: table-cell; width: 40px;">
                            <a href="{base_url()}/Annonce/archive/{$annonce['A_idannonce']}" class="btn btn-warning" type="button"><i class="fas fa-archive"></i></a>
                        </span>
                        {else if $annonce['A_etat'] == 1}
                        <span style="padding-left: 5px; display: table-cell; width: 40px;">
                            <a href="{base_url()}/Annonce/publish/{$annonce['A_idannonce']}" class="btn btn-success" type="button"><i class="fas fa-upload"></i></a>
                        </span>
                        {else if $annonce['A_etat'] == 3}
                        <span style="padding-left: 5px;display: table-cell; width: 40px;">
                            <a href="{base_url()}/Annonce/publish/{$annonce['A_idannonce']}" class="btn btn-dark" type="button"><i class="fas fa-box-open"></i></a>
                        </span>
                        {/if}
                    </div>
                </li>
            {/foreach}
            </ul>
        
        </div>

        <br>

    </div>
</section>

{include file='templates/footer.tpl'}
