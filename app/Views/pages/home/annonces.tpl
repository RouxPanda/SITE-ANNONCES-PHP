{include file='templates/header.tpl'}

    <section style="min-height: 80vh;">
        <div class="row centre_bas_page"  style="margin-top:20px; margin-bottom:20px;">
            <form class="custom-form" action="{base_url()}/Home/search" method="get" style="width:40%;">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <button class="input-group-text cyan lighten-2" type="submit" id="basic-text1">
                            <i class="fas fa-search text-white" aria-hidden="true"></i></button>
                    </div>
                    <input class="form-control my-0 py-1" type="text" name="rchr" placeholder="Recherche" aria-label="Recherche">
                </div>
                <div class="row" style="margin-left:30px;">
                    <form class="display" style="margin:5px; width:40%;">
                        <div class="row">
                            <div class="col-5 no-gutters">
                                <label >Loyer</label>
                                <input name="loyer_min" class="form-control-sm " type="number" placeholder="Min" style="width:30%">
                                <input name="loyer_max" class="form-control-sm " type="number" placeholder="Max" style="width:30%">
                            </div>
                            <div class="col-3 no-gutters">
                                <input type="text" class="form-control-sm  bar_recherche" name="ville" placeholder="Ville">
                            </div>
                            <div class="col no-gutters">
                                <label>Type</label>
                                <select name="type" name="type" class="form-control-sm ">
                                    <optgroup>
                                        <option value="" {if !isset($data)}selected{/if} {if isset($data) && $data['A_type'] == 'T1'}selected{/if}>Tout</option>
                                        <option value="T1">T1</option>
                                        <option value="T2">T2</option>
                                        <option value="T3">T3</option>
                                        <option value="T4">T4</option>
                                        <option value="T5">T5</option>
                                        <option value="T6">T6</option>
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                        <div class="row" style="margin-top:5px">
                            <div class="col no-gutters">
                                <label >Chauffage</label>
                                <select name="chauffage" class="form-control-sm">
                                    <optgroup>
                                        <option value="">Tout</option>
                                        <option value="individuel">Individuel</option>
                                        <option value="collectif">Collectif</option>
                                    </optgroup>
                                </select>
                            </div>
                                <div class="col no-gutters">
                                    <label >Superficie</label>
                                    <input name="super_min" class="form-control-sm " type="number" placeholder="Min" style="width:30%">
                                    <input name="super_max" class="form-control-sm " type="number" placeholder="Max" style="width:30%">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </form>
        </div>
        <div class="row">
            <div class="col"></div>
            <div class="col-8">
                <div class="row" style="text-align: left;">                
                    {foreach from=$datas item=$annonce}
                        {include file='templates/annonce.tpl'}
                    {/foreach}
                </div>
            </div>
            <div class="col"></div>
        </div>
        <div class="row centre_bas_page" style="margin-top:30px; margin-bottom:60px;">
            {if $numero>0}
                <a href="{base_url()}/Home/annonces/{$numero-1}">
                    <button class="btn btn-primary" style="font-size: 20px; border:none; background:orange;" type="button"><i class="fas fa-chevron-left"></i></button>
                </a>
            {/if}
            <button class="btn btn-primary" style="font-size: 20px; border:none; background:orange;margin-left:15px; margin-right:15px;" type="button">{$numero}</button>
            {if $numero*15 <= $total && $total >= 15}
                <a href="{base_url()}/Home/annonces/{$numero+1}">
                    <button class="btn btn-primary" style="font-size: 20px; border:none; background:orange;" type="button"><i class="fas fa-chevron-right"></i></button>
                </a>
            {/if}
        </div>
    </section>

{include file='templates/footer.tpl'}
