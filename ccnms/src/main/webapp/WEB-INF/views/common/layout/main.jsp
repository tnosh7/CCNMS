<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.userId}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  	a:link {color:black}
  	a:visited { color:black; }
	a:hover { color:black; }   
	a:active {color:purple;}
   h1 { margin: 50px 0px; }
   .headDigging a{
		font-family: 'Black Han Sans', sans-serif;
   		background-color:transparent;
   		color:white;
   		text-align:center;
   		font-size: x-large;
   }
    table {
    width: 100%;
    height: 200px;
  }
</style>
</head>
<script>

	$().ready(function(){
		
		$("#onePageViewCnt").val("${onePageViewCnt}");
		$("#sort").val("${sort}");
	});
	
	function getDiggingList() {
		var url = "${contextPath }/"
		    url += "?onePageViewCnt=" + $("#onePageViewCnt").val();
		location.href = url;
	}
	
	function updateThumb(diggingId) {
		if ("${sessionId == null}" == "true") {
			Swal.fire({
				  icon: 'info',
				  title: '로그인 후에 이용가능합니다.',
				  footer: '<a href="${contextPath }/user/loginUser">로그인 페이지로 이동하기</a>'
				})
		}
		else {
			
			$.ajax({
				url: "${contextPath}/updateThumbsUp",
				type:"get",
				data: {
					"diggingId" : diggingId
				},
				success: function(data){
					$("#updateThumbs"+diggingId).html(data);
				}
			})
		}
	}
	function show(){
		$("[name='dropdown-menu']").show();
	}
	function hide(){
		 $("[name='dropdown-menu']").hide();
	}
</script>
<body>
    <section class="categories">
        <div class="container">
            <div class="row">
               <div class="categories__slider owl-carousel">
               	<c:forEach var="headDiggingDTO" items="${headList }">
                    <div class="col-lg-12 col-md-12">
                    <c:choose>
                    	<c:when test="${headDiggingDTO.file eq ''}">
	                        <div class="categories__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/banner/notice.PNG">
                    	</c:when>
                    	<c:otherwise>
	                        <div class="categories__item set-bg" data-setbg="${contextPath }/thumbnails?file=${headDiggingDTO.file}">
                    	</c:otherwise>
                    </c:choose>
                            <span class="headDigging">${headDiggingDTO.writer}
                        	</span>
                            <br><br><br><br><br><br><br><br>
                             <span class="headDigging">
                            <a href="${contextPath }/digging/diggingDetail?diggingId=${headDiggingDTO.diggingId}">
                             ${headDiggingDTO.subject }</a></span>
                            <input type="hidden" value="${headDiggingDTO.diggingId }">
                        </div>
                    </div>
               	</c:forEach>
                </div>
            </div>
        </div>
    </section>
    <section class="section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="featured__controls">
                    	<hr>
                    	
                    	<ul align="right">
						    <li class="nav-item dropdown">
						    <a class="nav-link dropdown-toggle show" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true" onmouseenter="show()" onclick="hide()">정 렬</a>
						    <div class="dropdown-menu" name="dropdown-menu" data-popper-placement="bottom-start" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 41px);">
						      <a class="dropdown-item" href="${contextPath }/?sort=readCnt">인기많은순</a>
						      <a class="dropdown-item" href="${contextPath }/?sort=thumbsUp">추천순</a>
						      <a class="dropdown-item" href="${contextPath }/?sort=recent">최신순</a>
						    </div>
						  </li>
                    	</ul>
                    	<ul> 
	                   		<li> 게시물 보기
								<select id="onePageViewCnt" onchange="getDiggingList()" >
									<option value="10">10</option>
									<option value="5">5</option>
								</select>
	                   		</li>
                    	</ul>
                	</div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="digging__table" id="list-content">
                      <c:forEach var="diggingDTO" items="${diggingList }">
                  		<input type="hidden" id="diggingId"  value="${diggingDTO.userList}"/>
                        <table style="width:100%">
                           	<thead height="50">
                       			<tr style="background:whitesmoke">
                       				<th align="left" colspan="4" style="width:70%">
	                       				<c:choose>
	                       					<c:when test="${diggingDTO.profile eq null}">
	                       						<a href="${contextPath }/ranking/otherUserInfo?userId=${diggingDTO.userId}"><img src="${contextPath}/resources/bootstrap/img/icon/profile.jpg" width="40" height="40">&emsp;${diggingDTO.userId }&emsp;${diggingDTO.likePoint }</a>
	                       					</c:when>
	                       					<c:otherwise>
			                       				<img src="${contextPath }/digging/thumbnails?file=${diggingDTO.profile}"  width="40" height="40">&emsp;
			                       				<a href="${contextPath }/ranking/otherUserInfo?userId=${diggingDTO.userId }">
			                       					${diggingDTO.userId }&emsp;${diggingDTO.likePoint }
			                       				</a>
	                       					</c:otherwise>
	                       				</c:choose>
                     					<input type="hidden" id="writer" value="${diggingDTO.userId }"/>
                     					</th>
                       				<th align="right"><fmt:formatDate value="${diggingDTO.enrollDT }" pattern="yyyy-MM-dd" /></th>
                       			</tr>
                      		</thead>
                            <tbody style="height:40">
                                <tr>
                                	<th align="left">
                               			<c:set var="startDiggingIdx" value="${startDiggingIdx = startDiggingIdx + 1 }"/>
	                       				<span>${startDiggingIdx }. </span>
                                	</th>
									<th colspan="3"><a href="${contextPath }/digging/diggingDetail?diggingId=${diggingDTO.diggingId}"><h5>${diggingDTO.subject }</h5></a></th>
	                                   <c:choose>
	                                   	<c:when test="${diggingDTO.file eq ''}">
	                                   	</c:when>
	                                   	<c:otherwise>
		                                   <td class="shoping__cart__item">
		                                       <img src="${contextPath }/digging/thumbnails?file=${diggingDTO.file}" width="200" height="150" alt="ㅇㅇㅇㅇ" >
		                                   </td>
	                                   	</c:otherwise>
	                                   </c:choose>
                                </tr>
                            </tbody>
                            <tfoot>
							  	<tr><td colspan="4" align="left">
								    &emsp;<a href="javascript:updateThumb(${diggingDTO.diggingId })" class="card-link">
								    	<img alt="" src="${contextPath }/resources/bootstrap/img/thumbs.PNG" width="40" height="40" id="thumbsUp" />
								   		<span id="updateThumbs${diggingDTO.diggingId }">${diggingDTO.thumbsUp }</span></a>
								    &emsp;&emsp;<img alt="" src="${contextPath }/resources/bootstrap/img/comment.png"/> ${diggingDTO.replyCnt}
								    &emsp;&emsp;<img alt="" src="${contextPath }/resources/bootstrap/img/show.png"/> ${diggingDTO.readCnt }
							   		<input type="hidden" value="${diggingDTO.diggingId }"/>
							   		<input type="hidden" name="sort"/>
							  		</td>
							  	</tr>
							</tfoot>     
                        </table>
                        <hr>
                       </c:forEach>
                    </div>
                </div>
            </div>
   		<br>
    <div class="product__pagination blog__pagination" align="center">
   	<c:choose>
   		<c:when test="${sort eq null}">
	        <c:if test="${startPage > 10 }">
		        <a href="${contextPath }/?currentPageNumber=${startPage - 10}&onePageViewCnt=${onePageViewCnt}">이전</a>
	        </c:if>
	        <c:forEach var="i" begin="${startPage }" end="${endPage + 1 }">
	       		<a href="${contextPath }/?currentPageNumber=${i}&onePageViewCnt=${onePageViewCnt}">${i }</a>
	        </c:forEach>
	        <c:if test="${endPage != allPageCnt && endPage >= 10 }">
	        	<a href="${contextPath }/?currentPageNumber=${startPage + 10}&onePageViewCnt=${onePageViewCnt}">다음</a>
	        </c:if>
   		</c:when>
   		<c:otherwise>
	        <c:if test="${startPage > 10 }">
		        <a href="${contextPath }/?currentPageNumber=${startPage - 10}&onePageViewCnt=${onePageViewCnt}&sort=${sort}">이전</a>
	        </c:if>
	        <c:forEach var="i" begin="${startPage }" end="${endPage + 1 }">
	       		<a href="${contextPath }/?currentPageNumber=${i}&onePageViewCnt=${onePageViewCnt}&sort=${sort}">${i }</a>
	        </c:forEach>
	        <c:if test="${endPage != allPageCnt && endPage >= 10 }">
	        	<a href="${contextPath }/?currentPageNumber=${startPage + 10}&onePageViewCnt=${onePageViewCnt}&sort=${sort}">다음</a>
	        </c:if>
   		</c:otherwise>
   	</c:choose>	
     </div>
      <section class="latest-product spad">
        <div class="container">
         	<div align="center">
          		<img alt="" src="${contextPath }/resources/bootstrap/img/banner/weekendOffer.jpg">
          	</div>
            <div class="row">
                 <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                     <br><br><br><br>
                    <span>
                    	<h4><img alt="상점에러" src="${contextPath }/resources/bootstrap/img/shop.png">&ensp;최신 상품</h4>
                    </span>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                            	<table>
		                     	   <c:forEach var="recentShopDTO" items="${recentShopList }" varStatus="i"> 
		                     	 <tbody>
		                     		<tr>
		                     			<td>
		                     				${i.count }.&ensp;	
		                     				<img src="${contextPath }/digging/thumbnails?file=${recentShopDTO.productFile}" alt=""  width="40" height="60">
		                   				</td>
		                     			<td>
		                     				<a href="${contextPath }/shop/shopDetail?productCd=${recentShopDTO.productCd }"  class="latest-product__item">
				                     			<strong>${recentShopDTO.productNm}</strong>
		                     				</a>
		                     			</td>
		                     		</tr>
		                     	 </tbody>
		                         </c:forEach>
	                     	</table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                     <br><br><br><br>
                         <h4><img alt="상점에러" src="${contextPath }/resources/bootstrap/img/shop.png">&ensp;인기 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                         <table>
                   	   <c:forEach var="populerShopDTO" items="${populerShopList }" varStatus="i"> 
                     	 <tbody>
                     		<tr>
                     			<td>
                     				${i.count }.&ensp;	
                     				<img src="${contextPath }/digging/thumbnails?file=${populerShopDTO.productFile}" alt=""  width="40" height="60">
                   				</td>
                     			<td>
                   				 	<a href="${contextPath }/shop/shopDetail?productCd=${populerShopDTO.productCd }">
                                        <strong>${populerShopDTO.productNm}</strong>
                    				</a>
                 				</td>
                     		</tr>
                     	 </tbody>
                         </c:forEach>
                     	</table>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="col-lg-4 col-md-6">
                    <div class="latest-product__text">
                     <br><br><br><br>
                        <h4><img alt="상점에러" src="${contextPath }/resources/bootstrap/img/shop.png">&ensp;교환 상품</h4>
                        <div class="latest-product__slider owl-carousel">
                            <div class="latest-prdouct__slider__item">
                            <table>
                     	 <c:forEach var="exchangeShopDTO" items="${exchangeShopList }" varStatus="i"> 
                     	 <tbody>
                     		<tr>
                     			<td>
                     				${i.count }.&ensp;	
                     				<img src="${contextPath }/digging/thumbnails?file=${exchangeShopDTO.productFile}" alt=""  width="30" height="60">
                   				</td>
                     			<td>
                     				<a href="${contextPath }/shop/shopDetail?productCd=${exchangeShopDTO.productCd }" class="latest-product__item">
                     				<strong>${exchangeShopDTO.productNm}</strong>
                     				</a>
                     			</td>
                     		</tr>
                     	 </tbody>
                         </c:forEach>
                     	</table>
                            <input type="hidden" name="userId" value="${sessionId }">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            </section>
           </div>
          </div>
         </div>
          <br><br><br><br>
    </section>
     
     
</body>
</html>