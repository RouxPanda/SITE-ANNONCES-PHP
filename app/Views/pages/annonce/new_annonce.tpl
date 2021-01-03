{include file='templates/header.tpl'}

<section>
    <div class="row">
        <div class="col">
            <h1 style="text-align: center;margin-top: 60px;margin-bottom: 42px;">Nouvelle annonce</h1>
        </div>
    </div>
    <div class="container">
        <div style="box-shadow: 0px 2px 5px 2px rgba(0,0,0,0.4);">
        <form action="{base_url()}/Annonce/new" method="post">

            <br>

            <div class="form-row">
                <div class="col" style="margin-left: 30px;margin-right: 30px;">
                    <div class="form-group"><label>Titre</label><input name="titre" id="titre" class="form-control" type="text"></div>
                    <div class="form-group"><label>Description</label><input name="desc" id="desc" class="form-control" type="text"></div>
                    <div class="form-group"><label>Loyer</label><input name="loyer" id="loyer" class="form-control" type="number"></div>
                    <div class="form-group"><label>Coût charges</label><input name="cout_charge" id="cout_charge" class="form-control" type="number"></div>
                </div>
            </div>

            <hr style="width: 50%;">

            <div class="form-row">
                <div class="col" style="margin-left: 30px;margin-right: 30px;">
                    <div class="form-group"><label class="col-form-label">Photos</label></div>
                    <div class="form-group"><input type="file" style="margin: 10px;"><input type="file" style="margin: 10px;"><input type="file" style="margin: 10px;"></div>
                </div>
            </div>

            <hr style="width: 50%;">

            <div class="form-row">
                <div class="col" style="margin-left: 30px;margin-right: 30px;">
                    <div class="form-group"><label>Type</label><select name="type" id="type" class="form-control">
                        <optgroup>
                            <option value="T1" selected="">T1</option>
                            <option value="T2">T2</option>
                            <option value="T3">T3</option>
                            <option value="T4">T4</option>
                            <option value="T5">T5</option>
                            <option value="T6">T6</option>
                        </optgroup>
                    </select>
                    </div>
                    <div class="form-group"><label>Superficie</label><input name="superficie" id="superficie" class="form-control" type="number" placeholder="m²"></div>
                    <div class="form-group"><label>Chauffage</label><select name="chauffage" id="chauffage" class="form-control">
                        <optgroup>
                            <option value="Individuel" selected="">Individuel</option>
                            <option value="Collectif">Collectif</option>
                        </optgroup>
                    </select>
                    </div>
                </div>
            </div>
            <hr style="width: 50%;">

            <div class="form-row">
                <div class="col" style="margin-left: 30px;margin-right: 30px;">
                    <div class="form-group"><label>Adresse</label><input name="adresse" id="adresse" class="form-control" type="text"></div>
                    <div class="form-group"><label>Ville</label><input name="ville" id="ville" class="form-control" type="text"></div>
                    <div class="form-group"><label>Code postal</label><input name="cp" id="cp" class="form-control" type="number" min="0" max="99999"></div>
                </div>
            </div>

            <hr style="width: 50%;">

            <div class="form-row">
                <div class="col-xl-12" style="margin-bottom: 30px;margin-left: 30px;"><button class="btn btn-primary" type="submit" style="background: #ff763b;font-size: 18px;">Publier</button></div>
            </div>

        </form>
        </div>
    </div>
    <br>
</section>

{include file='templates/footer.tpl'}