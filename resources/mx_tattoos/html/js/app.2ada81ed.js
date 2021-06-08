(function(t) {
    function e(e) {
        for (var i, n, l = e[0], a = e[1], c = e[2], d = 0, _ = []; d < l.length; d++) n = l[d], Object.prototype.hasOwnProperty.call(o, n) && o[n] && _.push(o[n][0]), o[n] = 0;
        for (i in a) Object.prototype.hasOwnProperty.call(a, i) && (t[i] = a[i]);
        u && u(e);
        while (_.length) _.shift()();
        return r.push.apply(r, c || []), s()
    }

    function s() {
        for (var t, e = 0; e < r.length; e++) {
            for (var s = r[e], i = !0, l = 1; l < s.length; l++) {
                var a = s[l];
                0 !== o[a] && (i = !1)
            }
            i && (r.splice(e--, 1), t = n(n.s = s[0]))
        }
        return t
    }
    var i = {},
        o = {
            app: 0
        },
        r = [];

    function n(e) {
        if (i[e]) return i[e].exports;
        var s = i[e] = {
            i: e,
            l: !1,
            exports: {}
        };
        return t[e].call(s.exports, s, s.exports, n), s.l = !0, s.exports
    }
    n.m = t, n.c = i, n.d = function(t, e, s) {
        n.o(t, e) || Object.defineProperty(t, e, {
            enumerable: !0,
            get: s
        })
    }, n.r = function(t) {
        "undefined" !== typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(t, "__esModule", {
            value: !0
        })
    }, n.t = function(t, e) {
        if (1 & e && (t = n(t)), 8 & e) return t;
        if (4 & e && "object" === typeof t && t && t.__esModule) return t;
        var s = Object.create(null);
        if (n.r(s), Object.defineProperty(s, "default", {
                enumerable: !0,
                value: t
            }), 2 & e && "string" != typeof t)
            for (var i in t) n.d(s, i, function(e) {
                return t[e]
            }.bind(null, i));
        return s
    }, n.n = function(t) {
        var e = t && t.__esModule ? function() {
            return t["default"]
        } : function() {
            return t
        };
        return n.d(e, "a", e), e
    }, n.o = function(t, e) {
        return Object.prototype.hasOwnProperty.call(t, e)
    }, n.p = "";
    var l = window["webpackJsonp"] = window["webpackJsonp"] || [],
        a = l.push.bind(l);
    l.push = e, l = l.slice();
    for (var c = 0; c < l.length; c++) e(l[c]);
    var u = a;
    r.push([0, "chunk-vendors"]), s()
})({
    0: function(t, e, s) {
        t.exports = s("56d7")
    },
    "034f": function(t, e, s) {
        "use strict";
        s("85ec")
    },
    "56d7": function(t, e, s) {
        "use strict";
        s.r(e);
        s("e260"), s("e6cf"), s("cca6"), s("a79d");
        var i = s("2b0e"),
            o = function() {
                var t = this,
                    e = t.$createElement,
                    s = t._self._c || e;
                return t.NuiOpen ? s("div", {
                    style: t.position_nui,
                    attrs: {
                        id: "container"
                    }
                }, [s("div", {
                    staticClass: "box"
                }, [t._m(0), s("div", {
                    attrs: {
                        id: "store_information"
                    }
                }, [s("p", {
                    attrs: {
                        id: "main_title"
                    }
                }, [t._v(t._s(t.Texts_Nui.Title))]), s("p", {
                    attrs: {
                        id: "instruction"
                    }
                }, [t._v(t._s(t.Texts_Nui.Info1))]), s("p", {
                    attrs: {
                        id: "instruction"
                    }
                }, [t._v(t._s(t.Texts_Nui.Info2) + " "), s("span", {
                    staticStyle: {
                        color: "rgba(0, 255, 0, 0.75)",
                        "text-shadow": "1px 2px black"
                    }
                }, [t._v(t._s(t.Texts_Nui.Info3))])]), s("p", {
                    attrs: {
                        id: "instruction"
                    }
                }, [t._v(" " + t._s(t.Texts_Nui.Info4) + " "), s("span", {
                    staticStyle: {
                        color: "rgba(255, 0, 0)",
                        "text-shadow": "1px 2px black"
                    }
                }, [t._v(t._s(t.Texts_Nui.Info5))])])]), -1 == t.selected ? s("div", {
                    class: {
                        hover2: -1 == t.selected
                    },
                    style: t.text_button_remove_tattoos_style,
                    attrs: {
                        id: "RemoveAllTattoos"
                    }
                }, [t._v(t._s(t.text_button_remove_tattoos))]) : t._e(), -1 != t.selected ? s("div", {
                    attrs: {
                        id: "tattoos_list"
                    }
                }, t._l(t.list, (function(e, i) {
                    return s("ul", {
                        key: i
                    }, [s("li", {
                        class: e.title + e.dlc
                    }, [s("div", {
                        class: {
                            hover: t.selected == i
                        },
                        attrs: {
                            id: "local_range"
                        }
                    }, [s("img", {
                        attrs: {
                            src: "img/machine.png"
                        }
                    }), s("span", {
                        attrs: {
                            id: "info_tatto"
                        }
                    }, [t._v(t._s(e.title) + ":"), s("span", {
                        attrs: {
                            id: "mpheist3_overlays_info"
                        }
                    }, [t._v(t._s(e.current))])]), s("span", {
                        staticClass: "dlc_valor",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "green"
                        },
                        attrs: {
                            id: "dlc_valor"
                        }
                    }, [t._v(t._s(t.Texts_Nui.Money_Symbol) + t._s(e.price))]), s("span", {
                        staticClass: "dlc_total",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "chocolate"
                        },
                        attrs: {
                            id: "dlc_total"
                        }
                    }, [t._v(t._s(t.Texts_Nui.QtyTattoos) + " " + t._s(e.qty))]), 1 == e.acquired ? s("span", {
                        staticClass: "dlc_acquired",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "orange"
                        },
                        attrs: {
                            id: "dlc_acquired"
                        }
                    }, [t._v(t._s(t.Texts_Nui.TattoosAcquired))]) : 2 == e.acquired ? s("span", {
                        staticClass: "dlc_acquired",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "red"
                        },
                        attrs: {
                            id: "dlc_acquired"
                        }
                    }, [t._v(t._s(t.Texts_Nui.TattoosRemoved))]) : t._e(), e.has ? s("span", {
                        staticClass: "dlc_has",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "red"
                        },
                        attrs: {
                            id: "dlc_has"
                        }
                    }, [t._v(t._s(t.Texts_Nui.AlreadyHaveTattoo))]) : t._e(), s("input", {
                        directives: [{
                            name: "model",
                            rawName: "v-model",
                            value: e.current,
                            expression: "item.current"
                        }],
                        staticClass: "slider",
                        attrs: {
                            type: "range",
                            min: "1",
                            max: e.qty,
                            value: "0",
                            id: "mpheist3_overlays"
                        },
                        domProps: {
                            value: e.current
                        },
                        on: {
                            __r: function(s) {
                                return t.$set(e, "current", s.target.value)
                            }
                        }
                    })])])])
                })), 0) : t._e()])]) : t._e()
            },
            r = [function() {
                var t = this,
                    e = t.$createElement,
                    s = t._self._c || e;
                return s("div", {
                    attrs: {
                        id: "logo_store"
                    }
                }, [s("img", {
                    attrs: {
                        src: "img/logo.png"
                    }
                })])
            }],
            n = (s("d3b7"), {
                name: "Tattoo_Shop_And_Degrades",
                data: function() {
                    return {
                        NuiOpen: !1,
                        NameResource: "mx_tattoos",
                        position_nui: "left: 100%; top: 100%; transform: translate(-100%, -100%) scale(1);",
                        selected: 0,
                        list: [],
                        Texts_Nui: [],
                        text_button_remove_tattoos: ""
                    }
                },
                methods: {
                    receiveLua: function(t) {
                        if (t && t.data) {
                            var e = t.data;
                            if ("Keys" == e.ui ? this.Pressed_Key(e.mover) : "Interface" == e.ui && (this.NuiOpen = e.NuiOpen, e.NuiOpen && (this.list = e.list, this.position_nui = "left: " + e.x + "; top: " + e.y + "; transform: translate(-" + e.x + ", -" + e.y + ") scale(" + e.scale + ");", this.Texts_Nui = e.Texts_Nui, this.text_button_remove_tattoos = this.Texts_Nui.ButtonRemoveTattoo)), "Info" == e.ui)
                                for (var s = 0; s < this.list.length; s++) this.list[s].has = !1, this.list[s].dlc == e.dlc && (this.list[s].has = e.possui);
                            else if ("Added" == e.ui)
                                for (var i = 0; i < this.list.length; i++) this.list[i].acquired = 0, this.list[i].dlc == e.dlc && (this.list[i].acquired = e.add)
                        }
                    },
                    scrollToClass: function(t) {
                        var e = this.$el.getElementsByClassName(t)[0];
                        e.scrollIntoView()
                    },
                    Pressed_Key: function(t) {
                        var e = !1;
                        "Up" == t ? this.selected < 0 ? this.selected = this.list.length - 1 : this.selected-- : "Down" == t ? this.selected >= this.list.length - 1 ? this.selected = -1 : this.selected++ : "Right" == t && this.selected >= 0 ? (e = !0, this.list[this.selected].current >= this.list[this.selected].qty ? this.list[this.selected].current = 1 : this.list[this.selected].current++) : "Left" == t && this.selected >= 0 ? (e = !0, this.list[this.selected].current <= 1 ? this.list[this.selected].current = this.list[this.selected].qty : this.list[this.selected].current--) : "Enter" != t && "Delete" != t || (e = !0), e && (this.selected >= 0 ? fetch("https://".concat(this.NameResource, "/UpdateTattoo"), {
                            method: "POST",
                            body: JSON.stringify({
                                mx: {
                                    key: t,
                                    dlc: this.list[this.selected].dlc,
                                    current: this.list[this.selected].current
                                }
                            })
                        }) : (fetch("https://".concat(this.NameResource, "/UpdateTattoo"), {
                            method: "POST",
                            body: JSON.stringify({
                                mx: {
                                    key: t,
                                    dlc: "RemoverAll",
                                    current: "RemoverAll"
                                }
                            })
                        }), this.text_button_remove_tattoos = this.Texts_Nui.ButtonRemoveTattoo, this.text_button_remove_tattoos_style = "border: 0.2vh solid rgba(255, 0, 0, 0.3); color: red;", setTimeout(function() {
                            this.text_button_remove_tattoos = this.Texts_Nui.ButtonRemoveTattoo, this.text_button_remove_tattoos_style = "border: 0.2vh solid rgba(255, 0, 0, 0.3); color: red;"
                        }.bind(this), 2500))), this.selected > 0 && this.scrollToClass(this.list[this.selected].title + this.list[this.selected].dlc), console.log(this.selected)
                    }
                },
                created: function() {
                    window.addEventListener("message", this.receiveLua)
                },
                destroyed: function() {
                    window.removeEventListener("message", this.receiveLua)
                }
            }),
            l = n,
            a = (s("034f"), s("2877")),
            c = Object(a["a"])(l, o, r, !1, null, null, null),
            u = c.exports;
        i["a"].config.productionTip = !1, new i["a"]({
            render: function(t) {
                return t(u)
            }
        }).$mount("#app")
    },
    "85ec": function(t, e, s) {}
});