/*
YUI 3.7.1 (build 5627)
Copyright 2012 Yahoo! Inc. All rights reserved.
Licensed under the BSD License.
http://yuilibrary.com/license/
*/
YUI.add("dd-proxy",function(e,t){var n=e.DD.DDM,r="node",i="dragNode",s="host",o=!0,u,a=function(e){a.superclass.constructor.apply(this,arguments)};a.NAME="DDProxy",a.NS="proxy",a.ATTRS={host:{},moveOnEnd:{value:o},hideOnEnd:{value:o},resizeFrame:{value:o},positionProxy:{value:o},borderStyle:{value:"1px solid #808080"},cloneNode:{value:!1}},u={_hands:null,_init:function(){if(!n._proxy){n._createFrame(),e.on("domready",e.bind(this._init,this));return}this._hands||(this._hands=[]);var t,o,u=this.get(s),a=u.get(i);a.compareTo(u.get(r))&&n._proxy&&u.set(i,n._proxy),e.each(this._hands,function(e){e.detach()}),t=n.on("ddm:start",e.bind(function(){n.activeDrag===u&&n._setFrame(u)},this)),o=n.on("ddm:end",e.bind(function(){u.get("dragging")&&(this.get("moveOnEnd")&&u.get(r).setXY(u.lastXY),this.get("hideOnEnd")&&u.get(i).setStyle("display","none"),this.get("cloneNode")&&(u.get(i).remove(),u.set(i,n._proxy)))},this)),this._hands=[t,o]},initializer:function(){this._init()},destructor:function(){var t=this.get(s);e.each(this._hands,function(e){e.detach()}),t.set(i,t.get(r))},clone:function(){var t=this.get(s),n=t.get(r),o=n.cloneNode(!0);return delete o._yuid,o.setAttribute("id",e.guid()),o.setStyle("position","absolute"),n.get("parentNode").appendChild(o),t.set(i,o),o}},e.namespace("Plugin"),e.extend(a,e.Base,u),e.Plugin.DDProxy=a,e.mix(n,{_createFrame:function(){if(!n._proxy){n._proxy=o;var t=e.Node.create("<div></div>"),r=e.one("body");t.setStyles({position:"absolute",display:"none",zIndex:"999",top:"-999px",left:"-999px"}),r.prepend(t),t.set("id",e.guid()),t.addClass(n.CSS_PREFIX+"-proxy"),n._proxy=t}},_setFrame:function(e){var t=e.get(r),s=e.get(i),o,u="auto";o=n.activeDrag.get("activeHandle"),o&&(u=o.getStyle("cursor")),u=="auto"&&(u=n.get("dragCursor")),s.setStyles({visibility:"hidden",display:"block",cursor:u,border:e.proxy.get("borderStyle")}),e.proxy.get("cloneNode")&&(s=e.proxy.clone()),e.proxy.get("resizeFrame")&&s.setStyles({height:t.get("offsetHeight")+"px",width:t.get("offsetWidth")+"px"}),e.proxy.get("positionProxy")&&s.setXY(e.nodeXY),s.setStyle("visibility","visible")}})},"3.7.1",{requires:["dd-drag"]});
