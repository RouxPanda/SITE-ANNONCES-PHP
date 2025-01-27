{include file='templates/header.tpl'}

<section style="min-height: 80vh;">
    <div>
        <div class="row">
            <div class="container">
                <div class="row">
                    {if isset($smarty.session.mail) && $datas['A_auteur'] == $smarty.session.mail}
                    <div class="col" style=" text-align:right;">
                        <a href="{base_url()}/Annonce/edit/{$datas['A_idannonce']}"><i class="fas fa-edit" style="font-size: 40px; color:#ff941b; padding-right:30px;"></i></a>
                    </div>
                    {/if}
                </div>
                <div id="carousel-1" class="carousel slide" data-ride="carousel" style="margin: 0px;margin-top: 10px; margin-bottom: 33px; width: 65%;margin: 0 auto;">
                    <div id="image-carrousel" class="carousel-inner">
                        {if isset($images) && is_array($images) && !empty($images)}
                        {foreach from=$images item=$img}
                        <div class="carousel-item"><img class="w-100 d-block carousel-image" src="{base_url()}/public/uploads/annonces/{$img['P_nom']}" alt="Image"></div>
                        {/foreach}
                        {else}
                        <div class="carousel-item"><img class="w-100 d-block" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" alt="Image"></div>
                        {/if}
                    </div>
                    <a class="carousel-control-prev" href="#carousel-1" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon black" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carousel-1" role="button" data-slide="next">
                        <span class="carousel-control-next-icon black" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <br>
                <h2>{$datas['A_titre']}</h2>
                <h3 style="color: var(--orange); margin-top:20px;">{$datas['A_cout_loyer']} € (Charges {$datas['A_cout_charges']} €)</h3>
                <hr style="color: var(--gray);">
                <h5>Description :</h5>
                <p style="width: 466px;text-align: left;">{$datas['A_description']}</p>
                <hr style="color: var(--gray);">
                <div class="row">
                    <div class="col" style="margin: 9px;">
                        <div style="margin: 5px;"><span><i class="fas fa-ruler" style="color: #e86900;"></i> Superficie : <b>{$datas['A_superfice']}</b></span></div>
                        <div style="margin: 5px;"><span><i class="fas fa-home" style="color: #e86900;"></i> Type : <b>{$datas['A_type']}</b></span></div>
                    </div>
                    <div class="col" style="margin: 9px;">
                        <div style="margin: 5px;"><span><i class="fas fa-fire-alt" style="color: #e86900;"></i> Chauffage : <b>{$datas['A_type_chauffage']}</b></span></div>
                        <div style="margin: 5px;"><span>{if isset($datas['A_energie'])}<i class="fas fa-bolt" style="color: #e86900;"></i> Energie : <b>{$datas['A_energie']}</b> {/if}</span></div>
                        <div></div>
                    </div>
                </div>
                <hr style="color: var(--gray);">
                <div class="row">
                    <div class="col" style="margin: 9px;">
                        <div style="margin: 5px;"><span><i class="fas fa-map-marked-alt" style="color: #e86900;"></i> Adresse : <b>{$datas['A_adresse']}, {$datas['A_ville']} - {$datas['A_CP']}</b></span></div>
                        <div style="margin: 5px;"></div>
                    </div>
                </div>
                 {if isset($smarty.session.mail) && $datas['A_auteur'] != $smarty.session.mail}
                <div class="row">
                    <div class="col" style="margin-top: 33px;"><strong><span style="font-size: 22px;font-family: Allerta, sans-serif;">Vous êtes intéresser ?&nbsp;</span></strong>
                    <a href="{base_url()}/Account/chat/{$datas['A_idannonce']}" class="btn btn-primary" type="button" style="background: linear-gradient(-9deg, rgba(255,255,255,0.27), rgb(255,107,0)), var(--orange);margin-left: 40px;margin-top: -7px;">Envoyer un message&nbsp;&nbsp;<i class="fa fa-envelope"></i></a></div>
                </div>
                {/if}
                <br>
                <hr style="color: var(--gray);">
                <div class="row centre_bas_page">
                    <div id="gmap" class="w-75 shadow"></div>
                </div>
                <br>
            </div>
        </div>
    </div>
</section>

<script>
var adresse = "{$datas['A_adresse']} , {$datas['A_ville']} {$datas['A_CP']}";
document.getElementById("gmap").innerHTML = '<iframe style="width: 100%; height: 500px;" src="https://maps.google.com/maps?amp;hl=en&amp;q=%27'+adresse+'%27+(titre)&amp;ie=UTF8&amp;t=&amp;z=16&amp;iwloc=B&amp;output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>';

let nodes = document.getElementById('image-carrousel').childNodes;
for (var i = 0; i < nodes.length; i++) {
    if (nodes[i].nodeType !== 3) {
      nodes[i].classList.add('active');
      break;
    }        
}
</script>

{include file='templates/footer.tpl'}