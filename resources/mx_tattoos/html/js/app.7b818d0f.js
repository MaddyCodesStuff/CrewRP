(function(t) {
    function e(e) {
        for (var i, r, n = e[0], l = e[1], c = e[2], d = 0, h = []; d < n.length; d++) r = n[d], Object.prototype.hasOwnProperty.call(o, r) && o[r] && h.push(o[r][0]), o[r] = 0;
        for (i in l) Object.prototype.hasOwnProperty.call(l, i) && (t[i] = l[i]);
        u && u(e);
        while (h.length) h.shift()();
        return a.push.apply(a, c || []), s()
    }

    function s() {
        for (var t, e = 0; e < a.length; e++) {
            for (var s = a[e], i = !0, n = 1; n < s.length; n++) {
                var l = s[n];
                0 !== o[l] && (i = !1)
            }
            i && (a.splice(e--, 1), t = r(r.s = s[0]))
        }
        return t
    }
    var i = {},
        o = {
            app: 0
        },
        a = [];

    function r(e) {
        if (i[e]) return i[e].exports;
        var s = i[e] = {
            i: e,
            l: !1,
            exports: {}
        };
        return t[e].call(s.exports, s, s.exports, r), s.l = !0, s.exports
    }
    r.m = t, r.c = i, r.d = function(t, e, s) {
        r.o(t, e) || Object.defineProperty(t, e, {
            enumerable: !0,
            get: s
        })
    }, r.r = function(t) {
        "undefined" !== typeof Symbol && Symbol.toStringTag && Object.defineProperty(t, Symbol.toStringTag, {
            value: "Module"
        }), Object.defineProperty(t, "__esModule", {
            value: !0
        })
    }, r.t = function(t, e) {
        if (1 & e && (t = r(t)), 8 & e) return t;
        if (4 & e && "object" === typeof t && t && t.__esModule) return t;
        var s = Object.create(null);
        if (r.r(s), Object.defineProperty(s, "default", {
                enumerable: !0,
                value: t
            }), 2 & e && "string" != typeof t)
            for (var i in t) r.d(s, i, function(e) {
                return t[e]
            }.bind(null, i));
        return s
    }, r.n = function(t) {
        var e = t && t.__esModule ? function() {
            return t["default"]
        } : function() {
            return t
        };
        return r.d(e, "a", e), e
    }, r.o = function(t, e) {
        return Object.prototype.hasOwnProperty.call(t, e)
    }, r.p = "";
    var n = window["webpackJsonp"] = window["webpackJsonp"] || [],
        l = n.push.bind(n);
    n.push = e, n = n.slice();
    for (var c = 0; c < n.length; c++) e(n[c]);
    var u = l;
    a.push([0, "chunk-vendors"]), s()
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
                }, [t._m(0), t._m(1), -1 == t.selecionado ? s("div", {
                    class: {
                        hover2: -1 == t.selecionado
                    },
                    style: t.text_button_remove_tattoos_style,
                    attrs: {
                        id: "RemoverTodasTatuagens"
                    }
                }, [t._v(t._s(t.text_button_remove_tattoos))]) : t._e(), -1 != t.selecionado ? s("div", {
                    attrs: {
                        id: "tatuagens_lista"
                    }
                }, t._l(t.list, (function(e, i) {
                    return s("ul", {
                        key: i
                    }, [s("li", {
                        class: e.title + e.dlc
                    }, [s("div", {
                        class: {
                            hover: t.selecionado == i
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
                    }, [t._v("$" + t._s(e.price))]), s("span", {
                        staticClass: "dlc_total",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "chocolate"
                        },
                        attrs: {
                            id: "dlc_total"
                        }
                    }, [t._v("Qtd: " + t._s(e.qty))]), 1 == e.acquired ? s("span", {
                        staticClass: "dlc_suas_total",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "orange"
                        },
                        attrs: {
                            id: "dlc_suas_total"
                        }
                    }, [t._v("Tatuagem Adquirida!!!")]) : 2 == e.acquired ? s("span", {
                        staticClass: "dlc_suas_total",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "red"
                        },
                        attrs: {
                            id: "dlc_suas_total"
                        }
                    }, [t._v("Tatuagem Removida!!!")]) : t._e(), e.has ? s("span", {
                        staticClass: "dlc_possui",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "red"
                        },
                        attrs: {
                            id: "dlc_possui"
                        }
                    }, [t._v("Já possui.")]) : t._e(), s("input", {
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
            a = [function() {
                var t = this,
                    e = t.$createElement,
                    s = t._self._c || e;
                return s("div", {
                    attrs: {
                        id: "logo_loja"
                    }
                }, [s("img", {
                    attrs: {
                        src: "img/logo.png"
                    }
                })])
            }, function() {
                var t = this,
                    e = t.$createElement,
                    s = t._self._c || e;
                return s("div", {
                    attrs: {
                        id: "informacao_loja"
                    }
                }, [s("p", {
                    attrs: {
                        id: "titulo_principal"
                    }
                }, [t._v("Tatuagens")]), s("p", {
                    attrs: {
                        id: "instrucao"
                    }
                }, [t._v("Utilize as setas do teclado para selecionar as tatuagens")]), s("p", {
                    attrs: {
                        id: "instrucao"
                    }
                }, [t._v("Para comprar uma tatuagem, "), s("span", {
                    staticStyle: {
                        color: "rgba(0, 255, 0, 0.75)",
                        "text-shadow": "1px 2px black"
                    }
                }, [t._v("PRESSIONE ENTER")])]), s("p", {
                    attrs: {
                        id: "instrucao"
                    }
                }, [t._v(" Para remover uma tatuagem, "), s("span", {
                    staticStyle: {
                        color: "rgba(255, 0, 0)",
                        "text-shadow": "1px 2px black"
                    }
                }, [t._v("PRESSIONE DELETE")])])])
            }],
            r = (s("d3b7"), {
                name: "Tattoo_Shop_And_Degrades",
                data: function() {
                    return {
                        NuiOpen: !1,
                        NameResource: "mx_tattoos",
                        position_nui: "transform: scale(1.0);",
                        selecionado: 0,
                        list: [],
                        text_button_remove_tattoos: "Remover todas as tatuagens"
                    }
                },
                methods: {
                    receiveLua: function(t) {
                        if (t && t.data) {
                            var e = t.data;
                            if ("Keys" == e.ui ? this.TeclaPressionada(e.mover) : "Interface" == e.ui && (this.NuiOpen = e.NuiOpen, e.NuiOpen && (this.list = e.list, this.position_nui = "transform: scale(" + e.position_nui + ");")), "Info" == e.ui)
                                for (var s = 0; s < this.list.length; s++) this.list[s].has = !1, this.list[s].dlc == e.dlc && (this.list[s].has = e.possui);
                            else if ("Added" == e.ui)
                                for (var i = 0; i < this.list.length; i++) this.list[i].acquired = 0, this.list[i].dlc == e.dlc && (this.list[i].acquired = e.add)
                        }
                    },
                    scrollToClass: function(t) {
                        var e = this.$el.getElementsByClassName(t)[0];
                        e.scrollIntoView()
                    },
                    TeclaPressionada: function(t) {
                        var e = !1;
                        console.log("PRESS KEY"), "Up" == t ? this.selecionado < 0 ? this.selecionado = this.list.length - 1 : this.selecionado-- : "Down" == t ? this.selecionado >= this.list.length - 1 ? this.selecionado = -1 : this.selecionado++ : "Right" == t && this.selecionado >= 0 ? (e = !0, this.list[this.selecionado].current >= this.list[this.selecionado].qty ? this.list[this.selecionado].current = 1 : this.list[this.selecionado].current++) : "Left" == t && this.selecionado >= 0 ? (e = !0, this.list[this.selecionado].current <= 1 ? this.list[this.selecionado].current = this.list[this.selecionado].qty : this.list[this.selecionado].current--) : "Enter" != t && "Delete" != t || (e = !0), e && (this.selecionado >= 0 ? (this.scrollToClass(this.list[this.selecionado].title + this.list[this.selecionado].dlc), fetch("https://".concat(this.NameResource, "/UpdateTattoo"), {
                            method: "POST",
                            body: JSON.stringify({
                                mx: {
                                    key: t,
                                    dlc: this.list[this.selecionado].dlc,
                                    current: this.list[this.selecionado].current
                                }
                            })
                        })) : (fetch("https://".concat(this.NameResource, "/UpdateTattoo"), {
                            method: "POST",
                            body: JSON.stringify({
                                mx: {
                                    key: t,
                                    dlc: "RemoverAll",
                                    current: "RemoverAll"
                                }
                            })
                        }), this.text_button_remove_tattoos = "As tatuagens foram removidas", this.text_button_remove_tattoos_style = "border: 0.2vh solid rgba(0, 255, 0, 0.3); color: green;", setTimeout(function() {
                            this.text_button_remove_tattoos = "Remover todas as tatuagens", this.text_button_remove_tattoos_style = "border: 0.2vh solid rgba(255, 0, 0, 0.3); color: red;"
                        }.bind(this), 2500)))
                    }
                },
                created: function() {
                    window.addEventListener("message", this.receiveLua)
                },
                destroyed: function() {
                    window.removeEventListener("message", this.receiveLua)
                }
            }),
            n = r,
            l = (s("034f"), s("2877")),
            c = Object(l["a"])(n, o, a, !1, null, null, null),
            u = c.exports;
        i["a"].config.productionTip = !1, new i["a"]({
            render: function(t) {
                return t(u)
            }
        }).$mount("#app")
    },
    "85ec": function(t, e, s) {}
});