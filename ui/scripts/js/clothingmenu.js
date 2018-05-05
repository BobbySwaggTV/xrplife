const ClothingMenu = new Vue({
    el: "#Clothing_Menu",

    data: {
        showMenu: false,
        currentMenu: "clothing",

        // Clothing
        clothing: [],

        // Props
        props: [],
    },

    methods: {

        // Change Menu
        ChangeMenu(menu) {
            if (this.currentMenu != menu) {
                this.currentMenu = menu;
            }
        },

        // Change Clothing
        ChangeClothing(draw, text) {

        },

        // Change Prop
        ChangeProp(draw, text) {

        }

    },

    watch: {

    }
})