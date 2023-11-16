<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
    width: 100%;
    height:100px;
  }
  	a {color:black}
  	a:visited { color:black; }
	a:hover { color:purple; }   

</style>
</head>
<body>
     <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product" colspan="2"><h3>디깅</h3></th>
                                </tr>
                            </thead>
                            <tbody>
                               <c:forEach var="diggingDTO" items="${diggingList}" >
			               			<c:choose>
			               				<c:when test="${empty shopList}">
			               				<tr>
			               					<td colspan="2">조회된 검색결과가 없습니다.</td>
			               				</tr>
			               				</c:when>
			               					<c:otherwise>
        										<thead align="left">
        											<tr>
        												<td>작성자: <span>&emsp;${diggingDTO.writer }</span></td>
        											</tr>
        											<tr>
        												<td>작성일: <span>&emsp;<fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd"/></span></td>
        											</tr>
        										</thead>
        										<tbody height=100 align="left">
        											<th colspan="2">제목: <span>
        												<a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}">
	        												&emsp;${diggingDTO.subject }
        												</a>
        												</span>
       												</th>
        										</tbody>
       										</c:otherwise>								
			               			</c:choose>
			               	  </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns" align="right">
                        <a href="#" class="primary-btn cart-btn">디깅 더보기</a>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product" colspan="2"><h3>상점</h3></th>
                                </tr>
                            </thead>
                            <tbody>
                               <c:forEach var="shopDTO" items="${shopList}">
			               			<c:choose>
			               				<c:when test="${empty shopList}">
			               				<tr>
			               					<td colspan="2">조회된 검색결과가 없습니다.</td>
			               				</tr>
			               				</c:when>
			               					<c:otherwise>
        										<thead  align="left">
        											<tr>
        												<td>작성자: <span>&emsp;${shopDTO.writer }</span></td>
        											</tr>
        											<tr>
        												<td>작성일: <span>&emsp;<fmt:formatDate value="${shopDTO.enrollDt }" pattern="yyyy-MM-dd"/></span></td>
        											</tr>
        										</thead>
        										<tbody  height=100 align="left">
        											<tr>
        												<th colspan="2">제목: <span>
        												<a href="${contextPath }/shop/shopDetail?productCd=${shopDTO.productCd }">
	        												&emsp;${shopDTO.productNm }
        												</a>
        												</span>
        												</th>
        											</tr>
        										</tbody>
       										</c:otherwise>								
			               			</c:choose>
			               	  </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns" align="right">
                        <a href="#" class="primary-btn cart-btn">상점 더보기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
               	
    <!-- Blog Section End -->

</body>
</html>