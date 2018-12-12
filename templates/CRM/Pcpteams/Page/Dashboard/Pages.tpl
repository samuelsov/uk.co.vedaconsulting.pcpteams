<div class="view-content">

  {if $pcpInfo}
    <div id="ltype">
      {strip}

      <table class="selector">
        <tr class="columnheader">
          <th>{ts domain="uk.co.vedaconsulting.pcpteams"}Pcp Title{/ts}</th>
          <th>{ts domain="uk.co.vedaconsulting.pcpteams"}Support of{/ts}</th>
          <th>{ts domain="uk.co.vedaconsulting.pcpteams"}Goal{/ts}</th>
          <th>{ts domain="uk.co.vedaconsulting.pcpteams"}Amount Raised{/ts}</th>
          <th>{ts domain="uk.co.vedaconsulting.pcpteams"}Action{/ts}</th>
        </tr>

        {foreach from=$pcpInfo item=row}
        <tr class="{cycle values="odd-row,even-row"} {$row.class}">
              <td class="bold">
                {if $row.page_url}
                  <a  href="{$row.page_url}" title="{ts domain="uk.co.vedaconsulting.pcpteams"}Preview your Personal Campaign Page{/ts}">{$row.title}</a>
                {else}
                  {$row.title}
                {/if}
              </td>
              <td>{$row.page_title}</td>
              <td align="right">{$row.goal_amount|crmMoney}</td>
              <td align="right">{$row.amount_raised|crmMoney}</td>
              <td>{$row.action|replace:'xx':$row.pcpId}</td>
        </tr>
        {/foreach}
      </table>
    {/strip}
    </div>
  {else}
    <div class="messages status no-popup">
      <div class="icon inform-icon"></div>
      {ts domain="uk.co.vedaconsulting.pcpteams"}You do not have any active fundraising pages yet.{/ts}
    </div>
  {/if}

</div>
