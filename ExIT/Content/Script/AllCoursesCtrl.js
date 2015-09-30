/// <reference path="E:\Project\ExIT\ExIT\Scripts/jquery-2.1.4.js" />

/// <reference path="~/Scripts/angular-animate.min.js" />
/// <reference path="~/Script/toaster/toaster.js" />

ExItApp.filter('offset', function () {
    return function (input, start) {
        if (typeof input !== "undefined") {
            start = parseInt(start, 10);
            return input.slice(start);
        }
    };
});
var login = ExItApp.controller("AllCourses", function ($http, $scope, toaster) {

    $scope.itemsPerPage = 6;
    $scope.currentPage = 0;
    $scope.currentPageItem = 0;


    $scope.Step = function () {
        if (errormessage.length > 0) {
            $scope.pop(errormessage, "error");
        }
    }

    //Page Count
    $scope.pageCount = function () {
        var name = "#resultfiltertemp";
        var results = parseInt($(name).text());
        return Math.ceil((results) / $scope.itemsPerPage) - 1;
    };


    //Prev Page
    $scope.prevPage = function () {
        if ($scope.currentPage > 0) {
            $scope.currentPage--;
        }
    };
    $scope.rangeItem = function () {

        var rangeSize = 5;
        var ret = [];
        var start;

        start = $scope.currentPageItem;
        if ($scope.pageCount() > 0) {
            if ($scope.pageCount() < rangeSize) {
                for (var i = 0; i <= $scope.pageCount() ; i++) {
                    if (i !== undefined) {
                        ret.push(i);
                    }
                }
            } else {
                if (start > $scope.pageCount() - rangeSize) {
                    start = $scope.pageCount() - rangeSize + 1;
                }
                for (var j = start; j < start + rangeSize; j++) {
                    if (j !== undefined) {
                        ret.push(j);
                    }
                }
            }
        }
        return ret;
    };

    //Prev Page Item Page
    $scope.prevPageItem = function () {
        if ($scope.currentPageItem > 0) {
            $scope.currentPageItem--;
        }
    };

    //Disable Prev Page Item
    $scope.prevPageDisabledItem = function () {
        return $scope.currentPageItem == 0 ? "disabled" : "";
    };

    $scope.prevPageDisabled = function () {
        return $scope.currentPage == 0 ? "disabled" : "";
    };

    $scope.nextPage = function () {
        if ($scope.currentPage < $scope.pageCount()) {
            $scope.currentPage++;
        }
    };
    //Next Page Item
    $scope.nextPageItem = function () {
        if ($scope.currentPageItem < $scope.pageCount()) {
            $scope.currentPageItem++;
        }
    };

    //Disabled Next Page
    $scope.nextPageDisabledItem = function () {
        return $scope.currentPageItem == $scope.pageCount() ? "disabled" : "";
    };

    $scope.nextPageDisabled = function () {
        return $scope.currentPage == $scope.pageCount() ? "disabled" : "";
    };


    $scope.setPage = function (n) {
        $scope.currentPage = n;
    };
    $scope.setPageItem = function (n) {
        $scope.currentPageItem = n;
    };

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
        $http({
            method: "POST",
            url: "/Home/LoadAllCourses"
        }).success(function (data) {
            $scope.courses = data;

            //var items = $("#top-courses-panel .panel-body .course-box");
            //var numItems = items.length;
            //var perPage = 3;
            //// only show the first 2 (or "first per_page") items initially
            //items.slice(perPage).hide();
            //// now setup pagination
            //$("#pagination").pagination({
            //    items: numItems,
            //    itemsOnPage: perPage,
            //    cssStyle: "compact-theme",
            //    onPageClick: function (pageNumber) { // this is where the magic happens
            //        // someone changed page, lets hide/show trs appropriately
            //        var showFrom = perPage * (pageNumber - 1);
            //        var showTo = showFrom + perPage;
            //        items.hide() // first hide everything, then show for the new page
            //                .slice(showFrom, showTo).show();
            //    }
            //});
        })
    }
    $scope.load();
    
});