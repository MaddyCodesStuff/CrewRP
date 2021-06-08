(function(t) {
    function e(e) {
        for (var a, n, l = e[0], r = e[1], c = e[2], d = 0, h = []; d < l.length; d++) n = l[d], Object.prototype.hasOwnProperty.call(i, n) && i[n] && h.push(i[n][0]), i[n] = 0;
        for (a in r) Object.prototype.hasOwnProperty.call(r, a) && (t[a] = r[a]);
        u && u(e);
        while (h.length) h.shift()();
        return o.push.apply(o, c || []), s()
    }

    function s() {
        for (var t, e = 0; e < o.length; e++) {
            for (var s = o[e], a = !0, l = 1; l < s.length; l++) {
                var r = s[l];
                0 !== i[r] && (a = !1)
            }
            a && (o.splice(e--, 1), t = n(n.s = s[0]))
        }
        return t
    }
    var a = {},
        i = {
            app: 0
        },
        o = [];

    function n(e) {
        if (a[e]) return a[e].exports;
        var s = a[e] = {
            i: e,
            l: !1,
            exports: {}
        };
        return t[e].call(s.exports, s, s.exports, n), s.l = !0, s.exports
    }
    n.m = t, n.c = a, n.d = function(t, e, s) {
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
            for (var a in t) n.d(s, a, function(e) {
                return t[e]
            }.bind(null, a));
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
        r = l.push.bind(l);
    l.push = e, l = l.slice();
    for (var c = 0; c < l.length; c++) e(l[c]);
    var u = r;
    o.push([0, "chunk-vendors"]), s()
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
        var a = s("2b0e"),
            i = function() {
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
                }, t._l(t.list, (function(e, a) {
                    return s("ul", {
                        key: a
                    }, [s("li", {
                        class: e.titulo + e.dlc
                    }, [s("div", {
                        class: {
                            hover: t.selecionado == a
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
                    }, [t._v(t._s(e.titulo) + ":"), s("span", {
                        attrs: {
                            id: "mpheist3_overlays_info"
                        }
                    }, [t._v(t._s(e.atual))])]), s("span", {
                        staticClass: "dlc_valor",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "green"
                        },
                        attrs: {
                            id: "dlc_valor"
                        }
                    }, [t._v("$" + t._s(e.valor))]), s("span", {
                        staticClass: "dlc_total",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "chocolate"
                        },
                        attrs: {
                            id: "dlc_total"
                        }
                    }, [t._v("Qtd: " + t._s(e.qtd))]), 1 == e.suas ? s("span", {
                        staticClass: "dlc_suas_total",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "orange"
                        },
                        attrs: {
                            id: "dlc_suas_total"
                        }
                    }, [t._v("Tatuagem Adquirida!!!")]) : 2 == e.suas ? s("span", {
                        staticClass: "dlc_suas_total",
                        staticStyle: {
                            "margin-left": "0.5vh",
                            "font-size": "1.5vh",
                            color: "red"
                        },
                        attrs: {
                            id: "dlc_suas_total"
                        }
                    }, [t._v("Tatuagem Removida!!!")]) : t._e(), e.on ? s("span", {
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
                            value: e.atual,
                            expression: "item.atual"
                        }],
                        staticClass: "slider",
                        attrs: {
                            type: "range",
                            min: "1",
                            max: e.qtd,
                            value: "0",
                            id: "mpheist3_overlays"
                        },
                        domProps: {
                            value: e.atual
                        },
                        on: {
                            __r: function(s) {
                                return t.$set(e, "atual", s.target.value)
                            }
                        }
                    })])])])
                })), 0) : t._e()])]) : t._e()
            },
            o = [function() {
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
            n = (s("d3b7"), {
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
                                for (var s = 0; s < this.list.length; s++) this.list[s].on = !1, this.list[s].dlc == e.dlc && (this.list[s].on = e.possui);
                            else if ("Added" == e.ui)
                                for (var a = 0; a < this.list.length; a++) this.list[a].suas = 0, this.list[a].dlc == e.dlc && (this.list[a].suas = e.add)
                        }
                    },
                    scrollToClass: function(t) {
                        var e = this.$el.getElementsByClassName(t)[0];
                        e.scrollIntoView()
                    },
                    TeclaPressionada: function(t) {
                        var e = !1;
                        console.log("PRESS KEY"), "Cima" == t ? this.selecionado < 0 ? this.selecionado = this.list.length - 1 : this.selecionado-- : "Baixo" == t ? this.selecionado >= this.list.length - 1 ? this.selecionado = -1 : this.selecionado++ : "Direita" == t && this.selecionado >= 0 ? (e = !0, this.list[this.selecionado].atual >= this.list[this.selecionado].qtd ? this.list[this.selecionado].atual = 1 : this.list[this.selecionado].atual++) : "Esquerda" == t && this.selecionado >= 0 ? (e = !0, this.list[this.selecionado].atual <= 1 ? this.list[this.selecionado].atual = this.list[this.selecionado].qtd : this.list[this.selecionado].atual--) : "Enter" != t && "Delete" != t || (e = !0), e && (this.selecionado >= 0 ? (this.scrollToClass(this.list[this.selecionado].titulo + this.list[this.selecionado].dlc), fetch("https://".concat(this.NameResource, "/UpdateTattoo"), {
                            method: "POST",
                            body: JSON.stringify({
                                mx: {
                                    tecla: t,
                                    dlc: this.list[this.selecionado].dlc,
                                    atual: this.list[this.selecionado].atual
                                }
                            })
                        })) : (fetch("https://".concat(this.NameResource, "/UpdateTattoo"), {
                            method: "POST",
                            body: JSON.stringify({
                                mx: {
                                    tecla: t,
                                    dlc: "RemoverAll",
                                    atual: "RemoverAll"
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
            l = n,
            r = (s("034f"), s("2877")),
            c = Object(r["a"])(l, i, o, !1, null, null, null),
            u = c.exports;
        a["a"].config.productionTip = !1, new a["a"]({
            render: function(t) {
                return t(u)
            }
        }).$mount("#app")
    },
    "85ec": function(t, e, s) {}
});