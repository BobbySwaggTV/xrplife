const Notification = new Vue({
    el: "#Notification_System",

    methods: {
        CustomURLIconNotification(title, body, time, url, showBar, pos) {
            this.$snotify.simple(body, title, {
                timeout: time,
                showProgressBar: showBar,
                closeOnClick: false,
                position: pos,
                icon: url
            })
        },

        CustomIconNotification(title, body, time, iconFile, showBar, pos) {
            this.$snotify.simple(body, title, {
                timeout: time,
                showProgressBar: showBar,
                closeOnClick: false,
                position: pos,
                icon: "../../images/notifications/" + iconFile
            })
        },

        SuccessNotification(title, body, time, showBar, pos) {
            this.$snotify.success(body, title, {
                timeout: time,
                showProgressBar: showBar,
                closeOnClick: false,
                position: pos
            })
        },

        ErrorNotification(title, body, time, showBar, pos) {
            this.$snotify.error(body, title, {
                timeout: time,
                showProgressBar: showBar,
                closeOnClick: false,
                position: pos
            })
        },

        WarningNotification(title, body, time, showBar, pos) {
            this.$snotify.warning(body, title, {
                timeout: time,
                showProgressBar: showBar,
                closeOnClick: false,
                position: pos
            })
        },

        InfoNotification(title, body, time, showBar, pos) {
            this.$snotify.info(body, title, {
                timeout: time,
                showProgressBar: showBar,
                closeOnClick: false,
                position: pos
            })
        }
    }
})