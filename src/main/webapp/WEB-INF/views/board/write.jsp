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
                    <h1>신규 매점 등록</h1>
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
                                    <form action="/board/write" method="POST">
                                        <input type="hidden" name="page" value="${cri.page}">
                                        <input type="hidden" name="amount" value="${cri.amount}">
                                        <input type="hidden" name="type" value="${cri.type}">
                                        <input type="hidden" name="keyword" value="${cri.keyword}">
                                        <table class="table write-table">
                                            <tbody>
                                                <tr>
                                                    <th width="11%"><label for="restaurantName"># 매점명:</label></th>
                                                    <td><input type="text" name="restaurantName"
                                                            placeholder="한글 6자리까지 입력가능"></td>
                                                    <th width="11%"><label for="number"># 연락처:</label></th>
                                                    <td><input type="text" name="number" placeholder="'-' 를 포함해서 입력">
                                                    </td>
                                                    <th width="13%"><label for="category"># 카테고리:</label></th>
                                                    <td>
                                                        <select class="select-box" name="category">
                                                            <option value="">--카테고리 선택--</option>
                                                            <option value="KOREAN_FOOD">한식</option>
                                                            <option value="CHINA_FOOD">중식</option>
                                                            <option value="ITALY_FOOD">이태리식</option>
                                                            <option value="JAPAN_FOOD">일식</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="6"><label for="menus"># 메뉴</label></th>
                                                </tr>
                                                <tr>
                                                    <td colspan="6"><textarea name="menus" cols="30" rows="15"
                                                            placeholder="메뉴를 입력해 주세요."></textarea></td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <div class="list-btn">
                                            <button type="submit" class="btn btn-basic">등록</button>
                                            <a class="btn btn-basic" href="/board/list">취소</a>
                                        </div>
                                    </form>
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