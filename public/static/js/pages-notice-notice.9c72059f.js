(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-notice-notice"],{"2cf2":function(t,i,n){"use strict";var e=n("4ea4");Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;e(n("2fcc"));var a={data:function(){return{userinfo:{invite_code:"",role_name:"",invite_url:"https://www.bombgame.org/users/new"},lantype:0,lanpic:"",lanchk:0,langpics:[{name:"CN",url:"../../static/images/lang-CN.png"},{name:"EN",url:"../../static/images/lang-EN.png"}],noticename:["公告","NOTICE"],noticelist:[{id:1,title:"中国向欧方提出严正交涉",details:"中国向欧方提出严正交涉中国向欧方提出严正交涉中国向欧方提出严正交涉中国向欧方提出严正交涉中国向欧方提出严正交涉",status:0},{id:2,title:"中国向欧方提出严正交涉方提出严正",details:"中国向欧方提出严正交涉中国向欧方提出严正交涉中国向欧方提出严正交涉中国向欧方提出严正交涉中国向欧方提出严正交涉",status:0},{id:3,title:"中国向欧方提出严正交涉国向欧方提",details:"中国向欧方提出严正交涉中国向欧方提出严正交涉中国向欧方提出严正交涉中国向欧方提出严正交涉中国向欧方提出严正交涉",status:0}]}},computed:{i18n:function(){return this.$t("lang.notice")}},onLoad:function(){this.lanpic=this.langpics[this.lantype].url},methods:{tourl:function(t){console.log(t),this.$util.Tips(t)},changelang:function(){0==this.lantype?this.lantype=1:this.lantype=0,uni.setStorageSync("language",this.langpics[this.lantype].name),this.$i18n.locale=uni.getStorageSync("language"),console.log("ggg:"+this.$i18n.locale),this.lanpic=this.langpics[this.lantype].url},chekstatus:function(t){0==t.status?t.status=1:t.status=0}}};i.default=a},"2f97":function(t,i,n){"use strict";n.r(i);var e=n("2cf2"),a=n.n(e);for(var s in e)"default"!==s&&function(t){n.d(i,t,(function(){return e[t]}))}(s);i["default"]=a.a},"3f67":function(t,i,n){t.exports=n.p+"static/img/noticelogo.0a1f2ea2.png"},"4e5e":function(t,i,n){t.exports=n.p+"static/img/back.6a5a9a71.png"},"4f35":function(t,i,n){"use strict";var e;n.d(i,"b",(function(){return a})),n.d(i,"c",(function(){return s})),n.d(i,"a",(function(){return e}));var a=function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("v-uni-view",{staticClass:"container"},[e("v-uni-view",{staticClass:"header"},[e("v-uni-view",{staticClass:"lang"},[e("v-uni-navigator",{staticClass:"backbtn",attrs:{url:"../index/index"}}),e("v-uni-image",{attrs:{src:t.lanpic},on:{click:function(i){arguments[0]=i=t.$handleEvent(i),t.changelang()}}})],1),e("v-uni-view",{staticClass:"mainrow"},[e("v-uni-view",{staticClass:"userinfo"},[e("v-uni-view",{staticClass:"avatar"},[e("v-uni-navigator",{attrs:{url:"/pages/family/family"}},[e("v-uni-image",{attrs:{src:n("82e3")}})],1)],1),e("v-uni-view",{staticClass:"mainfo"},[e("v-uni-view",{staticClass:"nickname",domProps:{textContent:t._s(t.userinfo.invite_code)}}),e("v-uni-view",{staticClass:"levelname",domProps:{textContent:t._s(t.userinfo.role_name)}})],1)],1),e("v-uni-view",{staticClass:"notice"},[e("v-uni-image",{attrs:{src:n("3f67")}})],1)],1)],1),e("v-uni-view",{staticClass:"maindiv"},[e("v-uni-view",{staticClass:"maintitle"},[t._v(t._s(t.i18n.noticename))]),e("v-uni-view",{staticClass:"noticelist"},t._l(t.noticelist,(function(i,n){return e("v-uni-view",{key:n,staticClass:"noticeitem"},[e("v-uni-view",{staticClass:"shortinfo"},[e("v-uni-view",{staticClass:"arrow"}),e("v-uni-view",{staticClass:"title"},[t._v(t._s(i.title))]),e("v-uni-view",{staticClass:"switch",on:{click:function(n){arguments[0]=n=t.$handleEvent(n),t.chekstatus(i)}}},[1==i.status?e("v-uni-view",{staticClass:"open iconfont icon-xiangshang"}):t._e(),0==i.status?e("v-uni-view",{staticClass:"close iconfont icon-xiangxia"}):t._e()],1)],1),e("v-uni-view",{directives:[{name:"show",rawName:"v-show",value:1==i.status,expression:"item.status==1"}],staticClass:"details"},[e("v-uni-view"),e("v-uni-view",[t._v(t._s(i.details))]),e("v-uni-view")],1)],1)})),1)],1)],1)},s=[]},"726e":function(t,i,n){t.exports=n.p+"static/img/title.c47f25dc.png"},"76e8":function(t,i,n){"use strict";var e=n("a7582"),a=n.n(e);a.a},"82e3":function(t,i,n){t.exports=n.p+"static/img/avatar.32524a47.png"},a7582:function(t,i,n){var e=n("d307");"string"===typeof e&&(e=[[t.i,e,""]]),e.locals&&(t.exports=e.locals);var a=n("4f06").default;a("17c97204",e,!0,{sourceMap:!1,shadowMode:!1})},d307:function(t,i,n){var e=n("24fb"),a=n("1de5"),s=n("da57"),c=n("4e5e"),o=n("726e");i=e(!1);var l=a(s),r=a(c),u=a(o);i.push([t.i,'@charset "UTF-8";\n/**\n * 这里是uni-app内置的常用样式变量\n *\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\n *\n */\n/**\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\n *\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\n */\n/* 颜色变量 */\n/* 行为相关颜色 */\n/* 文字基本颜色 */\n/* 背景颜色 */\n/* 边框颜色 */\n/* 尺寸变量 */\n/* 文字尺寸 */\n/* 图片尺寸 */\n/* Border Radius */\n/* 水平间距 */\n/* 垂直间距 */\n/* 透明度 */\n/* 文章场景相关 */uni-page-body[data-v-3c2e9fb6]{width:100%;height:100%;background:url('+l+") no-repeat fixed top;background-size:100%}.container[data-v-3c2e9fb6]{padding:%?20?%;font-size:%?14?%;line-height:%?24?%}.backbtn[data-v-3c2e9fb6]{width:%?260?%;height:%?120?%;margin-left:%?-20?%;background:url("+r+") no-repeat 0 0;background-size:60%}.maindiv .maintitle[data-v-3c2e9fb6]{text-align:center;font-size:%?48?%;font-family:黑体;font-weight:650;letter-spacing:%?20?%;margin-top:%?10?%;line-height:%?80?%}.maindiv .noticelist[data-v-3c2e9fb6]{margin-top:%?30?%}.maindiv .noticelist .noticeitem[data-v-3c2e9fb6]{display:table;width:94%;border:%?2?% solid #00a8ff;background-color:#fff;border-radius:%?30?%;margin-top:%?20?%;padding:%?20?%}.maindiv .noticelist .noticeitem .shortinfo[data-v-3c2e9fb6]{display:table-row;height:%?140?%}.maindiv .noticelist .noticeitem .shortinfo .arrow[data-v-3c2e9fb6]{background:url("+u+") no-repeat 50%;background-size:90%;width:20%;display:table-cell}.maindiv .noticelist .noticeitem .shortinfo .title[data-v-3c2e9fb6]{width:70%;font-size:%?40?%;line-height:%?60?%;padding-left:%?20?%;display:table-cell;vertical-align:middle}.maindiv .noticelist .noticeitem .shortinfo .switch[data-v-3c2e9fb6]{display:table-cell;vertical-align:bottom;width:5%}.maindiv .noticelist .noticeitem .shortinfo .switch .open[data-v-3c2e9fb6]{color:#1095ff;width:%?16?%;height:%?16?%}.maindiv .noticelist .noticeitem .shortinfo .switch .close[data-v-3c2e9fb6]{color:#1095ff;width:%?16?%;height:%?16?%}.maindiv .noticelist .noticeitem .details[data-v-3c2e9fb6]{display:table-row;width:100%;font-size:%?30?%;color:#777;line-height:%?40?%}.maindiv .noticelist .noticeitem .details uni-view[data-v-3c2e9fb6]{display:table-cell}body.?%PAGE?%[data-v-3c2e9fb6]{background:url("+l+") no-repeat fixed top;background-size:100%}",""]),t.exports=i},da57:function(t,i,n){t.exports=n.p+"static/img/background.1be773c0.png"},eaf2:function(t,i,n){"use strict";n.r(i);var e=n("4f35"),a=n("2f97");for(var s in a)"default"!==s&&function(t){n.d(i,t,(function(){return a[t]}))}(s);n("76e8");var c,o=n("f0c5"),l=Object(o["a"])(a["default"],e["b"],e["c"],!1,null,"3c2e9fb6",null,!1,e["a"],c);i["default"]=l.exports}}]);