<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        .container-lg {
            width: 500px;
            margin: 0 auto; /* Center the container horizontally */
            margin-top: 100px; /* Add top margin for spacing */
        }

        .btn-success {
            background-color: #00C73C;
            border-color: #00C73C;
        }

        .btn-success:hover {
            background-color: #00A237;
            border-color: #00A237;
        }

        .form-label {
            margin-bottom: 0.5rem;
            font-weight: bold;
        }

        .mb-3 {
            margin-bottom: 1rem;
        }

        #checkIdBtn, #checkNickNameBtn, #checkEmailBtn {
            margin-top: 0.5rem;
        }

        /* Custom styles for the bordered container */
        .registration-container {
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            padding: 1rem;
            background-color: white;
            width: 600px; /* Adjust the width as desired */
            margin: 0 auto;
        }

        .layout {
            display: flex;
            flex: 1 1 auto;
            flex-wrap: nowrap;
            min-width: 0;
        }

        .shadow {
            box-shadow: 0 3px 30px 0 rgba(0, 0, 0, .16) !important;
        }

        .myPageOption {
            flex-basis: 15%;
            max-width: 15%;
            margin-right: 12px;
        }

        .myInfo {
            flex-basis: 41.6%;
            max-width: 41.6%;
            margin-left: 12px;
            margin-bottom: 2rem;
        }

        .hover {
            padding: 5px;
            border-radius: 8px;
        }

        .hover:hover {
            background-color: #FFC107;
        }

        .myPageMenu {
            text-decoration: none;
            color: black;
            margin-bottom: 8px;
        }
    </style>
</head>
<body>

<my:navBar></my:navBar>

<my:alert></my:alert>

<div class="container" style="margin-top: 100px;">
    <div class="layout" style="justify-content: center;">
        <div class="myPageOption">
            <div class="layout shadow" style="padding: 11px 5px 3px 5px; flex-direction: column">
                <a class="myPageMenu" href="/totalMyPage">
                    <span class="hover">회원 정보 수정</span>
                </a>
                <c:if test="${myMemberType == 'artist'}">
                    <a class="myPageMenu" href="/myRequest">
                        <span class="hover">의뢰 관리</span>
                    </a>
                </c:if>
                <a class="myPageMenu" href="/shoppingList">
                    <span class="hover">주문 내역</span>
                </a>
            </div>
        </div>

        <div class="row justify-content-center myInfo">
            <div class="shadow" style="height: 760px;">
                <h1>프로필</h1>
                <!-- .mb-3*4>label+input -->
                <div class="mb-3">
                    <label class="form-label" for="">아이디</label>
                    <input class="form-control" type="text" value="${member.userId }" name="userId" readonly/>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="">닉네임</label>
                    <input class="form-control" type="text" value="${member.nickName }" name="nickName" readonly/>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="">생년월일</label>
                    <input class="form-control" type="text" value="${member.birth }" name="birth" readonly/>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="">주소</label>
                    <input class="form-control" type="text" value="${member.address }" name="address" readonly/>
                    <input class="form-control" type="text" value="${member.addressDetail }" name="addressDetail"
                           readonly/>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="">전화번호</label>
                    <input class="form-control" type="text" value="${member.phone }" name="phone" readonly/>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="">이메일</label>
                    <input class="form-control" type="text" value="${member.email }" name="email" readonly/>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="">소개</label>
                    <input class="form-control" type="text" value="${member.introduce }" name="introduce" readonly/>
                </div>
                <a class="btn btn-dark" href="/modify?userId=${member.userId }">수정</a>
                <button type="button" data-bs-toggle="modal" class="btn btn-danger" data-bs-target="#confirmModal">
                    회원탈퇴
                </button>
            </div>
        </div>
    </div>
</div>
</div>
<%-- <div class="d-none">
  <form id="removeForm" action="/remove" method="post">
     <input type="text" name="id" value="${member.id }" />
  </form>
</div> --%>

<!-- 탈퇴 확인Modal -->
<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">탈퇴 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="removeForm" action="/remove" method="post">
                    회원탈퇴 하시겠습니까?
                    <input type="hidden" name="userId" value="${member.userId }"/>
                    <input type="hidden" name="nickName" value="${member.nickName }"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
                <button type="submit" form="removeForm" class="btn btn-danger">예</button>
            </div>
        </div>
    </div>
</div>

<sec:authorize access="isAuthenticated()">
    <my:chatBtn></my:chatBtn>
    <script src="/js/chat.js" charset="UTF-8"></script>
</sec:authorize>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>