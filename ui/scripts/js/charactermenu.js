///////////////////////////////////////////////////////////////////////////
// Vue app handling character menu instance
///////////////////////////////////////////////////////////////////////////
const CharacterMenu = new Vue({
    el: "#Character_Menu",

    data: {

        // Important Data
        resource_name: "xrplife",

        // Booleans
        showMenu: false,
        showCreator: false,
        showLoading: false,
        showError: false,

        // Arrays
        characters: [],
        genders: ["Male","Female"],
        models: [],
        nameRules: [
            (v) => !!v || "Name required",
            (v) => !!v && v.length <= 15 || "Name must be 15 characters or less",
            (v) => !!v && RegExp("^[a-zA-Z]+$").test(v) || "Invalid Characters",
            (v) => !!v && v.length >= 4 || "Name must be 4 - 15 characters"
        ],
        selectRules: [
            (v) => !!v || "Selection required",
        ],
        dobRules: [
            (v) => !!v || "You must choose have a dob"
        ],
        ageRules: [
            (v) => !!v && v >= 18 || "You must be 18+ to create a character",
            (v) => !!v && v <= 65 || "You must be less than 65 to create a character"
        ],

        // Form Data
        first: "",
        last: "",
        sex: "",
        model: "",
        dob: "",
        age: "",

        // Other Data
        errorMessage: ""

    },

    methods: {
        ShowCreator() {
            this.showCreator = !this.showCreator;
            if (this.showCreator == false) {
                this.FormReset();
            }
        },

        SelectCharacter(_index) {
            this.showMenu = false
            axios.post("http://" + this.resource_name + "/selectcharacter", {
                char_data: this.characters[_index]
            }).then( (response) => {
                console.log(response);
            }).catch( (error) => {
                console.log(error);
            })
        },

        DeleteCharacter(_index) {
            this.showLoading = true;
            axios.post("http://" + this.resource_name + "/deletecharacter", {
                char_data: this.characters[_index]
            }).then( (response) => {
                console.log(response);
            }).catch( (error) => {
                console.log(error);
            })
        },

        CreateCharacter() {
            if (this.$refs.creatorForm.validate()) {
                axios.post("http://" + this.resource_name + "/createcharacter", {
                    name: Interface.Helpers.FixName(this.first) + " " + Interface.Helpers.FixName(this.last),
                    dob: this.dob,
                    gender: this.sex,
                    model: this.model
                }).then( (response) => {
                    console.log(response);
                }).catch( (error) => {
                    console.log(error);
                });
                this.showLoading = true;
            };
        },

        FormReset() {
            this.$refs.creatorForm.reset();
        }
    },

    watch: {
        "dob" : (val, oldVal) => {
            if (val != oldVal) {
                CharacterMenu.age = Interface.Helpers.GetAge(CharacterMenu.dob);
            }
        },

        "sex" : (val, oldVal) => {
            if (val != oldVal) {
                axios.post("http://" + CharacterMenu.resource_name + "/updatemodels", {
                    gender: CharacterMenu.sex
                }).then( (response) => {
                    console.log(response);
                }).catch( (error) => {
                    console.log(error);
                })
            }
        }
    }
})