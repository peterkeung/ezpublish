{*?template charset=latin1?*}

<div align="center">
  <h1>{"Finished"|i18n("design/standard/setup/init")}</h1>
</div>

<p>
  {"eZ publish has been installed with the following sites. You will find the username and password mentioned for each site."|i18n("design/standard/setup/init")}
</p>

<p>
  <table border="0" cellspacing="3" cellpadding="0">
    
    <tr>
    {section name=SiteTemplate loop=$site_templates}

      <td class="setup_site_templates">
        <div align="top">
          <a href="{$:item.url|wash}" target="_other">{section show=$:item.image_file_name}<img src={$:item.image_file_name|ezroot} alt="{$:item.name|wash}" />{section-else}<img src={"design/standard/images/setup/eZ_setup_template_default.png"|ezroot} alt="{$:item.name|wash}" />{/section}</a>
        </div>
        <div align="bottom">
	  <table border="0" cellspacing="0" cellpadding="0">
            <tr>
	      <td>{"Title"|i18n("design/standard/setup/init")}:&nbsp;</td>
	      <td>{$:item.name|wash}</td>
	    </tr>
	    <tr>
	      <td>{"URL"|i18n("design/standard/setup/init")}:&nbsp;</td>
	      <td><a href="{$:item.url|wash}" target="_blank" class="setup_final">{"User site"|i18n('design/standard/setup/init')}</a>, <a href="{$:item.admin_url|wash}" target="_blank" class="setup_final">{"Admin site"|i18n('design/standard/setup/init')}</a></td>
	    </tr>
	    <tr>
	      <td>{"Username"|i18n("design/standard/setup/init")}:&nbsp;</td>
	      <td>admin</td>
	    </tr>
	  </table>

        </div>
      </td>

      {delimiter modulo=2}
        </tr>
        <tr>
      {/delimiter}

    {/section}
    </tr>

  </table>      
</p>
