<!-- header -->
{literal}
<style>

.page-civicrm-pcp h1.page-header {
  display: none;
}

#crm-container .pcp-donate {
  height: auto;
}

.pcp-details,
.pcp-profile {
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-flex-direction: row;
  -ms-flex-direction: row;
  flex-direction: row;
  -webkit-flex-wrap: nowrap;
  -ms-flex-wrap: nowrap;
  flex-wrap: nowrap;
  -webkit-justify-content: space-between;
  -ms-flex-pack: justify;
  justify-content: space-between;
  -webkit-align-content: flex-start;
  -ms-flex-line-pack: start;
  align-content: flex-start;
  -webkit-align-items: stretch;
  -ms-flex-align: stretch;
  align-items: stretch;
}

.pcp-etc,
.pcp-avatar {
  -webkit-order: 0;
  -ms-flex-order: 0;
  order: 0;
  -webkit-flex: 1 1 auto;
  -ms-flex: 1 1 auto;
  flex: 1 1 auto;
  -webkit-align-self: flex-start;
  -ms-flex-item-align: start;
  align-self: flex-start;
}

.pcp-indicator,
.pcp-donate {
  -webkit-order: 0;
  -ms-flex-order: 0;
  order: 0;
  -webkit-flex: 0 1 auto;
  -ms-flex: 0 1 auto;
  flex: 0 1 auto;
  -webkit-align-self: stretch;
  -ms-flex-item-align: stretch;
  align-self: stretch;

  min-width: 280px;
}

.pcp-donate {
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-flex-direction: column;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-flex-wrap: nowrap;
  -ms-flex-wrap: nowrap;
  flex-wrap: nowrap;
  -webkit-justify-content: space-around;
  -ms-flex-pack: distribute;
  justify-content: space-around;
  -webkit-align-content: center;
  -ms-flex-line-pack: center;
  align-content: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
}

.pcp-profile {
  background-color: #eef1f6;
  border-radius: 5px;
}

.pcp-profile .title {
  text-transform: uppercase;
}

.pcp-profile .title-infix {
  font-size: 2em;
  font-weight: bold;
  display: block;
}

.pcp-avatar {
  padding: 20px;
}

.pcp-donate {
  border-radius: 0 5px 5px 0;
  background-color: #222 /* #161616 */;
  padding: 20px;
}

.pcp-donate .raised-total,
.pcp-donate .target {
  width: 100%;
}

.pcp-donate .raised-total .label,
.pcp-donate .raised-total .amount,
.pcp-donate .target .label,
.pcp-donate .target .amount {
  display: block;
  margin: auto;
  text-align: center;
  color: #fff;
}
.pcp-donate .raised-total .amount,
.pcp-donate .target .amount {
  border-top: 1px solid #4a4a4a;
  margin: 12px 0px 30px 0;
  padding-top: 12px;
  font-weight: bold;
  font-size: 1.5em;
}
.crm-pcp-manage .button .btn {
  border-color: #47acb3;
  color: #fff;
  background-color: #47acb3;
}
.pcp-donate .button .btn {
  font-size: 2em;
}
.crm-pcp-manage .button .btn:hover {
  background-color: #379ca3;
  border-color: #379ca3;
}

.pcp-profile,
.pcp-details {
  margin: 20px 0;
}
#crm-container .pcp-details h3,
#crm-container .pcp-details h2 {
  background-color: transparent;
  color: #000;
  margin: 30px 0px 15px 0px;
  border-bottom: 1px solid #e8eef2;
  padding: 0 0 5px 0;
}

.pcp-details .intro-text,
.pcp-details .page-text {
  background: none ! important;
  margin: 20px 0 ! important;
}
.pcp-details .quot {
}

.crm-container .pcp-members table {
  border: none;
}
.crm-container .pcp-members table tr + tr > td {
  border-top: 1px solid #e8eef2;
}

.pcp-indicator {
 text-align: center;
}
.pcp-indicator .meter  {
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-flex-direction: row;
  -ms-flex-direction: row;
  flex-direction: row;
  -webkit-flex-wrap: nowrap;
  -ms-flex-wrap: nowrap;
  flex-wrap: nowrap;
  -webkit-justify-content: center;
  -ms-flex-pack: center;
  justify-content: center;
  -webkit-align-content: center;
  -ms-flex-line-pack: center;
  align-content: center;
  -webkit-align-items: center;
  -ms-flex-align: center;
  align-items: center;
}
.pcp-indicator .meter  {
  font-size: 0.8em;
}
.pcp-indicator .meter-goal,
.pcp-indicator .meter-raised {
  padding: 5px;
}
.pcp-indicator span + strong {
  display: block;
}

.pcp-indicator .meter-goal {
  -webkit-order: 0;
  -ms-flex-order: 0;
  order: 0;
  -webkit-flex: 0 1 auto;
  -ms-flex: 0 1 auto;
  flex: 0 1 auto;
  -webkit-align-self: flex-start;
  -ms-flex-item-align: start;
  align-self: flex-start;
}

.pcp-indicator .meter-raised {
  -webkit-order: 0;
  -ms-flex-order: 0;
  order: 0;
  -webkit-flex: 0 1 auto;
  -ms-flex: 0 1 auto;
  flex: 0 1 auto;
  -webkit-align-self: flex-end;
  -ms-flex-item-align: end;
  align-self: flex-end;
}
</style>
{/literal}
<div class="crm-pcp-manage">

  <div class="pcp-profile">

    <div class="pcp-avatar">
        <div class="title">
          <span class="title-prefix">Encouragez</span>
          <span class="title-infix">{$contactName}</span>
        </div>
        <div class="avatar">
          <img id="{$pcpinfo.image_id}" {if $is_edit_page} class="crm-pcp-inline-pic-edit" {/if} href="{$updateProfPic}" src="{$pcpinfo.image_url}">
        </div>
    </div><!-- pcp-avatar -->

    <div class="pcp-donate">

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

    <!--div id="pcp-progress" class="pcp-progress">
      <span class="stat-num"><strong>{$pcpinfo.percentage}<i>%</i></strong></span>
      <div class="circle">
      </div>
    </div-->
  <div class="pcp-details">

    <div class="pcp-etc">

      <div class="pcp-information">
        <h2 class="">{$pcpinfo.title}</h2>
      <!-- BIO section -->
      {if $pcpinfo.intro_text}
        <div id="pcp_intro_text" class="intro-text" data-placeholder="Intro Text">{$pcpinfo.intro_text}</div>
      {/if}
      {if $pcpinfo.page_text}
        <div id="pcp_page_text" class="page-text" data-placeholder="Page Description">{$pcpinfo.page_text}</div>
      {/if}
      <!-- BIO section ends -->
      </div>

    {if $pcpinfo.team_pcp_id}
      <div class="pcp-members">
        <div class="mem-header">
          <h2>Mon équipe</h2>
        </div>
        <div class="button">
          <a class="btn btn-lg" href="{crmURL p="civicrm/pcp/manage" q="id=`$pcpinfo.team_pcp_id`"}">Voir la page de l'équipe</a>
        </div>
      </div>
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

      </div><!-- member-block ends-->
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
      </div>



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
          </div>
    {elseif $pcpinfo.is_teampage && $is_member}
{*
      <div class="team-buttons">
        <a class="pcp-button pcp-btn-brown crm-pcp-inline-team-edit" href="{$inviteTeamURl}">{ts}Invite Team Members{/ts}</a>
        {if !$is_edit_page}
        <a class="pcp-button pcp-btn-brown crm-pcp-alert-leave-team" href="javascript:void(0)" data-user-id={$userId} data-teampcp-id={$pcpinfo.id}>{ts}Leave Team{/ts}</a>
        {/if}
       </div>
*}
    {/if}
    
    </div><!--pcp-details-->

    <div class="pcp-indicator">
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
      </div>
     {math assign="percent" equation="100*(raised/goal)" raised=$pcpinfo.amount_raised goal=$pcpinfo.goal_amount format="%.1f"}
    {if $pcpinfo.team_pcp_id}
      <p>J'ai collecté<br /><strong>{$percent}&#160;%</strong> de mon objectif!</p> 
    {else}
        <p>Nous avons collecté<br /><strong>{$percent}&#160;%</strong> de notre objectif!</p> 

    {/if}
    </div>
{literal}
<script>
CRM.$(function($) {
  $('.meter-visual').jQMeter({
    goal:'{/literal}{$pcpinfo.goal_amount}{literal}',
    raised:'{/literal}{$pcpinfo.amount_raised}{literal}',
    meterOrientation:'vertical',
    width:'20px',
    height:'200px',
    bgColor:'#ffff00',
    barColor:'#e0001a',
    displayTotal: false,
    animationSpeed:500
  });
});
</script>
{/literal}

  </div><!--pcp-details-->


  </div>

  <div class="clear"></div>
</div>

