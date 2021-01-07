{include file='templates/header.tpl'}

<section>
    <div class="container" >

        {include file='templates/manage_menu.tpl'}
        <br>
        
        <div class="container">
          
          <div class="row">
            <div class="col-4">
              <div class="list-group">
                {if isset($convs) && is_array($convs)}
                {foreach from=$convs item=$ann}
                <a href="{base_url()}/Account/chat/{$ann['id']}{if isset($ann['dest'])}{$ann['dest']}{/if}" class="list-group-item list-group-item-action {if isset($current) && $current == $ann['id']}active{/if}" aria-current="true">
                  <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">{$ann['titre']}</h5>
                    
                  </div>
                  <p class="mb-1">s</p>
                </a>
                {/foreach}
                {/if}
              </div>
            </div>
            <div class="col">
              <div class="messaging">
                  <div class="inbox_msg">
                    <div class="mesgs w-100">
                        {if isset($msgs) && isset($smarty.session.mail)}
                          {foreach from=$msgs item=$msg}
                            {if $msg['M_mail'] == $smarty.session.mail}
                            <div class="outgoing_msg">
                                <div class="sent_msg">
                                    <p>{$msg['M_texte_message']}</p>
                                </div>
                            </div>
                            {else}
                            <div class="incoming_msg">
                                <div class="received_msg">
                                <div class="received_withd_msg">
                                    <p>{$msg['M_texte_message']}</p>
                                </div>
                                </div>
                            </div>
                            {/if}
                          {/foreach}
                        {/if}
                    </div>
                  </div>
              </div>

              <form method="post" action="{base_url()}/Account/post_msg" style="margin-top:5px;">
                <div class="input-group mb-3">
                  <input type="hidden" name="dest" value="{if isset($dest)}{$dest}{/if}" />
                  <input type="hidden" name="id" value="{if isset($id)}{$id}{/if}" />
                  <input type="text" name="msg" class="form-control" placeholder="Votre message ..."  aria-describedby="send-btn" />
                  <button class="btn btn-outline-secondary" type="submit" id="send-btn"><i class="fas fa-paper-plane"></i></button>
                </div>
              </form>

            </div>

          </div>

        </div>

        <br>

    </div>
</section>

{include file='templates/footer.tpl'}
