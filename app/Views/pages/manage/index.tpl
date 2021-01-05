{include file='templates/header.tpl'}

<section>

    <div class="container">

        {include file='templates/manage_menu.tpl'}
        <br>

        <div class="bg-gray">
            <div class="container" id="system-status">
                <h1 class="text-center">{$smarty.session.pseudo}</h1>
                <hr style="height: 5px; color: #ff763b; background-color: #878787 ; width: 10%; border: none;">
    
                <a href="/Annonce/new"><button class="btn btn-primary" type="button" style="margin: 0 auto;text-align: center;margin-top: 22px;color: var(--light);background: var(--orange);border-color: var(--orange);">Publier une nouvelle annonce</button></a>
            </div>
        </div>
    </div>

    <br>

</section>

{include file='templates/footer.tpl'}
