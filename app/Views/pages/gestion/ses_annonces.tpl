{include file='templates/header.tpl'}

<section>
    <div class="row register-form" >
        <div class="col-lg-2" style="height: 700px;width: 366px;">
            <div class="vertical-nav" style="background: rgb(255,255,255);width: 171px;">
                <h4 class="text-center"> </h4>
                <h4 style="color: rgb(116,116,116);">Gestion de Compte</h4>
                <ul class="vertical-nav-list">
                    <li class="vnav-li"><a class="vnav-link" href="/Account/gestion/">Son compte</a></li>
                    <li class="vnav-li"><a class="active-link vnav-link" href="/Account/gestion/ses_annonces">Ses annonces</a></li>
                    <li class="vnav-li"><a class="vnav-link" href="/Account/gestion/chat">Message</a></li>
                    <li class="vnav-li"><a class="vnav-link" href="/Account/deconnexion">Déconnexion</a></li>
                </ul>
            </div>
        </div>
        <section></section>
    </div>
</section>

{include file='templates/footer.tpl'}
