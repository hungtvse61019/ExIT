/// <reference path="E:\Project\ExIT\ExIT\Scripts/jquery-2.1.4.js" />

/// <reference path="~/Scripts/angular-animate.min.js" />
/// <reference path="~/Script/toaster/toaster.js" />

var register = ExItApp.controller("RegisterCtrl", function ($http, $scope, toaster) {
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

    $scope.validate=function(){
        var error="";
        var name = document.getElementById("name").value;
        if(name==null || name.length==0){
            error+="<li>Vui lòng nhập Họ và Tên</li>";
        }
        var username = document.getElementById("username").value;
        if (username == null || username.length == 0) {
            error += "<li>Vui lòng nhập Tên truy cập</li>";
        } 
        var password = document.getElementById("password").value;
        if (password == null || password.length == 0) {
            error += "<li>Vui lòng nhập Mật khẩu</li>";
        } else {
            var repassword = document.getElementById("repassword").value;
            if (repassword !== password) {
                error += "<li>Mật khẩu xác nhận không giống nhau</li>";
            }
        }
        return error;
    }


    $scope.register = function () {



        var error = $scope.validate();

      
        if (error.length>0) {
            $scope.pop(error, "error");
        } else {

            $http({
                method: "POST",
                url: "/Home/CheckUserName",
                data: {
                    username: $("#username").val(),
                }
            }).success(function (data) {
                if (data === "False") {
                    error += "<li>Tên truy cập đã tồn tại</li>";
                    $scope.pop(error, "error");
                } else {
                    $http({
                        method: "POST",
                        url: "/Home/RegisterAccount",
                        data: {
                            name: $("#name").val(),
                            username: $("#username").val(),
                            password: $("#password").val(),
                            address: $("#address").val(),
                            phone: $("#phone").val(),
                            email: $("#email").val(),
                        }
                    }).success(function (data) {
                        if (data === "true") {
                            setTimeout(function () {
                                var links = "http://" + $(location).attr('host') + "/Home/Index";
                                location.assign(links);
                            }, 1000);
                            $scope.pop("Đăng Ký Tài Khoản Thành Công!", "success");
                        }
                    })
                }
            })

           
        }
       
    }
    
})