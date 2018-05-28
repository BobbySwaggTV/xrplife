///////////////////////////////////////////////////////////////////////////
// Waits for events from the players client
///////////////////////////////////////////////////////////////////////////
document.onreadystatechange = () => {
    if (document.readyState === "complete") {
        window.addEventListener('message', function(event) {

            ///////////////////////////////////////////////////////////////////////////
            // Notifications
            ///////////////////////////////////////////////////////////////////////////
            if (event.data.type == "notification_customurlicon") {

                Notification.CustomURLIconNotification(event.data.title, event.data.body, event.data.time, event.data.url, event.data.showBar, event.data.pos);

            } else if (event.data.type == "notification_customicon") {

                Notification.CustomIconNotification(event.data.title, event.data.body, event.data.time, event.data.iconFile, event.data.showBar, event.data.pos);

            } else if (event.data.type == "notification_success") {

                Notification.SuccessNotification(event.data.title, event.data.body, event.data.time, event.data.showBar, event.data.pos);

            } else if (event.data.type == "notification_error") {

                Notification.ErrorNotification(event.data.title, event.data.body, event.data.time, event.data.showBar, event.data.pos);

            } else if (event.data.type == "notification_warning") {
                
                Notification.WarningNotification(event.data.title, event.data.body, event.data.time, event.data.showBar, event.data.pos);

            } else if (event.data.type == "notification_info") {
                
                Notification.InfoNotification(event.data.title, event.data.body, event.data.time, event.data.showBar, event.data.pos);

            }
            
            ///////////////////////////////////////////////////////////////////////////
            // Character Menu
            ///////////////////////////////////////////////////////////////////////////
            if (event.data.type == "enable_character_menu") {

                var new_chars = SortCharacters(event.data.chars);
                CharacterMenu.characters = new_chars;
                CharacterMenu.showMenu = true;

            } else if (event.data.type == "update_character_menu_models") {

                CharacterMenu.models = event.data.ped_models;

            } else if (event.data.type == "create_character_menu_callback") {

                if  (event.data.status) {

                    var new_chars = SortCharacters(event.data.chars)
                    CharacterMenu.showLoading = false;
                    CharacterMenu.showError = false;
                    CharacterMenu.errorMessage = "";
                    CharacterMenu.ShowCreator();
                    CharacterMenu.characters = new_chars;

                } else {

                    CharacterMenu.showLoading = false;
                    CharacterMenu.showError = true;
                    CharacterMenu.errorMessage = event.data.error;

                }
            } else if (event.data.type == "delete_character_menu_callback") {

                var new_chars = SortCharacters(event.data.chars)
                CharacterMenu.showLoading = false;
                CharacterMenu.characters = new_chars;
                CharacterMenu.showLoading = false;

            }

            ///////////////////////////////////////////////////////////////////////////
            // ATM Menu
            ///////////////////////////////////////////////////////////////////////////
            if (event.data.type == "open_atm_menu") {

                ATMMenu.OpenMenu(event.data.name, event.data.balance);

            } else if (event.data.type == "update_atm_menu") {

                ATMMenu.UpdateMenu(event.data.status, event.data.message, event.data.balance);

            }

            ///////////////////////////////////////////////////////////////////////////
            // Admin Menu
            ///////////////////////////////////////////////////////////////////////////
            if (event.data.type == "open_admin_menu") {

                AdminMenu.OpenMenu(event.data.name, event.data.rank, event.data.perms, event.data.players);
            
            } else if (event.data.type == "pass_recieved_admin_message") {

                AdminMenu.RecieveChatMessage(event.data.message_data, event.data.perms);

            } else if (event.data.type == "pass_admin_error") {

                AdminMenu.ThrowError(event.data.error);

            }

        });
    }
}

///////////////////////////////////////////////////////////////////////////
// Sorts characters recieved from client and sorts to correct format
///////////////////////////////////////////////////////////////////////////
function SortCharacters(char_list) {
    var new_chars = [];
    for (var a = 0; a < char_list.length; a++) {
        new_chars.push({
            id: char_list[a].id,
            name: char_list[a].name,
            dob: char_list[a].dob,
            age: Interface.Helpers.GetAge(char_list[a].dob),
            gender: char_list[a].gender,
            model: char_list[a].model,
            bank: char_list[a].bank
        })
    }
    return new_chars;
}