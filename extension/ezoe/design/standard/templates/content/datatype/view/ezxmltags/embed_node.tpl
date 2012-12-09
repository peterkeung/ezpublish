{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{if and( is_set( $context ), array( 'ezoe-edit', 'ezoe-embed' )|contains( $context ) )}
    {* Display for edit mode *}
    <a href={$node.url_alias|ezurl()} title={$node.url_alias|ezurl()} target="_blank">{$object.name|wash()} ({$object.class_name})</a>
{else}
    <div class="{if $object_parameters.align}object-{$object_parameters.align}{/if}{if ne($classification|trim,'')} {$classification|wash}{/if}"{if is_set($object_parameters.id)} id="{$object_parameters.id}"{/if}>
    {node_view_gui view=$view link_parameters=$link_parameters object_parameters=$object_parameters content_node=$node object=$object classification=$classification}
    </div>
{/if}