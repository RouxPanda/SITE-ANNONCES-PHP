{include file='templates/header.tpl'}

    <section>
        <div class="row centre_bas_page">
            <form class="custom-form" action="{base_url()}/Home/annonces" method="post" style="width:40%;">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <button class="input-group-text cyan lighten-2" type="submit" id="basic-text1">
                            <i class="fas fa-search text-white" aria-hidden="true"></i></button>
                    </div>
                    <input class="form-control my-0 py-1" type="text" name="rchr" placeholder="Recherche" aria-label="Recherche">
                    <div class="input-group-prepend btn-group">
                      <button type="button" class="btn btn-secondary" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class='fas fa-angle-down'></i>
                      </button>
                      <div class="dropdown-menu dropdown-menu-right keep-open" style="width:200px;">
                        <form class="px-4 py-3 display" style="margin:5px;">
                            <div class="form-group">
                              <label>Loyer</label>
                              <div class="">
                              <input name="loyer" id="loyer" class="form-control-sm" type="number" placeholder="Min" style="width:45%">
                              <input name="loyer" id="loyer" class="form-control-sm" type="number" placeholder="Max" style="width:45%">
                              </div>
                            </div>
                            <input type="text" class="form-control" id="exampleDropdownFormPassword1" placeholder="Ville">
                            <div class="form-group"><label>Type</label><select name="type" id="type" class="form-control">
                                <optgroup>
                                    <option value="T1" {if !isset($data)}selected{/if} {if isset($data) && $data['A_type'] == 'T1'}selected{/if}>T1</option>
                                    <option value="T2">T2</option>
                                    <option value="T3">T3</option>
                                    <option value="T4">T4</option>
                                    <option value="T5">T5</option>
                                    <option value="T6">T6</option>
                                </optgroup>
                            </select></div>
                            <div class="form-group"><label>Chauffage</label><select name="chauffage" id="chauffage" class="form-control">
                                <optgroup>
                                    <option value="individuel">Individuel</option>
                                    <option value="collectif">Collectif</option>
                                </optgroup>
                            </select></div>
                            <input type="text" class="form-control" id="exampleDropdownFormPassword1" placeholder="Type chauffage">
                            <input type="text" class="form-control" id="exampleDropdownFormPassword1" placeholder="Ville">
                            <div class="form-check">
                              <input type="checkbox" class="form-check-input" id="dropdownCheck">
                              <label class="form-check-label" for="dropdownCheck">
                                Remember me
                              </label>
                            </div>
                          <button type="submit" class="btn btn-primary">Sign in</button>
                        </form>
                      </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="row" style="text-align: left">
            {foreach from=$datas item=$annonce}
                {include file='templates/annonce.tpl'}
            {/foreach}
        </div>
        <div class="row centre_bas_page" style="margin-top:30px; margin-bottom:60px;">
            {if isset($numero) && $numero>0}
            <a href="{base_url()}/Home/annonces/{$numero-1}">
                <button class="btn btn-primary" style="font-size: 20px; border:none; background:orange;" type="button"><i class="fas fa-chevron-left"></i></button>
            </a>
            {/if}
            <a style="margin-left:15px; margin-right:15px;">
                <button class="btn btn-primary" style="font-size: 20px; border:none; background:orange;" type="button">{$numero}</button>
            </a>
            {if isset($numero) && $numero*16 <= $total}
            <a href="{base_url()}/Home/annonces/{$numero+1}">
                <button class="btn btn-primary" style="font-size: 20px; border:none; background:orange;" type="button"><i class="fas fa-chevron-right"></i></button>
            </a>
            {/if}
        </div>
    </section>

{include file='templates/footer.tpl'}
