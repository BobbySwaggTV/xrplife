Interface = {};
Interface.Helpers = {}

Interface.Helpers.FixName = (name) => {
    var newName = ""
    for (var a = 0; a < name.length; a++) {
        if (a == 0) {
            newName = name[a].toUpperCase();
        } else {
            var concat = newName + name[a].toLowerCase();
            newName = concat;
        }
    }
    return newName
};

Interface.Helpers.GetAge = (string) => {
    var today = new Date();
    var birthDate = new Date(string);
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age = age - 1;
    }
    return age;
};