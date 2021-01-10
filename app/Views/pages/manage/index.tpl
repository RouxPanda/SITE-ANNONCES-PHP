{include file='templates/header.tpl'}

<section style="min-height: 80vh;">

    <div class="container">

        {include file='templates/manage_menu.tpl'}
        <br>

        <div class="bg-gray">
            <div class="container" id="system-status">
                <h1 class="text-center">{$smarty.session.pseudo}</h1>
                <hr style="height: 5px; color: #ff763b; background-color: #878787 ; width: 10%; border: none;">
                <div class="row centre_bas_page" style="margin-top: 10%">
                    <a href="{base_url()}/Annonce/new"><button class="btn btn-primary" type="button" style="margin: 0 auto;text-align: center;margin-top: 22px;color: var(--light);background: var(--orange);border-color: var(--orange);">Publier une nouvelle annonce</button></a>
                    <a data-toggle="modal" data-target="#confirmModal" data-link="{base_url()}/Account/delete" data-whatever="Etes vous sur de vouloir supprimer votre compte ?"><button class="btn btn-danger" type="button" style="margin: 0 auto; margin-left:20px; text-align: center;margin-top: 22px;color: var(--light);">Supprimer compte</button></a>
                <div>
            </div>
        </div>
    </div>

    <br>

</section>

{include file='templates/footer.tpl'}
