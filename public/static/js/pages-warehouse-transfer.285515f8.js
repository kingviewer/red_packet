(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-warehouse-transfer"],{"1db6":function(e,t,n){var a=n("8a58");"string"===typeof a&&(a=[[e.i,a,""]]),a.locals&&(e.exports=a.locals);var i=n("4f06").default;i("053ef18c",a,!0,{sourceMap:!1,shadowMode:!1})},"4dc4":function(e,t,n){"use strict";var a=n("1db6"),i=n.n(a);i.a},"8a58":function(e,t,n){var a=n("24fb");t=a(!1),t.push([e.i,'@charset "UTF-8";\n/**\n * 这里是uni-app内置的常用样式变量\n *\n * uni-app 官方扩展插件及插件市场（https://ext.dcloud.net.cn）上很多三方插件均使用了这些样式变量\n * 如果你是插件开发者，建议你使用scss预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App\n *\n */\n/**\n * 如果你是App开发者（插件使用者），你可以通过修改这些变量来定制自己的插件主题，实现自定义主题功能\n *\n * 如果你的项目同样使用了scss预处理，你也可以直接在你的 scss 代码中使用如下变量，同时无需 import 这个文件\n */\n/* 颜色变量 */\n/* 行为相关颜色 */\n/* 文字基本颜色 */\n/* 背景颜色 */\n/* 边框颜色 */\n/* 尺寸变量 */\n/* 文字尺寸 */\n/* 图片尺寸 */\n/* Border Radius */\n/* 水平间距 */\n/* 垂直间距 */\n/* 透明度 */\n/* 文章场景相关 */uni-page-body[data-v-779d4762]{width:100%;min-height:100%;background:linear-gradient(180deg,#11739d,#126c9a,#0b5b8f)}body.?%PAGE?%[data-v-779d4762]{background:linear-gradient(180deg,#11739d,#126c9a,#0b5b8f)}',""]),e.exports=t},aff6:function(e,t,n){"use strict";var a=n("4ea4");Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0,n("96cf");var i=a(n("1da1")),s=a(n("65b0")),u=a(n("bfd9")),p={data:function(){return{unit:"CIC",game_balance:"",bit_balance:"",checked1:!0,checked2:!1,formModel:{checked1:"0",checked2:"1",count:""},radios:[{name:"游戏账户 → 币币账户",value:"checked1"},{name:"币币账户 → 游戏账户",value:"checked2"}],current:0}},onLoad:function(e){this.game_balance=e.gameBalance,this.setTitle(),this.callWeb3()},methods:{callWeb3:function(){var e=this,t=uni.getStorageSync("user_token");t&&s.default.getWeb3().then((function(n){var a=new n.eth.Contract(u.default.game.abi,u.default.game.address);a.methods.balanceOf(t).call().then((function(t){var n=u.default.usdt.to_display_amount(t);e.bit_balance=n}))}))},setTitle:function(){uni.setNavigationBarTitle({title:"划转CIC"})},radioChange:function(e){for(var t=0;t<this.radios.length;t++)if(this.radios[t].value===e.detail.value){this.current=t;break}},transfer:function(){var e=this;return(0,i.default)(regeneratorRuntime.mark((function t(){var n,a,i;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:if(n=e,e.formModel.count){t.next=4;break}return uni.showToast({title:"请输入划转数量",icon:"none",duration:2e3}),t.abrupt("return");case 4:if(uni.getStorageSync("language")?uni.getStorageSync("language"):e.$i18n.locale,0!==e.current){t.next=10;break}return t.next=8,s.default.getdata(e,s.default.api.main.transform,{user_token:uni.getStorageSync("user_token"),amount:n.formModel.count},"POST","","",(function(e,t){console.log(t),"success"==t.code?(n.$util.Tips({title:t.msg||"划转成功"}),setTimeout((function(){uni.navigateBack({delta:1})}),2e3)):n.$util.Tips({title:t.msg},"/pages/register/register")}));case 8:t.next=13;break;case 10:a=e,i=uni.getStorageSync("user_token"),s.default.getWeb3().then((function(e){var t=new e.eth.Contract(u.default.game.abi,u.default.game.address);t.methods.depositForUser(u.default.cic.to_real_amount(a.formModel.count)).send({from:i,gas:4e4}).on("transactionHash",(function(e){a.$util.Tips({title:e.msg||"划转成功!"})})).on("error",(function(e){a.$util.Tips({title:e.msg||"划转失败!"})}))}));case 13:case"end":return t.stop()}}),t)})))()}}};t.default=p},b2fc:function(e,t,n){"use strict";n.r(t);var a=n("aff6"),i=n.n(a);for(var s in a)"default"!==s&&function(e){n.d(t,e,(function(){return a[e]}))}(s);t["default"]=i.a},bd5e:function(e,t,n){"use strict";n.r(t);var a=n("fd1e"),i=n("b2fc");for(var s in i)"default"!==s&&function(e){n.d(t,e,(function(){return i[e]}))}(s);n("4dc4");var u,p=n("f0c5"),r=Object(p["a"])(i["default"],a["b"],a["c"],!1,null,"779d4762",null,!1,a["a"],u);t["default"]=r.exports},bfd9:function(e,t,n){"use strict";n("c975"),n("ac1f"),n("5319"),Object.defineProperty(t,"__esModule",{value:!0}),t.default=void 0;var a={usdt:{address:"0x55d398326f99059fF775485246999027B3197955",to_real_amount:function(e){return a.to_real_amount(e,18)},to_display_amount:function(e){return a.to_display_amount(e,18)},abi:[{inputs:[],payable:!1,stateMutability:"nonpayable",type:"constructor"},{anonymous:!1,inputs:[{indexed:!0,internalType:"address",name:"owner",type:"address"},{indexed:!0,internalType:"address",name:"spender",type:"address"},{indexed:!1,internalType:"uint256",name:"value",type:"uint256"}],name:"Approval",type:"event"},{anonymous:!1,inputs:[{indexed:!0,internalType:"address",name:"previousOwner",type:"address"},{indexed:!0,internalType:"address",name:"newOwner",type:"address"}],name:"OwnershipTransferred",type:"event"},{anonymous:!1,inputs:[{indexed:!0,internalType:"address",name:"from",type:"address"},{indexed:!0,internalType:"address",name:"to",type:"address"},{indexed:!1,internalType:"uint256",name:"value",type:"uint256"}],name:"Transfer",type:"event"},{constant:!0,inputs:[],name:"_decimals",outputs:[{internalType:"uint8",name:"",type:"uint8"}],payable:!1,stateMutability:"view",type:"function"},{constant:!0,inputs:[],name:"_name",outputs:[{internalType:"string",name:"",type:"string"}],payable:!1,stateMutability:"view",type:"function"},{constant:!0,inputs:[],name:"_symbol",outputs:[{internalType:"string",name:"",type:"string"}],payable:!1,stateMutability:"view",type:"function"},{constant:!0,inputs:[{internalType:"address",name:"owner",type:"address"},{internalType:"address",name:"spender",type:"address"}],name:"allowance",outputs:[{internalType:"uint256",name:"",type:"uint256"}],payable:!1,stateMutability:"view",type:"function"},{constant:!1,inputs:[{internalType:"address",name:"spender",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"approve",outputs:[{internalType:"bool",name:"",type:"bool"}],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!0,inputs:[{internalType:"address",name:"account",type:"address"}],name:"balanceOf",outputs:[{internalType:"uint256",name:"",type:"uint256"}],payable:!1,stateMutability:"view",type:"function"},{constant:!1,inputs:[{internalType:"uint256",name:"amount",type:"uint256"}],name:"burn",outputs:[{internalType:"bool",name:"",type:"bool"}],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!0,inputs:[],name:"decimals",outputs:[{internalType:"uint8",name:"",type:"uint8"}],payable:!1,stateMutability:"view",type:"function"},{constant:!1,inputs:[{internalType:"address",name:"spender",type:"address"},{internalType:"uint256",name:"subtractedValue",type:"uint256"}],name:"decreaseAllowance",outputs:[{internalType:"bool",name:"",type:"bool"}],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!0,inputs:[],name:"getOwner",outputs:[{internalType:"address",name:"",type:"address"}],payable:!1,stateMutability:"view",type:"function"},{constant:!1,inputs:[{internalType:"address",name:"spender",type:"address"},{internalType:"uint256",name:"addedValue",type:"uint256"}],name:"increaseAllowance",outputs:[{internalType:"bool",name:"",type:"bool"}],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!1,inputs:[{internalType:"uint256",name:"amount",type:"uint256"}],name:"mint",outputs:[{internalType:"bool",name:"",type:"bool"}],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!0,inputs:[],name:"name",outputs:[{internalType:"string",name:"",type:"string"}],payable:!1,stateMutability:"view",type:"function"},{constant:!0,inputs:[],name:"owner",outputs:[{internalType:"address",name:"",type:"address"}],payable:!1,stateMutability:"view",type:"function"},{constant:!1,inputs:[],name:"renounceOwnership",outputs:[],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!0,inputs:[],name:"symbol",outputs:[{internalType:"string",name:"",type:"string"}],payable:!1,stateMutability:"view",type:"function"},{constant:!0,inputs:[],name:"totalSupply",outputs:[{internalType:"uint256",name:"",type:"uint256"}],payable:!1,stateMutability:"view",type:"function"},{constant:!1,inputs:[{internalType:"address",name:"recipient",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"transfer",outputs:[{internalType:"bool",name:"",type:"bool"}],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!1,inputs:[{internalType:"address",name:"sender",type:"address"},{internalType:"address",name:"recipient",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"transferFrom",outputs:[{internalType:"bool",name:"",type:"bool"}],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!1,inputs:[{internalType:"address",name:"newOwner",type:"address"}],name:"transferOwnership",outputs:[],payable:!1,stateMutability:"nonpayable",type:"function"}]},cic:{address:"0x716Ba6938756aB83996688444e5Bc284c4e7B4F0",to_real_amount:function(e){return a.to_real_amount(e,8)},to_display_amount:function(e){return a.to_display_amount(e,8)},abi:[{inputs:[],stateMutability:"nonpayable",type:"constructor"},{anonymous:!1,inputs:[{indexed:!0,internalType:"address",name:"owner",type:"address"},{indexed:!0,internalType:"address",name:"spender",type:"address"},{indexed:!1,internalType:"uint256",name:"value",type:"uint256"}],name:"Approval",type:"event"},{anonymous:!1,inputs:[],name:"FomoModeToAccelerated",type:"event"},{anonymous:!1,inputs:[],name:"FomoModeToNormal",type:"event"},{anonymous:!1,inputs:[{indexed:!1,internalType:"uint256",name:"amount1",type:"uint256"},{indexed:!1,internalType:"uint256",name:"amount2",type:"uint256"},{indexed:!1,internalType:"uint256",name:"amountLP",type:"uint256"}],name:"LiquidityAdded",type:"event"},{anonymous:!1,inputs:[{indexed:!0,internalType:"address",name:"previousOwner",type:"address"},{indexed:!0,internalType:"address",name:"newOwner",type:"address"}],name:"OwnershipTransferred",type:"event"},{anonymous:!1,inputs:[{indexed:!0,internalType:"address",name:"from",type:"address"},{indexed:!0,internalType:"address",name:"to",type:"address"},{indexed:!1,internalType:"uint256",name:"value",type:"uint256"}],name:"Transfer",type:"event"},{anonymous:!1,inputs:[{indexed:!1,internalType:"address",name:"winner",type:"address"},{indexed:!1,internalType:"uint256",name:"reward",type:"uint256"}],name:"WinFomo",type:"event"},{inputs:[],name:"ADDR_BET",outputs:[{internalType:"address",name:"",type:"address"}],stateMutability:"view",type:"function"},{inputs:[],name:"ADDR_BLACK_HOLE",outputs:[{internalType:"address",name:"",type:"address"}],stateMutability:"view",type:"function"},{inputs:[],name:"ADDR_CACHE",outputs:[{internalType:"address",name:"",type:"address"}],stateMutability:"view",type:"function"},{inputs:[],name:"ADDR_DROP",outputs:[{internalType:"address",name:"",type:"address"}],stateMutability:"view",type:"function"},{inputs:[],name:"ADDR_FOMO",outputs:[{internalType:"address",name:"",type:"address"}],stateMutability:"view",type:"function"},{inputs:[],name:"ADDR_ROUTER",outputs:[{internalType:"address",name:"",type:"address"}],stateMutability:"view",type:"function"},{inputs:[],name:"ADDR_USDT",outputs:[{internalType:"address",name:"",type:"address"}],stateMutability:"view",type:"function"},{inputs:[],name:"geUnlockTime",outputs:[{internalType:"uint256",name:"",type:"uint256"}],stateMutability:"view",type:"function"},{inputs:[{internalType:"uint256",name:"time",type:"uint256"}],name:"lock",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[],name:"owner",outputs:[{internalType:"address",name:"",type:"address"}],stateMutability:"view",type:"function"},{inputs:[],name:"renounceOwnership",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[],name:"swapPair",outputs:[{internalType:"address",name:"",type:"address"}],stateMutability:"view",type:"function"},{inputs:[],name:"swapRouter",outputs:[{internalType:"contract IUniswapV2Router02",name:"",type:"address"}],stateMutability:"view",type:"function"},{inputs:[{internalType:"address",name:"newOwner",type:"address"}],name:"transferOwnership",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[],name:"unlock",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[],name:"enableTrading",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[],name:"disableTrading",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[{internalType:"address",name:"bet",type:"address"},{internalType:"uint256",name:"tokenAmount",type:"uint256"},{internalType:"uint256",name:"usdtAmount",type:"uint256"}],name:"addBet",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[{internalType:"address",name:"provider",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"providerAddLP",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[{internalType:"address",name:"provider",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"providerRemoveLP",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[{internalType:"address",name:"bet",type:"address"}],name:"getBetToken",outputs:[{internalType:"uint256",name:"",type:"uint256"}],stateMutability:"view",type:"function"},{inputs:[{internalType:"address",name:"bet",type:"address"}],name:"getBetUsdt",outputs:[{internalType:"uint256",name:"",type:"uint256"}],stateMutability:"view",type:"function"},{inputs:[],name:"getFomoInfo",outputs:[{internalType:"uint256",name:"totalCigar",type:"uint256"},{internalType:"uint256",name:"secsSinceLast",type:"uint256"},{internalType:"bool",name:"inAcceleratedMode",type:"bool"}],stateMutability:"view",type:"function"},{inputs:[],name:"loopFomo",outputs:[{internalType:"bool",name:"",type:"bool"}],stateMutability:"view",type:"function"},{inputs:[],name:"winFomo",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[],name:"dailyRelease",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[{internalType:"address",name:"from",type:"address"},{internalType:"address",name:"to",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"rechargeFromAddr",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[],name:"name",outputs:[{internalType:"string",name:"",type:"string"}],stateMutability:"view",type:"function"},{inputs:[],name:"symbol",outputs:[{internalType:"string",name:"",type:"string"}],stateMutability:"view",type:"function"},{inputs:[],name:"decimals",outputs:[{internalType:"uint8",name:"",type:"uint8"}],stateMutability:"view",type:"function"},{inputs:[],name:"totalSupply",outputs:[{internalType:"uint256",name:"",type:"uint256"}],stateMutability:"view",type:"function"},{inputs:[{internalType:"address",name:"account",type:"address"}],name:"balanceOf",outputs:[{internalType:"uint256",name:"",type:"uint256"}],stateMutability:"view",type:"function"},{inputs:[{internalType:"address",name:"recipient",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"transfer",outputs:[{internalType:"bool",name:"",type:"bool"}],stateMutability:"nonpayable",type:"function"},{inputs:[{internalType:"address",name:"recipient",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"withdrawU",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[{internalType:"address",name:"recipient",type:"address"},{internalType:"uint56",name:"amount",type:"uint56"}],name:"withdrawFromFomo",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[{internalType:"address",name:"recipient",type:"address"},{internalType:"uint56",name:"amount",type:"uint56"}],name:"withdrawFromBet",outputs:[],stateMutability:"nonpayable",type:"function"},{inputs:[{internalType:"address",name:"owner",type:"address"},{internalType:"address",name:"spender",type:"address"}],name:"allowance",outputs:[{internalType:"uint256",name:"",type:"uint256"}],stateMutability:"view",type:"function"},{inputs:[{internalType:"address",name:"spender",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"approve",outputs:[{internalType:"bool",name:"",type:"bool"}],stateMutability:"nonpayable",type:"function"},{inputs:[{internalType:"address",name:"sender",type:"address"},{internalType:"address",name:"recipient",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"transferFrom",outputs:[{internalType:"bool",name:"tsResult",type:"bool"}],stateMutability:"nonpayable",type:"function"},{inputs:[{internalType:"address",name:"spender",type:"address"},{internalType:"uint256",name:"addedValue",type:"uint256"}],name:"increaseAllowance",outputs:[{internalType:"bool",name:"",type:"bool"}],stateMutability:"nonpayable",type:"function"},{inputs:[{internalType:"address",name:"spender",type:"address"},{internalType:"uint256",name:"subtractedValue",type:"uint256"}],name:"decreaseAllowance",outputs:[{internalType:"bool",name:"",type:"bool"}],stateMutability:"nonpayable",type:"function"}]},game:{address:"0x3A96e8D46CC8Fc458c5de8893bCf31574B04588c",abi:[{anonymous:!1,inputs:[{indexed:!0,internalType:"address",name:"user",type:"address"},{indexed:!1,internalType:"uint256",name:"amount",type:"uint256"}],name:"Deposit",type:"event"},{anonymous:!1,inputs:[{indexed:!0,internalType:"address",name:"user",type:"address"},{indexed:!1,internalType:"uint256",name:"amount",type:"uint256"}],name:"DepositFromToken",type:"event"},{anonymous:!1,inputs:[{indexed:!0,internalType:"address",name:"previousOwner",type:"address"},{indexed:!0,internalType:"address",name:"newOwner",type:"address"}],name:"OwnershipTransferred",type:"event"},{anonymous:!1,inputs:[{indexed:!0,internalType:"address",name:"user",type:"address"},{indexed:!1,internalType:"uint256",name:"amount",type:"uint256"}],name:"Withdraw",type:"event"},{constant:!1,inputs:[{internalType:"address[]",name:"users",type:"address[]"},{internalType:"uint256[]",name:"amounts",type:"uint256[]"}],name:"addForUsers",outputs:[],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!0,inputs:[{internalType:"address",name:"user",type:"address"}],name:"balanceOf",outputs:[{internalType:"uint256",name:"",type:"uint256"}],payable:!1,stateMutability:"view",type:"function"},{constant:!1,inputs:[{internalType:"uint256",name:"amount",type:"uint256"}],name:"depositForUser",outputs:[{internalType:"uint256",name:"",type:"uint256"}],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!1,inputs:[{internalType:"address",name:"user",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"depositFromToken",outputs:[],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!0,inputs:[],name:"owner",outputs:[{internalType:"address",name:"",type:"address"}],payable:!1,stateMutability:"view",type:"function"},{constant:!1,inputs:[],name:"renounceOwnership",outputs:[],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!1,inputs:[{internalType:"address",name:"tokenAddr",type:"address"}],name:"setTokenAddr",outputs:[],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!1,inputs:[{internalType:"address",name:"newOwner",type:"address"}],name:"transferOwnership",outputs:[],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!1,inputs:[{internalType:"address",name:"recipient",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"withdraw",outputs:[{internalType:"uint256",name:"",type:"uint256"}],payable:!1,stateMutability:"nonpayable",type:"function"},{constant:!1,inputs:[{internalType:"address",name:"recipient",type:"address"},{internalType:"uint256",name:"amount",type:"uint256"}],name:"withdrawAnyway",outputs:[],payable:!1,stateMutability:"nonpayable",type:"function"}]},to_real_amount:function(e,t){var n,a=e+"";n=-1===a.indexOf(".")?0:a.length-a.indexOf(".")-1,a=a.replace(".","");for(var i=0;i<t-n;i++)a+="0";return a},to_display_amount:function(e,t){var n=e+"";if(e.length<t)for(var a=t-e.length+1,i=0;i<a;i++)n="0"+n;return n=n.substr(0,n.length-t)+"."+n.substr(n.length-t),n.length-n.indexOf(".")-1>6&&(n=n.substr(0,n.indexOf(".")+7)),n}},i=a;t.default=i},fd1e:function(e,t,n){"use strict";var a;n.d(t,"b",(function(){return i})),n.d(t,"c",(function(){return s})),n.d(t,"a",(function(){return a}));var i=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("v-uni-view",[n("v-uni-view",{staticClass:"warehouse-details__info"},[n("v-uni-view",{staticClass:"details__statics"},[n("v-uni-view",{staticClass:"avatar"},[n("v-uni-image",{staticClass:"avatar-img",attrs:{src:"/static/images/avatar.png",mode:"widthFix"}})],1),n("v-uni-view",{staticClass:"details__staticas--right"},[n("v-uni-view",[n("v-uni-view",{staticClass:"label"},[e._v("币币账户余额")]),n("v-uni-view",{staticClass:"num"},[e._v(e._s(e.bit_balance)+" "+e._s(e.unit))])],1),n("v-uni-view",[n("v-uni-view",{staticClass:"label"},[e._v("游戏账户余额")]),n("v-uni-view",{staticClass:"num"},[e._v(e._s(e.game_balance)+" "+e._s(e.unit))])],1),n("v-uni-view",[n("v-uni-view",{staticClass:"label"},[e._v("冻结数量")]),n("v-uni-view",{staticClass:"num"},[e._v("0 "+e._s(e.unit))])],1)],1)],1)],1),n("v-uni-view",{staticClass:"form-wrap"},[n("v-uni-view",{staticClass:"title"},[e._v("选择划转方向:")]),n("v-uni-form",[n("v-uni-radio-group",{on:{change:function(t){arguments[0]=t=e.$handleEvent(t),e.radioChange.apply(void 0,arguments)}}},e._l(e.radios,(function(t,a){return n("v-uni-label",{key:t.value,staticClass:"uni-list-cell"},[n("v-uni-view",[e._v(e._s(t.name))]),n("v-uni-view",[n("v-uni-radio",{attrs:{value:t.value,checked:a===e.current}})],1)],1)})),1),n("v-uni-label",{staticClass:"uni-list-cell"},[n("v-uni-view",[e._v("填写划转数量：")]),n("v-uni-input",{staticClass:"input",attrs:{type:"text",placeholder:"填写数量","placeholder-style":"color:#ffffff"},model:{value:e.formModel.count,callback:function(t){e.$set(e.formModel,"count",t)},expression:"formModel.count"}})],1),n("v-uni-button",{staticClass:"form_btn",attrs:{type:"default"},on:{click:function(t){arguments[0]=t=e.$handleEvent(t),e.transfer()}}},[e._v("确定")])],1)],1)],1)},s=[]}}]);