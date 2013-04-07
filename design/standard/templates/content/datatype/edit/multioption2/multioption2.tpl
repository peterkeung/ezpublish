{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{default attribute_base=ContentObjectAttribute
         parent_group_id=0
         parent_multioption_id=-1}
{if $depth|lt(2)}
    <div class="block">
        <label for="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}">{'Group'|i18n( 'design/standard/content/datatype' )}:</label>
        <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_data_optiongroup_name_{$attribute.id}_{$parent_group_id}[]" value="{$group.name}" />
        <input type="hidden" name="{$attribute_base}_data_optiongroup_id_{$attribute.id}_{$parent_group_id}[]" value="{$group.group_id}" />

    </div>
    {else}
    <input type="hidden" name="{$attribute_base}_data_optiongroup_name_{$attribute.id}_{$parent_group_id}[]" value="{$group.name}" />
    <input type="hidden" name="{$attribute_base}_data_optiongroup_id_{$attribute.id}_{$parent_group_id}[]" value="{$group.group_id}" />

    {if $parent_multioption_id|ge(0)}
        <input type="hidden" name="{$attribute_base}_data_optiongroup_id_parent_multioption_{$attribute.id}_{$group.group_id}" value="{$parent_multioption_id}" />
    {/if}
{/if}

{include uri='design:content/datatype/edit/multioption2/multioption.tpl' name=ChildOption attribute=$attribute group=$group parent_group_id=$parent_group_id depth=$depth attribute_base=$attribute_base}
{/default}
