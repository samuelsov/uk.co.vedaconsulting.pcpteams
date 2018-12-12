{if $is_edit_page}
<div class="pcp-public-page"><p>{ts 1=$publicUrl}Vous pouvez modifier votre image ansi que le titre ou la description de votre page en cliquant sur l'élément correspondant et visualiser les changements en retournant sur <a href="%1">votre page publique</a>.{/ts}</p></div>
{/if}
<div class="crm-pcp-manage">

  <div class="pcp-profile row">

    <div class="pcp-avatar col-md-8">
        <div class="title">
          <span class="title-prefix">Encouragez</span>
          <span class="title-infix">{$contactName}</span>
        </div>
        <div class="avatar">
          <img height="220" id="{$pcpinfo.image_id}" {if $is_edit_page} class="crm-pcp-inline-pic-edit" {/if} href="{$updateProfPic}" src="{$pcpinfo.image_url}">
        </div>
    </div><!-- pcp-avatar -->

    <div class="pcp-donate col-md-4">

      <div class="raised-total">
        <div class="label"><span class="text">{*ts}Raised so far{/ts*}Montant amassé</span></div>
        <div class="amount">{$pcpinfo.amount_raised|crmMoney:$pcpInfo.currency}</div>
      </div> 
      <div class="target">
        <div class="label"><span class="text">{*ts}Of target{/ts*}Objectif</span></div>
        <div id="pcp_goal_amount" class="amount {if 0 && $is_edit_page}crm-pcp-inline-text-edit{/if}" data-placeholder="Goal Amount">{$pcpinfo.goal_amount|crmMoney:$pcpInfo.currency}</div>
      </div>
      <div class="button">
        <a class="btn btn-lg" href="{$pcpinfo.donate_url}"><span id="donate_link_text" data-placeholder="name of he button">{*ts}Donate{/ts*}DON</span></a>
      </div>
    </div><!-- pcp-donate -->

  </div><!-- pcp-profile -->

  <!-- End header-->

  <div class="pcp-details row">

    <div class="pcp-etc col-md-8">

      <div class="pcp-information">
        <h2 id="pcp_title" class="title {if $is_edit_page}crm-pcp-inline-text-edit{/if}" data-placeholder="Page Title">{$pcpinfo.title}</h2>
      <!-- BIO section -->
      {*
        <div id="pcp_intro_text" {if $is_edit_page}class="intro-text crm-pcp-inline-text-edit" data-edit-params='{ldelim}"cid": "{$contactId}", "class_name": "CRM_Contact_Form_Inline_ContactInfo"{rdelim}' {else} class="intro-text" {/if} data-placeholder="Intro Text">{$pcpinfo.intro_text}</div>
      *}
        <div id="pcp_page_text" class="page-text {if $is_edit_page}crm-pcp-inline-text-edit{/if}" data-placeholder="Page Description">{$pcpinfo.page_text}</div>
      <!-- BIO section ends -->
      </div><!--pcp-information-->

    {if $pcpinfo.team_pcp_id}
      <div class="pcp-members">
        <div class="mem-header">
          <h2>Mon équipe</h2>
        </div>
        <div class="button">
          <a class="btn btn-lg" href="{crmURL p="civicrm/pcp/manage" q="id=`$pcpinfo.team_pcp_id`"}">Voir la page de l'équipe</a>
        </div>
      </div><!--pcp-members-->
    {/if}

    {if $pcpinfo.is_teampage}
      <div class="pcp-members">
        <div class="mem-header">
          <h2>{*ts}Team Members{/ts*}Notre équipe</h2>
        </div>
        <table class="mem-body">
          {foreach from=$teamMemberInfo item=memberInfo}
          <tr class="mem-row">
{*
            <div class="mem-body-row action">
              Remove link(admin)
            </div> 
*}
            <td class="mem-body-row avatar" width="45">
              <img width="35" height="35" src="{$memberInfo.image_url}">
            </td>
            <td class="mem-body-row name">
              <strong><a href="{crmURL p="civicrm/pcp/manage" q="id=`$memberInfo.pcp_id`"}">{$memberInfo.display_name}</a> </strong>
              {if $memberInfo.is_team_admin}
                <br /><small>{*ts}( Team Admin ){/ts*}Capitaine de l'équipe</small>
              {/if}
            </td>
{*
            <td class="mem-body-row- pcp-progress">
              <span>{$memberInfo.donations_count} Donations</span>
              <div class="pcp-bar">
                <div class="pcp-bar-progress" style="width: {$memberInfo.percentage}%;" title="{$memberInfo.percentage}%">
                </div>
              </div>
            </td>
*}
            <td class="mem-body-row raised">
              {$memberInfo.amount_raised|crmMoney}
            </td>
          </tr>
          {/foreach}
        </table><!-- mem-body ends -->

      </div><!--pcp-members-->
    {/if}

      <div class="pcp-donators">
        <h2>Nos donateurs et supporteurs</h2>

        
        {foreach from=$donationInfo item=donations}
          <div class="top-donations">
            <strong>{$donations.nickname}</strong> a fait un don de {$donations.total_amount}
            {if $donations.personal_note}
            <blockquote><span class="quot">«&#160;</span>{$donations.personal_note}<span class="quot">&#160;»</span></blockquote>
            {/if}
          </div>
        {/foreach}
      </div><!--pcp-donators-->

    {if $pcpinfo.pending_team_pcp_id}
          <div class="team-section">
            <h3>{ts}(You have Team Request waiting for approval){/ts}</h3>
            <div class="waiting-approval">
              <div class="avatar">
               <img width="75" height="75" src="{$pendingApprovalInfo.image_url}">
              </div>
              <div class="team-info">
                <h3>{$pendingApprovalInfo.title}</h3>
                <p>{$pendingApprovalInfo.intro_text}</p>
              </div>
              <div class="team-stats">
                <div class="raised-total">
                  <span class="amount">{$pendingApprovalInfo.amount_raised|crmMoney:$pendingApprovalInfo.currency}</span>
                  <div class="raised"><span class="text">{ts}Raised so far{/ts}</span></div>
                </div>
                <div class="target">
                  <span class="text">{ts}Of target{/ts}</span>
                  <div id="pcp_goal_amount" class="amount">{$pendingApprovalInfo.goal_amount|crmMoney:$pendingApprovalInfo.currency}</div>
                </div>
              </div>
              <div class="clear"></div>
            </div>
            <div class="pending-team-buttons">
              <a class="pcp-button pcp-btn-red crm-pcp-alert-cancel-pending-request" href="javascript:void(0)" data-entity-id={$pendingApprovalInfo.relationship_id} data-pcp-id={$pcpinfo.pcp_id} data-teampcp-id={$pcpinfo.pending_team_pcp_id}>{ts}Withdraw Request{/ts}</a>
            </div>
          </div><!--team-section-->
    {elseif $pcpinfo.is_teampage && $is_member}
{*
      <div class="team-buttons">
        <a class="pcp-button pcp-btn-brown crm-pcp-inline-team-edit" href="{$inviteTeamURl}">{ts}Invite Team Members{/ts}</a>
        {if !$is_edit_page}
        <a class="pcp-button pcp-btn-brown crm-pcp-alert-leave-team" href="javascript:void(0)" data-user-id={$userId} data-teampcp-id={$pcpinfo.id}>{ts}Leave Team{/ts}</a>
        {/if}
       </div><!--team-buttons-->
*}
    {/if}
    
    </div><!--pcp-etc-->

    <div class="pcp-indicator col-md-4">
    {if $pcpinfo.team_pcp_id}
      <p>Évolution de ma collecte de fonds</p>
    {else}
      <p>La progression de notre collecte de fonds</p>
    {/if}
      <div class="meter">
        <div class="meter-raised">
        <span>Collecté:</span> <strong>{$pcpinfo.amount_raised|crmMoney:$pcpInfo.currency}</strong>
        </div>
        <div class="meter-visual">
        </div>
        <div class="meter-goal">
        <span>Objectif:</span> <strong>{$pcpinfo.goal_amount|crmMoney:$pcpInfo.currency}</strong>
        </div>
      </div><!--meter-->
{*
    <div id="pcp-progress" class="pcp-progress">
      <span class="stat-num"><strong><i>%</i></strong></span>
      <div class="circle">
      </div>
    </div>
*}
     {*math assign="percent" equation="100*(raised/goal)" raised=$pcpinfo.amount_raised goal=$pcpinfo.goal_amount format="%.1f"*}
    {if $pcpinfo.team_pcp_id}
      <p>J'ai collecté<br /><strong>{$percent}&#160;%</strong> de mon objectif!</p> 
    {else}
        <p>Nous avons collecté<br /><strong>{$pcpinfo.percentage}&#160;%</strong> de notre objectif!</p> 

    {/if}
    </div><!--pcp-indicator-->
{literal}
<script>
CRM.$(function($) {
  $('.meter-visual').jQMeter({
    goal:'{/literal}{$pcpinfo.goal_amount}{literal}',
    raised:'{/literal}{$pcpinfo.amount_raised}{literal}',
    meterOrientation:'vertical',
    width:'20px',
    height:'200px',
    bgColor:'#eef1f6',
    barColor:'#e0001a',
    displayTotal: false,
    animationSpeed:500
  });
});
</script>
{/literal}

  </div><!--pcp-details-->

</div><!--crm-pcp-manage-->

<div class="clear"></div>

{literal}
<script type="text/javascript">
CRM.$(function($) {
  var apiUrl = {/literal}"{crmURL p='civicrm/ajax/rest' h=0 q='className=CRM_Pcpteams_Page_AJAX&fnName=inlineEditorAjax&snippet=6&json=1'}";{literal}
  var editparams = {
    type      : 'text',
    //cssclass  : 'crm-form-textarea',
    //style     : 'inherit',
    cancel    : 'Annuler',
    submit    : 'Sauvegarder',
    submitdata: {pcp_id: {/literal}{$pcpinfo.id}{literal}},
    tooltip   : ts('Cliquer pour éditer...'),
    indicator : ts('Sauvegarde en cours...'),
    callback  : function( editedValue ){
       var editedId = cj(this).attr('id');
       $(this).html(editedValue);
       //$(this).css("background", "#F7F6F6");
       $(this).css("border", "none");
     }
  }

  // inline text edit
  //#3515 Now we display editable field placholder of each
  $('.crm-pcp-inline-text-edit').each(function(){
    editparams['placeholder'] = ts('Click to edit ') + $(this).attr('data-placeholder');
    editparams['tooltip'] = ts('Click to edit ') + $(this).attr('data-placeholder');
    $(this).editable(apiUrl, editparams);
  });
  // $('.crm-pcp-inline-text-edit').editable(apiUrl, editparams);
  $('.crm-pcp-inline-text-edit').mouseover(function(){
    //$(this).css("background", "#E5DEDE");
    $(this).css("border", "2px dashed #c4c4c4");
    $(this).css("border-radius", "10px");
  });
  $('.crm-pcp-inline-text-edit').mouseout(function(){
    //$(this).css("background", "#F7F6F6");
    $(this).css("border", "none");
  });

  // inline text edit for buttons
  editparams['callback'] = function( editedValue ){
    var editedId = cj(this).attr('id');
    $(this).html(editedValue);
    $(this).css("background", "#e0001a");
    $(this).css("border", "none");
  }
  //#3515 Now we display editable field placholder of each
  $('.crm-pcp-inline-btn-edit').each(function(){
    editparams['placeholder'] = ts('Cliquer pour éditer ') + $(this).attr('data-placeholder');
    editparams['tooltip'] = ts('Cliquer pour éditer ') + $(this).attr('data-placeholder');
    $(this).editable(apiUrl, editparams);
  });  
  // $('.crm-pcp-inline-btn-edit').editable(apiUrl, editparams);
  $('.crm-pcp-inline-btn-edit').mouseover(function(){
    $(this).css("background", "rgb(19, 18, 18)");
    $(this).css("border", "2px dashed #c4c4c4");
    $(this).css("border-radius", "10px");
  });
  $('.crm-pcp-inline-btn-edit').mouseout(function(){
    $(this).css("background", "#e0001a");
    $(this).css("border", "none");
  });

  // team member request block show/hide
  $('.member-req-block').hide();
  $('#showMemberRequests').on('click', function() {
    $('.member-req-block').show('slow');
    $(this).parent().parent().hide();
  });
  
  //inline Create, Invite and Join Team 
  $('.crm-pcp-inline-team-edit').on('click', function(ev){
    ev.preventDefault();
    var url   = cj(this).attr('href');
    var title = 'Join Team';
    if (url) {
      CRM.loadForm(url, {
        dialog: {width: 650, height: 'auto', title: title, show: 'drop', hide: "drop"}
      }).on('crmFormSuccess', function(e, data) {
        if (typeof(data.crmMessages) == 'object') {
          // swtich off civi's status popup loader
          $(document).off('ajaxSuccess');
          // use pcp's status message display method
          $.each(data.crmMessages, function(n, msg) {
            var pcpMessage = "<div class='pcp-info pcp-message'><h3>" + msg.title + "</h3><p>" + msg.text + "</p></div>";
            $('.pcp-messages').html('');
            $(pcpMessage).appendTo('.pcp-messages').show('slow');
          });
        }
      });
    }
  });
  
  // profile image inline edit
  $('.crm-pcp-inline-pic-edit').on('click', function(ev){
    var url = $(this).attr('href');
    var fileid = $(this).attr('id');
    if(fileid){
      url = url + '&fileid=' + fileid;
    }
    if (url) {
      CRM.loadForm(url, {
        dialog: {width: 500, height: 'auto', show: 'drop', hide: "drop"}
      }).on('crmFormSuccess', function(e, data) {
        $(document).ajaxStop(function() { 
          location.reload(true); 
          //DS FIXME: avoid loading of page with url below
          //$('.crm-pcp-inline-pic-edit').attr('src','/civicrm/file?reset=1&id=9&eid=50&time=' + new Date().getTime());
        });
      });
    }
  });
  $('.crm-pcp-inline-pic-edit').mouseover(function(){
    $(this).css("background", "#E5DEDE");
    $(this).css("border", "2px dashed #c4c4c4");
    $(this).css("border-radius", "10px");
  });
  $('.crm-pcp-inline-pic-edit').mouseout(function(){
    $(this).css("background", "#F7F6F6");
    $(this).css("border", "none");
  });

  // circular progress bar
  var circleVar = {/literal}{$pcpinfo.percentage};{literal}

  /*$('.circle').circleProgress({
    value: circleVar/100,
    size: 130,
    thickness: 15,
    lineCap: "round",
    fill: {
      gradient: ["#FF0000", "#e0001a"]
    },
  }).on('circle-animation-progress', function(event, progress) {
    if ((100 * progress) <= circleVar) {
      $('#pcp-progress').find('strong').html(parseInt(100 * progress) + '<i>%</i>');
    } else {
      $('#pcp-progress').find('strong').html(parseInt(circleVar) + '<i>%</i>');
    }
  });*/
  /*
  $('.circle').jQMeter({
    goal:'100',
    raised:'10',
    meterOrientation:'vertical',
    width:'35px',
    height:'200px',
    bgColor:'#eee',
    barColor:'#e0001a',
    displayTotal:false,
    animationSpeed:500
  });

*/
  $(".crm-pcp-alert-approve-request").on('click', function(ev) {
    var $el = $(this);
    CRM.confirm({
      title: ts('{/literal}{ts escape="js"}Approuver la demande{/ts}{literal}'),
      message: ts('{/literal}{ts escape="js"}Approuve le nouveau membre?{/ts}{literal}'),
      options: {{/literal}yes: '{ts escape="js"}Oui{/ts}', no: '{ts escape="js"}Non{/ts}'{literal}},
    }).on('crmConfirm:yes', function() {
      var postUrl = {/literal}"{crmURL p='civicrm/ajax/rest' h=0 q='snippet=4&className=CRM_Pcpteams_Page_AJAX&fnName=approveTeamMember'}"{literal};
      var request = $.post(postUrl, {entity_id : $el.data('entityId'), pcp_id : $el.data('pcpId'), team_pcp_id: $el.data('teampcpId')});
      request.done(function(data) {
        setPcpMessage('Member Request Approved', 'Member Request Approved');
        $('div.member-block > div.mem-body').append(data);
        $el.closest('.mem-row').remove();
        if ($(".member-req-block > .mem-body > div").length <= 1) {
          $(".member-req-block").hide('slow');
        }
      });
    });
  });

  $(".crm-pcp-alert-decline-request").on('click', function(ev) {
    var $el = $(this);
    CRM.confirm({
      title: ts('{/literal}{ts escape="js"}Decline Request{/ts}{literal}'),
      message: ts('{/literal}{ts escape="js"}Are you sure you want to decline this request?{/ts}{literal}'),
      options: {{/literal}yes: '{ts escape="js"}Yes{/ts}', no: '{ts escape="js"}No{/ts}'{literal}},
    }).on('crmConfirm:yes', function() {
      var postUrl = {/literal}"{crmURL p='civicrm/ajax/rest' h=0 q='snippet=4&className=CRM_Pcpteams_Page_AJAX&fnName=declineTeamMember'}"{literal};
      var request = $.post(postUrl, {entity_id : $el.data('entityId'), pcp_id : $el.data('pcpId'), team_pcp_id: $el.data('teampcpId')});
      request.done(function(data) {
        setPcpMessage('Member Request Declined', 'Member Request Declined');
        $el.closest('.mem-row').remove();
        if ($(".member-req-block > .mem-body > div").length <= 1) {
          $(".member-req-block").hide('slow');
        }
      });
    });
  });

  $(".crm-pcp-alert-leave-team").on('click', function(ev) {
    var $el = $(this);
    CRM.confirm({
      title: ts('{/literal}{ts escape="js"}Leave Team{/ts}{literal}'),
      message: ts('{/literal}{ts escape="js"}Do you really want to leave the team?{/ts}{literal}'),
      options: {{/literal}yes: '{ts escape="js"}Yes{/ts}', no: '{ts escape="js"}No{/ts}'{literal}},
    }).on('crmConfirm:yes', function() {
      var postUrl = {/literal}"{crmURL p='civicrm/ajax/rest' h=0 q='snippet=4&className=CRM_Pcpteams_Page_AJAX&fnName=leaveTeam'}";{literal}
      var request = $.post(postUrl, {user_id : $el.data('userId'), team_pcp_id : $el.data('teampcpId')});
      request.done(function(data) {
        setPcpMessage('Left The Team', 'You no longer part of this team, and this page may no longer be visible to you.');
      });
    });
  });

  $(".crm-pcp-alert-cancel-pending-request").on('click', function(ev) {
    var $el = $(this);
    CRM.confirm({
      title: ts('{/literal}{ts escape="js"}Cancel Join Request{/ts}{literal}'),
      message: ts('{/literal}{ts escape="js"}Are you sure you want to withdraw your request to join this team?{/ts}{literal}'),
      options: {{/literal}yes: '{ts escape="js"}Yes{/ts}', no: '{ts escape="js"}No{/ts}'{literal}},
    }).on('crmConfirm:yes', function() {
      var postUrl = {/literal}"{crmURL p='civicrm/ajax/rest' h=0 q='snippet=4&className=CRM_Pcpteams_Page_AJAX&fnName=withdrawJoinRequest' }"{literal};
      var request = $.post(postUrl, {entity_id : $el.data('entityId'), pcp_id : $el.data('pcpId'), team_pcp_id: $el.data('teampcpId')});
      request.done(function(data) {
        setPcpMessage('Join Request Cancelled', 'Your join request to the team has been cancelled.');
        $el.closest('.team-section').remove();
      });
    });
  });

  function setPcpMessage(title, text) {
    var pcpMessage = "<div class='pcp-info pcp-message'>";
    if (title) {
      pcpMessage = pcpMessage + "<h3>" + title + "</h3>";
    }
    if (text) {
      pcpMessage = pcpMessage + "<p>" + text + "</p>";
    }
    $('.pcp-messages').html('');
    $(pcpMessage).appendTo('.pcp-messages').show('slow');
  }
});
</script>
{/literal}
