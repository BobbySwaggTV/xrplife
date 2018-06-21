const CharacterStarter = new Vue({
    el: "#Character_Start_Modifier",

    data: {

        ///////////////////////////////////////////////////////////////////////////
        // Important Data
        ///////////////////////////////////////////////////////////////////////////
        resource_name: "xrplife",

        ///////////////////////////////////////////////////////////////////////////
        // Booleans
        ///////////////////////////////////////////////////////////////////////////
        showMenu: false,

        ///////////////////////////////////////////////////////////////////////////
        // Base Arrays
        ///////////////////////////////////////////////////////////////////////////
        tabs: ["MODEL", "FACE", "HEAD", "HAIR", "ARMS", "LEGS", "BAGS", "SHOES", "NECK", "ACCESSORIES", "VESTS", "OVERLAYS", "JACKETS", "FINISH"],
        models: [],


        ///////////////////////////////////////////////////////////////////////////
        // Data
        ///////////////////////////////////////////////////////////////////////////

        // Current Main Tab
        tab: "",

        // Selected Model
        model: "",

        ///////////////////////////////////////////////////////////////////////////
        // Component Arrays
        ///////////////////////////////////////////////////////////////////////////
        components: {
            "FACE" : {
                draw : {"min" : 0, "current" : 0, "max" : 0},
                text : {"min" : 0, "current" : 0, "max" : 0}
            },
            "HEAD" : {
                draw : {"min" : 0, "current" : 0, "max" : 0},
                text : {"min" : 0, "current" : 0, "max" : 0}
            },
            "HAIR" : {
                draw : {"min" : 0, "current" : 0, "max" : 0},
                text : {"min" : 0, "current" : 0, "max" : 0}
            },
            "ARMS" : {
                draw : {"min" : 0, "current" : 0, "max" : 0},
                text : {"min" : 0, "current" : 0, "max" : 0}
            },
            "LEGS" : {
                draw : {"min" : 0, "current" : 0, "max" : 0},
                text : {"min" : 0, "current" : 0, "max" : 0}
            },
            "BAGS" : {
                draw : {"min" : 0, "current" : 0, "max" : 0},
                text : {"min" : 0, "current" : 0, "max" : 0}
            },
            "SHOES" : {
                draw : {"min" : 0, "current" : 0, "max" : 0},
                text : {"min" : 0, "current" : 0, "max" : 0}
            },
            "NECK" : {
                draw : {"min" : 0, "current" : 0, "max" : 0},
                text : {"min" : 0, "current" : 0, "max" : 0}
            },
            "ACCESSORIES" : {
                draw : {"min" : 0, "current" : 0, "max" : 0},
                text : {"min" : 0, "current" : 0, "max" : 0}
            },
            "VESTS" : {
                draw : {"min" : 0, "current" : 0, "max" : 0},
                text : {"min" : 0, "current" : 0, "max" : 0}
            },
            "OVERLAYS" : {
                draw : {"min" : 0, "current" : 0, "max" : 0},
                text : {"min" : 0, "current" : 0, "max" : 0}
            },
            "JACKETS" : {
                draw : {"min" : 0, "current" : 0, "max" : 0},
                text : {"min" : 0, "current" : 0, "max" : 0}
            },
        }


    },

    methods: {

        // Opens creator menu
        OpenMenu(models) {
            this.showMenu = true;
            this.models = models;
        },

        // Changes players model
        ChangeModel(model) {
            axios.post("http://" + this.resource_name + "/creatorchangemodel", {
                model: model
            }).then( (response) => {
                console.log(response);
            }).catch( (error) => {
                console.log(error);
            });
        },

        UpdateModelComponents(compData) {
            this.components = {
                "FACE" : {
                    draw : {"min" : 0, "current" : compData["FACE"].draw["current"], "max" : compData["FACE"].draw["max"] - 1},
                    text : {"min" : 0, "current" : compData["FACE"].text["current"], "max" : compData["FACE"].text["max"] - 1}
                },
                "HEAD" : {
                    draw : {"min" : 0, "current" : compData["HEAD"].draw["current"], "max" : compData["HEAD"].draw["max"] - 1},
                    text : {"min" : 0, "current" : compData["HEAD"].text["current"], "max" : compData["HEAD"].text["max"] - 1}
                },
                "HAIR" : {
                    draw : {"min" : 0, "current" : compData["HAIR"].draw["current"], "max" : compData["HAIR"].draw["max"] - 1},
                    text : {"min" : 0, "current" : compData["HAIR"].text["current"], "max" : compData["HAIR"].text["max"] - 1}
                },
                "ARMS" : {
                    draw : {"min" : 0, "current" : compData["ARMS"].draw["current"], "max" : compData["ARMS"].draw["max"] - 1},
                    text : {"min" : 0, "current" : compData["ARMS"].text["current"], "max" : compData["ARMS"].text["max"] - 1}
                },
                "LEGS" : {
                    draw : {"min" : 0, "current" : compData["LEGS"].draw["current"], "max" : compData["LEGS"].draw["max"] - 1},
                    text : {"min" : 0, "current" : compData["LEGS"].text["current"], "max" : compData["LEGS"].text["max"] - 1}
                },
                "BAGS" : {
                    draw : {"min" : 0, "current" : compData["BAGS"].draw["current"], "max" : compData["BAGS"].draw["max"] - 1},
                    text : {"min" : 0, "current" : compData["BAGS"].text["current"], "max" : compData["BAGS"].text["max"] - 1}
                },
                "SHOES" : {
                    draw : {"min" : 0, "current" : compData["SHOES"].draw["current"], "max" : compData["SHOES"].draw["max"] - 1},
                    text : {"min" : 0, "current" : compData["SHOES"].text["current"], "max" : compData["SHOES"].text["max"] - 1}
                },
                "NECK" : {
                    draw : {"min" : 0, "current" : compData["NECK"].draw["current"], "max" : compData["NECK"].draw["max"] - 1},
                    text : {"min" : 0, "current" : compData["NECK"].text["current"], "max" : compData["NECK"].text["max"] - 1}
                },
                "ACCESSORIES" : {
                    draw : {"min" : 0, "current" : compData["ACCESSORIES"].draw["current"], "max" : compData["ACCESSORIES"].draw["max"] - 1},
                    text : {"min" : 0, "current" : compData["ACCESSORIES"].text["current"], "max" : compData["ACCESSORIES"].text["max"] - 1}
                },
                "VESTS" : {
                    draw : {"min" : 0, "current" : compData["VESTS"].draw["current"], "max" : compData["VESTS"].draw["max"] - 1},
                    text : {"min" : 0, "current" : compData["VESTS"].text["current"], "max" : compData["VESTS"].text["max"] - 1}
                },
                "OVERLAYS" : {
                    draw : {"min" : 0, "current" : compData["OVERLAYS"].draw["current"], "max" : compData["OVERLAYS"].draw["max"] - 1},
                    text : {"min" : 0, "current" : compData["OVERLAYS"].text["current"], "max" : compData["OVERLAYS"].text["max"] - 1}
                },
                "JACKETS" : {
                    draw : {"min" : 0, "current" : compData["JACKETS"].draw["current"], "max" : compData["JACKETS"].draw["max"] - 1},
                    text : {"min" : 0, "current" : compData["JACKETS"].text["current"], "max" : compData["JACKETS"].text["max"] - 1}
                },
            }
        },

        // Update drawable textures
        UpdateDrawableTextures(component, textData) {
            console.log(JSON.stringify(textData));

            this.components[component].text["min"] = textData["min"];
            this.components[component].text["current"] = textData["current"];
            this.components[component].text["max"] = textData["max"];

            console.log(JSON.stringify(this.components[component].text));
        },

        // Increase ped drawable
        IncreaseCompDraw(component, amount) {
            var new_value = this.components[component].draw["current"] + amount;
            if (new_value > this.components[component].draw["max"]) {
                new_value = this.components[component].draw["min"];
            };
            this.components[component].draw["current"] = new_value;

            // AXIOS REQUEST
            axios.post("http://" + this.resource_name + "/creatorchangedrawable", {
                component: component,
                drawable: new_value
            }).then( (response) => {
                console.log(response);
            }).catch( (error) => {
                console.log(error);
            });
        },

        // Decrease ped drawable
        DecreaseCompDraw(component, amount) {
            var new_value = this.components[component].draw["current"] - amount;
            if (new_value < this.components[component].draw["min"]) {
                new_value = this.components[component].draw["max"];
            }
            this.components[component].draw["current"] = new_value;

            // AXIOS REQUEST
            axios.post("http://" + this.resource_name + "/creatorchangedrawable", {
                component: component,
                drawable: new_value
            }).then( (response) => {
                console.log(response);
            }).catch( (error) => {
                console.log(error);
            });
        },

        // Increase ped drawable texture
        IncreaseCompText(component, amount) {
            var new_value = this.components[component].text["current"] + amount;
            if (new_value > this.components[component].text["max"]) {
                new_value = this.components[component].text["min"];
            };
            this.components[component].text["current"] = new_value;

            // AXIOS REQUEST
            axios.post("http://" + this.resource_name + "/creatorchangetexture", {
                component: component,
                texture: new_value
            }).then( (response) => {
                console.log(response);
            }).catch( (error) => {
                console.log(error);
            })
        },

        // Decrease ped drawable texture
        DecreaseCompText(component, amount) {
            var new_value = this.components[component].text["current"] - amount;
            if (new_value < this.components[component].text["min"]) {
                new_value = this.components[component].text["max"];
            }
            this.components[component].text["current"] = new_value;

            // AXIOS REQUEST
            axios.post("http://" + this.resource_name + "/creatorchangetexture", {
                component: component,
                texture: new_value
            }).then( (response) => {
                console.log(response);
            }).catch( (error) => {
                console.log(error);
            })
        },

        FinishCharacter() {
            if (this.model != "") {
                this.showMenu = false;
                axios.post("http://" + this.resource_name + "/finishcharactercreator", {
                    model: this.model
                }).then( (response) => {
                    console.log(response);
                }).catch( (error) => {
                    console.log(error);
                })
            }
        },

        RotateCharacter(value) {
            axios.post("http://" + this.resource_name + "/rotatecharacter", {
                amount: value
            }).then( (response) => {
                console.log(response);
            }).catch( (error) => {
                console.log(error);
            })
        },
    },

    watch: {

        "model" : (val, oldVal) => {
            if(val != oldVal) {
                CharacterStarter.ChangeModel(CharacterStarter.model);
            }
        },

    }
})