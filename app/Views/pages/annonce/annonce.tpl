{include file='templates/header.tpl'}

<section>
    <div>
        <div class="row">
            <div class="col"></div>
            <div class="col-xl-7" style="width: 533px;margin-top: 33px;">
                <div class="row">
                    <div class="col"><h3>{$datas['A_titre']}</h3></div>
                    {if $datas.A_auteur == $smarty.session.mail}
                    <div class="col" style=" text-align:right;">
                        <a href="{base_url()}/Annonce/modify/{$datas['A_idannonce']}"><i class="fas fa-edit" style="font-size: 40px; color:#ff941b; padding-right:30px;"></i></a>
                        <a href="#####"><i class="fas fa-trash-alt" style="font-size: 40px; color:#ff941b; padding-right:10px;""></i></a>
                    </div>
                    {/if}
                </div>
                <div class="carousel slide" data-ride="carousel" id="carousel-1" style="margin: 0px;margin-top: 33px;margin-bottom: 33px;">
                    <div class="carousel-inner">
                        <div class="carousel-item active"><img class="w-100 d-block" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" alt="Slide Image"></div>
                        <div class="carousel-item"><img class="w-100 d-block" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" alt="Slide Image"></div>
                        <div class="carousel-item"><img class="w-100 d-block" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" alt="Slide Image"></div>
                    </div>
                    <div><a class="carousel-control-prev" href="#carousel-1" role="button" data-slide="prev"><span class="carousel-control-prev-icon"></span><span class="sr-only">Previous</span></a><a class="carousel-control-next" href="#carousel-1" role="button" data-slide="next"><span class="carousel-control-next-icon" style="color: var(--blue);background: var(--light);"></span><span class="sr-only">Next</span></a></div>
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-1" data-slide-to="1"></li>
                        <li data-target="#carousel-1" data-slide-to="2"></li>
                    </ol>
                </div>
                <h3 style="color: var(--orange);">{$datas['A_cout_loyer']} € ({$datas['A_cout_charges']} €)</h3>
                <p style="width: 466px;text-align: left;">{$datas['A_description']}</p>
                <hr style="color: var(--gray);">
                <div class="row">
                    <div class="col" style="margin: 9px;">
                        <div style="margin: 5px;"><span>Superficie : {$datas['A_superficie']}</span></div>
                        <div style="margin: 5px;"><span>Type : {$datas['A_type']}</span></div>
                    </div>
                    <div class="col" style="margin: 9px;">
                        <div style="margin: 5px;"><span> Chauffage : {$datas['A_type_chauffage']}</span></div>
                        <div style="margin: 5px;"><span>{if isset($datas['A_energie'])}Energie : {$datas['A_energie']} {/if}</span></div>
                        <div></div>
                    </div>
                </div>
                <hr style="color: var(--gray);">
                <div class="row">
                    <div class="col" style="margin: 9px;">
                        <div style="margin: 5px;"><span>Adresse : {$datas['A_adresse']}</span></div>
                        <div style="margin: 5px;width: 618px;margin-left: 72px;"><span style="margin-right: 20px;">{$datas['A_ville']}</span>
                        <span>{$datas['A_CP']}</span></div>
                        <div style="margin: 5px;"></div>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 50px;">
                    <div class="col" style="margin-top: 33px;"><strong><span style="font-size: 22px;font-family: Allerta, sans-serif;">Vous êtes intéresser ?&nbsp;</span></strong>
                    <button class="btn btn-primary" type="button" style="background: linear-gradient(-9deg, rgba(255,255,255,0.27), rgb(255,107,0)), var(--orange);margin-left: 40px;margin-top: -7px;">Envoyer un message&nbsp;&nbsp;<i class="fa fa-envelope"></i></button></div>
                </div>
            </div>
            <div class="col"></div>
        </div>
    </div>
</section>

{include file='templates/footer.tpl'}