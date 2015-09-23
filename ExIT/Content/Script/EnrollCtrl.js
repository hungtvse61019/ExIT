/// <reference path="E:\Project\ExIT\ExIT\Scripts/jquery-2.1.4.js" />

/// <reference path="~/Scripts/angular-animate.min.js" />
/// <reference path="~/Script/toaster/toaster.js" />
var login = ExItApp.controller("EnrollCtrl", function ($http, $scope, toaster) {
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



    $scope.regis = function () {
        var rankcourse = $("#courserank").val();
        var userrank = $("#userrank").val();
        if (userrank.length===0) {
            $scope.pop("Vui long dang nhap", "error");
        } else {
            var urank=parseInt(userrank);
            var crank = parseInt(rankcourse);

            if (urank<crank) {
                $scope.pop("Vui long chon khoa hoc phu hop voi trinh do cua ban", "error");
            } else {
                $http({
                    method: "POST",
                    url: "/Home/Enroll",
                    data: {
                        couserid: $("#courseid").val()
                    }
                }).success(function (data) {
                    if (data==="True") {
                        $scope.pop("Dang Ky Khoa Hoc Thanh Cong", "success");
                    }
                })
            }
        }
    }
});