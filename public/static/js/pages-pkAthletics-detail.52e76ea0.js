(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-pkAthletics-detail"],{3024:function(t,i,e){"use strict";var a=e("4ea4");Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0,e("96cf");var s=a(e("1da1")),n=a(e("65b0")),o={data:function(){return{id:"",status:0,myRecord:{},pkList:[],historyData:[{id:0,status:0,time:"2021-11-06 17:00:00"},{id:1,status:1,time:"2021-11-06 17:00:00"},{id:2,status:0,time:"2021-11-06 17:00:00"}]}},onLoad:function(t){var i=JSON.parse(decodeURIComponent(t.items));console.log(i.loser),this.myRecord=i,i.id&&this.getRecordPerson()},methods:{goBack:function(){uni.navigateBack({delta:1})},getRecordPerson:function(){var t=this;return(0,s.default)(regeneratorRuntime.mark((function i(){var e;return regeneratorRuntime.wrap((function(i){while(1)switch(i.prev=i.next){case 0:return e=t,i.next=3,n.default.getdata(t,n.default.api.main.recordPerson,{user_token:uni.getStorageSync("user_token"),id:e.myRecord.game_round_id},"GET","","",(function(t,i){console.log(i),"success"==i.code?e.historyData=i.data:e.$util.Tips({title:i.msg})}));case 3:case"end":return i.stop()}}),i)})))()},loadpkDetails:function(){}},onPullDownRefresh:function(){setTimeout((function(){uni.stopPullDownRefresh()}),1e3)},onReachBottom:function(){var t=this,i=null;null!==i&&clearTimeout(i),i=setTimeout((function(){return t.loadpkDetails()}),500)}};i.default=o},"353b":function(t,i,e){"use strict";e.r(i);var a=e("ff87"),s=e("edd3");for(var n in s)"default"!==n&&function(t){e.d(i,t,(function(){return s[t]}))}(n);e("d61c");var o,r=e("f0c5"),c=Object(r["a"])(s["default"],a["b"],a["c"],!1,null,"7f5c328d",null,!1,a["a"],o);i["default"]=c.exports},d61c:function(t,i,e){"use strict";var a=e("e91fb"),s=e.n(a);s.a},e91fb:function(t,i,e){var a=e("fb5c");"string"===typeof a&&(a=[[t.i,a,""]]),a.locals&&(t.exports=a.locals);var s=e("4f06").default;s("8021da9a",a,!0,{sourceMap:!1,shadowMode:!1})},edd3:function(t,i,e){"use strict";e.r(i);var a=e("3024"),s=e.n(a);for(var n in a)"default"!==n&&function(t){e.d(i,t,(function(){return a[t]}))}(n);i["default"]=s.a},eeca:function(t,i,e){t.exports=e.p+"static/img/bg.10a9e6a3.png"},fb5c:function(t,i,e){var a=e("24fb"),s=e("1de5"),n=e("eeca");i=a(!1);var o=s(n);i.push([t.i,'@charset "UTF-8";\n/**\n * 这里是uni-app内置的常用样式变量\n *\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\n *\n */\n/**\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\n *\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\n */\n/* 颜色变量 */\n/* 行为相关颜色 */\n/* 文字基本颜色 */\n/* 背景颜色 */\n/* 边框颜色 */\n/* 尺寸变量 */\n/* 文字尺寸 */\n/* 图片尺寸 */\n/* Border Radius */\n/* 水平间距 */\n/* 垂直间距 */\n/* 透明度 */\n/* 文章场景相关 */uni-page-body[data-v-7f5c328d]{width:100%;min-height:100%;background:url('+o+") no-repeat;background-size:100% 100%}header[data-v-7f5c328d]{z-index:1;position:fixed;left:0;right:0;height:%?94?%}header .pk-banner_back[data-v-7f5c328d]{position:absolute;width:%?139?%;height:%?94?%;top:%?45?%}header .header[data-v-7f5c328d]{width:100%;height:%?94?%;line-height:%?94?%;font-size:%?36?%;color:#fff;margin-top:%?45?%;text-align:center}.history__flows[data-v-7f5c328d]{padding:%?32?%;color:#fff}.history__flows .history__flows_title[data-v-7f5c328d]{font-size:%?32?%;padding-bottom:%?32?%}.history__flows .history__flows_list .history__flows_item[data-v-7f5c328d]{margin:%?24?% 0;border:1px solid #2d76a2;display:flex;align-items:center;justify-content:space-between;padding:%?32?%;border-radius:%?12?%}.history__flows .history__flows_list .history__flows_item .history__flows_item--right[data-v-7f5c328d]{flex:1}.history__flows .history__flows_list .history__flows_item .history__flows_item--right .flows_item--right_type uni-image[data-v-7f5c328d]{width:%?80?%;height:%?80?%;border-radius:50%}.history__flows .history__flows_list .history__flows_item .history__flows_item--right .flows_item--right_status[data-v-7f5c328d]{font-size:%?28?%;display:flex;align-items:center}.history__flows .history__flows_list .history__flows_item .history__flows_item--right .color[data-v-7f5c328d]{color:#f9a864}.history__flows .history__flows_list .history__flows_item .history__flows_item--right .view-details[data-v-7f5c328d]{display:flex;justify-content:space-between;font-size:%?24?%;margin-top:%?24?%}.details-pk-type[data-v-7f5c328d]{color:#fff;font-size:%?30?%;text-align:center}.pk-id[data-v-7f5c328d]{font-weight:500;margin-right:%?60?%}.popup-wrap[data-v-7f5c328d]{position:relative;padding:%?160?% %?32?% %?32?% %?32?%;text-align:center}.success-image[data-v-7f5c328d]{height:%?460?%;width:%?460?%}.failed-image[data-v-7f5c328d]{height:%?572?%;width:%?460?%}.content[data-v-7f5c328d]{width:%?460?%;position:absolute;bottom:%?70?%;left:50%;text-align:center;margin-left:%?-230?%}.num[data-v-7f5c328d]{color:#a15c1a;font-size:%?40?%;font-weight:700}.replay-image[data-v-7f5c328d]{display:block;width:%?126?%;height:%?60?%;margin:%?20?% auto 0}.pliers-image[data-v-7f5c328d]{width:%?140?%;height:%?140?%}.content-fail[data-v-7f5c328d]{width:%?460?%;position:absolute;bottom:%?70?%;left:50%;text-align:center;margin-left:%?-230?%}.content-fail .replay-image[data-v-7f5c328d]{margin-left:%?165?%}body.?%PAGE?%[data-v-7f5c328d]{background:url("+o+") no-repeat;background-size:100% 100%}",""]),t.exports=i},ff87:function(t,i,e){"use strict";var a;e.d(i,"b",(function(){return s})),e.d(i,"c",(function(){return n})),e.d(i,"a",(function(){return a}));var s=function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("v-uni-view",{staticClass:"pk-wrap"},[e("header",[e("v-uni-view",{staticClass:"header"},[t._v("PK详情")]),e("v-uni-navigator",{attrs:{url:"#","hover-class":"none"},on:{click:function(i){arguments[0]=i=t.$handleEvent(i),t.goBack.apply(void 0,arguments)}}},[e("v-uni-image",{staticClass:"pk-banner_back",attrs:{src:"/static/images/back.png",mode:""}})],1)],1),t.myRecord.loser?e("v-uni-view",{staticClass:"popup-wrap"},[e("v-uni-image",{staticClass:"failed-image",attrs:{src:"/static/images/pk/failed.png",mode:""}}),e("v-uni-view",{staticClass:"content-fail"},[e("v-uni-image",{staticClass:"pliers-image",attrs:{src:"/static/images/warehouse/pliers.png",mode:""}}),e("v-uni-view",{staticClass:"num"},[t._v("获得钳子")]),e("v-uni-image",{staticClass:"replay-image",attrs:{src:"/static/images/pk/replay.png",mode:""}})],1)],1):e("v-uni-view",{staticClass:"popup-wrap"},[e("v-uni-image",{staticClass:"success-image",attrs:{src:"/static/images/pk/success.png",mode:""}}),e("v-uni-view",{staticClass:"content"},[e("v-uni-view",{staticClass:"num"},[t._v(t._s(t.myRecord.usdt_won)+" CIC")]),e("v-uni-image",{staticClass:"replay-image",attrs:{src:"/static/images/pk/replay.png",mode:""}})],1)],1),e("v-uni-view",{staticClass:"details-pk-type"},[t._v(t._s(t.myRecord.desc))]),e("v-uni-view",{staticClass:"history__flows"},[e("v-uni-view",{staticClass:"history__flows_list"},t._l(t.historyData,(function(i,a){return e("v-uni-view",{key:i.invite_code,staticClass:"history__flows_item"},[e("v-uni-view",{staticClass:"history__flows_item--right"},[e("v-uni-view",{staticClass:"flows_item--right_type"},[e("v-uni-image",{attrs:{src:"/static/images/center/avatar-small.png",mode:"aspectFill"}})],1),e("v-uni-view",{staticClass:"flows_item--right_status"},[e("v-uni-view",{staticClass:"pk-id"},[t._v("ID: "+t._s(i.invite_code))]),i.loser?e("v-uni-view",{},[e("v-uni-text",[t._v("PK失败")])],1):e("v-uni-view",{staticClass:"color"},[t._v("PK成功: "+t._s(i.usdt_won))])],1)],1)],1)})),1)],1)],1)},n=[]}}]);