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
                <a href="#" class="list-group-item list-group-item-action {if isset($current) && $current == $ann['idannonce']}active{/if}" aria-current="true">
                  <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">{$ann['A_titre']}</h5>
                  </div>
                </a>
                {/foreach}
                {/if}
              </div>
            </div>
            <div class="col">
              <div class="messaging">
                  <div class="inbox_msg">
                    <div class="mesgs">
                        <div class="incoming_msg">
                            <div class="received_msg">
                            <div class="received_withd_msg">
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                            </div>
                            </div>
                        </div>
                        <div class="outgoing_msg">
                            <div class="sent_msg">
                            <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
                            </div>
                        </div>
                        <div class="incoming_msg">
                            <div class="received_msg">
                            <div class="received_withd_msg">
                                <p>Test, which is a new approach to have</p>
                                </div>
                            </div>
                        </div>
                        <div class="outgoing_msg">
                            <div class="sent_msg">
                            <p>Apollo University, Delhi, India Test</p>
                            </div>
                        </div>
                        <div class="incoming_msg">
                            <div class="received_msg">
                            <div class="received_withd_msg">
                                <p>We work directly with our designers and suppliers,
                                and sell direct to you, which means quality, exclusive
                                products, at a price anyone can afford.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                  </div>
              </div>

              <form method="post" style="margin-top:5px;">
                <div class="input-group mb-3">
                  <input type="text" class="form-control" placeholder="Votre message ..."  aria-describedby="send-btn">
                  <button class="btn btn-outline-secondary" type="button" id="send-btn"><i class="fas fa-paper-plane"></i></button>
                </div>
              </form>

            </div>

          </div>

        </div>

        <br>

    </div>
</section>

{include file='templates/footer.tpl'}
