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
        <div id="pcp_goal_amount" class="amount {if $is_edit_page}crm-pcp-inline-text-edit{/if}" data-placeholder="Goal Amount">{$pcpinfo.goal_amount|crmMoney:$pcpInfo.currency}</div>
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
        <div id="pcp_intro_text" class="intro-text" data-placeholder="Intro Text">{$pcpinfo.intro_text}</div>
      *}
      <div id="pcp_page_text" class="page-text" data-placeholder="Page Description">{$pcpinfo.page_text}</div>
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

