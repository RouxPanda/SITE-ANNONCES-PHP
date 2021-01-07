<div class="col" id="cartes">
    <a style="text-decoration: none;"class="card" href="{base_url()}/Annonce/view/{$annonce.A_idannonce}">
        <div class="card-body {if isset($smarty.session.mail) && $annonce.A_auteur == $smarty.session.mail}annonce_proprietaire{/if}">
            <h4 class="card-title" style="color:black;">{$annonce.A_titre}</h4>
            <p class="card-text">
                {$annonce.A_description}
            </p>
            <P class="text-center"><img class="card-image" src="{base_url()}/uploads/{if isset($annonce.image)}annonces/{$annonce.image}{else}default.jpg{/if}" style="height: 300px" /></P>
            <h3 class="card-text">{$annonce.A_cout_loyer} €</h3>
        </div>
    </a>
</div>