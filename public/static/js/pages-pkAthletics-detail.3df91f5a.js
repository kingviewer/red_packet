(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-pkAthletics-detail"],{"05c8":function(t,i,e){var a=e("24fb"),s=e("1de5"),n=e("7c1a");i=a(!1);var o=s(n);i.push([t.i,'@charset "UTF-8";\n/**\n * 这里是uni-app内置的常用样式变量\n *\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\n *\n */\n/**\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\n *\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\n */\n/* 颜色变量 */\n/* 行为相关颜色 */\n/* 文字基本颜色 */\n/* 背景颜色 */\n/* 边框颜色 */\n/* 尺寸变量 */\n/* 文字尺寸 */\n/* 图片尺寸 */\n/* Border Radius */\n/* 水平间距 */\n/* 垂直间距 */\n/* 透明度 */\n/* 文章场景相关 */uni-page-body[data-v-40ed67d8]{width:100%;min-height:100%;background:url('+o+") no-repeat;background-size:100% 100%}header[data-v-40ed67d8]{z-index:1;position:fixed;left:0;right:0;height:%?94?%}header .pk-banner_back[data-v-40ed67d8]{position:absolute;width:%?139?%;height:%?94?%;top:%?45?%}header .header[data-v-40ed67d8]{width:100%;height:%?94?%;line-height:%?94?%;font-size:%?36?%;color:#fff;margin-top:%?45?%;text-align:center}.history__flows[data-v-40ed67d8]{padding:%?32?%;color:#fff}.history__flows .history__flows_title[data-v-40ed67d8]{font-size:%?32?%;padding-bottom:%?32?%}.history__flows .history__flows_list .history__flows_item[data-v-40ed67d8]{margin:%?24?% 0;border:1px solid #2d76a2;display:flex;align-items:center;justify-content:space-between;padding:%?32?%;border-radius:%?12?%}.history__flows .history__flows_list .history__flows_item .history__flows_item--right[data-v-40ed67d8]{flex:1}.history__flows .history__flows_list .history__flows_item .history__flows_item--right .flows_item--right_type uni-image[data-v-40ed67d8]{width:%?80?%;height:%?80?%;border-radius:50%}.history__flows .history__flows_list .history__flows_item .history__flows_item--right .flows_item--right_status[data-v-40ed67d8]{font-size:%?28?%;display:flex;align-items:center}.history__flows .history__flows_list .history__flows_item .history__flows_item--right .color[data-v-40ed67d8]{color:#f9a864}.history__flows .history__flows_list .history__flows_item .history__flows_item--right .view-details[data-v-40ed67d8]{display:flex;justify-content:space-between;font-size:%?24?%;margin-top:%?24?%}.details-pk-type[data-v-40ed67d8]{color:#fff;font-size:%?30?%;text-align:center}.pk-id[data-v-40ed67d8]{font-weight:500;margin-right:%?60?%}.popup-wrap[data-v-40ed67d8]{position:relative;padding:%?160?% %?32?% %?32?% %?32?%;text-align:center}.success-image[data-v-40ed67d8]{height:%?460?%;width:%?460?%}.failed-image[data-v-40ed67d8]{height:%?572?%;width:%?460?%}.content[data-v-40ed67d8]{width:%?460?%;position:absolute;bottom:%?70?%;left:50%;text-align:center;margin-left:%?-230?%}.num[data-v-40ed67d8]{color:#a15c1a;font-size:%?40?%;font-weight:700}.replay-image[data-v-40ed67d8]{display:block;width:%?126?%;height:%?60?%;margin:%?20?% auto 0}.pliers-image[data-v-40ed67d8]{width:%?140?%;height:%?140?%}.content-fail[data-v-40ed67d8]{width:%?460?%;position:absolute;bottom:%?70?%;left:50%;text-align:center;margin-left:%?-230?%}.content-fail .replay-image[data-v-40ed67d8]{margin-left:%?165?%}body.?%PAGE?%[data-v-40ed67d8]{background:url("+o+") no-repeat;background-size:100% 100%}",""]),t.exports=i},"1cfb":function(t,i,e){"use strict";var a=e("284a"),s=e.n(a);s.a},"284a":function(t,i,e){var a=e("05c8");"string"===typeof a&&(a=[[t.i,a,""]]),a.locals&&(t.exports=a.locals);var s=e("4f06").default;s("16f610b6",a,!0,{sourceMap:!1,shadowMode:!1})},4145:function(t,i,e){"use strict";e.r(i);var a=e("578c"),s=e.n(a);for(var n in a)"default"!==n&&function(t){e.d(i,t,(function(){return a[t]}))}(n);i["default"]=s.a},"578c":function(t,i,e){"use strict";var a=e("4ea4");Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;a(e("2fcc"));var s={data:function(){return{id:"",status:0,pkList:[{name:"2人PK",img:"/static/images/pk/center-1.png",desc:"10CIC 1 VS 1"},{name:"3人PK",img:"/static/images/pk/center-2.png",desc:"10CIC 1 VS 2"},{name:"5人PK",img:"/static/images/pk/center-3.png",desc:"10CIC 1 VS 4"},{name:"10人PK",img:"/static/images/pk/center-4.png",desc:"10CIC 1 VS 9"}],historyData:[{id:0,status:0,time:"2021-11-06 17:00:00"},{id:1,status:1,time:"2021-11-06 17:00:00"},{id:2,status:0,time:"2021-11-06 17:00:00"}]}},onLoad:function(t){this.id=t.id},methods:{loadpkDetails:function(){}},onPullDownRefresh:function(){setTimeout((function(){uni.stopPullDownRefresh()}),1e3)},onReachBottom:function(){var t=this,i=null;null!==i&&clearTimeout(i),i=setTimeout((function(){return t.loadpkDetails()}),500)}};i.default=s},"7c1a":function(t,i,e){t.exports=e.p+"static/img/bg.10a9e6a3.png"},"7e1a":function(t,i,e){"use strict";e.r(i);var a=e("9cf1"),s=e("4145");for(var n in s)"default"!==n&&function(t){e.d(i,t,(function(){return s[t]}))}(n);e("1cfb");var o,r=e("f0c5"),d=Object(r["a"])(s["default"],a["b"],a["c"],!1,null,"40ed67d8",null,!1,a["a"],o);i["default"]=d.exports},"9cf1":function(t,i,e){"use strict";var a;e.d(i,"b",(function(){return s})),e.d(i,"c",(function(){return n})),e.d(i,"a",(function(){return a}));var s=function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("v-uni-view",{staticClass:"pk-wrap"},[e("header",[e("v-uni-view",{staticClass:"header"},[t._v("PK详情")]),e("v-uni-navigator",{attrs:{url:"../index/index","hover-class":"none"}},[e("v-uni-image",{staticClass:"pk-banner_back",attrs:{src:"/static/images/back.png",mode:""}})],1)],1),1==t.status?e("v-uni-view",{staticClass:"popup-wrap"},[e("v-uni-image",{staticClass:"success-image",attrs:{src:"/static/images/pk/success.png",mode:""}}),e("v-uni-view",{staticClass:"content"},[e("v-uni-view",{staticClass:"num"},[t._v("1000 CIC")]),e("v-uni-image",{staticClass:"replay-image",attrs:{src:"/static/images/pk/replay.png",mode:""}})],1)],1):e("v-uni-view",{staticClass:"popup-wrap"},[e("v-uni-image",{staticClass:"failed-image",attrs:{src:"/static/images/pk/failed.png",mode:""}}),e("v-uni-view",{staticClass:"content-fail"},[e("v-uni-image",{staticClass:"pliers-image",attrs:{src:"/static/images/warehouse/pliers.png",mode:""}}),e("v-uni-view",{staticClass:"num"},[t._v("获得钳子")]),e("v-uni-image",{staticClass:"replay-image",attrs:{src:"/static/images/pk/replay.png",mode:""}})],1)],1),e("v-uni-view",{staticClass:"details-pk-type"},[t._v("10CIC  1 VS 4")]),e("v-uni-view",{staticClass:"history__flows"},[e("v-uni-view",{staticClass:"history__flows_list"},t._l(t.historyData,(function(i,a){return e("v-uni-view",{key:a,staticClass:"history__flows_item"},[e("v-uni-view",{staticClass:"history__flows_item--right"},[e("v-uni-view",{staticClass:"flows_item--right_type"},[e("v-uni-image",{attrs:{src:"/static/images/center/avatar-small.png",mode:"aspectFill"}})],1),e("v-uni-view",{staticClass:"flows_item--right_status"},[e("v-uni-view",{staticClass:"pk-id"},[t._v("ID 1A2B3C")]),e("v-uni-view",{staticClass:"color"},[t._v("PK成功: 56CIC")])],1)],1)],1)})),1)],1)],1)},n=[]}}]);