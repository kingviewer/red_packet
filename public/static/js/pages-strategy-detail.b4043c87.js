(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-strategy-detail"],{"05d3":function(t,i,e){"use strict";var n=e("4ea4");Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0,e("96cf");var a=n(e("1da1")),o=n(e("2fcc")),r={name:"ArticleDetail",data:function(){return{content:{}}},onLoad:function(t){try{var i=t.id;i&&this.getDetail(i)}catch(e){return e}},methods:{getDetail:function(t){var i=this;return(0,a.default)(regeneratorRuntime.mark((function e(){var n;return regeneratorRuntime.wrap((function(e){while(1)switch(e.prev=e.next){case 0:return n=i,e.next=3,o.default.getdata(i,o.default.api.main.articleDetail,{user_token:uni.getStorageSync("user_token"),id:t},"GET","","",(function(t,i){"success"==i.code?n.content=i.data:n.$util.Tips({title:i.msg})}));case 3:case"end":return e.stop()}}),e)})))()}}};i.default=r},"333d":function(t,i,e){"use strict";e.r(i);var n=e("05d3"),a=e.n(n);for(var o in n)"default"!==o&&function(t){e.d(i,t,(function(){return n[t]}))}(o);i["default"]=a.a},"4e5e":function(t,i,e){t.exports=e.p+"static/img/back.6a5a9a71.png"},"726e":function(t,i,e){t.exports=e.p+"static/img/title.c47f25dc.png"},"790d":function(t,i,e){"use strict";var n;e.d(i,"b",(function(){return a})),e.d(i,"c",(function(){return o})),e.d(i,"a",(function(){return n}));var a=function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("v-uni-view",{staticClass:"container"},[e("v-uni-view",{staticClass:"header"},[e("v-uni-view",{staticClass:"lang"},[e("v-uni-navigator",{staticClass:"backbtn",attrs:{url:"../index/index"}}),e("v-uni-image",{attrs:{src:t.lanpic},on:{click:function(i){arguments[0]=i=t.$handleEvent(i),t.changelang()}}})],1),e("v-uni-view",{staticClass:"mainrow"},[e("v-uni-text",{staticStyle:{"font-size":"46rpx"}},[t._v(t._s(t.content.title))])],1),e("v-uni-view",{},[e("v-uni-text",{domProps:{innerHTML:t._s(t.content.html)}})],1)],1)],1)},o=[]},a903:function(t,i,e){var n=e("dd0a");"string"===typeof n&&(n=[[t.i,n,""]]),n.locals&&(t.exports=n.locals);var a=e("4f06").default;a("26c3f285",n,!0,{sourceMap:!1,shadowMode:!1})},b10d:function(t,i,e){"use strict";var n=e("a903"),a=e.n(n);a.a},b430:function(t,i,e){"use strict";e.r(i);var n=e("790d"),a=e("333d");for(var o in a)"default"!==o&&function(t){e.d(i,t,(function(){return a[t]}))}(o);e("b10d");var r,c=e("f0c5"),d=Object(c["a"])(a["default"],n["b"],n["c"],!1,null,"33b0ea62",null,!1,n["a"],r);i["default"]=d.exports},da57:function(t,i,e){t.exports=e.p+"static/img/background.1be773c0.png"},dd0a:function(t,i,e){var n=e("24fb"),a=e("1de5"),o=e("da57"),r=e("4e5e"),c=e("726e");i=n(!1);var d=a(o),s=a(r),l=a(c);i.push([t.i,'@charset "UTF-8";\n/**\n * 这里是uni-app内置的常用样式变量\n *\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\n *\n */\n/**\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\n *\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\n */\n/* 颜色变量 */\n/* 行为相关颜色 */\n/* 文字基本颜色 */\n/* 背景颜色 */\n/* 边框颜色 */\n/* 尺寸变量 */\n/* 文字尺寸 */\n/* 图片尺寸 */\n/* Border Radius */\n/* 水平间距 */\n/* 垂直间距 */\n/* 透明度 */\n/* 文章场景相关 */uni-page-body[data-v-33b0ea62]{width:100%;height:100%;background:url('+d+") no-repeat fixed top;background-size:100%}.container[data-v-33b0ea62]{padding:%?20?%;font-size:%?14?%;line-height:%?24?%}.backbtn[data-v-33b0ea62]{width:%?260?%;height:%?120?%;margin-left:%?-20?%;background:url("+s+") no-repeat 0 0;background-size:60%}.maindiv .maintitle[data-v-33b0ea62]{text-align:center;font-size:%?48?%;font-family:黑体;font-weight:650;letter-spacing:%?20?%;margin-top:%?10?%;line-height:%?80?%}.maindiv .noticelist[data-v-33b0ea62]{margin-top:%?30?%}.maindiv .noticelist .noticeitem[data-v-33b0ea62]{display:table;width:94%;border:%?2?% solid #00a8ff;background-color:#fff;border-radius:%?30?%;margin-top:%?20?%;padding:%?20?%}.maindiv .noticelist .noticeitem .shortinfo[data-v-33b0ea62]{display:table-row;height:%?140?%}.maindiv .noticelist .noticeitem .shortinfo .arrow[data-v-33b0ea62]{background:url("+l+") no-repeat 50%;background-size:90%;width:20%;display:table-cell}.maindiv .noticelist .noticeitem .shortinfo .title[data-v-33b0ea62]{width:70%;font-size:%?40?%;line-height:%?60?%;padding-left:%?20?%;display:table-cell;vertical-align:middle}.maindiv .noticelist .noticeitem .shortinfo .switch[data-v-33b0ea62]{display:table-cell;vertical-align:bottom;width:5%}.maindiv .noticelist .noticeitem .shortinfo .switch .open[data-v-33b0ea62]{color:#1095ff;width:%?16?%;height:%?16?%}.maindiv .noticelist .noticeitem .shortinfo .switch .close[data-v-33b0ea62]{color:#1095ff;width:%?16?%;height:%?16?%}.maindiv .noticelist .noticeitem .details[data-v-33b0ea62]{display:table-row;width:100%;font-size:%?30?%;color:#777;line-height:%?40?%}.maindiv .noticelist .noticeitem .details uni-view[data-v-33b0ea62]{display:table-cell}body.?%PAGE?%[data-v-33b0ea62]{background:url("+d+") no-repeat fixed top;background-size:100%}",""]),t.exports=i}}]);