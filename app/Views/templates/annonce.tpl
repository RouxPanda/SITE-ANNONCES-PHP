<div class="col-md-4" style="padding-bottom: 30px;">
    <div class="annonce-card {if isset($smarty.session.mail) && $annonce.A_auteur == $smarty.session.mail}annonce_proprietaire{else}ombre{/if}" onclick="window.location='{base_url()}/Annonce/view/{$annonce.A_idannonce}'">
        <div class="banner" style="background-image: url('{base_url()}/public/uploads/{if isset($annonce.image)}annonces/{$annonce.image}{else}default.jpg{/if}');"></div>
        <h2 class="name">{$annonce.A_titre}</h2>
        <div class="actions">
            <div class="annonce-info">
                <h2><a><span>{$annonce.A_cout_loyer}</span><small>Loyer (€)</small></a></h2>
                <h2><a><span>{$annonce.A_type}</span><small>Type</small></a></h2>
            </div>
            <div class="desc"><span>{$annonce.A_description}</span></div>
        </div>
    </div>
</div>