function getListData(e, a) {
	if (_listDataCache[e]) return _listDataCache[e];
	var t = [];
	return $.each(a,
	function(a, o) {
		var i = o.name;
		i.indexOf("one") > -1 || o.deprecated || o.demos.length && $.each(o.demos,
		function(a, i) {
			var n = i.desc || o.desc;
			t.push({
				demoName: o.name + (isEn ? "": " (" + n + ")"),
				demoURL: "widgets/" + e + "/" + o.name + "/" + a
			})
		})
	}),
	_listDataCache[e] = t,
	t
}
var _widgets = {
	style: {
		variables: {
			depStyle: []
		},
		mixins: {
			depStyle: []
		},
		base: {
			depStyle: []
		},
		grid: {
			depStyle: []
		},
		"block-grid": {
			depStyle: []
		},
		utility: {
			depStyle: []
		},
		button: {
			depStyle: []
		},
		code: {
			depStyle: []
		},
		form: {
			depStyle: []
		},
		image: {
			depStyle: []
		},
		table: {
			depStyle: []
		},
		animation: {
			depStyle: []
		},
		article: {
			depStyle: []
		},
		badge: {
			depStyle: []
		},
		breadcrumb: {
			depStyle: []
		},
		"button-group": {
			depStyle: ["button.less"]
		},
		close: {
			depStyle: []
		},
		comment: {
			depStyle: []
		},
		icon: {
			depStyle: []
		},
		"input-group": {
			depStyle: ["form.less", "button.less"]
		},
		list: {
			depStyle: []
		},
		nav: {
			depStyle: []
		},
		pagination: {
			depStyle: []
		},
		panel: {
			depStyle: []
		},
		progress: {
			depStyle: []
		},
		thumbnail: {
			depStyle: []
		},
		topbar: {
			depStyle: []
		},
		print: {
			depStyle: []
		}
	},
	js: {
		core: {
			depStyle: [],
			depJs: []
		},
		"ui.add2home": {
			depStyle: ["ui.add2home.less"],
			depJs: []
		},
		"ui.alert": {
			depStyle: ["ui.alert.less", "close.less", "ui.component.less"],
			depJs: []
		},
		"ui.button": {
			depStyle: ["button.less", "button-group.less", "icon.less"],
			depJs: []
		},
		"ui.collapse": {
			depStyle: ["ui.component.less"],
			depJs: []
		},
		"ui.dimmer": {
			depStyle: ["ui.component.less"],
			depJs: []
		},
		"ui.dropdown": {
			depStyle: ["ui.dropdown.less", "animation.less"],
			depJs: []
		},
		"ui.flexslider": {
			depStyle: ["ui.flexslider.less", "icon.less"],
			depJs: []
		},
		"ui.iscroll-lite": {
			depStyle: [],
			depJs: []
		},
		"ui.modal": {
			depStyle: ["ui.modal.less", "ui.component.less", "close.less"],
			depJs: ["ui.dimmer.js"]
		},
		"ui.offcanvas": {
			depStyle: ["ui.offcanvas.less"],
			depJs: []
		},
		"ui.pinchzoom": {
			depStyle: [],
			depJs: []
		},
		"ui.popover": {
			depStyle: ["ui.popover.less"],
			depJs: []
		},
		"ui.progress": {
			depStyle: ["ui.progress.less"],
			depJs: []
		},
		"ui.pureview": {
			depStyle: ["ui.pureview.less", "icon.less"],
			depJs: ["ui.pinchzoom.js", "util.hammer.js"]
		},
		"ui.scrollspy": {
			depStyle: ["animation.less"],
			depJs: []
		},
		"ui.scrollspynav": {
			depStyle: [],
			depJs: ["ui.smooth-scroll.js"]
		},
		"ui.share": {
			depStyle: ["ui.share.less", "icon.less", "button.less"],
			depJs: ["util.qrcode.js", "ui.modal.js"]
		},
		"ui.smooth-scroll": {
			depStyle: [],
			depJs: []
		},
		"ui.sticky": {
			depStyle: ["ui.component.less", "animation.less"],
			depJs: []
		},
		"ui.tabs": {
			depStyle: ["nav.less", "ui.tabs.less"],
			depJs: ["util.hammer.js"]
		},
		"ui.datepicker": {
			depStyle: ["form.less", "icon.less", "input-group.less", "ui.datepicker.less"],
			depJs: []
		},
		"ui.selected": {
			depStyle: ["utility.less", "button.less", "icon.less", "form.less", "ui.dropdown.less", "ui.selected.less"],
			depJs: ["ui.dropdown.js"]
		},
		"ui.ucheck": {
			depStyle: ["icon.less", "ui.ucheck.less"],
			depJs: []
		},
		"ui.validator": {
			depStyle: ["form.less"],
			depJs: []
		},
		"util.cookie": {
			depStyle: [],
			depJs: []
		},
		"util.fullscreen": {
			depStyle: [],
			depJs: []
		},
		"util.geolocation": {
			depStyle: [],
			depJs: []
		},
		"util.hammer": {
			depStyle: [],
			depJs: []
		},
		"util.qrcode": {
			depStyle: [],
			depJs: []
		},
		"util.store": {
			depStyle: [],
			depJs: []
		}
	},
	widgets: {
		accordion: {
			id: "accordion",
			name: "Accordion",
			localName: {
				en: "Accordion",
				"zh-cn": "折叠面板"
			},
			version: "2.1.0",
			description: "类似手风琴的内容折叠模块",
			author: {
				name: "Minwe",
				email: "minwe@yunshipei.com"
			},
			ver: "2.1",
			icon: "accordion.png",
			tpl: '{{#this}}\n  <section data-am-widget="accordion" class="am-accordion {{#if theme}}am-accordion-{{theme}}{{else}}am-accordion-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}"{{#if id}} id="{{id}}"{{/if}} data-am-accordion=\'{ {{#if options.multiple}}"multiple": true{{/if}} }\'>\n    {{#each content}}\n      <dl class="am-accordion-item{{#if active}} am-active{{/if}}{{#if disabled}} am-disabled{{/if}}">\n        <dt class="am-accordion-title">\n          {{{title}}}\n        </dt>\n        <dd class="am-accordion-bd am-collapse {{#if active}}am-in{{/if}}">\n          \x3c!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 --\x3e\n          <div class="am-accordion-content">\n            {{{content}}}\n          </div>\n        </dd>\n      </dl>\n    {{/each}}\n  </section>\n{{/this}}\n',
			example: "",
			depStyle: ["icon.less", "ui.component.less"],
			depJs: ["ui.collapse.js"],
			options: {
				multiple: {
					name: "同时展开多个面板",
					desc: "是否允许同时展开多个面板",
					type: "select",
					"default": !1,
					required: !1,
					dataList: [{
						value: "false",
						title: "不启用",
						selected: !0
					},
					{
						value: !0,
						title: "启用"
					}]
				}
			},
			themes: [{
				name: "default",
				desc: "圆角灰边",
				options: {
					multiple: !1
				},
				hook: "hook-am-accordion-default",
				variables: [{
					variable: "accordion-item-border-color",
					name: "边框颜色",
					"default": "rgba(0, 0, 0, 0.05)",
					used: [{
						selector: ".am-accordion-item",
						property: "border-top-color"
					}]
				},
				{
					variable: "accordion-title-color",
					name: "标题颜色",
					"default": "rgba(0, 0, 0, 0.6)",
					used: [{
						selector: ".am-accordion-title",
						property: "color"
					}]
				},
				{
					variable: "accordion-title-active-color",
					name: "标题激活颜色",
					"default": "#428bca",
					used: [{
						selector: ".am-accordion-title:hover",
						property: "color"
					},
					{
						selector: ".am-active .am-accordion-title",
						property: "color"
					}]
				},
				{
					variable: "accordion-title-active-bg-color",
					name: "标题激活背景颜色",
					"default": "#eee",
					used: [{
						selector: ".am-active .am-accordion-title",
						property: "background-color"
					}]
				},
				{
					variable: "accordion-content-color",
					name: "内容颜色",
					"default": "#666",
					used: [{
						selector: ".am-accordion-content",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							multiple: !0
						},
						content: [{
							title: "就这样恣意的活着",
							content: "置身人群中 <br/> 你只需要被淹没 享受 沉默 <br/> 退到人群后 <br/> 你只需给予双手 微笑 等候",
							active: !0,
							disabled: !0
						},
						{
							title: "让生命去等候，去等候，去等候，去等候",
							content: "走在忠孝东路 <br/> 徘徊在茫然中 <br/> 在我的人生旅途 <br/> 选择了多少错误 <br/> 我在睡梦中惊醒 <br/> 感叹悔言无尽 <br/> 恨我不能说服自己 <br/> 接受一切教训 <br/> 让生命去等候 <br/> 等候下一个漂流 <br/> 让生命去等候 <br/>等候下一个伤口"
						},
						{
							title: "我就这样告别山下的家",
							content: "我就这样告别山下的家，我实在不愿轻易让眼泪留下。我以为我并不差不会害怕，我就这样自己照顾自己长大。我不想因为现实把头低下，我以为我并不差能学会虚假。怎样才能够看穿面具里的谎话？别让我的真心散的像沙。如果有一天我变得更复杂，还能不能唱出歌声里的那幅画？"
						}]
					}
				}]
			},
			{
				name: "basic",
				desc: "极简无边框",
				options: {
					multiple: !1
				},
				hook: "hook-am-accordion-basic",
				variables: [{
					variable: "accordion-title-color",
					name: "标题颜色",
					"default": "#333",
					used: [{
						selector: ".am-accordion-title",
						property: "color"
					}]
				},
				{
					variable: "accordion-title-active-color",
					name: "标题激活颜色",
					"default": "#428bca",
					used: [{
						selector: ".am-accordion-title:hover",
						property: "color"
					},
					{
						selector: ".am-active .am-accordion-title",
						property: "color"
					}]
				},
				{
					variable: "accordion-content-color",
					name: "内容颜色",
					"default": "#666",
					used: [{
						selector: ".am-accordion-content",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {}
				}]
			},
			{
				name: "gapped",
				desc: "扁平分离边框",
				options: {
					multiple: !1
				},
				hook: "hook-am-accordion-gapped",
				variables: [{
					variable: "accordion-item-border-color",
					name: "边框颜色",
					"default": "rgba(0, 0, 0, 0.1)",
					used: [{
						selector: ".am-accordion-item",
						property: "border-color"
					}]
				},
				{
					variable: "accordion-title-color",
					name: "标题颜色",
					"default": "rgba(0, 0, 0, 0.6)",
					used: [{
						selector: ".am-accordion-title",
						property: "color"
					}]
				},
				{
					variable: "accordion-title-active-color",
					name: "标题激活颜色",
					"default": "rgba(0, 0, 0, 0.8)",
					used: [{
						selector: ".am-accordion-title:hover",
						property: "color"
					},
					{
						selector: ".am-active .am-accordion-title",
						property: "color"
					}]
				},
				{
					variable: "accordion-title-active-bg",
					name: "标题激活背景色",
					"default": "#f5f5f5",
					used: [{
						selector: ".am-active .am-accordion-title",
						property: "background-color"
					}]
				},
				{
					variable: "accordion-content-color",
					name: "内容颜色",
					"default": "#666",
					used: [{
						selector: ".am-accordion-content",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				options: {
					multiple: !1
				},
				hook: "hook-am-accordion-one",
				variables: [{
					variable: "accordion-item-border-color",
					name: "边框颜色",
					"default": "#dfdfdf",
					used: [{
						selector: ".am-accordion-item",
						property: "border-color"
					}]
				},
				{
					variable: "accordion-title-color",
					name: "标题颜色",
					"default": "#555",
					used: [{
						selector: ".am-accordion-title",
						property: "color"
					}]
				},
				{
					variable: "accordion-content-color",
					name: "内容颜色",
					"default": "#666",
					used: [{
						selector: ".am-accordion-content",
						property: "color"
					}]
				},
				{
					variable: "accordion-title-active-color",
					name: "标题激活颜色",
					"default": "#15afef",
					used: [{
						selector: ".am-active .am-accordion-title",
						property: "color"
					}]
				},
				{
					variable: "accordion-title-active-color",
					name: "标题激活背景色",
					"default": "#f8f8f8",
					used: [{
						selector: ".am-active .am-accordion-title",
						property: "background-color"
					}]
				}],
				demos: [{
					desc: "",
					data: {}
				}]
			}],
			demoContent: [{
				title: "就这样恣意的活着",
				content: "置身人群中 <br/> 你只需要被淹没 享受 沉默 <br/> 退到人群后 <br/> 你只需给予双手 微笑 等候",
				active: !0
			},
			{
				title: "让生命去等候，去等候，去等候，去等候",
				content: "走在忠孝东路 <br/> 徘徊在茫然中 <br/> 在我的人生旅途 <br/> 选择了多少错误 <br/> 我在睡梦中惊醒 <br/> 感叹悔言无尽 <br/> 恨我不能说服自己 <br/> 接受一切教训 <br/> 让生命去等候 <br/> 等候下一个漂流 <br/> 让生命去等候 <br/>等候下一个伤口"
			},
			{
				title: "我就这样告别山下的家",
				content: "我就这样告别山下的家，我实在不愿轻易让眼泪留下。我以为我并不差不会害怕，我就这样自己照顾自己长大。我不想因为现实把头低下，我以为我并不差能学会虚假。怎样才能够看穿面具里的谎话？别让我的真心散的像沙。如果有一天我变得更复杂，还能不能唱出歌声里的那幅画？"
			}]
		},
		divider: {
			id: "divider",
			name: "Divider",
			localName: {
				en: "Divider",
				"zh-cn": "分割线"
			},
			version: "2.0.1",
			description: "分割线",
			author: {
				name: "Shengli",
				email: "china_victory@yunshipei.com"
			},
			ver: "2.0",
			icon: "divider.png",
			tpl: '{{#this}}\n  <hr data-am-widget="divider" style="{{#if options.width}}width:{{{options.width}}};{{/if}}{{#if options.height}}height:{{{options.height}}};{{/if}}" class="am-divider {{#if theme}}am-divider-{{theme}}{{else}}am-divider-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}"{{#if id}} id="{{id}}"{{/if}} />\n{{/this}}\n',
			example: "",
			depStyle: [],
			options: {},
			themes: [{
				name: "default",
				desc: "灰色分隔线",
				hook: "hook-am-divider-default",
				variables: [{
					variable: "divider-bg-color",
					name: "分割线颜色",
					"default": "#ddd",
					used: [{
						selector: "",
						property: "background-color"
					}]
				}],
				demos: [{
					desc: "",
					data: {}
				}]
			},
			{
				name: "dotted",
				desc: "点分割线",
				hook: "hook-am-divider-default",
				demos: [{
					desc: "",
					data: {}
				}]
			},
			{
				name: "dashed",
				desc: "虚线分割线",
				hook: "hook-am-divider-default",
				demos: [{
					desc: "",
					data: {}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				hook: "hook-am-divider-one",
				variables: [{
					variable: "divider-bg-color",
					name: "分割线颜色",
					"default": "#dfdfdf",
					used: [{
						selector: "",
						property: "background-color"
					}]
				}],
				demos: [{
					desc: "",
					data: {}
				}]
			}]
		},
		duoshuo: {
			id: "duoshuo",
			name: "Duoshuo",
			localName: {
				en: "Duoshuo",
				"zh-cn": "多说"
			},
			version: "2.0.1",
			description: "多说评论系统",
			author: {
				name: "minwe",
				email: "minwe@yunshipei.com"
			},
			ver: "2.0",
			icon: "duoshuo.png",
			tpl: '{{#this}}\n  <div data-am-widget="duoshuo" class="am-duoshuo{{#if theme}} am-duoshuo-{{theme}}{{else}} am-duoshuo-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}"{{#if id}} id="{{id}}"{{/if}} {{#if options.shortName}}data-ds-short-name="{{options.shortName}}"{{/if}}>\n    <div class="ds-thread" {{#if content}}{{#each content}}{{#ifCond @key \'==\' \'threadKey\'}}  data-thread-key="{{this}}"{{else}} data-{{@key}}="{{this}}"{{/ifCond}}{{/each}}{{/if}}>\n    </div>\n  </div>\n{{/this}}',
			example: "",
			depStyle: [],
			depJs: [],
			options: {
				shortName: {
					name: "多说域名",
					desc: "xxx.duoshuo.com 中的 xxx",
					type: "text",
					"default": "",
					required: !0
				}
			},
			themes: [{
				id: "default",
				name: "default",
				desc: "默认",
				options: {},
				hook: "hook-am-duoshuo-default",
				variables: [],
				demos: [{
					desc: "",
					data: {
						options: {
							shortName: "amazeui"
						}
					}
				}]
			}]
		},
		figure: {
			id: "figure",
			name: "Figure",
			localName: {
				en: "Figure",
				"zh-cn": "单张图片"
			},
			version: "2.0.3",
			description: "显示单张图片",
			author: {
				name: "Minwe",
				email: "minwe@yunshipei.com"
			},
			ver: "2.0",
			icon: "figure.png",
			tpl: '{{#this}}\n  <figure data-am-widget="figure" class="am am-figure {{#if theme}}am-figure-{{theme}}{{else}}am-figure-default{{/if}} {{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}" {{#if id}}\n      id="{{id}}"{{/if}}  data-am-figure="{ {{#if options.zoomAble}} pureview: \'{{options.zoomAble}}\'{{/if}} }">\n    {{#if content.link}}<a href="{{content.link}}" title="{{content.figcaption}}" class="{{className}}">{{/if}}\n\n    {{#if options.figcaptionPosition}}\n      {{#ifCond options.figcaptionPosition \'==\' \'top\'}}\n        {{#if content.figcaption}}\n          <figcaption class="am-figure-capition-top">\n            {{content.figcaption}}\n          </figcaption>\n        {{/if}}\n      {{/ifCond}}\n    {{/if}}\n\n    {{#if content.img}}\n      <img src="{{content.img}}" {{#if content.rel}}data-rel="{{content.rel}}"{{/if}} alt="{{#if content.imgAlt}}{{content.imgAlt}}{{else}}{{content.figcaption}}{{/if}}"/>\n    {{/if}}\n    {{#if options.figcaptionPosition}}\n      {{#ifCond options.figcaptionPosition \'==\' \'bottom\'}}\n        {{#if content.figcaption}}\n          <figcaption class="am-figure-capition-btm">\n            {{content.figcaption}}\n          </figcaption>\n        {{/if}}\n      {{/ifCond}}\n    {{else}}\n      {{#if content.figcaption}}\n        <figcaption class="am-figure-capition-btm">\n          {{content.figcaption}}\n        </figcaption>\n      {{/if}}\n    {{/if}}\n\n    {{#if content.link}}</a>{{/if}}\n  </figure>\n{{/this}}\n',
			example: "",
			depStyle: ["ui.pureview.less"],
			depJs: ["ui.pinchzoom.js", "ui.pureview.js"],
			options: {
				figcaptionPosition: {
					name: "标题位置",
					desc: "图片标题相对于图片的位置",
					type: "select",
					"default": "bottom",
					required: !0,
					dataList: [{
						value: "bottom",
						title: "图片下方",
						selected: !0
					},
					{
						value: "top",
						title: "图片上方"
					}]
				},
				zoomAble: {
					name: "图片缩放",
					desc: "图片触控缩放功能",
					type: "select",
					"default": !0,
					required: !0,
					dataList: [{
						value: "auto",
						title: "自动判断",
						selected: !0
					},
					{
						value: !0,
						title: "强制启用",
						selected: !0
					},
					{
						value: !1,
						title: "强制禁用"
					}]
				}
			},
			themes: [{
				name: "default",
				desc: "灰色边框",
				options: {
					figcaptionPosition: "bottom",
					zoomble: !1
				},
				hook: "hook-am-figure-default",
				variables: [{
					variable: "figure-img-border-color",
					name: "图片边框颜色",
					"default": "#dedede",
					used: [{
						selector: "img",
						property: "border-color"
					}]
				},
				{
					variable: "figure-color",
					name: "文字颜色",
					"default": "#333",
					used: [{
						selector: "figcaption",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							figcaptionPosition: "bottom",
							zoomAble: !0
						}
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				options: {
					figcaptionPosition: "bottom",
					zoomble: !1
				},
				hook: "hook-am-figure-one",
				variables: [{
					variable: "figure-img-border-color",
					name: "图片边框颜色",
					"default": "#dfdfdf",
					used: [{
						selector: "img",
						property: "border-color"
					}]
				},
				{
					variable: "figure-bg",
					name: "背景颜色",
					"default": "#fff",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "figure-color",
					name: "文字颜色",
					"default": "#888",
					used: [{
						selector: "figcaption",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							figcaptionPosition: "bottom",
							zoomAble: "auto"
						}
					}
				}]
			}],
			demoContent: {
				img: "http://s.amazeui.org/media/i/demos/pure-1.jpg?imageView2/0/w/640",
				rel: "http://s.amazeui.org/media/i/demos/pure-1.jpg",
				figcaption: "春天的花开秋天的风以及冬天的落阳"
			}
		},
		footer: {
			id: "footer",
			name: "Footer",
			localName: {
				en: "Footer",
				"zh-cn": "页脚"
			},
			version: "3.1.2",
			description: "页脚模块，含“云适配版 | 电脑版”模式选择及网站相关其它信息，如公司版权等。",
			author: {
				name: "Shengli",
				email: "china_victory@yunshipei.com"
			},
			ver: "3.1",
			icon: "footer.png",
			tpl: '{{#this}}\n  <footer data-am-widget="footer"\n          class="am-footer {{#if theme}}am-footer-{{theme}}{{else}}am-footer-default {{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}"\n          {{#if id}}id="{{id}}"{{/if}} data-am-footer="{ {{#if options.addToHS}}addToHS: 1{{/if}} }">\n    <div class="am-footer-switch">\n    <span class="{{#if options.modal}}am-footer-ysp{{/if}}" data-rel="mobile"\n          data-am-modal="{target: \'#am-switch-mode\'}">\n      {{#unless content.switchName}}\n        {{#ifCond content.lang \'==\' \'en\'}}\n          Mobile\n        {{else}}\n          云适配版\n        {{/ifCond}}\n      {{else}}\n        {{content.switchName}}\n      {{/unless}}\n    </span>\n      <span class="am-footer-divider"> | </span>\n      <a id="godesktop" data-rel="desktop" class="am-footer-desktop" href="javascript:">\n        {{#ifCond content.lang \'==\' \'en\'}}\n          Desktop\n        {{else}}\n          电脑版\n        {{/ifCond}}\n      </a>\n    </div>\n    <div class="am-footer-miscs {{#if options.textPosition}}am-text-left{{/if}}">\n\n      {{#if options.techSupportCo}}\n        {{#ifCond content.lang \'==\' \'en\'}}\n          <p>Supported by {{#if options.techSupportSite}}<a href="{{options.techSupportSite}}"\n                                                            title="{{options.techSupportCo}}"\n                                                            target="_blank"> class="{{className}}"{{{options.techSupportCo}}}</a>{{else}}{{{options.techSupportCo}}}{{/if}}\n            .</p>\n        {{else}}\n          <p>由 {{#if options.techSupportSite}}<a href="{{options.techSupportSite}}" title="{{options.techSupportCo}}"\n                                                target="_blank" class="{{techSupportClassName}}">{{{options.techSupportCo}}}</a>{{else}}{{{options.techSupportCo}}}{{/if}}\n            提供技术支持</p>\n        {{/ifCond}}\n      {{/if}}\n      {{#each content.companyInfo}}\n        <p>{{{detail}}}</p>\n      {{/each}}\n    </div>\n  </footer>\n\n  <div id="am-footer-modal"\n       class="am-modal am-modal-no-btn am-switch-mode-m {{#if theme}}am-switch-mode-m-{{theme}}{{/if}}">\n    <div class="am-modal-dialog">\n      <div class="am-modal-hd am-modal-footer-hd">\n        <a href="javascript:void(0)" data-dismiss="modal" class="am-close am-close-spin {{className}}" data-am-modal-close>&times;</a>\n      </div>\n      <div class="am-modal-bd">\n        {{#ifCond content.lang \'==\' \'en\'}}\n          You are visiting\n        {{else}}\n          您正在浏览的是\n        {{/ifCond}}\n\n        <span class="am-switch-mode-owner">\n          {{#if content.owner}}\n            {{content.owner}}\n          {{else}}\n            云适配\n          {{/if}}\n        </span>\n\n        <span class="am-switch-mode-slogan">\n          {{#if content.slogan}}\n            {{{content.slogan}}}\n          {{else}}\n            {{#ifCond content.lang \'==\' \'en\'}}\n              mobilized version for your device.\n            {{else}}\n              为您当前手机订制的移动网站。\n            {{/ifCond}}\n          {{/if}}\n        </span>\n      </div>\n    </div>\n  </div>\n{{/this}}\n',
			example: "",
			depStyle: ["icon.less", "close.less", "ui.add2home.less", "ui.modal.less", "ui.component.less"],
			depJs: ["ui.dimmer.js", "ui.modal.js", "ui.add2home.js", "util.cookie.js"],
			options: {
				modal: {
					name: "弹出层",
					desc: "可选值：'true'(默认) - ；'false' - 不显示",
					type: "select",
					required: !0,
					"default": !0,
					dataList: [{
						value: !1,
						title: "不显示"
					},
					{
						value: !0,
						title: "显示"
					}]
				},
				addToHS: {
					name: "添加到桌面图标",
					desc: "添加到桌面图标",
					type: "select",
					required: !1,
					"default": !1,
					dataList: [{
						value: !1,
						title: "关闭"
					},
					{
						value: !0,
						title: "开启"
					}]
				},
				techSupportCo: {
					name: "技术支持公司",
					desc: "",
					type: "text",
					placeholder: "技术支持公司名称",
					"default": "",
					required: !1
				},
				techSupportSite: {
					name: "技术支持网址",
					desc: "",
					type: "text",
					placeholder: "技术支持公司网址",
					"default": "",
					required: !1
				},
				textPosition: {
					name: "文字位置",
					desc: "可选值：left - 左对齐；默认 - 居中",
					type: "select",
					required: !1,
					"default": "",
					dataList: [{
						value: "",
						title: "居中"
					},
					{
						value: "left",
						title: "左对齐"
					}]
				}
			},
			themes: [{
				name: "default",
				desc: "默认",
				options: {
					modal: !0,
					siteType: "",
					textPosition: ""
				},
				hook: "hook-am-footer-default",
				variables: [{
					variable: "footer-bg",
					name: "背景颜色",
					"default": "#fff",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "footer-ysp-color",
					name: "云适配版文字颜色",
					"default": "#555",
					used: [{
						selector: ".am-footer-ysp",
						property: "color"
					}]
				},
				{
					variable: "footer-divider-color",
					name: "分隔线颜色",
					"default": "#ccc",
					used: [{
						selector: ".am-footer-divider",
						property: "color"
					}]
				},
				{
					variable: "footer-desktop-color",
					name: "电脑版颜色",
					"default": "#ccc",
					used: [{
						selector: ".am-footer-desktop",
						property: "color"
					}]
				},
				{
					variable: "footer-link-color",
					name: "链接颜色",
					"default": "#555",
					used: [{
						selector: "a",
						property: "color"
					}]
				},
				{
					variable: "footer-miscs-color",
					name: "版权信息颜色",
					"default": "#999",
					used: [{
						selector: ".am-footer-miscs",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							modal: !0,
							techSupportCo: "诺亚方舟",
							techSupportSite: "http://www.yunshipei.com/"
						}
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				options: {
					modal: !0,
					siteType: "",
					textPosition: ""
				},
				hook: "hook-am-footer-one",
				variables: [{
					variable: "footer-bg",
					name: "背景颜色",
					"default": "#fff",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "footer-ysp-color",
					name: "云适配版文字颜色",
					"default": "#555",
					used: [{
						selector: ".am-footer-ysp",
						property: "color"
					}]
				},
				{
					variable: "footer-divider-color",
					name: "分隔线颜色",
					"default": "#ccc",
					used: [{
						selector: ".am-footer-divider",
						property: "color"
					}]
				},
				{
					variable: "footer-desktop-color",
					name: "电脑版颜色",
					"default": "#ccc",
					used: [{
						selector: ".am-footer-desktop",
						property: "color"
					}]
				},
				{
					variable: "footer-link-color",
					name: "链接颜色",
					"default": "#555",
					used: [{
						selector: "a",
						property: "color"
					}]
				},
				{
					variable: "footer-miscs-color",
					name: "版权信息颜色",
					"default": "#999",
					used: [{
						selector: ".am-footer-miscs",
						property: "color"
					}]
				},
				{
					variable: "footer-miscs-link-color",
					name: "版权信息链接颜色",
					"default": "#555",
					used: [{
						selector: ".am-footer-miscs a",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							modal: !0,
							techSupportCo: "云适配",
							techSupportSite: "http://www.yunshipei.com/"
						}
					}
				}]
			}],
			demoContent: {
				owner: "云适配",
				companyInfo: [{
					detail: "CopyRight©2014  AllMobilize Inc."
				},
				{
					detail: "京ICP备13033158"
				}]
			}
		},
		gallery: {
			id: "gallery",
			name: "Gallery",
			localName: {
				en: "Gallery",
				"zh-cn": "图片画廊"
			},
			version: "3.0.0",
			description: "图片列表，点击可放大图片",
			author: {
				name: "Minwe",
				email: "minwe@yunshipei.com"
			},
			ver: "3.0",
			icon: "gallery.png",
			tpl: '{{#this}}\n  <ul data-am-widget="gallery" class="am-gallery{{#if options.cols}} am-avg-sm-{{options.cols}}{{else}} am-avg-sm-2{{/if}}\n  am-avg-md-3 am-avg-lg-4 {{#if\n  theme}}am-gallery-{{theme}}{{else}}am-gallery-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}" data-am-gallery="{ {{#if options.gallery}}pureview: true{{/if}} }" {{#if id}}id="{{id}}"{{/if}}>\n    {{#each content}}\n      <li>\n        <div class="am-gallery-item">\n          {{#if link}}\n            <a href="{{link}}" class="{{className}}">\n              {{#if img}}<img src="{{img}}" {{#if rel}}data-rel="{{rel}}"{{/if}} alt="{{title}}"/>{{/if}}\n              {{#if title}}\n                <h3 class="am-gallery-title">{{{title}}}</h3>\n              {{/if}}\n              {{#if desc}}\n                <div class="am-gallery-desc">{{{desc}}}</div>\n              {{/if}}\n            </a>\n          {{else}}\n            {{#if img}}<img src="{{img}}" {{#if rel}}data-rel="{{rel}}"{{/if}} alt="{{title}}"/>{{/if}}\n            {{#if title}}\n              <h3 class="am-gallery-title">{{{title}}}</h3>\n            {{/if}}\n            {{#if desc}}\n              <div class="am-gallery-desc">{{{desc}}}</div>\n            {{/if}}\n          {{/if}}\n        </div>\n      </li>\n    {{/each}}\n  </ul>\n{{/this}}\n',
			example: "",
			depStyle: ["ui.pureview.less"],
			depJs: ["ui.pinchzoom.js", "ui.pureview.js"],
			options: {
				cols: {
					name: "图片列数",
					desc: "图片列数，[1-5]{1}",
					type: "select",
					"default": "",
					required: !1,
					pattern: "[1-5]{1}",
					dataList: [{
						value: "1",
						title: "1"
					},
					{
						value: "2",
						title: "2"
					},
					{
						value: "3",
						title: "3"
					},
					{
						value: "4",
						title: "4"
					},
					{
						value: "5",
						title: "5"
					}]
				},
				gallery: {
					name: "Lightbox",
					desc: "是否开启点击图片全屏显示大图功能",
					type: "select",
					"default": !1,
					required: !1,
					dataList: [{
						value: "false",
						title: "不启用",
						selected: !0
					},
					{
						value: !0,
						title: "启用"
					}]
				}
			},
			themes: [{
				name: "default",
				desc: "无边框",
				options: {
					cols: 2,
					gallery: !0
				},
				hook: "hook-am-gallery-default",
				variables: [{
					variable: "gallery-title-color",
					name: "标题颜色",
					"default": "#555",
					used: [{
						selector: ".am-gallery-title",
						property: "color"
					}]
				},
				{
					variable: "gallery-desc-color",
					name: "描述信息颜色",
					"default": "#999",
					used: [{
						selector: ".am-gallery-desc",
						property: "color"
					}]
				}],
				demos: [{
					desc: "2列",
					data: {
						options: {
							cols: 2,
							gallery: !0
						}
					}
				},
				{
					desc: "3列",
					data: {
						options: {
							cols: 3,
							gallery: !0
						}
					}
				}]
			},
			{
				name: "overlay",
				desc: "浮层标题",
				options: {
					cols: 2,
					gallery: !1
				},
				hook: "hook-am-gallery-overlay",
				variables: [{
					variable: "gallery-title-color",
					name: "标题颜色",
					"default": "#FFF",
					used: [{
						selector: ".am-gallery-title",
						property: "color"
					}]
				},
				{
					variable: "gallery-title-bg",
					name: "标题背景颜色",
					"default": "rgba(0,0,0,0.5)",
					used: [{
						selector: ".am-gallery-title",
						property: "background-color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							cols: 2,
							gallery: !0
						}
					}
				}]
			},
			{
				name: "bordered",
				desc: "容器边框",
				options: {
					cols: 2,
					gallery: !1
				},
				hook: "hook-am-gallery-bordered",
				variables: [{
					variable: "gallery-title-color",
					name: "标题颜色",
					"default": "#555",
					used: [{
						selector: ".am-gallery-title",
						property: "color"
					}]
				},
				{
					variable: "gallery-desc-color",
					name: "描述信息颜色",
					"default": "#999",
					used: [{
						selector: ".am-gallery-desc",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							cols: 2
						}
					}
				}]
			},
			{
				name: "imgbordered",
				desc: "图片边框",
				options: {
					cols: 2,
					gallery: !1
				},
				hook: "hook-am-gallery-imgbordered",
				variables: [{
					variable: "gallery-title-color",
					name: "标题颜色",
					"default": "#555",
					used: [{
						selector: ".am-gallery-title",
						property: "color"
					}]
				},
				{
					variable: "gallery-desc-color",
					name: "描述信息颜色",
					"default": "#999",
					used: [{
						selector: ".am-gallery-desc",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							cols: 2
						}
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				options: {
					cols: 2,
					gallery: !0
				},
				hook: "hook-am-gallery-one",
				variables: [{
					variable: "gallery-bg",
					name: "背景颜色",
					"default": "#fff",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "gallery-title-color",
					name: "标题颜色",
					"default": "#555",
					used: [{
						selector: ".am-gallery-title",
						property: "color"
					}]
				},
				{
					variable: "gallery-desc-color",
					name: "描述信息颜色",
					"default": "#999",
					used: [{
						selector: ".am-gallery-desc",
						property: "color"
					}]
				},
				{
					variable: "gallery-more-bg",
					name: "更多背景",
					"default": "#dfdfdf",
					used: [{
						selector: ".am-gallery-more a",
						property: "background-color"
					}]
				},
				{
					variable: "gallery-more-link-color",
					name: "更多文字颜色",
					"default": "#555",
					used: [{
						selector: ".am-gallery-more a",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							cols: 2,
							gallery: !0
						}
					}
				}]
			}],
			demoContent: [{
				img: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
				link: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
				title: "远方 有一个地方 那里种有我们的梦想",
				desc: "2375-09-26"
			},
			{
				img: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
				link: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
				title: "某天 也许会相遇 相遇在这个好地方",
				desc: "2375-09-26"
			},
			{
				img: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
				link: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
				title: "不要太担心 只因为我相信",
				desc: "2375-09-26"
			},
			{
				img: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
				link: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
				title: "终会走过这条遥远的道路",
				desc: "2375-09-26"
			}]
		},
		gotop: {
			id: "gotop",
			name: "Gotop",
			localName: {
				en: "Gotop",
				"zh-cn": "回顶部"
			},
			version: "4.0.2",
			description: "回到顶部模块",
			author: {
				name: "Shengli",
				email: "china_victory@yunshipei.com"
			},
			ver: "4.0",
			icon: "gotop.png",
			tpl: '{{#this}}\n  <div data-am-widget="gotop" class="am-gotop {{#if theme}}am-gotop-{{theme}}{{else}}am-gotop-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}" {{#if id}}id="{{id}}"{{/if}}>\n    <a href="#top" title="{{content.title}}">\n      {{#if content.title}}\n        <span class="am-gotop-title">{{content.title}}</span>\n      {{/if}}\n      {{#if content.customIcon}}\n        <img class="am-gotop-icon-custom" src="{{content.customIcon}}" />\n      {{else}}\n        {{#if content.icon}}\n          <i class="am-gotop-icon am-icon-{{content.icon}}"></i>\n        {{else}}\n          <i class="am-gotop-icon am-icon-chevron-up"></i>\n        {{/if}}\n      {{/if}}\n    </a>\n  </div>\n{{/this}}\n',
			example: "",
			depStyle: [],
			depJs: ["ui.smooth-scroll.js"],
			options: {},
			themes: [{
				name: "default",
				desc: "居中按钮",
				hook: "hook-am-gotop-default",
				variables: [{
					variable: "gotop-link-bg",
					name: "背景颜色",
					"default": "#428bca",
					used: [{
						selector: "a",
						property: "background-color"
					}]
				},
				{
					variable: "gotop-link-color",
					name: "文字颜色",
					"default": "#fff",
					used: [{
						selector: "a",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						content: {
							title: "回到顶部"
						}
					}
				}]
			},
			{
				name: "fixed",
				desc: "右侧悬浮",
				hook: "hook-am-gotop-fixed",
				variables: [{
					variable: "gotop-icon-bg",
					name: "图标背景色",
					"default": "#555",
					used: [{
						selector: ".am-gotop-icon",
						property: "background-color"
					}]
				},
				{
					variable: "gotop-icon-color",
					name: "图标颜色",
					"default": "#ddd",
					used: [{
						selector: ".am-gotop-icon",
						property: "color"
					}]
				},
				{
					variable: "gotop-icon-hover-color",
					name: "图标 Hover 颜色",
					"default": "#fff",
					used: [{
						selector: ".am-gotop-icon:hover",
						property: "color"
					}]
				}],
				demos: [{
					desc: "默认 Icon",
					data: {
						content: {
							title: "回到顶部"
						}
					}
				},
				{
					desc: "设置 Icon",
					data: {
						content: {
							icon: "hand-o-up"
						}
					}
				},
				{
					desc: "自定义图片",
					data: {
						content: {
							customIcon: "http://amazeui.b0.upaiyun.com/assets/i/cpts/gotop/goTop.gif"
						}
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				hook: "hook-am-gotop-one",
				variables: [{
					variable: "gotop-bg",
					name: "背景颜色",
					"default": "#fff",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "gotop-border-color",
					name: "边框颜色",
					"default": "#15afef",
					used: [{
						selector: "",
						property: "border-color"
					}]
				},
				{
					variable: "gotop-icon-color",
					name: "图标",
					"default": "#15afef",
					used: [{
						selector: ".am-gotop-icon",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						theme: "one"
					}
				}]
			}]
		},
		header: {
			id: "header",
			name: "Header",
			localName: {
				en: "Header",
				"zh-cn": "页头"
			},
			version: "2.0.0",
			description: "页面顶部",
			author: {
				name: "hzp",
				email: "hzp@yunshipei.com"
			},
			ver: "2.0",
			icon: "header.png",
			tpl: '{{#this}}\n  <header data-am-widget="header"\n          class="am-header{{#if theme}} am-header-{{theme}}{{else}} am-header-default{{/if}}{{#if options.fixed}} am-header-fixed{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}"{{#if id}}\n          id="{{id}}"{{/if}}>\n    {{#if content.left}}\n      <div class="am-header-left am-header-nav">\n        {{#each content.left}}\n          <a href="{{link}}" class="{{className}}">\n            {{#if title}}\n              <span class="am-header-nav-title">\n                {{title}}\n              </span>\n            {{/if}}\n\n            {{# if customIcon}}\n              <img class="am-header-icon-custom" src="{{customIcon}}" alt=""/>\n            {{else}}\n              {{#if icon}}\n                <i class="am-header-icon am-icon-{{icon}}"></i>\n              {{/if}}\n            {{/if}}\n          </a>\n        {{/each}}\n      </div>\n    {{/if}}\n\n    {{#if content.title}}\n      <h1 class="am-header-title">\n        {{#if content.link}}\n          <a href="{{content.link}}" class="{{content.className}}">\n            {{{content.title}}}\n          </a>\n        {{else}}\n          {{{content.title}}}\n        {{/if}}\n      </h1>\n    {{/if}}\n\n    {{#if content.right}}\n      <div class="am-header-right am-header-nav">\n        {{#each content.right}}\n          <a href="{{link}}" class="{{className}}">\n            {{#if title}}\n              <span class="am-header-nav-title">\n                {{title}}\n              </span>\n            {{/if}}\n\n            {{# if customIcon}}\n              <img class="am-header-icon-custom" src="{{customIcon}}" alt=""/>\n            {{else}}\n              {{#if icon}}\n                <i class="am-header-icon am-icon-{{icon}}"></i>\n              {{/if}}\n            {{/if}}\n          </a>\n        {{/each}}\n      </div>\n    {{/if}}\n  </header>\n{{/this}}\n',
			example: "",
			depStyle: ["icon.less"],
			depJs: [],
			options: {},
			themes: [{
				name: "default",
				desc: "深色背景",
				options: {},
				hook: "hook-am-header-default",
				variables: [{
					variable: "header-bg",
					name: "背景颜色",
					"default": "#0e90d2",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "header-title-color",
					name: "标题颜色",
					"default": "#fff",
					used: [{
						selector: ".am-header-title,.am-header-title a",
						property: "color"
					}]
				},
				{
					variable: "header-nav-color",
					name: "两侧图标文字颜色",
					"default": "#fff",
					used: [{
						selector: ".am-header-nav a",
						property: "color"
					}]
				}],
				demos: [{
					desc: "图标",
					data: {
						content: {
							left: [{
								link: "#left-link",
								icon: "home"
							}],
							title: "Amaze UI",
							link: "#title-link",
							right: [{
								link: "#right-link",
								icon: "bars"
							}]
						}
					}
				},
				{
					desc: "图片图标",
					data: {
						content: {
							left: [{
								link: "#left-link",
								icon: "home",
								customIcon: 'data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 20"><path d="M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z" fill="%23fff"/></svg>'
							}],
							title: '<img src="http://s.amazeui.org/media/i/brand/amazeui-cw.png" />',
							right: [{
								link: "#right-link",
								customIcon: 'data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 42 26" fill="%23fff"><rect width="4" height="4"/><rect x="8" y="1" width="34" height="2"/><rect y="11" width="4" height="4"/><rect x="8" y="12" width="34" height="2"/><rect y="22" width="4" height="4"/><rect x="8" y="23" width="34" height="2"/></svg>'
							}]
						}
					}
				},
				{
					desc: "图标+文字",
					data: {
						content: {
							left: [{
								link: "#left-link",
								title: "首页",
								icon: "home"
							}],
							title: "Amaze UI",
							right: [{
								link: "#right-link",
								icon: "bars",
								title: "菜单"
							}]
						}
					}
				},
				{
					desc: "多图标",
					data: {
						content: {
							left: [{
								link: "#left-link",
								icon: "home"
							},
							{
								link: "#phone-link",
								icon: "phone"
							}],
							title: "Amaze UI",
							right: [{
								link: "#user-link",
								icon: "user"
							},
							{
								link: "#cart-link",
								icon: "shopping-cart"
							}]
						}
					}
				},
				{
					desc: "结合按钮",
					data: {
						content: {
							left: [{
								link: "#left-link",
								icon: "home",
								title: "返回",
								className: "am-btn am-btn-default"
							}],
							title: "Amaze UI",
							right: [{
								link: "#user-link",
								icon: "user"
							},
							{
								link: "#cart-link",
								className: "am-btn am-btn-secondary",
								icon: "shopping-cart"
							}]
						}
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				options: {},
				hook: "hook-am-header-one",
				variables: [{
					variable: "header-bg",
					name: "背景颜色",
					"default": "#fff",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "header-title-color",
					name: "标题颜色",
					"default": "#1c1c1c",
					used: [{
						selector: ".am-header-title, .am-header-title a",
						property: "color"
					}]
				},
				{
					variable: "header-icon-color",
					name: "图标颜色",
					"default": "#15afef",
					used: [{
						selector: ".am-header-nav a",
						property: "color"
					}]
				}],
				demos: [{
					data: {
						content: {
							left: [{
								link: "#left-link",
								icon: "home"
							}],
							title: "Amaze UI",
							right: [{
								link: "#right-link",
								icon: "bars"
							}]
						}
					}
				}]
			}]
		},
		intro: {
			id: "intro",
			name: "Intro",
			localName: {
				en: "Intro",
				"zh-cn": "简介"
			},
			version: "4.0.2",
			description: "多用于简单的场景，如网站简介、关于网站等",
			author: {
				name: "Shengli",
				email: "china_victory@yunshipei.com"
			},
			ver: "4.0",
			icon: "intro.png",
			tpl: '{{#this }}\n  <div data-am-widget="intro"\n       class="am-intro am-cf {{#if theme}}am-intro-{{theme}}{{else}}am-intro-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}"\n       {{#if id}}id="{{id}}"{{/if}}>\n    {{#if content.title}}\n      <div class="am-intro-hd">\n        <h2 class="am-intro-title">{{{content.title}}}</h2>\n        {{#if content.more.link}}\n          {{#ifCond options.position \'==\' \'top\'}}\n            <a class="am-intro-more am-intro-more-top {{content.more.className}}" href="{{content.more.link}}">{{content.more.title}}</a>\n          {{/ifCond}}\n        {{/if}}\n      </div>\n    {{/if}}\n\n    <div class="am-g am-intro-bd">\n      {{#if content.left}}\n        <div\n            class="am-intro-left {{#if options.leftCols}}am-u-sm-{{options.leftCols}}{{/if}}">{{{content.left}}}</div>\n      {{/if}}\n      {{#if content.right}}\n        <div\n            class="am-intro-right {{#if options.rightCols}}am-u-sm-{{options.rightCols}}{{/if}}">{{{content.right}}}</div>\n      {{/if}}\n    </div>\n    {{#ifCond options.position \'==\' \'bottom\'}}\n      <div class="am-intro-more-bottom">\n        <a class="am-btn am-btn-default {{content.more.className}}"\n           href="{{content.more.link}}">{{content.more.title}}</a>\n      </div>\n    {{/ifCond}}\n  </div>\n{{/this}}\n',
			example: "",
			depStyle: ["button.less"],
			depJs: [],
			options: {
				leftCols: {
					name: "左部大小（单位：栅格数）",
					desc: "左部所占栅格数（2-10）",
					type: "select",
					"default": "5",
					required: !0,
					dataList: [{
						value: "1",
						title: "1"
					},
					{
						value: "2",
						title: "2"
					},
					{
						value: "3",
						title: "3"
					},
					{
						value: "4",
						title: "4"
					},
					{
						value: "5",
						title: "5"
					},
					{
						value: "6",
						title: "6"
					},
					{
						value: "7",
						title: "7"
					},
					{
						value: "8",
						title: "8"
					},
					{
						value: "9",
						title: "9"
					},
					{
						value: "10",
						title: "10"
					},
					{
						value: "11",
						title: "11"
					},
					{
						value: "12",
						title: "12"
					}]
				},
				rightCols: {
					name: "右部大小（单位：栅格数）",
					desc: "右部所占栅格数（2-10）",
					type: "select",
					"default": "7",
					required: !0,
					dataList: [{
						value: "1",
						title: "1"
					},
					{
						value: "2",
						title: "2"
					},
					{
						value: "3",
						title: "3"
					},
					{
						value: "4",
						title: "4"
					},
					{
						value: "5",
						title: "5"
					},
					{
						value: "6",
						title: "6"
					},
					{
						value: "7",
						title: "7"
					},
					{
						value: "8",
						title: "8"
					},
					{
						value: "9",
						title: "9"
					},
					{
						value: "10",
						title: "10"
					},
					{
						value: "11",
						title: "11"
					},
					{
						value: "12",
						title: "12"
					}]
				},
				position: {
					name: "更多链接位置",
					desc: "更多链接显示位置",
					type: "select",
					"default": "top",
					required: !1,
					dataList: [{
						value: "top",
						title: "右上部"
					},
					{
						value: "bottom",
						title: "下部"
					}]
				}
			},
			themes: [{
				name: "default",
				desc: "默认",
				options: {
					leftCols: "5",
					rightCols: "7",
					position: "top"
				},
				hook: "hook-am-intro-default",
				variables: [{
					variable: "intro-hd-bg",
					name: "标题背景色",
					"default": "#0e90d2",
					used: [{
						selector: ".am-intro-hd",
						property: "background-color"
					}]
				},
				{
					variable: "intro-hd-color",
					name: "标题文本颜色",
					"default": "#fff",
					used: [{
						selector: ".am-intro-title",
						property: "color"
					}]
				},
				{
					variable: "intro-hd-link-color",
					name: "More链接颜色",
					"default": "#eee",
					used: [{
						selector: ".am-intro-hd a",
						property: "color"
					}]
				}],
				demos: [{
					desc: "More 在上",
					data: {
						options: {
							leftCols: 5,
							rightCols: 7,
							position: "top"
						}
					}
				},
				{
					desc: "More 在下",
					data: {
						options: {
							leftCols: 5,
							rightCols: 7,
							position: "bottom"
						}
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				options: {
					leftCols: "5",
					rightCols: "7",
					position: "bottom"
				},
				hook: "hook-am-intro-one",
				variables: [{
					variable: "intro-title-color",
					name: "标题颜色",
					"default": "#333",
					used: [{
						selector: ".am-intro-title",
						property: "color"
					}]
				},
				{
					variable: "intro-link-color",
					name: "链接颜色",
					"default": "#15afef",
					used: [{
						selector: "a",
						property: "color"
					}]
				},
				{
					variable: "intro-hd-border-color",
					name: "边框颜色",
					"default": "#15afef",
					used: [{
						selector: ".am-intro-hd",
						property: "border-bottom-color"
					},
					{
						selector: ".am-intro-title:before",
						property: "background-color"
					}]
				},
				{
					variable: "intro-content-color",
					name: "内容颜色",
					"default": "#555",
					used: [{
						selector: ".am-intro-bd",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							leftCols: 5,
							rightCols: 7,
							position: "top"
						}
					}
				}]
			}],
			demoContent: {
				title: "你好小娜",
				more: {
					link: "#more",
					title: "更多细节"
				},
				left: '<img src="http://s.amazeui.org/assets/2.x/i/cpts/intro/WP_Cortana_China.png" alt="小娜" />',
				right: "<p>Cortana 恐怕是用户急于更新到 WP8.1 Update 开发者预览版的原因之一</p><p>Cortana 中国版特有的新图标（面团，带眼睛，可在 Cortana 设置中切换回圆圈），使用的是中文语言，也同样支持 Cortana 笔记本。</p>"
			}
		},
		list_news: {
			id: "list_news",
			name: "List",
			localName: {
				en: "List",
				"zh-cn": "内容列表"
			},
			version: "4.0.0",
			description: "内容列表模块",
			author: {
				name: "Minwe Luo",
				email: "minwe@yunshipei.com"
			},
			ver: "4.0",
			icon: "list_news.png",
			tpl: '{{#this}}\n  <div data-am-widget="list_news" class="am-list-news{{#if theme}} am-list-news-{{theme}}{{else}} am-list-news-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}" {{#if id}}id="{{id}}"{{/if}}>\n  \x3c!--列表标题--\x3e\n  {{#if content.header.title}}\n    <div class="am-list-news-hd am-cf">\n      {{#if content.header.link}} \x3c!--带更多链接--\x3e\n        <a href="{{content.header.link}}" class="{{content.header.className}}">\n          <h2>{{{content.header.title}}}</h2>\n          {{#ifCond content.header.morePosition \'==\' \'top\'}}\n            <span class="am-list-news-more am-fr">{{{content.header.moreText}}}</span>\n          {{/ifCond}}\n        </a>\n      {{else}} \x3c!--不带更多链接--\x3e\n        <h2>{{{content.header.title}}}</h2>\n      {{/if}}\n    </div>\n  {{/if}}\n\n  <div class="am-list-news-bd">\n  <ul class="am-list">\n  {{#ifCond options.type \'==\' \'thumb\'}}\n    {{#ifCond options.thumbPosition \'==\' \'top\'}} \x3c!--缩略图在标题上方--\x3e\n    {{#each content.main}}\n      <li class="am-g{{#if date}} am-list-item-dated{{/if}}{{#if desc}} am-list-item-desced{{/if}}{{#if img}} am-list-item-thumbed am-list-item-thumb-top{{/if}}">\n        {{!--\n          am-list-item-dated - 带日期\n          am-list-item-desced - 带描述\n          am-list-item-thumbed - 带缩略图的\n        --}}\n        {{#if img}}\n        <div class="am-list-thumb am-u-sm-12">\n          <a href="{{link}}" class="{{className}}">\n            <img src="{{img}}" alt="{{title}}"/>\n          </a>\n          {{#if thumbAddition}}\n            <div class="am-list-thumb-addon">{{{thumbAddition}}}</div>\n          {{/if}}\n        </div>\n        {{/if}}\n\n        <div class="{{#if img}}{{/if}} am-list-main">\n          {{#if title}}\n            <h3 class="am-list-item-hd"><a href="{{link}}" class="{{className}}">{{{title}}}</a></h3>\n          {{/if}}\n\n          {{#if date}}\n            <span class="am-list-date">{{date}}</span>\n          {{/if}}\n\n          {{#if desc}}\n            <div class="am-list-item-text">{{{desc}}}</div>\n          {{/if}}\n\n          {{#if mainAddition}}\n            <div class="am-list-news-addon">{{{mainAddition}}}</div>\n          {{/if}}\n        </div>\n      </li>\n    {{/each}}\n    {{/ifCond}}\n\n    {{#ifCond options.thumbPosition \'==\' \'bottom-left\'}} \x3c!--缩略图在标题下方居左--\x3e\n    {{#each content.main}}\n      <li class="am-g{{#if date}} am-list-item-dated{{/if}}{{#if desc}} am-list-item-desced{{/if}}{{#if img}} am-list-item-thumbed am-list-item-thumb-bottom-left{{/if}}">\n        {{!--\n          am-list-item-dated - 带日期\n          am-list-item-desced - 带描述\n          am-list-item-thumbed - 带缩略图的\n        --}}\n        {{#if title}}\n          <h3 class="am-list-item-hd"><a href="{{link}}" class="{{className}}">{{{title}}}</a></h3>\n        {{/if}}\n        {{#if img}}\n        <div class="am-u-sm-4 am-list-thumb">\n          <a href="{{link}}" class="{{className}}">\n            <img src="{{img}}" alt="{{title}}"/>\n          </a>\n          {{#if thumbAddition}}\n            <div class="am-list-thumb-addon">{{{thumbAddition}}}</div>\n          {{/if}}\n        </div>\n        {{/if}}\n\n        <div class="{{#if img}} am-u-sm-8 {{/if}} am-list-main">\n          {{#if date}}\n            <span class="am-list-date">{{date}}</span>\n          {{/if}}\n\n          {{#if desc}}\n            <div class="am-list-item-text">{{{desc}}}</div>\n          {{/if}}\n\n          {{#if mainAddition}}\n            <div class="am-list-news-addon">{{{mainAddition}}}</div>\n          {{/if}}\n        </div>\n      </li>\n    {{/each}}\n    {{/ifCond}}\n\n    {{#ifCond options.thumbPosition \'==\' \'bottom-right\'}} \x3c!--缩略图在标题下方居右--\x3e\n    {{#each content.main}}\n      <li class="am-g{{#if date}} am-list-item-dated{{/if}}{{#if desc}} am-list-item-desced{{/if}}{{#if img}} am-list-item-thumbed am-list-item-thumb-bottom-right{{/if}}">\n        {{!--\n          am-list-item-dated - 带日期\n          am-list-item-desced - 带描述\n          am-list-item-thumbed - 带缩略图的\n        --}}\n        {{#if title}}\n          <h3 class="am-list-item-hd"><a href="{{link}}" class="{{className}}">{{{title}}}</a></h3>\n        {{/if}}\n\n        <div class="{{#if img}} am-u-sm-8{{/if}} am-list-main">\n          {{#if date}}\n            <span class="am-list-date">{{date}}</span>\n          {{/if}}\n\n          {{#if desc}}\n            <div class="am-list-item-text">{{{desc}}}</div>\n          {{/if}}\n\n          {{#if mainAddition}}\n            <div class="am-list-news-addon">{{{mainAddition}}}</div>\n          {{/if}}\n        </div>\n        {{#if img}}\n        <div class="am-list-thumb am-u-sm-4">\n          <a href="{{link}}" class="{{className}}">\n            <img src="{{img}}" alt="{{title}}"/>\n          </a>\n          {{#if thumbAddition}}\n            <div class="am-list-thumb-addon">{{{thumbAddition}}}</div>\n          {{/if}}\n        </div>\n        {{/if}}\n      </li>\n    {{/each}}\n    {{/ifCond}}\n\n    {{#ifCond options.thumbPosition \'==\' \'left\'}} \x3c!--缩略图在标题左边--\x3e\n    {{#each content.main}}\n      <li class="am-g{{#if date}} am-list-item-dated{{/if}}{{#if desc}} am-list-item-desced{{/if}}{{#if img}} am-list-item-thumbed am-list-item-thumb-left{{/if}}">\n        {{!--\n          am-list-item-dated - 带日期\n          am-list-item-desced - 带描述\n          am-list-item-thumbed - 带缩略图的\n        --}}\n        {{#if img}}\n        <div class="am-u-sm-4 am-list-thumb">\n          <a href="{{link}}" class="{{className}}">\n            <img src="{{img}}" alt="{{title}}"/>\n          </a>\n          {{#if thumbAddition}}\n            <div class="am-list-thumb-addon">{{{thumbAddition}}}</div>\n          {{/if}}\n        </div>\n        {{/if}}\n\n        <div class="{{#if img}} am-u-sm-8{{/if}} am-list-main">\n          {{#if title}}\n            <h3 class="am-list-item-hd"><a href="{{link}}" class="{{className}}">{{{title}}}</a></h3>\n          {{/if}}\n          {{#if date}}\n            <span class="am-list-date">{{date}}</span>\n          {{/if}}\n\n          {{#if desc}}\n            <div class="am-list-item-text">{{{desc}}}</div>\n          {{/if}}\n\n          {{#if mainAddition}}\n            <div class="am-list-news-addon">{{{mainAddition}}}</div>\n          {{/if}}\n        </div>\n      </li>\n    {{/each}}\n    {{/ifCond}}\n\n    {{#ifCond options.thumbPosition \'==\' \'right\'}} \x3c!--缩略图在标题右边--\x3e\n    {{#each content.main}}\n      <li class="am-g{{#if date}} am-list-item-dated{{/if}}{{#if desc}} am-list-item-desced{{/if}}{{#if img}} am-list-item-thumbed am-list-item-thumb-right{{/if}}">\n        {{!--\n          am-list-item-dated - 带日期\n          am-list-item-desced - 带描述\n          am-list-item-thumbed - 带缩略图的\n        --}}\n        <div class="{{#if img}} am-u-sm-8{{/if}} am-list-main">\n          {{#if title}}\n            <h3 class="am-list-item-hd"><a href="{{link}}" class="{{className}}">{{{title}}}</a></h3>\n          {{/if}}\n\n          {{#if date}}\n            <span class="am-list-date">{{date}}</span>\n          {{/if}}\n\n          {{#if desc}}\n            <div class="am-list-item-text">{{{desc}}}</div>\n          {{/if}}\n\n          {{#if mainAddition}}\n            <div class="am-list-news-addon">{{{mainAddition}}}</div>\n          {{/if}}\n        </div>\n        {{#if img}}\n          <div class="am-u-sm-4 am-list-thumb">\n            <a href="{{link}}" class="{{className}}">\n              <img src="{{img}}" alt="{{title}}"/>\n            </a>\n            {{#if thumbAddition}}\n              <div class="am-list-thumb-addon">{{{thumbAddition}}}</div>\n            {{/if}}\n          </div>\n        {{/if}}\n      </li>\n    {{/each}}\n    {{/ifCond}}\n\n  {{else}}{{!--不带缩略图--}}\n    {{#each content.main}}\n      <li class="am-g{{#if date}} am-list-item-dated{{/if}}{{#if desc}} am-list-item-desced{{/if}}{{#if img}} am-list-item-thumbed{{/if}}">\n        {{!--\n          am-list-item-dated - 带日期\n          am-list-item-desced - 带描述\n          am-list-item-thumbed - 带缩略图的\n        --}}\n        {{#if title}}\n          <a href="{{link}}" class="am-list-item-hd {{className}}">{{{title}}}</a>\n        {{/if}}\n\n        {{#if date}}\n          <span class="am-list-date">{{date}}</span>\n        {{/if}}\n\n        {{#if desc}}\n          <div class="am-list-item-text">{{{desc}}}</div>\n        {{/if}}\n\n        {{#if mainAddition}}\n          <div class="am-list-news-addon">{{{mainAddition}}}</div>\n        {{/if}}\n      </li>\n    {{/each}}\n  {{/ifCond}}\n  </ul>\n  </div>\n\n  {{#ifCond content.header.morePosition \'==\' \'bottom\'}}\x3c!--更多在底部--\x3e\n    {{#if content.header.link}}\n      <div class="am-list-news-ft">\n        <a class="am-list-news-more am-btn am-btn-default {{content.header.className}}" href="{{content.header.link}}">{{{content.header.moreText}}}</a>\n      </div>\n    {{/if}}\n  {{/ifCond}}\n  </div>\n{{/this}}\n',
			example: "",
			depStyle: ["list.less", "button.less"],
			depJs: [],
			options: {
				type: {
					name: "类型",
					desc: "列表类型：normal - 普通, thumb - 缩略图",
					type: "select",
					required: !1,
					"default": "normal",
					dataList: [{
						value: "normal",
						title: "文字列表"
					},
					{
						value: "thumb",
						title: "带缩略图列表"
					}]
				},
				thumbPosition: {
					name: "缩略图位置",
					desc: "缩略图相对于标题的位置",
					type: "select",
					required: "!!(options.type === 'thumb')",
					"default": "bottom-left",
					dataList: [{
						value: "top",
						title: "Top"
					},
					{
						value: "bottom-left",
						title: "Bottom-left"
					},
					{
						value: "bottom-right",
						title: "bottom-right"
					},
					{
						value: "left",
						title: "Left"
					},
					{
						value: "right",
						title: "Right"
					}]
				}
			},
			themes: [{
				id: "default",
				name: "default",
				desc: "默认",
				hook: "hook-am-list-news-default",
				variables: [{
					variable: "list-item-border-color",
					name: "边框颜色",
					"default": "#dedede",
					used: [{
						selector: ".am-list > li",
						property: "border-color"
					}]
				},
				{
					variable: "list-date-color",
					name: "日期颜色",
					"default": "#999",
					used: [{
						selector: ".am-list-date",
						property: "color"
					}]
				},
				{
					variable: "list-text-color",
					name: "摘要颜色",
					"default": "rgb(153, 153, 153)",
					used: [{
						selector: ".am-list .am-list-item-text",
						property: "color"
					}]
				}],
				demos: [{
					desc: "更多在上",
					data: {
						content: {
							header: {
								title: "栏目标题",
								link: "##",
								moreText: "更多 &raquo;",
								morePosition: "top"
							},
							main: [{
								title: "我很囧，你保重....晒晒旅行中的那些囧！",
								link: "##",
								date: "2013-09-18"
							},
							{
								title: "我最喜欢的一张画",
								link: "##",
								date: "2013-10-14"
							},
							{
								title: "“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！",
								link: "##",
								date: "2013-11-18"
							}]
						}
					}
				},
				{
					desc: "更多在下",
					data: {
						content: {
							header: {
								title: "栏目标题",
								link: "###",
								moreText: "查看更多 &raquo;",
								morePosition: "bottom"
							},
							main: [{
								title: "我很囧，你保重....晒晒旅行中的那些囧！",
								link: "http://www.douban.com/online/11614662/"
							},
							{
								title: "我最喜欢的一张画",
								link: "http://www.douban.com/online/11624755/"
							},
							{
								title: "“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！",
								link: "http://www.douban.com/online/11645411/"
							}]
						}
					}
				},
				{
					desc: "带摘要",
					data: {
						content: {
							header: {
								title: "栏目标题",
								link: "###",
								moreText: "更多 &raquo;",
								morePosition: "top"
							},
							main: [{
								title: "我很囧，你保重....晒晒旅行中的那些囧！",
								link: "http://www.douban.com/online/11614662/",
								desc: "囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！"
							},
							{
								title: "我最喜欢的一张画",
								link: "http://www.douban.com/online/11624755/",
								desc: "你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，"
							},
							{
								title: "“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！",
								link: "http://www.douban.com/online/11645411/"
							}]
						}
					}
				},
				{
					desc: "上图+摘要",
					data: {
						options: {
							type: "thumb",
							thumbPosition: "top"
						},
						content: {
							header: {
								title: "缩略图在上方 + 摘要",
								link: "###",
								moreText: "更多 &raquo;",
								morePosition: "top"
							},
							main: [{
								title: "我很囧，你保重....晒晒旅行中的那些囧！",
								link: "http://www.douban.com/online/11614662/",
								desc: "囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！",
								img: "http://img5.douban.com/lpic/o636459.jpg"
							},
							{
								title: "我最喜欢的一张画",
								link: "http://www.douban.com/online/11624755/",
								desc: "你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，",
								img: "http://img3.douban.com/lpic/o637240.jpg"
							},
							{
								title: "“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！",
								link: "http://www.douban.com/online/11645411/",
								desc: "还在苦恼圣诞礼物再也玩儿不出新意？快来抢2013最炫彩的跨国圣诞礼物！【参与方式】1.关注“UniqueWay无二之旅”豆瓣品牌小站http://brand.douban.com/uniqueway/2.上传一张**本人**在旅行中色彩最浓郁、最丰富的照片（色彩包含取景地、周边事物、服装饰品、女生彩妆等等，发挥你们无穷的创意想象力哦！^^）一定要有本人出现喔！3. 在照片下方，附上一句旅行宣言作为照片说明。 成功参与活动！* 听他们刚才说，上传照片的次",
								img: "http://img3.douban.com/lpic/o638852.jpg"
							}]
						}
					}
				},
				{
					desc: "左图+摘要",
					data: {
						options: {
							type: "thumb",
							thumbPosition: "left"
						},
						content: {
							header: {
								title: "左图 + 摘要",
								link: "###",
								moreText: "更多 &raquo;",
								morePosition: "top"
							},
							main: [{
								title: "我很囧，你保重....晒晒旅行中的那些囧！",
								link: "http://www.douban.com/online/11614662/",
								desc: "囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！",
								img: "http://img5.douban.com/lpic/o636459.jpg"
							},
							{
								title: "我最喜欢的一张画",
								link: "http://www.douban.com/online/11624755/",
								desc: "你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，",
								img: "http://img3.douban.com/lpic/o637240.jpg"
							},
							{
								title: "“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！",
								link: "http://www.douban.com/online/11645411/",
								desc: "还在苦恼圣诞礼物再也玩儿不出新意？快来抢2013最炫彩的跨国圣诞礼物！【参与方式】1.关注“UniqueWay无二之旅”豆瓣品牌小站http://brand.douban.com/uniqueway/2.上传一张**本人**在旅行中色彩最浓郁、最丰富的照片（色彩包含取景地、周边事物、服装饰品、女生彩妆等等，发挥你们无穷的创意想象力哦！^^）一定要有本人出现喔！3. 在照片下方，附上一句旅行宣言作为照片说明。 成功参与活动！* 听他们刚才说，上传照片的次"
							}]
						}
					}
				},
				{
					desc: "右图+摘要",
					data: {
						options: {
							type: "thumb",
							thumbPosition: "right"
						},
						content: {
							header: {
								title: "缩略图在标题右边 + 摘要",
								link: "###",
								moreText: "更多 &raquo;",
								morePosition: "top"
							},
							main: [{
								title: "我很囧，你保重....晒晒旅行中的那些囧！",
								link: "http://www.douban.com/online/11614662/",
								desc: "囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！",
								img: "http://img5.douban.com/lpic/o636459.jpg"
							},
							{
								title: "我最喜欢的一张画",
								link: "http://www.douban.com/online/11624755/",
								desc: "你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，",
								img: "http://img3.douban.com/lpic/o637240.jpg"
							},
							{
								title: "“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！",
								link: "http://www.douban.com/online/11645411/",
								desc: "还在苦恼圣诞礼物再也玩儿不出新意？快来抢2013最炫彩的跨国圣诞礼物！【参与方式】1.关注“UniqueWay无二之旅”豆瓣品牌小站http://brand.douban.com/uniqueway/2.上传一张**本人**在旅行中色彩最浓郁、最丰富的照片（色彩包含取景地、周边事物、服装饰品、女生彩妆等等，发挥你们无穷的创意想象力哦！^^）一定要有本人出现喔！3. 在照片下方，附上一句旅行宣言作为照片说明。 成功参与活动！* 听他们刚才说，上传照片的次",
								img: ""
							}]
						}
					}
				},
				{
					desc: "下图+摘要",
					data: {
						options: {
							type: "thumb",
							thumbPosition: "bottom-left"
						},
						content: {
							header: {
								title: "缩略图在标题下左 + 摘要",
								link: "###",
								moreText: "更多 &raquo;",
								morePosition: "top"
							},
							main: [{
								title: "我很囧，你保重....晒晒旅行中的那些囧！",
								link: "http://www.douban.com/online/11614662/",
								desc: "囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！",
								img: "http://img5.douban.com/lpic/o636459.jpg"
							},
							{
								title: "我最喜欢的一张画",
								link: "http://www.douban.com/online/11624755/",
								desc: "你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，",
								img: "http://img3.douban.com/lpic/o637240.jpg"
							},
							{
								title: "“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！",
								link: "http://www.douban.com/online/11645411/",
								desc: "还在苦恼圣诞礼物再也玩儿不出新意？快来抢2013最炫彩的跨国圣诞礼物！【参与方式】1.关注“UniqueWay无二之旅”豆瓣品牌小站http://brand.douban.com/uniqueway/2.上传一张**本人**在旅行中色彩最浓郁、最丰富的照片（色彩包含取景地、周边事物、服装饰品、女生彩妆等等，发挥你们无穷的创意想象力哦！^^）一定要有本人出现喔！3. 在照片下方，附上一句旅行宣言作为照片说明。 成功参与活动！* 听他们刚才说，上传照片的次"
							}]
						}
					}
				},
				{
					desc: "下右图+摘要",
					data: {
						theme: "default",
						options: {
							type: "thumb",
							thumbPosition: "bottom-right"
						},
						content: {
							header: {
								title: "缩略图在标题下右 + 摘要",
								link: "###",
								moreText: "更多 &raquo;",
								morePosition: "top"
							},
							main: [{
								title: "我很囧，你保重....晒晒旅行中的那些囧！",
								link: "http://www.douban.com/online/11614662/",
								desc: "囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！",
								img: "http://img5.douban.com/lpic/o636459.jpg"
							},
							{
								title: "我最喜欢的一张画",
								link: "http://www.douban.com/online/11624755/",
								desc: "你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，",
								img: "http://img3.douban.com/lpic/o637240.jpg"
							},
							{
								title: "“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！",
								link: "http://www.douban.com/online/11645411/",
								desc: "还在苦恼圣诞礼物再也玩儿不出新意？快来抢2013最炫彩的跨国圣诞礼物！【参与方式】1.关注“UniqueWay无二之旅”豆瓣品牌小站http://brand.douban.com/uniqueway/2.上传一张**本人**在旅行中色彩最浓郁、最丰富的照片（色彩包含取景地、周边事物、服装饰品、女生彩妆等等，发挥你们无穷的创意想象力哦！^^）一定要有本人出现喔！3. 在照片下方，附上一句旅行宣言作为照片说明。 成功参与活动！* 听他们刚才说，上传照片的次"
							}]
						}
					}
				}]
			},
			{
				id: "one",
				name: "one",
				desc: "简约风格",
				hook: "hook-am-list-news-one",
				variables: [{
					variable: "list-hd-h2-color",
					name: "标题颜色",
					"default": "#000",
					used: [{
						selector: ".am-list-news-hd > a",
						property: "color"
					},
					{
						selector: ".am-list .am-list-item-desced a.am-list-item-hd",
						property: "color"
					}]
				},
				{
					variable: "list-hd-color",
					name: "标题边框",
					"default": "#15afef",
					used: [{
						selector: ".am-list-news-hd",
						property: "border-bottom-color"
					},
					{
						selector: ".am-list-news-hd::before",
						property: "background-color"
					}]
				},
				{
					variable: "list-li-a-color",
					name: "列表标题",
					"default": "#222",
					used: [{
						selector: ".am-list .am-list-item-dated > a",
						property: "color"
					},
					{
						selector: ".am-list-item-hd > a",
						property: "color"
					},
					{
						selector: ".am-list .am-list-item-thumbed .am-list-item-hd a",
						property: "color"
					}]
				},
				{
					variable: "list-li-2-text-color",
					name: "摘要颜色",
					"default": "#666",
					used: [{
						selector: ".am-list .am-list-item-desced .am-list-item-text",
						property: "color"
					},
					{
						selector: ".am-list .am-list-item-text > a",
						property: "color"
					},
					{
						selector: ".am-list .am-list-item-thumbed .am-list-main .am-list-item-text",
						property: "color"
					}]
				}],
				demos: [{
					desc: "默认",
					data: {
						content: {
							header: {
								title: "综合新闻",
								link: "###",
								moreText: "更多 &raquo;",
								morePosition: "bottom"
							},
							main: [{
								title: "我很囧，你保重....晒晒旅行中的那些囧！",
								link: "##",
								date: "2013-09-18"
							},
							{
								title: "我最喜欢的一张画",
								link: "##",
								date: "2013-10-14"
							},
							{
								title: "“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！",
								link: "##",
								date: "2013-11-18"
							}]
						}
					}
				},
				{
					desc: "带摘要",
					data: {
						content: {
							header: {
								title: "",
								link: "##",
								moreText: "更多 &raquo;",
								morePosition: "bottom"
							},
							main: [{
								title: "我很囧，你保重....晒晒旅行中的那些囧！",
								link: "http://www.douban.com/online/11614662/",
								desc: "囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！"
							},
							{
								title: "我最喜欢的一张画",
								link: "http://www.douban.com/online/11624755/",
								desc: "你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，"
							},
							{
								title: "“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！",
								link: "http://www.douban.com/online/11645411/"
							}]
						}
					}
				},
				{
					desc: "带缩略图+摘要",
					data: {
						options: {
							type: "thumb",
							thumbPosition: "bottom-left"
						},
						content: {
							header: {
								title: "",
								link: "##",
								moreText: "更多 &raquo;",
								morePosition: "bottom"
							},
							main: [{
								title: "我很囧，你保重....晒晒旅行中的那些囧！",
								link: "http://www.douban.com/online/11614662/",
								desc: "囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！",
								img: "http://img5.douban.com/lpic/o636459.jpg"
							},
							{
								title: "我最喜欢的一张画",
								link: "http://www.douban.com/online/11624755/",
								desc: "你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，",
								img: "http://img3.douban.com/lpic/o637240.jpg"
							},
							{
								title: "“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！",
								link: "http://www.douban.com/online/11645411/",
								desc: "还在苦恼圣诞礼物再也玩儿不出新意？快来抢2013最炫彩的跨国圣诞礼物！【参与方式】1.关注“UniqueWay无二之旅”豆瓣品牌小站http://brand.douban.com/uniqueway/2.上传一张**本人**在旅行中色彩最浓郁、最丰富的照片（色彩包含取景地、周边事物、服装饰品、女生彩妆等等，发挥你们无穷的创意想象力哦！^^）一定要有本人出现喔！3. 在照片下方，附上一句旅行宣言作为照片说明。 成功参与活动！* 听他们刚才说，上传照片的次"
							}]
						}
					}
				}]
			}]
		},
		map: {
			id: "map",
			name: "Map",
			localName: {
				en: "Map",
				"zh-cn": "百度地图"
			},
			version: "2.0.2",
			description: "地图模块",
			author: {
				name: "Hzp",
				email: "hzp@yunshipei.com"
			},
			ver: "2.0",
			icon: "map.png",
			tpl: '{{#this}}\n  <div data-am-widget="map" class="am-map {{#if theme}}am-map-{{theme}}{{else}}am-map-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}"\n      data-name="{{options.name}}" data-address="{{options.address}}" data-longitude="{{options.longitude}}" data-latitude="{{options.latitude}}" data-scaleControl="{{options.scaleControl}}" data-zoomControl="{{options.zoomControl}}" data-setZoom="{{options.setZoom}}" data-icon="{{options.icon}}">\n    <div id="bd-map"></div>\n  </div>\n{{/this}}',
			example: "",
			depStyle: ["icon.less"],
			options: {
				name: {
					name: "公司名称",
					desc: "",
					type: "text",
					"default": "",
					required: !1
				},
				address: {
					name: "公司地址",
					desc: "",
					type: "text",
					"default": "",
					required: !1
				},
				longitude: {
					name: "经度",
					desc: "",
					type: "text",
					"default": "",
					required: !1
				},
				latitude: {
					name: "纬度",
					desc: "",
					type: "text",
					"default": "",
					required: !1
				},
				zoomControl: {
					name: "缩放控件",
					dese: "是否添加地图缩放控件",
					type: "select",
					"default": !0,
					required: !1,
					dataList: [{
						value: !0,
						title: "启用",
						selected: !0
					},
					{
						value: !1,
						title: "不启用"
					}]
				},
				scaleControl: {
					name: "比例尺控件",
					dese: "是否添加地图比例尺控件",
					type: "select",
					"default": !1,
					required: !1,
					dataList: [{
						value: !1,
						title: "不启用",
						selected: !0
					},
					{
						value: !0,
						title: "启用"
					}]
				},
				setZoom: {
					name: "地图缩放比例",
					desc: "地图展示的缩放比例，默认值：3-18",
					type: "text",
					"default": 17,
					required: !1
				},
				icon: {
					name: "标注图标",
					desc: "自定义标注图标，填写图片网址",
					type: "text",
					"default": "",
					required: !1
				}
			},
			themes: [{
				name: "default",
				desc: "默认",
				options: {
					name: "",
					address: ""
				},
				hook: "hook-am-map-default",
				variables: [],
				demos: [{
					desc: "",
					data: {
						options: {
							name: "云适配",
							address: "北京市海淀区海淀大街27号亿景大厦3层西区",
							longitude: "",
							latitude: "",
							zoomControl: !0,
							scaleControl: "",
							setZoom: 17,
							icon: "http://amuituku.qiniudn.com/mapicon.png"
						}
					}
				}]
			}]
		},
		mechat: {
			id: "mechat",
			name: "Mechat",
			localName: {
				en: "Mechat",
				"zh-cn": "美洽客服"
			},
			version: "2.0.1",
			description: "美洽在线客服平台",
			author: {
				name: "cg",
				email: "trustmore@163.com"
			},
			ver: "2.0",
			icon: "mechat.png",
			tpl: '{{#this}}\n  <section data-am-widget="mechat" class="am-mechat{{#if theme}} am-mechat-{{theme}}{{else}} am-mechat-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}" {{#if id}} id="{{id}}" {{/if}} {{#if options.unitid}}data-am-mechat-unitid="{{options.unitid}}"{{/if}}>\n    <div id="mechat"></div>\n  </section>\n{{/this}}',
			example: "",
			depStyle: [],
			depJs: [],
			options: {},
			themes: [{
				id: "default",
				name: "default",
				desc: "默认",
				options: {},
				hook: "hook-am-mechat-default",
				demos: [{
					desc: "",
					data: {
						options: {
							unitid: "2538"
						}
					}
				}]
			}]
		},
		menu: {
			id: "menu",
			name: "Menu",
			localName: {
				en: "Menu",
				"zh-cn": "菜单"
			},
			version: "4.0.3",
			description: "菜单组件",
			author: {
				name: "Minwe Luo",
				email: "minwe@yunshipei.com"
			},
			ver: "4.0",
			icon: "menu.png",
			tpl: '{{#this}}\n  <nav data-am-widget="menu" class="am-menu {{#if theme}} am-menu-{{theme}}{{else}} am-menu-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}" {{options.dataset}} {{#if id}}id="{{id}}"{{/if}}\n    {{#ifCond theme \'==\' \'dropdown1\'}} data-am-menu-collapse{{/ifCond}}\n    {{#ifCond theme \'==\' \'dropdown2\'}} data-am-menu-collapse{{/ifCond}}\n    {{#ifCond theme \'==\' \'slide1\'}} data-am-menu-collapse{{/ifCond}}\n    {{#ifCond theme \'==\' \'offcanvas1\'}} data-am-menu-offcanvas{{/ifCond}}\n    {{#ifCond theme \'==\' \'offcanvas2\'}} data-am-menu-offcanvas{{/ifCond}}> {{!-- 与模板深耦合，与 JS 浅耦合 --}}\n    <a href="javascript: void(0)" class="am-menu-toggle">\n      {{#if options.toggleTitle}}\n        <span class="am-menu-toggle-title">{{options.toggleTitle}}</span>\n      {{/if}}\n      {{#if options.toggleCustomIcon}}\n        <img src="{{options.toggleCustomIcon}}" alt="Menu Toggle"/>\n      {{else}}\n        {{#if options.toggleIcon}}\n          <i class="am-menu-toggle-icon am-icon-{{options.toggleIcon}}"></i>\n          {{else}}\n          <i class="am-menu-toggle-icon am-icon-bars"></i>\n        {{/if}}\n      {{/if}}\n    </a>\n\n    {{!-- offCanvas menu Wrap --}}\n    {{!-- 问题：方便用户，但是与主题名称（类名）耦合过深 --}}\n    {{#ifCond theme \'==\' \'offcanvas1\'}}\n    <div class="am-offcanvas" {{#if options.closeOffCanvasOnclick}}data-dismiss-on="click"{{/if}}>\n      <div class="am-offcanvas-bar{{#if options.offCanvasFlip}} am-offcanvas-bar-flip{{/if}}">\n    {{/ifCond}}\n    {{#ifCond theme \'==\' \'offcanvas2\'}}\n    <div class="am-offcanvas">\n      <div class="am-offcanvas-bar{{#if options.offCanvasFlip}} am-offcanvas-bar-flip{{/if}}">\n    {{/ifCond}}\n\n    {{#if content}}\n      <ul class="am-menu-nav {{#if options.cols}}am-avg-sm-{{options\n      .cols}}{{else}}am-avg-sm-1{{/if}}{{#ifCond theme \'==\' \'dropdown1\'}} am-collapse{{/ifCond}}{{#ifCond theme\n      \'==\' \'dropdown2\'}} am-collapse{{/ifCond}}{{#ifCond theme\n      \'==\' \'slide1\'}} am-collapse{{/ifCond}}">\n        {{#each content}}\n          <li class="{{#if subMenu}}am-parent{{/if}}{{#if className}} {{className}}{{/if}}">\n            <a href="{{link}}" class="{{className}}" {{#if target}}target="{{target}}" {{/if}}>{{{title}}}</a>\n            {{#if subMenu}}\n              <ul class="am-menu-sub am-collapse {{#if subCols}} am-avg-sm-{{subCols}}{{else}}\n              am-avg-sm-1{{/if}} {{subMenuClassName}}">\n                {{#each subMenu}}\n                  <li class="{{#if subMenu}} am-parent{{/if}}{{#if className}} {{className}}{{/if}}">\n                    <a href="{{link}}" class="{{className}}" {{#if target}}target="{{target}}" {{/if}}>{{{title}}}</a>\n                  </li>\n                {{/each}}\n                {{!-- 显示进入栏目链接 --}}\n                {{#if channelLink}}\n                  <li class="am-menu-nav-channel"><a href="{{link}}" class="{{className}}" title="{{title}}">{{{channelLink}}}</a></li>\n                {{/if}}\n              </ul>\n            {{/if}}\n          </li>\n        {{/each}}\n      </ul>\n    {{/if}}\n\n    {{#ifCond theme \'==\' \'offcanvas1\'}}\n      </div>\n    </div>\n    {{/ifCond}}\n    {{#ifCond theme \'==\' \'offcanvas2\'}}\n      </div>\n    </div>\n    {{/ifCond}}\n    {{!-- 不要问我为什么这样写，我也不想这样 --}}\n  </nav>\n{{/this}}\n',
			example: "",
			depStyle: ["list.less", "ui.offcanvas.less", "ui.component.less"],
			depJs: ["ui.offcanvas.js", "ui.collapse.js", "ui.iscroll-lite.js"],
			options: {
				cols: {
					name: "列数",
					desc: "一级菜单列数，1-12，为1时可省略",
					type: "select",
					"default": "",
					pattern: "",
					required: !1,
					dataList: [{
						value: 1,
						title: 1
					},
					{
						value: 2,
						title: 2
					},
					{
						value: 3,
						title: 3
					},
					{
						value: 4,
						title: 4
					},
					{
						value: 5,
						title: 5
					},
					{
						value: 6,
						title: 6
					}]
				},
				offCanvasFlip: {
					name: "侧滑菜单位置",
					desc: "仅对侧滑主题有效",
					type: "select",
					"default": "",
					required: !1,
					dataList: [{
						value: !1,
						title: "左侧",
						selected: !0
					},
					{
						value: !0,
						title: "右侧"
					}]
				},
				toggleTitle: {
					name: "触发按钮文字",
					desc: "仅对使用使用触发按钮的主题有用",
					type: "text",
					"default": "",
					required: !1
				},
				toggleIcon: {
					name: "触发按钮图标",
					desc: "Font Icon名称，如 am-icon-xxx 中的 xxx",
					type: "text",
					"default": "",
					required: !1
				},
				toggleCustomIcon: {
					name: "触发按钮自定图标",
					desc: "自定义的图片地址，设置此项后 Font Icon 将不显示",
					type: "text",
					"default": "",
					required: !1
				}
			},
			themes: [{
				name: "default",
				desc: "横排",
				hook: "hook-am-menu-default",
				options: {
					cols: 3
				},
				variables: [{
					variable: "menu-nav-bg",
					name: "背景颜色",
					"default": "#fff",
					used: [{
						selector: ".am-menu-nav",
						property: "background-color"
					}]
				},
				{
					variable: "menu-nav-link-color",
					name: "链接颜色",
					"default": "#0e90d2",
					used: [{
						selector: ".am-menu-nav a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-top-active-color",
					name: "一级菜单激活颜色",
					"default": "#095f8a",
					used: [{
						selector: ".am-menu-nav > .am-parent.am-open > a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-sub-bg",
					name: "二级菜单背景色",
					"default": "#f1f1f1",
					used: [{
						selector: ".am-menu-sub",
						property: "background-color"
					},
					{
						selector: ".am-menu-nav > .am-parent > a:before",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-sub-link-color",
					name: "二级菜单链接颜色",
					"default": "#555",
					used: [{
						selector: ".am-menu-sub >li > a",
						property: "color"
					}]
				}],
				demos: [{
					desc: "横排",
					data: {
						options: {
							cols: "3"
						}
					}
				}]
			},
			{
				name: "dropdown1",
				desc: "下拉全宽",
				options: {
					cols: "1"
				},
				hook: "hook-am-menu-dropdown1",
				variables: [{
					variable: "menu-toggle-color",
					name: "触发按钮颜色",
					"default": "#c7c7c7",
					used: [{
						selector: ".am-menu-toggle",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-top-link-color",
					name: "一级菜单颜色",
					"default": "#fff",
					used: [{
						selector: ".am-menu-nav > li > a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-top-link-bg",
					name: "一级菜单背景色",
					"default": "#0e90d2",
					used: [{
						selector: ".am-menu-nav > li > a",
						property: "background-color"
					}]
				},
				{
					variable: "menu-nav-border-color",
					name: "边框颜色",
					"default": "#4C5565",
					used: [{
						selector: ".am-menu-nav > li > a",
						property: "border-bottom-color"
					}]
				},
				{
					variable: "menu-nav-top-link-active-color",
					name: "一级菜单激活颜色",
					"default": "#6B717D",
					used: [{
						selector: ".am-menu-nav > li.am-parent.am-open > a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-top-link-active-bg",
					name: "一级菜单激活背景色",
					"default": "#C5C9D2",
					used: [{
						selector: ".am-menu-nav > li.am-parent.am-open > a",
						property: "background-color"
					},
					{
						selector: ".am-menu-nav > li.am-parent.am-open>a::after",
						property: "border-top-color"
					}]
				},
				{
					variable: "menu-nav-sub-link-color",
					name: "二级菜单颜色",
					"default": "#7E858F",
					used: [{
						selector: ".am-menu-sub a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-sub-link-bg",
					name: "二级菜单背景色",
					"default": "#fff",
					used: [{
						selector: ".am-menu-sub",
						property: "background-color"
					}]
				},
				{
					variable: "menu-nav-sub-link-icon-color",
					name: "二级菜单 Icon 颜色",
					"default": "#aaa",
					used: [{
						selector: ".am-menu-sub a:before",
						property: "color"
					}]
				}],
				demos: [{
					desc: "自定图标",
					data: {
						options: {
							cols: "1",
							toggleIcon: "list"
						}
					}
				},
				{
					desc: "图片图标",
					data: {
						options: {
							cols: "1",
							toggleCustomIcon: 'data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 42 26" fill="%23fff"><rect width="4" height="4"/><rect x="8" y="1" width="34" height="2"/><rect y="11" width="4" height="4"/><rect x="8" y="12" width="34" height="2"/><rect y="22" width="4" height="4"/><rect x="8" y="23" width="34" height="2"/></svg>'
						}
					}
				},
				{
					desc: "文字触发",
					data: {
						options: {
							cols: "1",
							toggleTitle: "菜单",
							toggleIcon: "angle-right"
						}
					}
				}]
			},
			{
				name: "dropdown2",
				desc: "下拉横排",
				options: {
					cols: "4"
				},
				hook: "hook-am-menu-dropdown2",
				variables: [{
					variable: "menu-toggle-color",
					name: "触发按钮颜色",
					"default": "#fff",
					used: [{
						selector: ".am-menu-toggle",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-top-link-color",
					name: "一级菜单颜色",
					"default": "#fff",
					used: [{
						selector: ".am-menu-nav > li > a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-top-link-bg",
					name: "一级菜单背景色",
					"default": "#0e90d2",
					used: [{
						selector: ".am-menu-nav",
						property: "background-color"
					}]
				},
				{
					variable: "menu-nav-top-link-active-color",
					name: "一级菜单激活颜色",
					"default": "#6B717D",
					used: [{
						selector: ".am-menu-nav>li.am-parent.am-open>a:after",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-sub-link-color",
					name: "二级菜单颜色",
					"default": "#555",
					used: [{
						selector: ".am-menu-sub a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-sub-link-bg",
					name: "二级菜单背景色",
					"default": "#fff",
					used: [{
						selector: ".am-menu-sub",
						property: "background-color"
					},
					{
						selector: ".am-menu-nav>li.am-parent.am-open>a:before",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							cols: "4"
						}
					}
				}]
			},
			{
				name: "slide1",
				desc: "指示箭头一级下滑1",
				options: {
					cols: 1
				},
				hook: "hook-am-menu-slide1",
				variables: [{
					variable: "menu-toggle-color",
					name: "触发按钮颜色",
					"default": "#c7c7c7",
					used: [{
						selector: ".am-menu-toggle",
						property: "color"
					}]
				},
				{
					variable: "@menu-nav-bg",
					name: "菜单背景色",
					"default": "#f5f5f5",
					used: [{
						selector: ".am-menu-nav",
						property: "background-color"
					},
					{
						selector: ".am-menu-nav.am-in:before",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-link-color",
					name: "菜单颜色",
					"default": "#303338",
					used: [{
						selector: ".am-menu-nav>li>a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-sub-bg",
					name: "二级菜单背景色",
					"default": "#f1f1f1",
					used: [{
						selector: ".am-menu-sub",
						property: "background-color"
					},
					{
						selector: ".am-menu-nav > .am-parent > a:before",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-sub-link-color",
					name: "二级菜单链接颜色",
					"default": "#555",
					used: [{
						selector: ".am-menu-sub >li > a",
						property: "color"
					}]
				}],
				demos: [{
					data: {
						options: {
							cols: "4"
						}
					}
				}]
			},
			{
				name: "offcanvas1",
				desc: "侧滑竖排",
				options: {
					cols: "1"
				},
				hook: "hook-am-menu-offcanvas1",
				variables: [{
					variable: "menu-toggle-color",
					name: "触发按钮颜色",
					"default": "#c7c7c7",
					used: [{
						selector: ".am-menu-toggle",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-top-link-color",
					name: "一级菜单颜色",
					"default": "#ccc",
					used: [{
						selector: ".am-menu-nav > li > a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-top-link-hover-color",
					name: "一级菜单 Hover 颜色",
					"default": "#fff",
					used: [{
						selector: ".am-menu-nav > .am-open > a, .am-menu-nav > li > a:hover, .am-menu-nav > li > a:focus",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-top-link-hover-bg",
					name: "一级菜单 Hover 背景色",
					"default": "#404040",
					used: [{
						selector: ".am-menu-nav > .am-open > a, .am-menu-nav > li > a:hover, .am-menu-nav > li > a:focus",
						property: "background-color"
					}]
				},
				{
					variable: "menu-nav-top-link-active-bg",
					name: "二级菜单背景色",
					"default": "#1a1a1a",
					used: [{
						selector: ".am-menu-sub",
						property: "background-color"
					}]
				},
				{
					variable: "menu-nav-sub-link-color",
					name: "二级菜单颜色",
					"default": "#eee",
					used: [{
						selector: ".am-menu-sub a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-sub-link-hover-color",
					name: "二级菜单 Hover 颜色",
					"default": "#fff",
					used: [{
						selector: ".am-menu-sub a:hover",
						property: "color"
					}]
				}],
				demos: [{
					desc: "侧滑左侧",
					data: {
						options: {
							cols: "1"
						}
					}
				},
				{
					desc: "侧滑右侧",
					data: {
						options: {
							cols: "1",
							offCanvasFlip: !0
						}
					}
				}]
			},
			{
				name: "offcanvas2",
				desc: "侧滑横排",
				options: {
					cols: "3",
					offCanvasFlip: !0
				},
				hook: "hook-am-menu-offcanvas2",
				variables: [{
					variable: "menu-toggle-color",
					name: "触发按钮颜色",
					"default": "#c7c7c7",
					used: [{
						selector: ".am-menu-toggle",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-link-color",
					name: "链接颜色",
					"default": "#ccc",
					used: [{
						selector: ".am-menu-nav > li > a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-link-bg",
					name: "链接背景色",
					"default": "#404040",
					used: [{
						selector: ".am-menu-nav > li > a",
						property: "background-color"
					}]
				},
				{
					variable: "menu-nav-link-hover-color",
					name: "链接 Hover 颜色",
					"default": "#fff",
					used: [{
						selector: ".am-menu-nav > li > a:hover, .am-menu-nav > li > a:focus",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-link-active-color",
					name: "链接激活颜色",
					"default": "#fff",
					used: [{
						selector: ".am-menu-nav > .am-active > a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-link-active-bg",
					name: "链接激活背景色",
					"default": "#262626",
					used: [{
						selector: ".am-menu-nav > li > a:hover, .am-menu-nav > li > a:focus",
						property: "background-color"
					},
					{
						selector: ".am-menu-nav > .am-active > a",
						property: "background-color"
					}]
				},
				{
					variable: "menu-nav-border-color",
					name: "边框颜色",
					"default": "rgba(0, 0, 0, 0.3)",
					used: [{
						selector: ".am-menu-nav > li > a",
						property: "border-color"
					}]
				}],
				demos: [{
					desc: "侧滑横排",
					data: {
						options: {
							cols: "3",
							offCanvasFlip: !0
						},
						content: [{
							link: "##",
							title: "公司"
						},
						{
							link: "##",
							title: "人物"
						},
						{
							link: "##",
							title: "趋势"
						},
						{
							link: "##",
							title: "投融资"
						},
						{
							link: "##",
							title: "创业公司"
						},
						{
							link: "##",
							title: "创业人物"
						},
						{
							link: "##",
							title: "公司"
						},
						{
							link: "##",
							title: "人物"
						},
						{
							link: "##",
							title: "趋势"
						},
						{
							link: "##",
							title: "投融资"
						},
						{
							link: "##",
							title: "创业公司"
						},
						{
							link: "##",
							title: "创业人物"
						},
						{
							link: "##",
							title: "公司"
						},
						{
							link: "##",
							title: "人物"
						},
						{
							link: "##",
							title: "趋势"
						},
						{
							link: "##",
							title: "投融资"
						},
						{
							link: "##",
							title: "创业公司"
						},
						{
							link: "##",
							title: "创业人物"
						}]
					}
				}]
			},
			{
				name: "stack",
				desc: "垂直菜单",
				options: {
					cols: "1"
				},
				hook: "hook-am-menu-stack",
				variables: [{
					variable: "menu-nav-top-bg",
					name: "一级菜单背景色",
					"default": "#F5F5F5",
					used: [{
						selector: ".am-menu-nav>li>a",
						property: "background-color"
					}]
				},
				{
					variable: "menu-nav-top-link-color",
					name: "一级菜单颜色",
					"default": "#333",
					used: [{
						selector: ".am-menu-nav > li > a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-top-link-hover-bg",
					name: "一级 Hover 背景色",
					"default": "#ddd",
					used: [{
						selector: ".am-menu-nav>.am-open>a, .am-menu-nav>li>a:hover,.am-menu-nav>li>a:focus",
						property: "background-color"
					}]
				},
				{
					variable: "menu-nav-top-link-hover-color",
					name: "一级 Hover 颜色",
					"default": "#222",
					used: [{
						selector: ".am-menu-nav>.am-open>a, .am-menu-nav>li>a:hover,.am-menu-nav>li>a:focus",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-sub-link-color",
					name: "二级菜单颜色",
					"default": "#444",
					used: [{
						selector: ".am-menu-sub a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-sub-link-hover-color",
					name: "二级 Hover 颜色",
					"default": "#333",
					used: [{
						selector: ".am-menu-sub a:hover",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-border-color",
					name: "边框颜色",
					"default": "dedede",
					used: [{
						selector: ".am-menu-nav",
						property: "border-bottom-color"
					},
					{
						selector: "& > li.am-parent.am-open > a",
						property: "border-bottom-color"
					},
					{
						selector: ".am-menu-sub, .am-menu-nav > li > a",
						property: "border-top-color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							cols: "1"
						}
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				options: {
					cols: "1"
				},
				hook: "hook-am-menu-one",
				variables: [{
					variable: "menu-nav-bg",
					name: "背景颜色",
					"default": "#f5f5f5",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "menu-nav-link-color",
					name: "一级菜单颜色",
					"default": "#7d7d7d",
					used: [{
						selector: ".am-menu-nav > li > a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-link-active-color",
					name: "一级菜单激活颜色",
					"default": "#555",
					used: [{
						selector: ".am-menu-nav .am-active > a",
						property: "color"
					}]
				},
				{
					variable: "menu-nav-active-border-color",
					name: "激活边框颜色",
					"default": "#15afef",
					used: [{
						selector: ".am-menu-nav .am-active > a",
						property: "border-bottom-color"
					},
					{
						selector: ".am-menu-nav .am-open > a::before",
						property: "border-bottom-color"
					}]
				},
				{
					variable: "menu-nav-sub-bg",
					name: "二级菜单背景色",
					"default": "#fff",
					used: [{
						selector: ".am-menu-sub",
						property: "background-color"
					}]
				},
				{
					variable: "menu-nav-sub-link-color",
					name: "二级菜单颜色",
					"default": "#555",
					used: [{
						selector: ".am-menu-sub a",
						property: "color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							cols: "1"
						}
					}
				}]
			}],
			demoContent: [{
				link: "##",
				title: "公司",
				subCols: 2,
				channelLink: "进入栏目 &raquo;",
				subMenu: [{
					link: "##",
					title: "公司"
				},
				{
					link: "##",
					title: "人物"
				},
				{
					link: "##",
					title: "趋势"
				},
				{
					link: "##",
					title: "投融资"
				},
				{
					link: "##",
					title: "创业公司"
				},
				{
					link: "##",
					title: "创业人物"
				}]
			},
			{
				link: "##",
				title: "人物",
				subCols: 3,
				subMenu: [{
					link: "##",
					title: "公司"
				},
				{
					link: "##",
					title: "人物"
				},
				{
					link: "##",
					title: "趋势"
				},
				{
					link: "##",
					title: "投融资"
				},
				{
					link: "##",
					title: "创业公司"
				},
				{
					link: "##",
					title: "创业人物"
				}]
			},
			{
				link: "#c3",
				title: "趋势",
				subCols: 4,
				channelLink: "泥煤 &raquo;",
				subMenu: [{
					link: "##",
					title: "公司"
				},
				{
					link: "##",
					title: "人物"
				},
				{
					link: "##",
					title: "趋势"
				},
				{
					link: "##",
					title: "投融资"
				},
				{
					link: "##",
					title: "创业公司"
				},
				{
					link: "##",
					title: "创业人物"
				}]
			},
			{
				link: "##",
				title: "投融资",
				subCols: 3,
				subMenu: [{
					link: "##",
					title: "公司"
				},
				{
					link: "##",
					title: "人物"
				},
				{
					link: "##",
					title: "趋势"
				},
				{
					link: "##",
					title: "投融资"
				},
				{
					link: "##",
					title: "创业公司"
				},
				{
					link: "##",
					title: "创业人物"
				}]
			},
			{
				link: "##",
				title: "创业公司"
			},
			{
				link: "##",
				title: "创业人物"
			}]
		},
		navbar: {
			id: "navbar",
			name: "Navbar",
			localName: {
				en: "Navbar",
				"zh-cn": "工具栏"
			},
			version: "2.0.2",
			description: "页面底部工具栏",
			author: {
				name: "Shengli",
				email: "china_victory@yunshipei.com"
			},
			ver: "2.0",
			icon: "navbar.png",
			tpl: '{{#this}}\n  <div data-am-widget="navbar" class="am-navbar am-cf {{#if theme}}am-navbar-{{theme}}{{else}}am-navbar-default{{/if}} {{#if options.iconPosition}}am-navbar-inline{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}"\n      id="{{id}}">\n    {{#if content}}\n      <ul class="am-navbar-nav am-cf {{#if options.cols}}am-avg-sm-{{options.cols}}{{/if}}">\n        {{#each content}}\n          <li {{{dataApi}}}>\n            <a href="{{link}}" class="{{className}}">\n              {{#if customIcon}}\n                <img src="{{customIcon}}" alt="{{title}}"/>\n              {{else}}\n                {{#if icon}}\n                  <span class="am-icon-{{icon}}"></span>\n                {{/if}}\n              {{/if}}\n              {{#if title}}\n                <span class="am-navbar-label">{{title}}</span>\n              {{/if}}\n            </a>\n          </li>\n        {{/each}}\n      </ul>\n    {{/if}}\n  </div>\n{{/this}}\n',
			example: "",
			depStyle: ["ui.modal.less", "ui.component.less", "ui.share.less", "button.less"],
			depJs: ["ui.modal.js", "ui.share.js", "util.qrcode.js"],
			options: {
				cols: {
					name: "列数",
					desc: "分栏数量（建议2-4）",
					type: "select",
					required: !1,
					"default": 4,
					dataList: [{
						value: 1,
						title: "1"
					},
					{
						value: 2,
						title: "2"
					},
					{
						value: 3,
						title: "3"
					},
					{
						value: 4,
						title: "4"
					}]
				}
			},
			themes: [{
				name: "default",
				desc: "默认",
				options: {
					cols: 4
				},
				hook: "hook-am-navbar-default",
				variables: [{
					variable: "navbar-bg",
					name: "背景颜色",
					"default": "#0e90d2",
					used: [{
						selector: ".am-navbar-nav",
						property: "background-color"
					}]
				},
				{
					variable: "navbar-link-color",
					name: "链接颜色",
					"default": "#fff",
					used: [{
						selector: "a",
						property: "color"
					}]
				},
				{
					variable: "navbar-actions-bg",
					name: "更多列表背景",
					"default": "#0d86c4",
					used: [{
						selector: ".am-navbar-actions",
						property: "background-color"
					}]
				},
				{
					variable: "navbar-actions-border-bottom",
					name: "更多列表下边框颜色",
					"default": "#fff",
					used: [{
						selector: ".am-navbar-actions a",
						property: "border-color"
					}]
				}],
				demos: [{
					desc: "字体图标",
					data: {
						options: {
							cols: "4"
						}
					}
				},
				{
					desc: "自定义图标",
					data: {
						options: {
							cols: "4"
						},
						content: [{
							link: "sms:18601860186?body=约吗？",
							title: "消息",
							customIcon: "http://amazeui.b0.upaiyun.com/assets/i/cpts/navbar/Information.png"
						},
						{
							link: "tel:18601860186",
							title: "呼叫",
							customIcon: "http://amazeui.b0.upaiyun.com/assets/i/cpts/navbar/phone.png"
						},
						{
							link: "###",
							title: "分享",
							customIcon: "http://amazeui.b0.upaiyun.com/assets/i/cpts/navbar/share.png",
							dataApi: "data-am-navbar-share"
						},
						{
							link: "http://yunshipei.com",
							title: "地图",
							customIcon: "http://amazeui.b0.upaiyun.com/assets/i/cpts/navbar/map.png"
						}]
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				options: {
					cols: 4
				},
				hook: "hook-am-navbar-one",
				variables: [{
					variable: "navbar-bg",
					name: "背景颜色",
					"default": "#0e90d2",
					used: [{
						selector: ".am-navbar-nav",
						property: "background-color"
					}]
				},
				{
					variable: "navbar-link-color",
					name: "链接颜色",
					"default": "#fff",
					used: [{
						selector: "a",
						property: "color"
					}]
				},
				{
					variable: "navbar-actions-bg",
					name: "更多列表背景",
					"default": "#0d86c4",
					used: [{
						selector: ".am-navbar-actions",
						property: "background-color"
					}]
				},
				{
					variable: "navbar-actions-border-bottom",
					name: "更多列表下边框颜色",
					"default": "#fff",
					used: [{
						selector: ".am-navbar-actions a",
						property: "border-color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						options: {
							cols: "4"
						}
					}
				}]
			}],
			demoContent: [{
				title: "呼叫",
				link: "tel:123456789",
				icon: "phone"
			},
			{
				title: "分享",
				link: "###",
				icon: "share-square-o",
				dataApi: "data-am-navbar-share"
			},
			{
				title: "二维码",
				link: "###",
				icon: "qrcode",
				dataApi: "data-am-navbar-qrcode"
			},
			{
				title: "GitHub",
				link: "https://github.com/allmobilize/amazeui",
				icon: "github"
			},
			{
				title: "下载使用",
				link: "http://amazeui.org/getting-started",
				icon: "download"
			},
			{
				title: "Bug 反馈",
				link: "https://github.com/allmobilize/amazeui/issues",
				icon: "location-arrow"
			}]
		},
		pagination: {
			id: "pagination",
			name: "Pagination",
			localName: {
				en: "Pagination",
				"zh-cn": "分页"
			},
			version: "3.0.1",
			description: "分页组件",
			author: {
				name: "Shengli",
				email: "china_victory@yunshipei.com"
			},
			ver: "3.0",
			icon: "pagination.png",
			tpl: '{{#this}}\n  <ul data-am-widget="pagination"\n      class="am-pagination {{#if theme}}am-pagination-{{theme}}{{else}}am-pagination-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}"\n      {{#if id}}id="{{id}}"{{/if}}>\n\n    {{#if content.firstTitle}}\n      <li class="am-pagination-first {{content.firstClassName}}">\n        <a href="{{content.firstLink}}" class="{{content.firstClassName}}">{{{content.firstTitle}}}</a>\n      </li>\n    {{/if}}\n\n    {{#if content.prevTitle}}\n      <li class="am-pagination-prev {{content.prevClassName}}">\n        <a href="{{content.prevLink}}" class="{{content.prevClassName}}">{{{content.prevTitle}}}</a>\n      </li>\n    {{/if}}\n\n    {{! 移除 options.select，根据主题来判断结构，无奈 handlebars 逻辑处理...}}\n\n    {{#if content.page}}\n      {{#ifCond theme \'==\' \'select\'}}\n        <li class="am-pagination-select">\n          <select>\n            {{#each content.page}}\n              <option value="{{link}}" class="{{className}}">{{title}}{{#if ../content.total}}\n                / {{../../content.total}}{{/if}}\n              </option>\n            {{/each}}\n          </select>\n        </li>\n      {{else}}\n        {{#ifCond theme \'==\' \'one\'}}\n          <li class="am-pagination-select">\n            <select>\n              {{#each content.page}}\n                {{content.total}}\n                <option value="{{link}}" class="{{className}}">{{title}}{{#if ../content.total}}\n                  / {{../../content.total}}{{/if}}\n                </option>\n              {{/each}}\n            </select>\n          </li>\n        {{else}}\n          {{#each content.page}}\n            <li class="{{className}}">\n              <a href="{{link}}" class="{{className}}">{{{title}}}</a>\n            </li>\n          {{/each}}\n        {{/ifCond}}\n      {{/ifCond}}\n\n    {{/if}}\n\n    {{#if content.nextTitle}}\n      <li class="am-pagination-next {{content.nextClassName}}">\n        <a href="{{content.nextLink}}" class="{{content.nextClassName}}">{{{content.nextTitle}}}</a>\n      </li>\n    {{/if}}\n\n    {{#if content.lastTitle}}\n      <li class="am-pagination-last {{content.lastClassName}}">\n        <a href="{{content.lastLink}}" class="{{content.lastClassName}}">{{{content.lastTitle}}}</a>\n      </li>\n    {{/if}}\n  </ul>\n{{/this}}\n',
			example: "",
			depStyle: ["pagination.less"],
			options: {},
			themes: [{
				name: "default",
				desc: "扁平按钮",
				options: {
					select: !1
				},
				hook: "hook-am-pagination-default",
				variables: [{
					variable: "pagination-link-bg",
					name: "页码背景色",
					"default": "#eee",
					used: [{
						selector: "li a",
						property: "background-color"
					}]
				},
				{
					variable: "pagination-link-color",
					name: "页码颜色",
					"default": "#222",
					used: [{
						selector: "li a",
						property: "color"
					}]
				},
				{
					variable: "pagination-active-bg",
					name: "激活链接背景色",
					"default": "#0e90d2",
					used: [{
						selector: ">.am-active>a, >.am-active>span, >.am-active>a:hover, >.am-active>span:hover, >.am-active>a:focus, >.am-active>span:focus",
						property: "background-color"
					},
					{
						selector: ">.am-active>a, >.am-active>span, >.am-active>a:hover, >.am-active>span:hover, >.am-active>a:focus, >.am-active>span:focus",
						property: "border-color"
					}]
				},
				{
					variable: "pagination-active-color",
					name: "活动链接文本颜色",
					"default": "#fff",
					used: [{
						selector: ">.am-active>a, >.am-active>span, >.am-active>a:hover, >.am-active>span:hover, >.am-active>a:focus, >.am-active>span:focus",
						property: "color"
					}]
				}],
				demos: [{
					data: {
						content: {
							prevTitle: "上一页",
							prevLink: "#",
							nextTitle: "下一页",
							nextLink: "#",
							firstTitle: "第一页",
							firstLink: "#",
							lastTitle: "最末页",
							lastLink: "#",
							page: [{
								title: "1",
								link: "#"
							},
							{
								title: "2",
								link: "#",
								className: "am-active"
							},
							{
								title: "3",
								link: "#"
							},
							{
								title: "4",
								link: "#"
							},
							{
								title: "5",
								link: "#"
							}]
						}
					}
				}]
			},
			{
				name: "select",
				desc: "上下页+选择框",
				options: {
					select: !0
				},
				hook: "hook-am-pagination-select",
				variables: [{
					variable: "pagination-link-bg",
					name: "页码背景色",
					"default": "#eee",
					used: [{
						selector: ">li>a",
						property: "background-color"
					},
					{
						selector: ".am-pagination-select select",
						property: "background-color"
					}]
				},
				{
					variable: "pagination-link-color",
					name: "页码颜色",
					"default": "#555",
					used: [{
						selector: "> li > a",
						property: "color"
					},
					{
						selector: ".am-pagination-select select",
						property: "color"
					}]
				}],
				demos: [{
					data: {
						content: {
							prevTitle: "上一页",
							prevLink: "#",
							nextTitle: "下一页",
							nextLink: "#",
							total: "3",
							page: [{
								title: "1",
								link: "#"
							},
							{
								title: "2",
								link: "#"
							},
							{
								title: "3",
								link: "#"
							}]
						}
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				options: {
					select: !0
				},
				hook: "hook-am-pagination-one",
				variables: [{
					variable: "pagination-link-bg",
					name: "页码背景色",
					"default": "#eee",
					used: [{
						selector: ">li>a",
						property: "background-color"
					},
					{
						selector: ".am-pagination-select select",
						property: "background-color"
					}]
				},
				{
					variable: "pagination-link-color",
					name: "页码颜色",
					"default": "#555",
					used: [{
						selector: "> li > a",
						property: "color"
					},
					{
						selector: ".am-pagination-select select",
						property: "color"
					}]
				},
				{
					variable: "pagination-link-border",
					name: "边框颜色",
					"default": "#dfdfdf",
					used: [{
						selector: ".am-pagination-select select",
						property: "border-color"
					}]
				}],
				demos: [{
					data: {
						content: {
							prevTitle: "上一页",
							prevLink: "#",
							nextTitle: "下一页",
							nextLink: "#",
							page: [{
								title: "1",
								link: "#"
							},
							{
								title: "2",
								link: "#",
								"class": "active"
							},
							{
								title: "3",
								link: "#"
							}]
						}
					}
				}]
			}]
		},
		paragraph: {
			id: "paragraph",
			name: "Paragraph",
			localName: {
				en: "Paragraph",
				"zh-cn": "段落"
			},
			version: "2.0.1",
			description: "文本段落",
			author: {
				name: "Shengli",
				email: "china_victory@yunshipei.com"
			},
			ver: "2.0",
			icon: "paragraph.png",
			tpl: '{{#this}}\n  <article data-am-widget="paragraph"\n           class="am-paragraph {{#if theme}}am-paragraph-{{theme}}{{else}}am-paragraph-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}"\n           {{#if id}}id="{{id}}"{{/if}}\n           data-am-paragraph="{ {{#if options.tableScrollable}}tableScrollable: true,{{/if}} {{#if options.imgLightbox}}pureview: true{{/if}} }">\n\n    {{#if content}}\n      {{{ content.content }}}\n    {{/if}}\n  </article>\n{{/this}}\n',
			example: "",
			depStyle: ["ui.pureview.less"],
			depJs: ["ui.iscroll-lite.js", "ui.pinchzoom.js", "ui.pureview.js"],
			options: {
				imgLightbox: {
					name: "图片查看器",
					desc: "双击图片，可放大显示",
					type: "select",
					required: !1,
					"default": !1,
					dataList: [{
						value: !0,
						title: "开启"
					},
					{
						value: !1,
						title: "关闭",
						selected: !0
					}]
				},
				tableScrollable: {
					name: "表格滚动",
					desc: "超出可视区的表格，可以拖拽",
					type: "select",
					required: !1,
					"default": !1,
					dataList: [{
						value: !0,
						title: "开启"
					},
					{
						value: !1,
						title: "关闭",
						selected: !0
					}]
				}
			},
			themes: [{
				name: "default",
				desc: "默认",
				hook: "hook-am-paragraph-default",
				variables: [{
					variable: "paragraph-bg",
					name: "背景色",
					"default": "transparent",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "paragraph-color",
					name: "文字颜色",
					"default": "#333",
					used: [{
						selector: "",
						property: "color"
					}]
				},
				{
					variable: "paragraph-link-color",
					name: "链接颜色",
					"default": "#0e90d2",
					used: [{
						selector: "a",
						property: "color"
					}]
				},
				{
					variable: "paragraph-img-border-color",
					name: "图片边框颜色",
					"default": "#eee",
					used: [{
						selector: "img",
						property: "border-color"
					}]
				}],
				demos: [{
					data: {
						options: {
							imgLightbox: !0,
							tableScrollable: !0
						}
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				hook: "hook-am-paragraph-one",
				variables: [{
					variable: "paragraph-bg-color",
					name: "背景颜色",
					"default": "#fff",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "paragraph-text-color",
					name: "文本颜色",
					"default": "#666",
					used: [{
						selector: "",
						property: "color"
					}]
				},
				{
					variable: "paragraph-h3-color",
					name: "h1-h6标题颜色",
					"default": "#000",
					used: [{
						selector: "h1",
						property: "color"
					},
					{
						selector: "h2",
						property: "color"
					},
					{
						selector: "h3",
						property: "color"
					},
					{
						selector: "h4",
						property: "color"
					},
					{
						selector: "h5",
						property: "color"
					},
					{
						selector: "h6",
						property: "color"
					}]
				},
				{
					variable: "paragraph-a-color",
					name: "链接颜色",
					"default": "#000",
					used: [{
						selector: "a",
						property: "color"
					}]
				},
				{
					variable: "paragraph-hr-color",
					name: "分隔线颜色",
					"default": "#dfdfdf",
					used: [{
						selector: "hr",
						property: "background-color"
					}]
				}],
				demos: [{
					data: {
						options: {
							imgLightbox: !0,
							tableScrollable: !0
						}
					}
				}]
			}],
			demoContent: {
				content: "<img src=http://s.amazeui.org/media/i/demos/bing-1.jpg><p class=paragraph-default-p>南极洲又称<a href=http://zh.wikipedia.org/w/index.php?title=%E7%AC%AC%E4%B8%83%E5%A4%A7%E9%99%86&redirect=no>第七大陆</a>，是地球上最后一个被发现、唯一没有土著人居住的大陆。</p><p>南极大陆为通常所说的南大洋（太平洋、印度洋和大西洋的南部水域）所包围，它与南美洲最近的距离为965公里，距新西兰2000公里、距澳大利亚2500公里、距南非3800公里、距中国北京的距离约有12000公里。南极大陆的总面积为1390万平方公里，相当于中国和印巴次大陆面积的总和，居世界各洲第五位。</p><img src=http://s.amazeui.org/media/i/demos/bing-2.jpg /><p>整个南极大陆被一个巨大的冰盖所覆盖，平均海拔为2350米。南极洲是由冈瓦纳大陆分离解体而成，是世界上最高的大陆。南极横断山脉将南极大陆分成东西两部分。这两部分在地理和地质上差别很大。</p><img src=http://s.amazeui.org/media/i/demos/bing-3.jpg /><p>东南极洲是一块很古老的大陆，据科学家推算,已有几亿年的历史。它的中心位于难接近点，从任何海边到难接近点的距离都很远。东南极洲平均海拔高度2500米，最大高度4800 米。在东南极洲有南极大陆最大的活火山，即位于罗斯岛上的埃里伯斯火山，海拔高度3795米，有四个喷火口</p>"
			}
		},
		slider: {
			id: "slider",
			name: "Slider",
			localName: {
				en: "Slider",
				"zh-cn": "图片轮播"
			},
			version: "3.0.1",
			description: "基于 Flexslider 的响应式 slider ，支持触控操作。",
			author: {
				name: "Minwe",
				email: "minwe@yunshipei.com"
			},
			ver: "3.0",
			icon: "slider.png",
			tpl: '{{#this}}\n  <div data-am-widget="slider" class="am-slider {{#if theme}}am-slider-{{theme}}{{else}}am-slider-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}" data-am-slider=\'{{sliderConfig}}\' {{#if id}}id="{{id}}"{{/if}}>\n  <ul class="am-slides">\n    {{#each content}}\n      <li{{#if thumb}} data-thumb="{{thumb}}"{{/if}}>\n        {{#if link}}\n          <a href="{{link}}" class="{{className}}">\n        {{/if}}\n        {{#if img}}\n        	<img src="{{img}}">\n        {{/if}}\n        {{#if desc}}\n          <div class="am-slider-desc">{{{desc}}}</div>\n        {{/if}}\n        {{#if link}}</a>{{/if}} {{!--/end link--}}\n      </li>\n    {{/each}}\n  </ul>\n</div>\n{{/this}}',
			example: "",
			depStyle: ["ui.flexslider.less"],
			depJs: ["ui.flexslider.js"],
			options: {
				animation: {
					name: "动画效果",
					desc: "Slider 动画效果",
					type: "select",
					"default": "slide",
					required: !1,
					dataList: [{
						title: "slide",
						value: "slide"
					},
					{
						title: "fade",
						value: "fade"
					}]
				},
				slideshowSpeed: {
					name: "滚动间隔时间(毫秒)",
					desc: "Slider 图片滚动间隔时间",
					placeholder: "填写整数",
					type: "number",
					"default": 5e3,
					required: !1
				},
				initDelay: {
					name: "初始延迟(毫秒)",
					desc: "Slider 启动延迟时间",
					placeholder: "填写整数",
					type: "number",
					"default": 0,
					required: !1
				},
				itemWidth: {
					name: "条目宽度",
					desc: "Slide 条目的宽度，多图模式时设置此项",
					placeholder: "仅用于一屏显示多图时",
					type: "number",
					"default": 0,
					required: !1
				}
			},
			themes: [{
				name: "default",
				desc: "默认",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-default",
				variables: [{
					variable: "direction-nav-color",
					name: "前后导航按钮颜色",
					"default": "#222",
					used: [{
						selector: ".am-direction-nav a::before",
						property: "color"
					}]
				},
				{
					variable: "desc-color",
					name: "描述文字颜色",
					"default": "#fff",
					used: [{
						selector: ".am-slider-desc",
						property: "color"
					}]
				},
				{
					variable: "desc-bg-color",
					name: "描述文字背景颜色",
					"default": "rgba(0,0,0,0.7)",
					used: [{
						selector: ".am-slider-desc",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-bg-color",
					name: "控制点颜色",
					"default": "rgba(0,0,0,0.5)",
					used: [{
						selector: ".am-control-nav li a",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-hover-bg-color",
					name: "控制点Hover颜色",
					"default": "rgba(0,0,0,0.7)",
					used: [{
						selector: ".am-control-nav li a:hover",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-active-bg-color",
					name: "控制点激活颜色",
					"default": "#428bca",
					used: [{
						selector: ".am-control-nav li a.am-active",
						property: "background-color"
					}]
				},
				{
					variable: "pauseplay-color",
					name: "播放暂停按钮颜色",
					"default": "#000",
					used: [{
						selector: ".am-pauseplay a",
						property: "color"
					}]
				}],
				demos: [{
					desc: "默认",
					data: {
						sliderConfig: "{}"
					}
				},
				{
					desc: "标题",
					data: {
						sliderConfig: '{"animation":"slide","slideshow":false}',
						content: [{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
							desc: "这是标题标题标题标题标题标题标题0"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
							desc: "这是标题标题标题标题标题标题标题1"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
							desc: "这是标题标题标题标题标题标题标题2"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
							desc: "这是标题标题标题标题标题标题标题3"
						}]
					}
				},
				{
					desc: "多图",
					data: {
						sliderConfig: '{"animation":"slide","animationLoop":false,"itemWidth":200,"itemMargin":5}',
						content: [{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg"
						},
						{
							thumb: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg"
						}]
					}
				},
				{
					desc: "缩略图",
					data: {
						sliderConfig: '{"animation":"slide","controlNav":"thumbnails"}',
						content: [{
							thumb: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg"
						},
						{
							thumb: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg"
						},
						{
							thumb: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg"
						},
						{
							thumb: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg"
						}]
					}
				}]
			},
			{
				name: "a1",
				desc: "圆形控制点",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-a1",
				variables: [{
					variable: "control-nav-bg-color",
					name: "控制点颜色",
					"default": "rgba(0,0,0,0.5)",
					used: [{
						selector: ".am-control-nav li a",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-hover-bg-color",
					name: "控制点Hover颜色",
					"default": "rgba(0,0,0,0.7)",
					used: [{
						selector: ".am-control-nav li a:hover",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-active-bg-color",
					name: "控制点激活颜色",
					"default": "#FC7001",
					used: [{
						selector: ".am-control-nav li a.am-active",
						property: "background-color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						sliderConfig: '{"directionNav":false}'
					}
				}]
			},
			{
				name: "a2",
				desc: "方形控制点",
				hook: "hook-am-slider-a2",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				variables: [{
					variable: "control-nav-bg-color",
					name: "控制点颜色",
					"default": "rgba(0,0,0,0.5)",
					used: [{
						selector: ".am-control-nav li a",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-hover-bg-color",
					name: "控制点Hover颜色",
					"default": "rgba(0,0,0,0.7)",
					used: [{
						selector: ".am-control-nav li a:hover",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-active-bg-color",
					name: "控制点激活颜色",
					"default": "#FC7001",
					used: [{
						selector: ".am-control-nav li a.am-active",
						property: "background-color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"directionNav":false}'
					}
				}]
			},
			{
				name: "a3",
				desc: "底部黑边圆形控制点",
				hook: "hook-am-slider-a3",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				variables: [{
					variable: "control-nav-wrap-bg-color",
					name: "控制点背景色",
					"default": "#000",
					used: [{
						selector: ".am-control-nav",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-bg-color",
					name: "控制点颜色",
					"default": "rgba(0,0,0,0.5)",
					used: [{
						selector: ".am-control-nav li a",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-hover-bg-color",
					name: "控制点Hover颜色",
					"default": "rgba(0,0,0,0.7)",
					used: [{
						selector: ".am-control-nav li a:hover",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-active-bg-color",
					name: "控制点激活颜色",
					"default": "#FC7001",
					used: [{
						selector: ".am-control-nav li a.am-active",
						property: "background-color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"directionNav":false}'
					}
				}]
			},
			{
				name: "a4",
				desc: "底部白边圆形控制点",
				hook: "hook-am-slider-a4",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				variables: [{
					variable: "control-nav-bg-color",
					name: "控制点颜色",
					"default": "rgba(0,0,0,0.5)",
					used: [{
						selector: ".am-control-nav li a",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-hover-bg-color",
					name: "控制点Hover颜色",
					"default": "rgba(0,0,0,0.7)",
					used: [{
						selector: ".am-control-nav li a:hover",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-active-bg-color",
					name: "控制点激活颜色",
					"default": "#FC7001",
					used: [{
						selector: ".am-control-nav li a.am-active",
						property: "background-color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"directionNav":false}'
					}
				}]
			},
			{
				name: "a5",
				desc: "长条等分控制点",
				hook: "hook-am-slider-a5",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				variables: [{
					variable: "control-nav-bg-color",
					name: "控制点颜色",
					"default": "rgba(0,0,0,0.5)",
					used: [{
						selector: ".am-control-nav li a",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-hover-bg-color",
					name: "控制点Hover颜色",
					"default": "rgba(0,0,0,0.7)",
					used: [{
						selector: ".am-control-nav li a:hover",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-active-bg-color",
					name: "控制点激活颜色",
					"default": "#FC7001",
					used: [{
						selector: ".am-control-nav li a.am-active",
						property: "background-color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"directionNav":false}'
					}
				}]
			},
			{
				name: "b1",
				desc: "方形居中左右箭头",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-b1",
				variables: [{
					variable: "direction-nav-color",
					name: "箭头颜色",
					"default": "#333",
					used: [{
						selector: ".am-direction-nav a",
						property: "color"
					}]
				},
				{
					variable: "direction-nav-bg-color",
					name: "箭头背景色",
					"default": "rgba(0, 0, 0, 0.5)",
					used: [{
						selector: ".am-direction-nav a",
						property: "background-color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"controlNav":false}'
					}
				}]
			},
			{
				name: "b2",
				desc: "圆形居中左右箭头",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-b2",
				variables: [{
					variable: "direction-nav-color",
					name: "箭头颜色",
					"default": "#fff",
					used: [{
						selector: ".am-direction-nav a",
						property: "color"
					}]
				},
				{
					variable: "direction-nav-bg-color",
					name: "箭头背景色",
					"default": "rgba(0, 0, 0, 0.5)",
					used: [{
						selector: ".am-direction-nav a",
						property: "background-color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"controlNav":false}'
					}
				}]
			},
			{
				name: "b3",
				desc: "图片外左右箭头",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-b3",
				variables: [{
					variable: "direction-nav-color",
					name: "箭头颜色",
					"default": "#333",
					used: [{
						selector: ".am-direction-nav a",
						property: "color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"controlNav":false}',
						content: [{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg"
						}]
					}
				}]
			},
			{
				name: "b4",
				desc: "图片外左右圆形箭头",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-b4",
				variables: [{
					variable: "direction-nav-color",
					name: "箭头颜色",
					"default": "#fff",
					used: [{
						selector: ".am-direction-nav a",
						property: "color"
					}]
				},
				{
					variable: "direction-nav-bg-color",
					name: "箭头背景色",
					"default": "rgba(0, 0, 0, 0.8)",
					used: [{
						selector: ".am-direction-nav a",
						property: "background-color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"controlNav":false}'
					}
				}]
			},
			{
				name: "c1",
				desc: "标题+长条控制点",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-c1",
				variables: [{
					variable: "desc-color",
					name: "描述文字颜色",
					"default": "#fff",
					used: [{
						selector: ".am-slider-desc",
						property: "color"
					}]
				},
				{
					variable: "desc-bg-color",
					name: "描述文字背景颜色",
					"default": "rgba(0,0,0,0.6)",
					used: [{
						selector: ".am-slider-desc",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-bg-color",
					name: "控制点颜色",
					"default": "rgba(0,0,0,0.7)",
					used: [{
						selector: ".am-control-nav li a",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-active-bg-color",
					name: "控制点激活颜色",
					"default": "#FC7001",
					used: [{
						selector: ".am-control-nav li a.am-active",
						property: "background-color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"directionNav":false}',
						content: [{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
							desc: "远方 有一个地方 那里种有我们的梦想"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
							desc: "某天 也许会相遇 相遇在这个好地方"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
							desc: "不要太担心 只因为我相信 终会走过这条遥远的道路"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
							desc: "OH PARA PARADISE 是否那么重要 你是否那么地遥远"
						}]
					}
				}]
			},
			{
				name: "c2",
				desc: "标题+方形控制点",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-c2",
				variables: [{
					variable: "desc-color",
					name: "描述文字颜色",
					"default": "#fff",
					used: [{
						selector: ".am-slider-desc",
						property: "color"
					}]
				},
				{
					variable: "desc-bg-color",
					name: "描述文字背景颜色",
					"default": "rgba(0,0,0,0.6)",
					used: [{
						selector: ".am-slider-desc",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-bg-color",
					name: "控制点颜色",
					"default": "rgba(255,255,255,0.4)",
					used: [{
						selector: ".am-control-nav li a",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-active-bg-color",
					name: "控制点激活颜色",
					"default": "#fff",
					used: [{
						selector: ".am-control-nav li a.am-active",
						property: "background-color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"directionNav":false}',
						content: [{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
							desc: "远方 有一个地方 那里种有我们的梦想"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
							desc: "某天 也许会相遇 相遇在这个好地方"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
							desc: "不要太担心 只因为我相信 终会走过这条遥远的道路"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
							desc: "OH PARA PARADISE 是否那么重要 你是否那么地遥远"
						}]
					}
				}]
			},
			{
				name: "c3",
				desc: "标题+居中左右箭头",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-c3",
				variables: [{
					variable: "desc-color",
					name: "描述文字颜色",
					"default": "#fff",
					used: [{
						selector: ".am-slider-desc",
						property: "color"
					}]
				},
				{
					variable: "desc-bg-color",
					name: "描述文字背景颜色",
					"default": "rgba(0,0,0,0.6)",
					used: [{
						selector: ".am-slider-desc",
						property: "background-color"
					}]
				},
				{
					variable: "direction-nav-color",
					name: "箭头颜色",
					"default": "#fff",
					used: [{
						selector: ".am-direction-nav a",
						property: "color"
					}]
				},
				{
					variable: "direction-nav-bg-color",
					name: "箭头背景色",
					"default": "rgba(0,0,0,0.5)",
					used: [{
						selector: ".am-direction-nav a",
						property: "background-color"
					}]
				},
				{
					variable: "counter-bg-color",
					name: "计数背景色",
					"default": "rgba(255, 0, 0, 0.7)",
					used: [{
						selector: ".am-slider-counter",
						property: "background-color"
					}]
				},
				{
					variable: "counter-color",
					name: "计数颜色",
					"default": "#eee",
					used: [{
						selector: ".am-slider-counter",
						property: "color"
					}]
				},
				{
					variable: "counter-active-color",
					name: "计数激活颜色",
					"default": "rgba(255, 0, 0, 0.7)",
					used: [{
						selector: ".am-slider-counter .am-active",
						property: "color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"controlNav":false}',
						content: [{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
							desc: '<div class="am-slider-counter"><span class="am-active">1</span>/4</div>远方 有一个地方 那里种有我们的梦想'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
							desc: '<div class="am-slider-counter"><span class="am-active">2</span>/4</div>某天 也许会相遇 相遇在这个好地方'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
							desc: '<div class="am-slider-counter"><span class="am-active">3</span>/4</div>不要太担心 只因为我相信 终会走过这条遥远的道路'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
							desc: '<div class="am-slider-counter"><span class="am-active">4</span>/4</div>OH PARA PARADISE 是否那么重要 你是否那么地遥远'
						}]
					}
				}]
			},
			{
				name: "c4",
				desc: "标题+居底左右箭头",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-c4",
				variables: [{
					variable: "desc-color",
					name: "描述文字颜色",
					"default": "#fff",
					used: [{
						selector: ".am-slider-desc",
						property: "color"
					}]
				},
				{
					variable: "desc-bg-color",
					name: "描述文字背景颜色",
					"default": "rgba(0,0,0,0.6)",
					used: [{
						selector: ".am-slider-desc",
						property: "background-color"
					}]
				},
				{
					variable: "direction-nav-color",
					name: "箭头颜色",
					"default": "rgba(0,0,0,0.7)",
					used: [{
						selector: ".am-direction-nav a",
						property: "color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"controlNav":false}',
						content: [{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
							desc: "远方 有一个地方 那里种有我们的梦想"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
							desc: "某天 也许会相遇 相遇在这个好地方"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
							desc: "不要太担心 只因为我相信 终会走过这条遥远的道路"
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
							desc: "OH PARA PARADISE 是否那么重要 你是否那么地遥远"
						}]
					}
				}]
			},
			{
				name: "d1",
				desc: "标题+底部圆形左右箭头",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-d1",
				variables: [{
					variable: "desc-color",
					name: "描述文字颜色",
					"default": "#fff",
					used: [{
						selector: ".am-slider-desc",
						property: "color"
					}]
				},
				{
					variable: "desc-bg-color",
					name: "描述文字背景颜色",
					"default": "#f26422",
					used: [{
						selector: ".am-slider-desc",
						property: "background-color"
					}]
				},
				{
					variable: "desc-more-color",
					name: "更多链接颜色",
					"default": "#eee",
					used: [{
						selector: ".am-slider-more",
						property: "color"
					}]
				},
				{
					variable: "direction-nav-color",
					name: "箭头颜色",
					"default": "rgba(255,255,255,0.9)",
					used: [{
						selector: ".am-direction-nav a",
						property: "border-color"
					},
					{
						selector: ".am-direction-nav a",
						property: "color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"controlNav":false}',
						content: [{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
							desc: '<h2 class="am-slider-title">远方 有一个地方 那里种有我们的梦想</h2><a class="am-slider-more">了解更多</a>'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
							desc: '<h2 class="am-slider-title">某天 也许会相遇 相遇在这个好地方</h2><a class="am-slider-more">了解更多</a>'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
							desc: '<h2 class="am-slider-title">不要太担心 只因为我相信 终会走过这条遥远的道路</h2><a class="am-slider-more">了解更多</a>'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
							desc: '<h2 class="am-slider-title">OH PARA PARADISE 是否那么重要 你是否那么地遥远</h2><a class="am-slider-more">了解更多</a>'
						}]
					}
				}]
			},
			{
				name: "d2",
				desc: "浮层标题+底部圆形控制点",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-d2",
				variables: [{
					variable: "desc-color",
					name: "描述文字颜色",
					"default": "#fff",
					used: [{
						selector: ".am-slider-desc",
						property: "color"
					}]
				},
				{
					variable: "content-bg-color",
					name: "描述文字背景颜色",
					"default": "rgba(0,0,0,0.7)",
					used: [{
						selector: ".am-slider-content",
						property: "background-color"
					}]
				},
				{
					variable: "more-color",
					name: "更多链接颜色",
					"default": "#eee",
					used: [{
						selector: ".am-slider-more",
						property: "color"
					}]
				},
				{
					variable: "more-bg-color",
					name: "更多背景颜色",
					"default": "#F26422",
					used: [{
						selector: ".am-slider-more",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-bg-color",
					name: "控制点颜色",
					"default": "rgba(0,0,0,0.5)",
					used: [{
						selector: ".am-control-nav li a",
						property: "background-color"
					}]
				},
				{
					variable: "control-nav-active-bg-color",
					name: "控制点激活颜色",
					"default": "#FC7001",
					used: [{
						selector: ".am-control-nav li a.am-active",
						property: "background-color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"directionNav":false}',
						content: [{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
							desc: '<div class="am-slider-content"><h2 class="am-slider-title">远方 有一个地方 那里种有我们的梦想</h2><p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p></div><a class="am-slider-more">了解更多</a>'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
							desc: '<div class="am-slider-content"><h2 class="am-slider-title">某天 也许会相遇 相遇在这个好地方</h2><p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p></div><a class="am-slider-more">了解更多</a>'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
							desc: '<div class="am-slider-content"><h2 class="am-slider-title">不要太担心 只因为我相信 终会走过这条遥远的道路</h2><p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p></div><a class="am-slider-more">了解更多</a>'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
							desc: '<div class="am-slider-content"><h2 class="am-slider-title">OH PARA PARADISE 是否那么重要 你是否那么地遥远</h2><p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p></div><a class="am-slider-more">了解更多</a>'
						}]
					}
				}]
			},
			{
				name: "d3",
				desc: "标题+缩略图导航",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-d3",
				variables: [{
					variable: "desc-color",
					name: "描述文字颜色",
					"default": "#fff",
					used: [{
						selector: ".am-slider-desc",
						property: "color"
					}]
				},
				{
					variable: "desc-bg-color",
					name: "描述文字背景色",
					"default": "rgba(0, 0, 0, 0.7)",
					used: [{
						selector: ".am-slider-desc",
						property: "background-color"
					},
					{
						selector: ".am-control-thumbs .am-active + i",
						property: "border-top-color"
					}]
				}],
				demos: [{
					data: {
						sliderConfig: '{"controlNav":"thumbnails","directionNav":false}',
						content: [{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
							thumb: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
							desc: '<h2 class="am-slider-title">远方 有一个地方 那里种有我们的梦想</h2><p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
							thumb: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
							desc: '<h2 class="am-slider-title">某天 也许会相遇 相遇在这个好地方</h2><p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
							thumb: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
							desc: '<h2 class="am-slider-title">不要太担心 只因为我相信 终会走过这条遥远的道路</h2><p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
							thumb: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
							desc: '<h2 class="am-slider-title">OH PARA PARADISE 是否那么重要 你是否那么地遥远</h2><p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内</p>'
						}]
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				options: {
					animation: "slide",
					initDelay: 0,
					itemWidth: 0
				},
				hook: "hook-am-slider-one",
				variables: [{
					variable: "slider-dese-color",
					name: "描述文字颜色",
					"default": "#fff",
					used: [{
						selector: ".am-viewport .am-slider-desc",
						property: "color"
					}]
				},
				{
					variable: "slider-dese-bg",
					name: "描述文字背景颜色",
					"default": "rgba(0,0,0,0.5)",
					used: [{
						selector: ".am-viewport .am-slider-desc",
						property: "background-color"
					}]
				}],
				demos: [{
					desc: "",
					data: {
						sliderConfig: '{"directionNav":false}',
						content: [{
							img: "http://s.amazeui.org/media/i/demos/bing-1.jpg",
							desc: '<h2 class="am-slider-title">远方 有一个地方 那里种有我们的梦想</h2>'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-2.jpg",
							desc: '<h2 class="am-slider-title">某天 也许会相遇 相遇在这个好地方</h2>'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-3.jpg",
							desc: '<h2 class="am-slider-title">不要太担心 只因为我相信 终会走过这条遥远的道路</h2>'
						},
						{
							img: "http://s.amazeui.org/media/i/demos/bing-4.jpg",
							desc: '<h2 class="am-slider-title">OH PARA PARADISE 是否那么重要 你是否那么地遥远</h2>'
						}]
					}
				}]
			}],
			demoContent: [{
				img: "http://s.amazeui.org/media/i/demos/bing-1.jpg"
			},
			{
				img: "http://s.amazeui.org/media/i/demos/bing-2.jpg"
			},
			{
				img: "http://s.amazeui.org/media/i/demos/bing-3.jpg"
			},
			{
				img: "http://s.amazeui.org/media/i/demos/bing-4.jpg"
			}]
		},
		tabs: {
			id: "tabs",
			name: "Tabs",
			localName: {
				en: "Tabs",
				"zh-cn": "选项卡"
			},
			version: "4.0.1",
			description: "用于多标签切换",
			author: {
				name: "Shengli",
				email: "china_victory@yunshipei.com"
			},
			ver: "4.0",
			icon: "tabs.png",
			tpl: '{{#this}}\n  <div data-am-widget="tabs"\n       class="am-tabs{{#if theme}} am-tabs-{{theme}}{{else}} am-tabs-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}"\n       {{#if id}}id="{{id}}"{{/if}} {{#if options.noSwipe}}data-am-tabs-noswipe="1"{{/if}}>\n    {{#if content}}\n      <ul class="am-tabs-nav am-cf">\n        {{#each content}}\n          <li class="{{#if active}}am-active{{/if}}"><a href="[data-tab-panel-{{@index}}]">{{{title}}}</a></li>\n        {{/each}}\n      </ul>\n      <div class="am-tabs-bd">\n        {{#each content}}\n          <div data-tab-panel-{{@index}} class="am-tab-panel {{#if active}}am-active{{/if}}">\n            {{{content}}}\n          </div>\n        {{/each}}\n      </div>\n    {{/if}}\n  </div>\n{{/this}}\n',
			example: "",
			depStyle: ["ui.component.less", "ui.tabs.less", "animation.less"],
			depJs: ["ui.tabs.js", "util.hammer.js"],
			options: {
				noSwipe: {
					name: "触控操作",
					desc: "是否禁用 Tabs 触控操作",
					type: "select",
					required: !1,
					"default": 0,
					dataList: [{
						value: 0,
						title: "启用",
						selected: 1
					},
					{
						value: 1,
						title: "禁用"
					}]
				}
			},
			themes: [{
				name: "default",
				desc: "蓝色选项卡",
				options: {
					cols: 3
				},
				hook: "hook-am-tabs-default",
				variables: [{
					variable: "tabs-nav-bg",
					name: "标签背景色",
					"default": "#eee",
					used: [{
						selector: ".am-tabs-nav",
						property: "background-color"
					}]
				},
				{
					variable: "tabs-nav-color",
					name: "标签颜色",
					"default": "#333",
					used: [{
						selector: ".am-tabs-nav a",
						property: "color"
					}]
				},
				{
					variable: "tabs-nav-active-bg",
					name: "激活标签背景色",
					"default": "#0e90d2",
					used: [{
						selector: ".am-tabs-nav > .am-active a",
						property: "background-color"
					}]
				},
				{
					variable: "tabs-nav-active-color",
					name: "激活标签颜色",
					"default": "#fff",
					used: [{
						selector: ".am-tabs-nav > .am-active a",
						property: "color"
					}]
				}],
				demos: [{
					data: {
						options: {
							cols: "3"
						}
					}
				}]
			},
			{
				name: "d2",
				desc: "下边框选项卡",
				options: {
					cols: 3
				},
				hook: "hook-am-tabs-d2",
				variables: [{
					variable: "tabs-nav-bg",
					name: "标签背景色",
					"default": "#eee",
					used: [{
						selector: ".am-tabs-nav",
						property: "background-color"
					}]
				},
				{
					variable: "tabs-nav-color",
					name: "标签颜色",
					"default": "#333",
					used: [{
						selector: ".am-tabs-nav a",
						property: "color"
					}]
				},
				{
					variable: "tabs-nav-active-bg",
					name: "激活标签背景色",
					"default": "#0e90d2",
					used: [{
						selector: ".am-tabs-nav > .am-active a",
						property: "background-color"
					}]
				},
				{
					variable: "tabs-nav-active-color",
					name: "激活标签颜色",
					"default": "#fff",
					used: [{
						selector: ".am-tabs-nav > .am-active a",
						property: "color"
					},
					{
						selector: ".am-tabs-nav > .am-active",
						property: "border-bottom-color"
					},
					{
						selector: ".am-tabs-nav > .am-active:after",
						property: "border-bottom-color"
					}]
				}],
				demos: [{
					data: {
						options: {
							cols: "3"
						}
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				options: {
					cols: 3
				},
				hook: "hook-am-tabs-one",
				variables: [{
					variable: "tabs-color",
					name: "标签背景色",
					"default": "#fff",
					used: [{
						selector: ".am-tabs-nav",
						property: "background-color"
					}]
				},
				{
					variable: "tabs-border-color",
					name: "标签边框颜色",
					"default": "#15afef",
					used: [{
						selector: ".am-tabs-nav, .am-tabs-nav > li + li",
						property: "border-color"
					}]
				},
				{
					variable: "tabs-nav-color",
					name: "标签颜色",
					"default": "#15afef",
					used: [{
						selector: ".am-tabs-nav a",
						property: "color"
					}]
				},
				{
					variable: "tabs-nav-active-bg",
					name: "激活标签背景色",
					"default": "#15afef",
					used: [{
						selector: ".am-tabs-nav > .am-active a",
						property: "background-color"
					}]
				},
				{
					variable: "tabs-nav-active-color",
					name: "激活标签颜色",
					"default": "#15afef",
					used: [{
						selector: ".am-tabs-nav > .am-active a",
						property: "color"
					}]
				}],
				demos: [{
					data: {
						options: {
							cols: "3"
						}
					}
				}]
			}],
			demoContent: [{
				title: "青春",
				content: "【青春】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。",
				active: 1
			},
			{
				title: "彩虹",
				content: "【彩虹】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。"
			},
			{
				title: "歌唱",
				content: "【歌唱】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。"
			}]
		},
		titlebar: {
			id: "titlebar",
			name: "Titlebar",
			localName: {
				en: "Titlebar",
				"zh-cn": "标题栏"
			},
			version: "4.0.1",
			description: "多用于创建header、标题栏等",
			author: {
				name: "Shengli",
				email: "china_victory@yunshipei.com"
			},
			ver: "4.0",
			icon: "titlebar.png",
			tpl: '{{#this}}\n<div data-am-widget="titlebar" class="am-titlebar {{#if theme}}am-titlebar-{{theme}}{{else}}am-titlebar-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}" {{#if id}}id="{{id}}"{{/if}}>\n  {{#if content.title}}\n    <h2 class="am-titlebar-title {{#unless content.link}}{{content.className}}{{/unless}}">\n      {{#if content.link}}\n        <a href="{{content.link}}" class="{{content.className}}">{{{content.title}}}</a>\n      {{else}}\n        {{{content.title}}}\n      {{/if}}\n    </h2>\n  {{/if}}\n\n  {{#if content.nav}}\n    <nav class="am-titlebar-nav">\n      {{#each content.nav}}\n        <a href="{{link}}" class="{{className}}">{{{title}}}</a>\n      {{/each}}\n    </nav>\n  {{/if}}\n</div>\n{{/this}}\n',
			example: "",
			depStyle: ["button.less", "icon.less"],
			depJs: [],
			options: {},
			themes: [{
				name: "default",
				desc: "左边框",
				hook: "hook-am-titlebar-default",
				variables: [{
					variable: "titlebar-bg",
					name: "背景颜色",
					"default": "transparent",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "titlebar-color",
					name: "文本颜色",
					"default": "#0e90d2",
					used: [{
						selector: ".am-titlebar-title",
						property: "color"
					}]
				},
				{
					variable: "titlebar-link-color",
					name: "链接颜色",
					"default": "#0e90d2",
					used: [{
						selector: "a",
						property: "color"
					}]
				},
				{
					variable: "titlebar-border-color",
					name: "下边框颜色",
					"default": "#dedede",
					used: [{
						selector: "",
						property: "border-bottom-color"
					}]
				},
				{
					variable: "titlebar-border-left-color",
					name: "左边框颜色",
					"default": "#0e90d2",
					used: [{
						selector: ".am-titlebar-title:before",
						property: "border-left-color"
					}]
				}],
				demos: [{
					desc: "文字标题",
					data: {
						content: {
							title: "栏目标题",
							nav: [{
								title: "more &raquo;",
								link: "#more"
							}]
						}
					}
				},
				{
					desc: "图片标题",
					data: {
						content: {
							title: '<img src="http://s.amazeui.org/media/i/brand/amazeui-b.png"/>',
							nav: [{
								title: "more &raquo;",
								link: "#more"
							}]
						}
					}
				}]
			},
			{
				name: "multi",
				desc: "浅背景上边框",
				hook: "hook-am-titlebar-multi",
				variables: [{
					variable: "titlebar-bg",
					name: "背景颜色",
					"default": "#f5f5f5",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "titlebar-color",
					name: "文本颜色",
					"default": "#0e90d2",
					used: [{
						selector: ".am-titlebar-title",
						property: "color"
					}]
				},
				{
					variable: "titlebar-link-color",
					name: "链接颜色",
					"default": "#0e90d2",
					used: [{
						selector: "a",
						property: "color"
					}]
				},
				{
					variable: "titlebar-border-top-color",
					name: "上边框颜色",
					"default": "#3bb4f2",
					used: [{
						selector: "",
						property: "border-top-color"
					}]
				},
				{
					variable: "titlebar-border-bottom-color",
					name: "下边框颜色",
					"default": "#e8e8e8",
					used: [{
						selector: "",
						property: "border-bottom-color"
					}]
				}],
				demos: [{
					desc: "单个链接",
					data: {
						content: {
							title: "栏目标题",
							nav: [{
								title: "more &raquo;",
								link: "#more"
							}]
						}
					}
				},
				{
					desc: "多链接",
					data: {
						content: {
							title: "科技频道",
							nav: [{
								title: "手机",
								link: "#more-1"
							},
							{
								title: "数码",
								link: "#more-2"
							},
							{
								title: "影音",
								link: "#more-3"
							}]
						}
					}
				}]
			},
			{
				name: "cols",
				desc: "浅背景多链接",
				hook: "hook-am-titlebar-cols",
				variables: [{
					variable: "titlebar-bg",
					name: "背景颜色",
					"default": "#f5f5f5",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "titlebar-color",
					name: "文本颜色",
					"default": "#555",
					used: [{
						selector: "",
						property: "color"
					}]
				},
				{
					variable: "titlebar-link-color",
					name: "链接颜色",
					"default": "#a2a985",
					used: [{
						selector: "a",
						property: "color"
					}]
				},
				{
					variable: "titlebar-border-color",
					name: "上边框颜色",
					"default": "#e1e1e1",
					used: [{
						selector: "",
						property: "border-top-color"
					}]
				},
				{
					variable: "titlebar-link-active-color",
					name: "激活链接颜色",
					"default": "#0e90d2",
					used: [{
						selector: ".am-titlebar-title, .am-titlebar-title a",
						property: "color"
					},
					{
						selector: ".am-titlebar-title",
						property: "border-bottom-color"
					}]
				}],
				demos: [{
					data: {
						content: {
							title: "栏目标题",
							link: "#wtf",
							nav: [{
								link: "#c1",
								title: "子栏目"
							},
							{
								link: "#c2",
								title: "子栏目"
							},
							{
								link: "#c3",
								title: "子栏目"
							}]
						}
					}
				}]
			},
			{
				name: "one",
				desc: "简约风格",
				hook: "hook-am-titlebar-one",
				variables: [{
					variable: "titlebar-bg",
					name: "背景颜色",
					"default": "#fff",
					used: [{
						selector: "",
						property: "background-color"
					}]
				},
				{
					variable: "titlebar-border-color",
					name: "边框颜色",
					"default": "#15afef",
					used: [{
						selector: "",
						property: "border-bottom-color"
					},
					{
						selector: ".am-titlebar-title:before",
						property: "border-left-color"
					}]
				},
				{
					variable: "titlebar-title-color",
					name: "标题颜色",
					"default": "#222",
					used: [{
						selector: ".am-titlebar-title",
						property: "color"
					}]
				},
				{
					variable: "titlebar-title-link-color",
					name: "标题链接颜色",
					"default": "#222",
					used: [{
						selector: ".am-titlebar-title a",
						property: "color"
					}]
				},
				{
					variable: "titlebar-nav-link-color",
					name: "更多链接颜色",
					"default": "#999",
					used: [{
						selector: ".am-titlebar-nav, .am-titlebar-nav a",
						property: "color"
					}]
				}],
				demos: [{
					data: {
						content: {
							title: "栏目标题",
							link: "#c",
							nav: [{
								title: "more &raquo;",
								link: "#more"
							}]
						}
					}
				}]
			}]
		},
		wechatpay: {
			id: "wechatpay",
			name: "WeChat Pay",
			localName: {
				en: "WeChat Pay",
				"zh-cn": "微信支付"
			},
			version: "1.0.0",
			description: "微信支付",
			author: {
				name: "hzp",
				email: "hzp@yunshipei.com"
			},
			ver: "1.0",
			icon: "wechatpay.png",
			tpl: '{{#this}}\n  <div data-am-widget="wechatpay" class="am-wechatpay{{#if theme}} am-wechatpay-{{theme}}{{else}} am-wechatpay-default{{/if}}{{#if widgetId}} {{widgetId}}{{/if}}{{#if className}} {{className}}{{/if}}"{{#if id}} id="{{id}}"{{/if}} data-wechat-pay="{ {{#each content.order}} {{@key}}: \'{{this}}\',{{/each}} }">\n      <button type="button" class="am-btn am-btn-primary am-btn-block am-wechatpay-btn">\n        {{#if content.title}}\n          {{content.title}}\n        {{else}}\n          微信支付\n        {{/if}}\n      </button>\n  </div>\n{{/this}}\n',
			example: "",
			depStyle: ["icon.less"],
			depJs: [],
			options: {},
			themes: [{
				id: "default",
				name: "default",
				desc: "默认",
				options: {},
				hook: "hook-am-wechatpay-default",
				variables: [{
					variable: "",
					name: "",
					"default": "",
					used: [{
						selector: "",
						property: ""
					}]
				}],
				demos: [{
					desc: "",
					data: {
						content: {
							order: {
								timestamp: "1421914022",
								nonceStr: "8W93zPDk9fNRxRbpqv5yqwCkNRWZspyW",
								"package": "prepay_id=wx20150122160705ac42dc60170063851392",
								signType: "MD5",
								paySign: "5AF3E6B975D35BA23B63277CB45C8830"
							},
							title: "速速支付！"
						}
					}
				}]
			}]
		}
	}
}.widgets,
isEn = !1,
_listDataCache = {}; !
function(e) {
	if (e) {
		e(function() {
			FastClick.attach(document.body)
		});
		var a = e.AMUI.iScroll;
		if (a) {
			var t = ("localStorage" in window && window.localStorage && window.localStorage, ["accordion", "divider", "duoshuo", "figure", "footer", "gallery", "gotop", "header", "intro", "list_news", "map", "mechat", "menu", "navbar", "pagination", "paragraph", "slider", "tabs", "titlebar", "wechatpay"]),
			o = function() {
				var o = e("body"),
				i = e(".widget-hd"),
				n = e("#demo-scroller"),
				l = e("#widget-list");
				this.compile = Handlebars.compile(e("#tpl-demo-list").html()),
				this.cache = {},
				this.demoScroll = null,
				this.render = function(e, a) {
					return this.cache[e] || (this.cache[e] = this.compile(a)),
					this.cache[e]
				},
				this.createList = function(e) {
					e = e || this.getHash();
					var a = this;
					return e && i.find("h1").text(l.find("[data-rel=" + e + "]").text() + "Demos"),
					!e || t.indexOf(e) < 0 ? this.resetActive() : void a.setActive(e, getListData(e, _widgets[e].themes))
				},
				this.setActive = function(t, i) {
					n.empty().html(this.render(t, i)),
					o.addClass("demo-list-active"),
					this.demoScroll || (this.demoScroll = new a("#demo-list", {
						tap: !0
					})),
					setTimeout(e.proxy(function() {
						this.demoScroll.refresh()
					},
					this), 100)
				},
				this.resetActive = function() {
					o.removeClass("demo-list-active")
				},
				this.getHash = function() {
					return window.location.hash.replace("#", "")
				},
				this.init = function() {
					l.on("click tap", "a",
					function(a) {
						a.preventDefault(),
						window.location.hash = e(this).attr("data-rel")
					}),
					e(window).on("hashchange", e.proxy(function() {
						this.createList()
					},
					this)),
					e("#btn-back").on("click",
					function(e) {
						e.preventDefault(),
						window.location.hash = ""
					}),
					l.on("touchmove",
					function(e) {
						e.preventDefault()
					}),
					this.createList()
				},
				this.init(),
				this.mainScroll = new a(l[0])
			};
			e(function() {
				new o
			})
		}
	}
} (window.jQuery || window.Zepto)