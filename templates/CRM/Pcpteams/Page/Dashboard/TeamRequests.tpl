<div class="view-content">

  {if $teamPendingInfo}
    <div id="ltype">
      {strip}

      <table class="selector">
        <tr class="columnheader">
          <th>{ts domain="uk.co.vedaconsulting.pcpteams"}Name{/ts}</th>
          <th>{ts domain="uk.co.vedaconsulting.pcpteams"}PCP Title{/ts}</th>
          <th>{ts domain="uk.co.vedaconsulting.pcpteams"}Support of{/ts}</th>
          <th>{ts domain="uk.co.vedaconsulting.pcpteams"}Status{/ts}</th>
        </tr>

        {foreach from=$teamPendingInfo item=row}
        <tr class="{cycle values='odd-row,even-row'}">
              <td class="bold">{$row.teamName}</td>
              <td>
              {$row.teamPcpTitle}
              </td>
              <td>{$row.pageTitle}</td>
              <td>{ts domain="uk.co.vedaconsulting.pcpteams"}Pending Approval{/ts}</td>
        </tr>
        {/foreach}
      </table>
    {/strip}
    </div>
  {else}
    <div class="messages status no-popup">
      <div class="icon inform-icon"></div>
      {ts domain="uk.co.vedaconsulting.pcpteams"}You have no pending membership requests.{/ts}
    </div>
  {/if}

</div>
