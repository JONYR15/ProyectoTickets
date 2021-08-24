var $notificationBtn = $("a[notification-alert]");
var $notificationItems = $("#notification-items");

if (userAuthorized) {
    var connection = new signalR.HubConnectionBuilder().withUrl("~/notificationHub").build();
    var $notificationCounterSpan = $("#notification-counter");
    var notificationCount = 0;

    if (!localStorage.getItem("notification-count")) {
        localStorage.setItem("notification-count", 0);
    } else {
        notificationCount = parseInt(localStorage.getItem("notification-count"));
        $notificationCounterSpan.html(notificationCount);
    }

    if (!localStorage.getItem("notification-items")) {
        localStorage.setItem("notification-items", "");
    } else {
        $notificationItems.html(localStorage.getItem("notification-items"));
    }

    connection.on("ReceiveNotification", function (notification) {
        Snackbar.show({ pos: 'bottom-right', text: notification.message, actionText: 'Ok!', });

        notificationCount = parseInt(localStorage.getItem("notification-count"));
        localStorage.setItem("notification-count", notificationCount + 1);
        notificationCount = parseInt(localStorage.getItem("notification-count"));

        var notificationItems = localStorage.getItem("notification-items");
        localStorage.setItem("notification-items", notificationItems + notification.dropDownElement);
        notificationItems = localStorage.getItem("notification-items");

        $notificationCounterSpan.html(notificationCount);
        $notificationItems.html(notificationItems)
    });

    connection.start().then(function () {
        console.log("Connected to the NotificationHub");
    }).catch(function (err) {
        return console.error(err.toString());
    });
} else {
    console.log("User is not authenticated");
}

$notificationBtn.on("click", (e) => {
    e.preventDefault();

    if (!localStorage.getItem("notification-count")) {
        localStorage.setItem("notification-count", 0);
    } else {
        localStorage.setItem("notification-count", 0);
        $notificationCounterSpan.html(0);
    }
});

$("#remove-notification-items").on("click", (e) => {
    e.preventDefault();

    if (localStorage.getItem("notification-items")) {
        localStorage.setItem("notification-items", "");
        $notificationItems.html("");
    }
});