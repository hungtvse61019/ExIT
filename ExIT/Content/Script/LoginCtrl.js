/// <reference path="E:\Project\ExIT\ExIT\Scripts/jquery-2.1.4.js" />

/// <reference path="~/Scripts/angular-animate.min.js" />
/// <reference path="~/Script/toaster/toaster.js" />
var login = ExItApp.controller("LoginCtrl", function ($http, $scope, toaster) {
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
    $scope.login = function () {
        $http({
            method: "POST",
            url: "/Home/CheckLogin",
            data: {
                username: $("#username").val(),
                password: $("#password").val()
            }
            
        }).success(function (data) {
            if (data === "true") {
                setTimeout(function () {
                    var links = "http://" + $(location).attr('host') + "/Home/Index";
                    location.assign(links);
                }, 1000);
                $scope.pop("Đăng nhập Thành Công!", "success");
            } else {
                $scope.pop("Sai Tên truy cập hoặc Mật khẩu", "error");
            }
        })
    }

});