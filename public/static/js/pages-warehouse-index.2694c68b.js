(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-warehouse-index"],{1836:function(e,t,a){"use strict";a.r(t);var i=a("e649"),n=a.n(i);for(var s in i)"default"!==s&&function(e){a.d(t,e,(function(){return i[e]}))}(s);t["default"]=n.a},2757:function(e,t,a){var i=a("db27");"string"===typeof i&&(i=[[e.i,i,""]]),i.locals&&(e.exports=i.locals);var n=a("4f06").default;n("0c1425f4",i,!0,{sourceMap:!1,shadowMode:!1})},"68e3":function(e,t,a){"use strict";a.r(t);var i=a("ced7"),n=a("1836");for(var s in n)"default"!==s&&function(e){a.d(t,e,(function(){return n[e]}))}(s);a("d0ea");var o,u=a("f0c5"),r=Object(u["a"])(n["default"],i["b"],i["c"],!1,null,"0525a96c",null,!1,i["a"],o);t["default"]=r.exports},ced7:function(e,t,a){"use strict";var i;a.d(t,"b",(function(){return n})),a.d(t,"c",(function(){return s})),a.d(t,"a",(function(){return i}));var n=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("v-uni-view",{staticClass:"warehouse"},[a("v-uni-view",{staticClass:"warehouse-banner",attrs:{id:"warehouse-banner"}},[a("v-uni-image",{staticClass:"warehouse-banner_image",attrs:{src:"/static/images/warehouse/banner.jpg",mode:"widthFix"}}),a("v-uni-navigator",{attrs:{url:"../index/index","hover-class":"none"}},[a("v-uni-image",{staticClass:"warehouse-banner_back",attrs:{src:"/static/images/back.png",mode:""}})],1)],1),a("v-uni-view",{staticClass:"warehouse-modules",style:{"padding-top":e.bannerHeight+13+"px"}},[a("v-uni-view",{staticClass:"warehouse-modules_item",style:{"background-color":"#F8CFCF"}},[a("v-uni-image",{staticClass:"warehouse-modules_item__image",attrs:{src:"/static/images/warehouse/cic.png"}}),a("v-uni-view",{staticClass:"warehouse-modules_item__num"},[a("v-uni-view",{on:{click:function(t){arguments[0]=t=e.$handleEvent(t),e.jumpToFixedDetail("game")}}},[e._v("游戏："+e._s(e.userinfo.candy_display)),a("v-uni-image",{attrs:{src:"/static/images/warehouse/right.png",mode:""}})],1),a("v-uni-view",{on:{click:function(t){arguments[0]=t=e.$handleEvent(t),e.jumpToFixedDetail("bit")}}},[e._v("币币："+e._s(e.userinfo.chain_cigar_display)),a("v-uni-image",{attrs:{src:"/static/images/warehouse/right.png",mode:""}})],1)],1)],1),a("v-uni-view",{staticClass:"warehouse-modules_item",style:{"background-color":"#C9FBFF"},on:{click:function(t){arguments[0]=t=e.$handleEvent(t),e.goPlierDetail.apply(void 0,arguments)}}},[a("v-uni-image",{staticClass:"warehouse-modules_item__image",attrs:{src:"/static/images/warehouse/pliers.png"}}),a("v-uni-view",{staticClass:"warehouse-modules_item__num"},[a("v-uni-view",[e._v(e._s(e.userinfo.pliers_amount))])],1)],1),e._l(e.warehouseTypeList,(function(t,i){return a("v-uni-view",{key:t.id,staticClass:"warehouse-modules_item",style:{"background-color":e.bgList[i]},on:{click:function(a){arguments[0]=a=e.$handleEvent(a),e.jumpToDetail(t)}}},[a("v-uni-view",{staticClass:"warehouse-modules_item__sequence"},[e._v(e._s(t.bomb_no))]),a("v-uni-image",{staticClass:"warehouse-modules_item__image",attrs:{src:t.image}}),a("v-uni-view",{staticClass:"warehouse-modules_item__num"},[a("v-uni-view",[e._v(e._s(t.amount))])],1)],1)}))],2)],1)},s=[]},d0ea:function(e,t,a){"use strict";var i=a("2757"),n=a.n(i);n.a},db27:function(e,t,a){var i=a("24fb");t=i(!1),t.push([e.i,'@charset "UTF-8";\n/**\n * 这里是uni-app内置的常用样式变量\n *\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\n *\n */\n/**\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\n *\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\n */\n/* 颜色变量 */\n/* 行为相关颜色 */\n/* 文字基本颜色 */\n/* 背景颜色 */\n/* 边框颜色 */\n/* 尺寸变量 */\n/* 文字尺寸 */\n/* 图片尺寸 */\n/* Border Radius */\n/* 水平间距 */\n/* 垂直间距 */\n/* 透明度 */\n/* 文章场景相关 */uni-page-body[data-v-0525a96c]{background-color:#f2f5fc}.warehouse-banner[data-v-0525a96c]{z-index:1;position:fixed;left:0;right:0;height:0;padding-bottom:70%;overflow:hidden}.warehouse-banner .warehouse-banner_image[data-v-0525a96c]{width:100%;height:100%;position:absolute;left:0;right:0;top:0;bottom:0}.warehouse-banner .warehouse-banner_back[data-v-0525a96c]{width:%?139?%;height:%?94?%;margin-top:%?45?%}.warehouse-modules[data-v-0525a96c]{display:flex;flex-wrap:wrap;padding:%?25?%;justify-content:space-between}.warehouse-modules .warehouse-modules_item[data-v-0525a96c]{cursor:pointer;position:relative;width:calc(100% / 2 - %?86?%);border-radius:%?14?%;margin:%?16?% %?25?%;padding:%?18?% %?18?% %?30?%;text-align:center;display:flex;flex-direction:column;align-items:center}.warehouse-modules .warehouse-modules_item .warehouse-modules_item__image[data-v-0525a96c]{height:%?176?%;width:%?176?%;margin-bottom:%?18?%}.warehouse-modules .warehouse-modules_item .warehouse-modules_item__num[data-v-0525a96c]{height:%?70?%;display:flex;flex-direction:column;font-size:%?26?%;line-height:1.7;align-items:center;justify-content:center}.warehouse-modules .warehouse-modules_item .warehouse-modules_item__num uni-image[data-v-0525a96c]{width:%?12?%;height:%?20?%;margin-left:%?20?%}.warehouse-modules .warehouse-modules_item .warehouse-modules_item__sequence[data-v-0525a96c]{height:%?20?%;width:100%;text-align:right;font-size:%?20?%}body.?%PAGE?%[data-v-0525a96c]{background-color:#f2f5fc}',""]),e.exports=t},e649:function(e,t,a){"use strict";var i=a("4ea4");a("ac1f"),Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0,a("96cf");var n=i(a("1da1")),s=i(a("2fcc")),o={data:function(){return{bannerHeight:0,userinfo:{},bgList:["#E4C5EC","#C5EAB5","#A0FFD6","#FFE5B7"],warehouseTypeList:[]}},onLoad:function(){this.getUserInfo(),this.getBombs()},onShow:function(){this.getUserInfo(),this.getBombs()},mounted:function(){var e=this,t=uni.createSelectorQuery().in(this);t.select("#warehouse-banner").boundingClientRect((function(t){e.bannerHeight=t.height})).exec()},methods:{jumpToFixedDetail:function(e){this.$util.Tips("/pages/warehouse/fixedDetail?type=".concat(e))},getUserInfo:function(){var e=this;return(0,n.default)(regeneratorRuntime.mark((function t(){var a;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return a=e,t.next=3,s.default.getdata(e,s.default.api.main.userinfo,{user_token:uni.getStorageSync("user_token")},"POST","","",(function(e,t){console.log(t),"success"==t.code?(a.userinfo=t.data,uni.setStorageSync("userinfo",t.data)):a.$util.Tips({title:t.msg},"/pages/register/register")}));case 3:case"end":return t.stop()}}),t)})))()},goPlierDetail:function(){uni.navigateTo({url:"./pliersDetail"})},getBombs:function(){var e=this;return(0,n.default)(regeneratorRuntime.mark((function t(){var a;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return uni.showLoading({title:"疯狂加载中..."}),a=e,t.next=4,s.default.getdata(e,s.default.api.main.bombsList,{user_token:uni.getStorageSync("user_token")},"GET","","",(function(e,t){uni.hideLoading(),"success"==t.code?a.warehouseTypeList=t.data:a.$util.Tips({title:t.msg})}));case 4:case"end":return t.stop()}}),t)})))()},loadWareHouseData:function(){},jumpToDetail:function(e){uni.navigateTo({url:"./detail?id="+e.id+"&img="+e.image+"&bomb_no="+e.bomb_no+"&amount="+e.amount+"&cost_pliers="+e.cost_pliers})}}};t.default=o}}]);