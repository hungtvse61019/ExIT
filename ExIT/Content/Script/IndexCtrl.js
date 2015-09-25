/// <reference path="E:\Project\ExIT\ExIT\Scripts/jquery-2.1.4.js" />

/// <reference path="~/Scripts/angular-animate.min.js" />
/// <reference path="~/Script/toaster/toaster.js" />
var login = ExItApp.controller("IndexCtrl", function ($http, $scope, toaster) {
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
   
    $scope.load = function () {
        $scope.courses = [];
        $scope.teachers = []
        $http({
            method: "POST",
            url: "/Home/LoadCourseIndex"
        }).success(function (data) {
            $scope.courses = data;
            $http({
                method: "POST",
                url: "/Home/LoadTeacherIndex"
            }).success(function (data) {
                $scope.teachers = data;
                var username = $("#username").val();
                var role = $("#role").val();
                if (username != null) {
                    if (role == "1") {
                        $scope.subjects = []
                        $http({
                            method: "POST",
                            url: "/Home/LoadAllPracticals",
                            data: {
                                username: $("#username").val(),
                            }
                        }).success(function (data) {
                            $scope.subjects = data;

                        })
                    }
                    
                }
               
            })
        })
    }
    $scope.load();
});