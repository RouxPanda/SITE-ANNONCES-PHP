{include file='templates/header.tpl'}

<section>
    <div class="row register-form" >

        {include file='templates/manage_menu.tpl'}

        <div class="col offset-lg-0" style="height: 700px;width: 987px;">
            <div class="bg-gray padding-50" style="height: 700px;">
                <div class="container" id="system-status">
                    <h1 class="text-center">{$pseudo}</h1>
                    <hr style="height: 5px; color: #ff763b; background-color: #878787 ; width: 10%; border: none;">
                    <div class="system-status">
                        <div class="row">
                            <div class="col-md-6">
                                <h2>Vue d'ensemble</h2>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>Vu totales</td>
                                                <td>$chiffre</td>
                                            </tr>
                                            <tr>
                                                <td>Annonces en ligne</td>
                                                <td>$chiffre</td>
                                            </tr>
                                            <tr>
                                                <td>J'ai plus d'idée mdr</td>
                                                <td>Online</td>
                                            </tr>
                                            <tr>
                                                <td>Datacenter (East)</td>
                                                <td>Recovering...</td>
                                            </tr>
                                            <tr>
                                                <td>Datacenter (West)</td>
                                                <td>Offline</td>
                                            </tr>
                                            <tr>
                                                <td>Network </td>
                                                <td>Online</td>
                                            </tr>
                                            <tr>
                                                <td>Notification System</td>
                                                <td>Online</td>
                                            </tr>
                                            <tr>
                                                <td>Monitoring System</td>
                                                <td>Online</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-6 offset-lg-0">
                                <h2>Dernière annonce</h2>
                                <div class="card">
                                    <div class="card-body">
                                        <h3>Application </h3>
                                        <p>We have received reports of degraded performance in one or more areas of the application and are working quickly to resolve the issue. Thank you for your patience.&nbsp; </p>
                                        <div class="latest-update-timestamp"><span><strong>February 3, 2017 @ 9:35 PM MST</strong></span></div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-body sr-only">
                                        <h3><i class="fa fa-check"></i>Web Server</h3>
                                        <div class="latest-update-timestamp"><span><strong>February 3, 2017 @ 9:35 PM MST</strong></span></div>
                                    </div>
                                </div>
                                <div class="card"></div>
                                <div class="card"></div>
                                <div class="card">
                                    <div class="card-body sr-only">
                                        <h3><i class="fa fa-check"></i>Network</h3>
                                        <div class="latest-update-timestamp"><span><strong>February 3, 2017 @ 9:35 PM MST</strong></span></div>
                                    </div>
                                </div>
                                <a href="/Annonce/new"><button class="btn btn-primary" type="button" style="margin: 0 auto;text-align: center;margin-top: 22px;color: var(--light);background: var(--orange);border-color: var(--orange);">Publier une nouvelle annonce</button></a>
                            </div>
                        </div><a href="/Account/manage/modif_info"><button class="btn btn-primary" type="button" style="text-align: center;margin-top: 22px;color: var(--light);background: var(--orange);border-color: var(--orange);">Changer son profil</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

{include file='templates/footer.tpl'}
