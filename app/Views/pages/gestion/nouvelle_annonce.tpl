{include file='templates/header.tpl'}
<section>
        <div class="row">
            <div class="col">
                <h1 style="text-align: center;margin-top: 60px;margin-bottom: 42px;">Nouvelle annonce</h1>
            </div>
        </div>
        <form>
            <div style="box-shadow: 0px 2px 5px 2px rgba(0,0,0,0.4);">
                <div class="form-row">
                    <div class="col" style="margin-left: 33px;margin-right: 10px;">
                        <div class="form-group"><label style="margin: 8px;margin-top: 12;">Titre</label><input class="form-control" type="text" style="width: 50%;"></div>
                        <div class="form-group"><label style="margin: 8px;margin-top: 12;">Description</label><input class="form-control" type="text" style="padding-bottom: 100px;width: 80%;"></div>
                        <div class="form-group"><label style="margin: 8px;margin-top: 12;">Loyer</label><input class="form-control" type="number" style="padding-left: 8px;width: 50%;"></div>
                        <div class="form-group"><label style="margin: 8px;margin-top: 12;">Coût charges</label><input class="form-control" type="number" style="padding-left: 8px;width: 50%;"></div>
                    </div>
                    <div class="col" style="margin-right: 33px;margin-left: 10px;">
                        <div class="form-group">
                            <div class="col"><label class="col-form-label" style="margin: 8px;margin-top: 12;">Photos :</label></div>
                            <div class="col" style="margin: 0px;"><input type="file" style="margin: 10px;"><input type="file" style="margin: 10px;"><input type="file" style="margin: 10px;"></div>
                        </div>
                        <div class="form-group"><label style="margin: 8px;margin-top: 12;">Superficie&nbsp;</label><input class="form-control" type="number" style="padding-left: 8px;width: 50%;" placeholder="m³"></div>
                        <div class="form-group"><label style="margin: 8px;margin-top: 12;">Chauffage</label><select class="form-control" style="width: 50%;">
                                <optgroup>
                                    <option value="12" selected="">Individuel</option>
                                    <option value="13">Collectif</option>
                                </optgroup>
                            </select></div>
                    </div>
                </div>
                <hr style="width: 50%;">
                <div class="form-row">
                    <div class="col" style="margin-left: 33px;margin-right: 10px;">
                        <div class="form-group"><label style="margin: 8px;margin-top: 12;">Adresse</label><input class="form-control" type="text" style="width: 50%;"></div>
                        <div class="form-group"><label style="margin: 8px;margin-top: 12;">Ville</label><input class="form-control" type="text" style="width: 25%;"></div>
                        <div class="form-group"><label style="margin: 8px;margin-top: 12;">Code postal</label><input class="form-control" type="number" style="padding-left: 8px;width: 25%;" min="0" max="99999"></div>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-xl-12" style="margin-top: 48px;margin-bottom: 42px;margin-left: 34px;"><button class="btn btn-primary" type="button" style="background: #ff763b;font-size: 18px;">Publier</button></div>
            </div>
        </form>
</section>

    {include file='templates/footer.tpl'}