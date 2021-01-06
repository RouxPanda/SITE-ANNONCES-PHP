{include file='templates/header.tpl'}

<section>

    <div class="container">
    
        <h1 class="text-center">Utilisateurs</h1>

        <br>

        <div class="container">

            <ul class="list-group">
            {foreach from=$datas item=$user}
                <li class="list-group-item">
                    <div class="input-group" style="display:table; width:100%;">   
                        <i class="fas fa-user mr-3"></i>
                        {$user['U_pseudo']}
                        <span style="display: table-cell; width: 40px;">
                            <a href="{base_url()}/Admin/uedit/{$user['U_mail']}" class="btn btn-primary" type="button"><i class="fas fa-pen"></i></a>
                        </span>
                        <span style="padding-left: 5px; display: table-cell; width: 40px;">
                            <a href="{base_url()}/Admin/udelete/{$user['U_mail']}" class="btn btn-danger" type="button"><i class="fas fa-trash"></i></a>
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
