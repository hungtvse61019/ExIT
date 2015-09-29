/// <reference path="E:\Project\ExIT\ExIT\Scripts/jquery-2.1.4.js" />

/// <reference path="~/Scripts/angular-animate.min.js" />
/// <reference path="~/Script/toaster/toaster.js" />

var register = ExItApp.controller("MarkingPraticalCtrl", function ($http, $scope, toaster) {
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



    $scope.marking = function (studentid,subjectid) {
        var error = "";
        
        var markId = "#"+subjectid + "-" + studentid;
        var mark = $(markId).val();
        if (mark < 10) {
            if (mark != null) {
                $http({
                    method: "POST",
                    url: "/Home/Marking",
                    data: {
                        studentid: studentid,
                        subjectid: subjectid,
                        mark: mark
                    }
                }).success(function (data) {
                    if (data === "true") {
                        setTimeout(function () {
                            var links = "http://" + $(location).attr('host') + "/Home/MarkingPratical?subjectid=" + subjectid;
                            location.assign(links);
                        }, 1000);
                        $scope.pop("Cham diem thanh cong!", "success");
                    } else {
                        setTimeout(function () {
                            var links = "http://" + $(location).attr('host') + "/Home/Index";
                            location.assign(links);
                        }, 1000);
                    }
                })
            } else {
                $scope.pop("Vui lòng nhập điểm!", "error");
            }
        } else {
            $scope.pop("Vui lòng nhập điểm nhỏ hơn 10!", "error");
        }
        
        

    }

})