{include file='templates/header.tpl'}

<section>

    <div class="container">
    
        <h1 class="text-center">Utilisateurs</h1>

        <br>

        <div class="container">

            <ul class="list-group">
            {foreach from=$datas item=$user}
                <li class="list-group-item">
                    <div class="input-group" style="display:table; width:100%;">   
                        <i class="fas fa-user mr-3"></i>
                        {$user['U_pseudo']}
                        <span style="display: table-cell; width: 40px;">
                            <a class="btn btn-info" type="button" data-toggle="modal" data-target="#mailModal" data-whatever="{$user['U_mail']}"><i class="fas fa-envelope"></i></i></a>
                        </span>
                        <span style="padding-left: 5px; display: table-cell; width: 40px;">
                            <a href="{base_url()}/Admin/uedit/{$user['U_mail']}" class="btn btn-primary" type="button"><i class="fas fa-pen"></i></a>
                        </span>
                        <span style="padding-left: 5px; display: table-cell; width: 40px;">
                            <a href="{base_url()}/Admin/udelete/{$user['U_mail']}" class="btn btn-danger" type="button"><i class="fas fa-trash"></i></a>
                        </span>
                    </div>
                </li>
            {/foreach}
            </ul>
        
        </div>

    </div>

    <br>

    <div class="modal fade" id="mailModal" tabindex="-1" role="dialog" aria-labelledby="mailModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="mailModalLabel">Envoyer un mail</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{base_url()}/Admin/sendMail" method="post">
                        <div class="form-group">
                            <label for="recipient-mail" class="col-form-label">Utilisateur:</label>
                            <input type="text" class="form-control" id="recipient-mail" name="dest">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="message-text" name="msg"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Send message</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
    $('#mailModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var recipient = button.data('whatever');
        var modal = $(this);
        modal.find('.modal-body input').val(recipient);
    });
    </script>

</section>

{include file='templates/footer.tpl'}
