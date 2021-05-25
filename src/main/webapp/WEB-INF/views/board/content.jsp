<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>음식점 관리 시스템</title>
    <!-- 폰트어썸 cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- 부트스트랩 css cdn -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- custom css -->
    <link rel="stylesheet" href="/css/main.css">
</head>

<body>

    <div id="wrapper" class="clearfix">

        <!-- header container -->
        <header id="header" class="full- header">
            <div id="header-wrap">
                <div class="container clearfix">
                    <div id="logo">
                        <a href="/index.html" class="standard-logo"><img src="../images/logo.png" alt="Logo"></a>
                    </div>
                </div>
            </div>
        </header>
        <!-- header container end -->

        <!-- main container -->
        <div id="main-container">
            <!-- Page title -->
            <section id="page-title">
                <div class="container clearfix">
                    <h1>No.${restaurant.restaurantNum} 매점 정보 상세보기</h1>
                </div>
            </section>
            <!-- page title end -->

            <!-- page content -->
            <section id="content">
                <div class="content-wrap">
                    <section id="sub-page" class="main-container">
                        <div class="container clearfix">

                            <div class="row">
                                <div class="col-lg-12 table-box">
                                    <table class="table view-table">
                                        <tbody>
                                            <tr>
                                                <th width="11%"># 매점명:</th>
                                                <td>${restaurant.restaurantName}</td>
                                                <th width="11%"># 연락처:</th>
                                                <td>${restaurant.number}</td>
                                                <th width="13%"># 카테고리:</th>
                                                <td>${restaurant.category.foodName}</td>
                                            </tr>
                                            <tr>
                                                <th colspan="6"># 메뉴</th>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <textarea class="content-box" name="menus" cols="30" rows="15"
                                                        disabled>${restaurant.menus}</textarea>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <div class="list-btn">
                                        <a class="btn btn-basic"
                                            href="/board/modify?restaurantNum=${restaurant.restaurantNum}">수정</a>
                                        <a class="btn btn-basic"
                                            href="/board/delete?restaurantNum=${restaurant.restaurantNum}">삭제</a>
                                        <a class="btn btn-basic"
                                            href="/board/list?page=${cri.page}&type=${cri.type}&keyword=${cri.keyword}&amount=${cri.amount}">목록</a>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </section>
                </div>
            </section>
            <!-- page content end -->
        </div>
        <!-- main container end -->

        <!-- footer -->
        <footer id="footer">
            <div id="copyrights">
                COPYRIGHT© TeamPJ03 2021. ALL RIGHTS RESERVED.
            </div>
        </footer>
        <!-- footer end -->
    </div>



    <!-- 부트스트랩 js cdn -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- 제이쿼리 cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
        integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <!-- custom js -->
    <script>
        // url 감추기
        // history.replaceState({}, null, location.pathname);
    </script>

</body>

</html>