/// <reference path="E:\Project\ExIT\ExIT\Scripts/jquery-2.1.4.js" />

/// <reference path="~/Scripts/angular-animate.min.js" />
/// <reference path="~/Script/toaster/toaster.js" />
var login = ExItApp.controller("QuizCtrl", function ($http, $scope, toaster) {
    $scope.pop = function (message, bool) {
        if (bool === "success") {
            toaster.pop('success', "Thành Công", '<ul>' + message + '</ul>', 5000, 'trustedHtml');
        } else if (bool === "error") {
            toaster.pop('error', "Loi", '<ul>' + message + '</ul>', null, 'trustedHtml');
        } else if (bool === "warning") {
            //toaster.pop('warning', "Thông Báo", '<ul>' + message + '</ul>', null, 'warning');
            toaster.pop('warning', "Thông Báo", message, null, 'warning');
        }
    };

    $scope.submit = function () {
        var number = parseInt($("#numbers").val());
        var val = "";
        for (var i = 0; i < number; i++) {
            for (var j = 1; j < 5; j++) {
                var num=(i * 4)+j;
                var id = "#optionsRadios" + num;
                if ($(id).is(':checked')) {
                    val += $(id).val()+";";
                }
            }

        }
        $http({
            method: "POST",
            url: "/Home/CheckAnswer",
            data: {
                value: val,
                subjectid: $("#subjectid").val(),
                remain: $("#remaintime").val()
            }
        }).success(function (data) {
            if (data==="true") {
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
         
        })
    }
});