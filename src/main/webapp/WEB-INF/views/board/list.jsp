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
                    <h1>입점 업체 리스트</h1>
                </div>
            </section>
            <!-- page title end -->

            <!-- page content -->
            <section id="content">
                <div class="content-wrap">
                    <section id="sub-page" class="main-container">
                        <div class="container clearfix">

                            <form class="search-box margin-clear" name="s-form" action="#" method="post">
                                <input type="hidden" name="search" value="on">
                                <div class="row search-line">
                                    <div class="col-lg-5">
                                        <p>총 <span class="total-count">2</span> 건의 게시물이 등록되어 있습니다.</p>
                                    </div>
                                    <div class="col-lg-2">
                                        <select name="select">
                                            <option value="S_RES_NUM">매점번호</option>
                                            <option value="S_RES_NAME">매점명</option>
                                            <option value="S_TEL_NUM">연락처</option>
                                            <option value="S_ALL">전체</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-5">
                                        <div class="form-group has-feedback">
                                            <input class="form-control" type="text" name="sword"
                                                placeholder="검색어를 입력하세요.">
                                            <input type="hidden" name="Sub_No" value="1">
                                            <span onclick="go_search();"><i
                                                    class="icon-search form-control-feedback fas fa-search"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <div class="row">
                                <div class="col-lg-12 table-box">
                                    <table class="table list-table">
                                        <tbody>
                                            <tr>
                                                <th width="10%">매점번호</th>
                                                <th width="17%">매점명</th>
                                                <th width="20%">연락처</th>
                                                <th width="40%">메뉴</th>
                                                <th width="13%">카테고리</th>
                                            </tr>

                                            <%-- 게시물 개수가 0개일 경우 목록대신 "게시물이 존재하지 않습니다." 출력 --%>
                                            <c:if test="${list.size() <= 0}">
                                                <tr>
                                                    <td class="no-article" colspan="5">게시물이 존재하지 않습니다.</td>
                                                </tr>
                                            </c:if>

                                            <c:if test="${list.size() > 0}">
                                                <%-- 컨트롤러가 가져온 게시글 데이터를 반복하여 출력. --%>
                                                <c:forEach var="restaurant" items="${list}">
                                                    <tr data-num="${restaurant.restaurantNum}">
                                                        <td>${restaurant.restaurantNum}</td>
                                                        <td>${restaurant.restaurantName}</td>
                                                        <td>${restaurant.number}</td>
                                                        <td>
                                                            <div class="text-ellipsis"><a
                                                                    href="/board/content?restaurantNum=${restaurant.restaurantNum}">${restaurant.menus}</a>
                                                            </div>
                                                        </td>
                                                        <td>${restaurant.category.foodName}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                    <div class="list-btn">
                                        <a class="btn btn-basic" href="/board/write">글쓰기</a>
                                    </div>
                                </div>


                            </div>

                            <!-- pagination -->
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center">
                                    <c:if test="${pageMaker.prev}">
                                        <li class="page-item">
                                            <a class="page-link"
                                                href="/board/list?page=${pageMaker.beginPage - 1}">이전</a>
                                        </li>
                                    </c:if>

                                    <c:forEach var="i" begin="${pageMaker.beginPage}" end="${pageMaker.endPage}"
                                        step="1">
                                        <li class="page-item" data-page="${i}"><a class="page-link"
                                                href="/board/list?page=${i}">${i}</a></li>
                                    </c:forEach>

                                    <c:if test="${pageMaker.next}">
                                        <li class="page-item">
                                            <a class="page-link"
                                                href="/board/list?page=${pageMaker.endPage + 1}">다음</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                            <!-- pagination end -->
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



    <!-- 제이쿼리 cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
        integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <!-- 부트스트랩 js cdn -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- custom js -->
    <script>
        // 리스트 게시판 tr 클릭이벤트
        document.querySelector('table.table').addEventListener('click', e => {
            if (!e.target.matches('table.table tr td')) return;
            // console.log('tr clicked!', e.target);
            location.href = '/board/content?restaurantNum=' + e.target.parentNode.dataset.num;
        });

        //현재 위치한 페이지넘버에 클래스 active 를 부여하는 함수 정의
        function appendPageActive(curPageNum) {
            const $ul = document.querySelector('.pagination');
            for (let $li of [...$ul.children]) {
                if ($li.dataset.page === curPageNum) {
                    $li.classList.add('active');
                }
            }
        }
        (function () {
            appendPageActive('${pageMaker.criteria.page}');
        }());
    </script>

</body>

</html>