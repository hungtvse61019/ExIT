$(function () {

    var note = $('#note'),
		ts = new Date(2012, 0, 1),
		newYear = true;

    if ((new Date()) > ts) {
        // The new year is here! Count towards something else.
        // Notice the *1000 at the end - time must be in milliseconds
        ts = (new Date()).getTime() + 15 * 60 * 1000;
        newYear = false;
    }

    $('#countdown').countdown({
        timestamp: ts,
        callback: function (days, hours, minutes, seconds) {

            var message = "";

            message += days + " day" + (days == 1 ? '' : 's') + ", ";
            message += hours + " hour" + (hours == 1 ? '' : 's') + ", ";
            message += minutes + " minute" + (minutes == 1 ? '' : 's') + " and ";
            message += seconds + " second" + (seconds == 1 ? '' : 's') + " <br />";
            var value = minutes+":"+seconds + "";
            $("#remaintime").val(value);
            if (minutes == 0 && seconds == 0) {
                message = "het roi";
                var number = parseInt($("#numbers").val());
                var val = "";
                for (var i = 0; i < number; i++) {
                    for (var j = 1; j < 5; j++) {
                        var num = (i * 4) + j;
                        var id = "#optionsRadios" + num;
                        if ($(id).is(':checked')) {
                            val += $(id).val() + ";";
                        }
                    }

                }
                var remain=
                $.ajax({
                    method: "POST",
                    url: "/Home/CheckAnswer",
                    data: {
                        value: val,
                        subjectid: $("#subjectid").val(),
                        remain: minutes + seconds+""
                    }
                }).done(function (msg) {
                    if (data === "true") {
                        setTimeout(function () {
                            var links = "http://" + $(location).attr('host') + "/Home/ResultQuiz?subjectid=" + $("#subjectid").val();
                            location.assign(links);
                        }, 1000);
                    } else {
                        setTimeout(function () {
                            var links = "http://" + $(location).attr('host') + "/Home/Index";
                            location.assign(links);
                        }, 1000);
                    }
                    alert("Data Saved: " + msg);
                });


            }
            else {
                message += "left to 10 days from now!";
            }

            note.html(message);
        }
    });

    
});
