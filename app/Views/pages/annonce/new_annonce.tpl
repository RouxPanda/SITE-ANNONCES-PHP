{include file='templates/header.tpl'}

<section style="min-height: 80vh;">
    <div class="row">
        <div class="col">
            <h1 style="text-align: center;margin-top: 60px;margin-bottom: 42px;">
            {if isset($data)}
                Modifier Annonce
            {else}
                Nouvelle Annonce
            {/if}
            </h1>
        </div>
    </div>
    <div class="container">
        <div style="box-shadow: 0px 2px 5px 2px rgba(0,0,0,0.4);">
        <form action="{base_url()}/Annonce/{if isset($data)}edit/{$data['A_idannonce']}{else}new{/if}" method="post"  enctype="multipart/form-data">

            <br>

            <div class="form-row">
                <div class="col" style="margin-left: 30px;margin-right: 30px;">
                    <div class="form-group"><label>Titre</label><input name="titre" id="titre" class="form-control" type="text" value="{if isset($data)}{$data['A_titre']}{/if}"></div>
                    <div class="form-group"><label>Description</label><input name="desc" id="desc" class="form-control" type="text" value="{if isset($data)}{$data['A_description']}{/if}"></div>
                    <div class="form-group"><label>Loyer</label><input name="loyer" id="loyer" class="form-control" type="number" value="{if isset($data)}{$data['A_cout_loyer']}{/if}"></div>
                    <div class="form-group"><label>Coût charges</label><input name="cout_charge" id="cout_charge" class="form-control" type="number" value="{if isset($data)}{$data['A_cout_charges']}{/if}"></div>
                </div>
            </div>

            <hr style="width: 50%;">

            <div class="form-row">
                <div class="col" style="margin-left: 30px;margin-right: 30px;">
                    <div class="form-group"><label class="col-form-label">Photos</label></div>
                    <div class="form-group">
                        <input type="file" name="images[]" id="images" accept="image/*" multiple onchange="checkFiles(this.files)"/>
                    </div>
                    <div class="row">
                        <div id="images-preview" class="images-preview text-center col">
                            {if isset($images) && is_array($images) && !empty($images)}
                            {foreach from=$images item=$img}
                                <img height="100px" style="margin: 5px;" src="{base_url()}/public/uploads/annonces/{$img['P_nom']}" />
                            {/foreach}
                            {/if}
                        </div>
                    </div>
                </div>
            </div>

            <hr style="width: 50%;">

            <div class="form-row">
                <div class="col" style="margin-left: 30px;margin-right: 30px;">
                    <div class="form-group"><label>Type</label><select name="type" id="type" class="form-control">
                        <optgroup>
                            {if isset($types)}
                            {foreach from=$types item=$type}
                                <option value="{$type['T_type']}" {if isset($data) && $data['A_type'] == $type['T_type']}selected{/if} >{$type['T_type']}</option>
                            {/foreach}}
                            {/if}
                        </optgroup>
                    </select>
                    </div>
                    <div class="form-group"><label>Superficie</label><input name="superficie" id="superficie" class="form-control" type="number" placeholder="m²" value="{if isset($data)}{$data['A_superfice']}{/if}"></div>
                    <div class="form-group"><label>Chauffage</label><select name="chauffage" id="chauffage" class="form-control" onchange="showEDiv('energie_div', this)">
                        <optgroup>
                            <option value="individuel" {if !isset($data)}selected{/if} {if isset($data) && $data['A_type_chauffage'] == 'individuel'}selected{/if}>Individuel</option>
                            <option value="collectif" {if isset($data) && $data['A_type_chauffage'] == 'collectif'}selected{/if}>Collectif</option>
                        </optgroup>
                    </select></div> 
                    <div id="energie_div" class="form-group" {if isset($data) && $data['A_type_chauffage'] == 'collectif'}style="display: none;"{/if}><label>Energie</label><select name="energie" id="energie" class="form-control">
                        <optgroup>
                            {if isset($energies)}
                            {foreach from=$energies item=$energy}
                                <option value="{$energy['E_id_engie']}" {if isset($data) && $data['A_energie'] == $energy['E_id_engie']}selected{/if} >{$energy['E_description']}</option>
                            {/foreach}}
                            {/if}
                        </optgroup>
                    </select>
                    </div>
                </div>
            </div>
            <hr style="width: 50%;">

            <div class="form-row">
                <div class="col" style="margin-left: 30px;margin-right: 30px;">
                    <div class="form-group"><label>Adresse</label><input name="adresse" id="adresse" class="form-control" type="text" value="{if isset($data)}{$data['A_adresse']}{/if}"></div>
                    <div class="form-group"><label>Ville</label><input name="ville" id="ville" class="form-control" type="text" value="{if isset($data)}{$data['A_ville']}{/if}"></div>
                    <div class="form-group"><label>Code postal</label><input name="cp" id="cp" class="form-control" type="text" value="{if isset($data)}{$data['A_CP']}{/if}"></div>
                </div>
            </div>

            <hr style="width: 50%;">

            <div class="form-row">
                <div class="col-xl-12" style="margin-bottom: 30px;margin-left: 30px;"><button class="btn btn-primary" type="submit" name="action" value="2" style="background: #ff763b;font-size: 18px;">
                {if isset($data)}
                    Mettre a jour </button>
                {else}
                    Publier </button>
                    <button class="btn btn-primary" type="submit" name="action" value="1" style="background: #ff763b;font-size: 18px; margin-left:30px;">Laisser en brouillon</button>
                {/if}
                
                </div>
            </div>

        </form>
        </div>
    </div>
    <br>
</section>

<script>
function showEDiv(divId, element) {
    document.getElementById(divId).style.display = element.value == 'collectif' ? 'none' : 'block';
}


function checkFiles(files) {
    document.getElementById("images-preview").innerHTML = '';

    let max = 5;  
    if(files.length>max) {
        alert("Vous ne pouvez choisir que " + max + " images !");
        let list = new DataTransfer;
        document.getElementById('images').files = list.files
    }else{
        let filesAmount = files.length;
        for (i = 0; i < filesAmount; i++) {
            var reader = new FileReader();
            reader.onload = function(event) {
                $($.parseHTML('<img>')).attr('src', event.target.result).attr('height', '100px').attr('style', 'margin: 5px;').appendTo('div.images-preview');
            }

            reader.readAsDataURL(files[i]);
        }
    }       
}
</script>

{include file='templates/footer.tpl'}