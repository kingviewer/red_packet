(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-warehouse-detail"],{4582:function(t,i,e){"use strict";e.r(i);var a=e("83e9"),s=e.n(a);for(var n in a)"default"!==n&&function(t){e.d(i,t,(function(){return a[t]}))}(n);i["default"]=s.a},5978:function(t,i,e){"use strict";e.r(i);var a=e("cad3"),s=e("4582");for(var n in s)"default"!==n&&function(t){e.d(i,t,(function(){return s[t]}))}(n);e("7da1");var o,l=e("f0c5"),u=Object(l["a"])(s["default"],a["b"],a["c"],!1,null,"043e6750",null,!1,a["a"],o);i["default"]=u.exports},"7da1":function(t,i,e){"use strict";var a=e("95ae"),s=e.n(a);s.a},"83e9":function(t,i,e){"use strict";var a=e("4ea4");Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0,e("96cf");var s=a(e("1da1")),n=a(e("2fcc")),o={data:function(){return{userinfo:{},id:"",bombNo:"",amount:"",cost_pliers:"",title:"",flowImage:"",name:"",type:"",cicNum:10,sequence:"",unit:"枚",flowsData:[{id:0,type:0,name:"拆弹",time:"2021-11-06 17:00:00",count:-21},{id:1,type:1,name:"扫雷",time:"2021-11-06 17:00:00",count:1212},{id:2,type:3,name:"扫雷",time:"2021-11-06 17:00:00",count:1212}]}},onLoad:function(t){this.id=t.id,this.bombNo=t.bomb_no,this.amount=t.amount,this.cost_pliers=t.cost_pliers,this.setTitle(t.bomb_no,t.img),this.loadFlowsData(t.id),this.getUserInfo()},methods:{getUserInfo:function(){var t=this;return(0,s.default)(regeneratorRuntime.mark((function i(){var e;return regeneratorRuntime.wrap((function(i){while(1)switch(i.prev=i.next){case 0:return e=t,i.next=3,n.default.getdata(t,n.default.api.main.userinfo,{user_token:uni.getStorageSync("user_token")},"POST","","",(function(t,i){console.log(i),"success"==i.code?(e.userinfo=i.data,uni.setStorageSync("userinfo",i.data)):e.$util.Tips({title:i.msg},"/pages/register/register")}));case 3:case"end":return i.stop()}}),i)})))()},setTitle:function(t,i){this.flowImage=i,uni.setNavigationBarTitle({title:"炸弹".concat(t)})},loadFlowsData:function(){var t=this;return(0,s.default)(regeneratorRuntime.mark((function i(){var e;return regeneratorRuntime.wrap((function(i){while(1)switch(i.prev=i.next){case 0:return uni.showLoading({title:"疯狂加载中..."}),e=t,i.next=4,n.default.getdata(t,n.default.api.main.bombFlow,{user_token:uni.getStorageSync("user_token"),bomb_id:e.id},"GET","","",(function(t,i){uni.hideLoading(),"success"==i.code?e.flowsData=i.data:e.$util.Tips({title:i.msg})}));case 4:case"end":return i.stop()}}),i)})))()},transfer:function(){uni.navigateTo({url:"./transfer"})},disposal:function(){uni.navigateTo({url:"./disposal?id="+this.id+"&bomb_no="+this.bombNo+"&amount="+this.amount+"&cost_pliers="+this.cost_pliers})},exchange:function(){uni.navigateTo({url:"./exchange"})},changeCoin:function(t){uni.navigateTo({url:"./recharge?type="+t})}},onPullDownRefresh:function(){setTimeout((function(){uni.stopPullDownRefresh()}),1e3)},onReachBottom:function(){var t=this,i=null;null!==i&&clearTimeout(i),i=setTimeout((function(){return t.loadFlowsData()}),500)}};i.default=o},"95ae":function(t,i,e){var a=e("c02d");"string"===typeof a&&(a=[[t.i,a,""]]),a.locals&&(t.exports=a.locals);var s=e("4f06").default;s("081c3dc9",a,!0,{sourceMap:!1,shadowMode:!1})},c02d:function(t,i,e){var a=e("24fb");i=a(!1),i.push([t.i,'@charset "UTF-8";\n/**\n * 这里是uni-app内置的常用样式变量\n *\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\n *\n */\n/**\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\n *\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\n */\n/* 颜色变量 */\n/* 行为相关颜色 */\n/* 文字基本颜色 */\n/* 背景颜色 */\n/* 边框颜色 */\n/* 尺寸变量 */\n/* 文字尺寸 */\n/* 图片尺寸 */\n/* Border Radius */\n/* 水平间距 */\n/* 垂直间距 */\n/* 透明度 */\n/* 文章场景相关 */uni-page-body[data-v-043e6750]{width:100%;min-height:100%;background:linear-gradient(180deg,#11739d,#126c9a,#0b5b8f)}.details__flows[data-v-043e6750]{padding:%?32?%;color:#fff}.details__flows .details__flows_title[data-v-043e6750]{font-size:%?32?%;padding-bottom:%?32?%}.details__flows .details__flows_list .details__flows_item[data-v-043e6750]{margin:%?24?% 0;border:1px solid #2d76a2;display:flex;align-items:center;justify-content:space-between;padding:%?32?%;border-radius:%?12?%}.details__flows .details__flows_list .details__flows_item .details__flows_item--image[data-v-043e6750]{border-radius:50%;width:%?100?%;height:%?100?%;margin-right:%?32?%;background-color:#2d80a7}.details__flows .details__flows_list .details__flows_item .details__flows_item--right[data-v-043e6750]{flex:1}.details__flows .details__flows_list .details__flows_item .details__flows_item--right .flows_item--right_type[data-v-043e6750]{font-size:%?30?%}.details__flows .details__flows_list .details__flows_item .details__flows_item--right .flows_item--right_time[data-v-043e6750]{font-size:%?24?%;margin-top:%?24?%}body.?%PAGE?%[data-v-043e6750]{background:linear-gradient(180deg,#11739d,#126c9a,#0b5b8f)}',""]),t.exports=i},cad3:function(t,i,e){"use strict";var a;e.d(i,"b",(function(){return s})),e.d(i,"c",(function(){return n})),e.d(i,"a",(function(){return a}));var s=function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("v-uni-view",{staticClass:"warehouse-details"},[e("v-uni-view",{staticClass:"warehouse-details__info"},[e("v-uni-view",{staticClass:"details__statics"},[e("v-uni-view",{staticClass:"avatar"},[e("v-uni-image",{staticClass:"avatar-img",attrs:{src:"/static/images/avatar.png",mode:"widthFix"}})],1),e("v-uni-view",{staticClass:"details__staticas--right"},[e("v-uni-view",[e("v-uni-view",{staticClass:"label"},[t._v("库存余额")]),e("v-uni-view",{staticClass:"num"},[t._v(t._s(t.amount)+" "+t._s(t.unit))])],1),e("v-uni-view",[e("v-uni-view",{staticClass:"label"},[t._v("可用余额")]),e("v-uni-view",{staticClass:"num"},[t._v(t._s(t.amount)+" "+t._s(t.unit))])],1),e("v-uni-view",[e("v-uni-view",{staticClass:"label"},[t._v("冻结数量")]),e("v-uni-view",{staticClass:"num"},[t._v("0 "+t._s(t.unit))])],1)],1)],1),e("v-uni-view",{staticClass:"details__btn"},[e("v-uni-view",{staticClass:"details__btn-tips"},[t._v("完成拆弹可以获得拆弹奖励，拆弹需要消耗数量不等的钳子")]),e("v-uni-button",{staticStyle:{margin:"0 0 0 auto !important"},attrs:{type:"default"},on:{click:function(i){arguments[0]=i=t.$handleEvent(i),t.disposal.apply(void 0,arguments)}}},[t._v("拆弹")])],1)],1),e("v-uni-view",{staticClass:"details__flows"},[e("v-uni-view",{staticClass:"details__flows_title"},[t._v("累计流水:")]),t.flowsData.length?e("v-uni-view",{staticClass:"details__flows_list"},t._l(t.flowsData,(function(i,a){return e("v-uni-view",{key:i.id,staticClass:"details__flows_item"},[e("v-uni-image",{staticClass:"details__flows_item--image",attrs:{src:i.image}}),e("v-uni-view",{staticClass:"details__flows_item--right"},[e("v-uni-view",{staticClass:"flows_item--right_type"},[t._v(t._s(i.flow_type_name))]),e("v-uni-view",{staticClass:"flows_item--right_time"},[t._v(t._s(i.created_at))])],1),e("v-uni-view",{staticClass:"details__flows_num"},[t._v(t._s(i.amount)+" 枚")])],1)})),1):e("v-uni-view",{},[e("v-uni-text",[t._v("暂无流水")])],1)],1)],1)},n=[]}}]);