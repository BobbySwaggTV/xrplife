const ATMMenu = new Vue({
    el: "#ATM_Menu",

    data: {
        
        // Important Data
        resource_name: "xrplife",

        // Booleans
        showMenu: false,
        loading: false,

        // Rules
        inputRules: [
            (v) => !!v || "Input invalid",
            (v) => !!v && RegExp("^(0|[1-9][0-9]*)$").test(v) || "Not a number",
            (v) => !!v && v >= 1 || "Input must be greater than 0",
            (v) => !!v && v[0] != 0 || "Input must not begin with a 0"
        ],

        // Character Information
        character_name: "",
        account: 0,

        // Inputs
        depositFormValid: false,
        withdrawFormValid: false,
        depositAmount: 0,
        withdrawAmount: 0,
    },

    methods: {
        OpenMenu(name, balance) {
            this.showMenu = true;
            this.character_name = name;
            this.account = balance
        },

        CloseMenu() {
            this.showMenu = false;
            this.$refs.depositForm.reset();
            this.$refs.withdrawForm.reset();
            axios.post("http://" + this.resource_name + "/closeatm", {
            }).then( (response) => {
                console.log(response);
            }).catch( (error) => {
                console.log(error);
            })
        },

        DepositMoney() {
            if (this.depositFormValid) {
                this.loading = true;
                axios.post("http://" + this.resource_name + "/depositatm", {
                    amount: this.depositAmount
                }).then( (response) => {
                    console.log(response);
                }).catch( (error) => {
                    console.log(error);
                })
                this.$refs.depositForm.reset();
            }
        },

        WithdrawMoney() {
            if (this.withdrawFormValid) {
                this.loading = true;
                axios.post("http://" + this.resource_name + "/withdrawatm", {
                    amount: this.withdrawAmount
                }).then( (response) => {
                    console.log(response);
                }).catch( (error) => {
                    console.log(error);
                })
                this.$refs.withdrawForm.reset();
            }
        },

        ChangeMenu(menu) {
            this.menuState = menu;
        },
    }
})