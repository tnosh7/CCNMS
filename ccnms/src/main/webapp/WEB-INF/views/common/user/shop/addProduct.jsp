<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 li{
		 list-style-type: none;
	 }
  .ck-editor__editable[role="textbox"] {
    min-height: 300px;
  }

  .ck-content .image {
    max-width: 80%;
    margin: 20px auto;
  }

</style>
<script>
	$().ready(function(){
		$("#uploadFileBtn").click(function(){
			$("#uploadAppend").append('<input type="file" class="form-control" id="uploadfile" name="uploadfile"><label class="input-group-text" for="inputGroupFile02" id="uploadFileBtn" name="uploadFile" onclick="appendFile()">사진 추가</label>');
		});
	});

</script>
</head>
<body>
<form action="${contextPath }/shop/addProduct" method="post" enctype="multipart/form-data"> 
  <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                        <br>
                            <h4><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAY5JREFUSEvN1D1I1lEUx/GPRS5BRdDg4JDQJESQkLQGBk2VBBa4RARFDkFzCs46JNoQLkFJiFSDoEtrg5a4tDTUoktvVLQkqBy4z6A893//PfBAZ7pv535/59xzboc2W0eb71cHcAIPcBZnkqA1rGASX6tElgDDmMLRzCXfcROvc5AqwAgeJccFzOBNml/APVxO8xuYawbJAXrwEQdSeiYyCkcxhj84iS/7z+UAofYOXmCoUAhLuIiHGK8L2ERXetT1AmAAy3iHvrqAvziEg9guAI7jG341K4Zcin7iSHIIxyo7hh8InxjvsRwgajzCvYJXBcB1PMdbnK8LuJ+aaBXnKtIUij+k97qLx3UBnXiPXjzB7UwUzxA9EBH3NxNS1WinEF/CYTRTF2vT+I3T+PwvjdY4O4h5bCGabyNtdONTGl/Dy1a+iobPU8SfdAuzabGhPuaxnrXSZxeOjSqJaoqqClvEJVytUh8H6wB2CmVaecd/ASgEUL1dJ4K4IZemon/xQNLXdkDLaaobQcuAXVL1RRnaCiDMAAAAAElFTkSuQmCC"/>
                            &ensp;상품 판매 등록 안내</h4>
                            <ul>
                                <li><strong>1. 모두디깅은 모든 디깅을 위한 공간입니다. 다른 유저들을 존중해주세요.</strong></li>
                               	<hr>
                                <li><strong>2. 공지에 있는 디깅 룰을 읽어주세요.</strong></li>
                               	<hr>
                                <li><strong>3. 디깅 룰을 벗어난 글을 게시할 경우 자동 삭제됩니다.</strong></li>
                               	<hr>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                  <div class="nav-align-top mb-4">
                    <ul class="nav nav-tabs" role="tablist">
                      <li class="nav-item">
                        <button
                          type="button"
                          class="nav-link active"
                          role="tab"
                          data-bs-toggle="tab"
                          data-bs-target="#navs-top-write"
                          aria-controls="navs-top-write"
                          aria-selected="true"
                          value="write"
                          id="writeBnt"
                          name="writeBnt"
                        >
                     	  상품 판매 등록
                        </button>
                      </li>
                    </ul>
                    <div class="tab-content">
                      <div class="tab-pane fade show active" id="navs-top-write" role="tabpanel">
                      <div class="card-body">
	                  	 	 <div class="form-group">
	                  	 	 	<table>
	                  	 	 		<tr>
	                  	 	 			<th width="30%">상품 이름</th>
	                  	 	 			<th> <input class="form-control form-control-lg" type="text" id="productNm" name="productNm" maxlength="35" placeholder="상품 이름을 입력하세요." ></th>
	                  	 	 		</tr>
	                  	 	 		<tr>
	                  	 	 			<th>상품 분류</th>
	                  	 	 			<th> <select name="sort" >
						  						<option value="">[필수] 상품판매 분류 선택</option>
						  						<option value="game">게임</option>
						  						<option value="kPop">K-POP</option>
						  						<option value="ott">OTT</option>
						  						<option value="animal">동물 & 애완동물</option>
						  						<option value="business">비즈니스</option>
						  						<option value="sport">스포츠</option>
						  						<option value="celeb">연예인</option>
						  						<option value="trevel">여행</option>
						  						<option value="fashion">패션</option>
						  						<option value="etc">ETC</option>
					  						</select></th>
	                  	 	 		</tr>
	                  	 	 		<tr>
	                  	 	 			<th>판매자</th>
	                  	 	 			<th><select name="writer" >
				                  	 			<option>판매자</option>
						  						<option>${sessionScope.userId }</option>
					  						</select></th>
	                  	 	 		</tr>
	                  	 	 		<tr>
	                  	 	 			<th>가격</th>
	                  	 	 			<th><input class="form-control form-control-lg" type="text" id="price" name="price" maxlength="20" placeholder="가격을 입력하세요(숫자만 입력)." ></th>
	                  	 	 		</tr>
	                  	 	 		<tr>
	                  	 	 			<th>할인률</th>
	                  	 	 			<th><input class="form-control form-control-lg" type="text" id="discountRate" name="discountRate" maxlength="35" placeholder="할인률을 입력하세요." ></th>
	                  	 	 		</tr>
	                  	 	 		<tr>
	                  	 	 			<th>재고</th>
	                  	 	 			<th><input class="form-control form-control-lg" type="number" id="stock" name="stock" maxlength="35" placeholder="재고를 입력하세요." ></th>
	                  	 	 		</tr>
	                  	 	 		<tr>
	                  	 	 			<th>배송 방법</th>
	                  	 	 			<th><input class="form-control form-control-lg" type="text" id="deliveryMethod" name="deliveryMethod" maxlength="35" placeholder="배송 방법을 입력하세요." ></th>
	                  	 	 		</tr>
	                  	 	 		<tr>
	                  	 	 			<th>배송 가격</th>
	                  	 	 			<th><input class="form-control form-control-lg" type="text" id="deliveryPrice" name="deliveryPrice" maxlength="35" placeholder="배송 가격을 입력하세요(숫자만 입력)."></th>
	                  	 	 		</tr>
	                  	 	 		<tr>
	                  	 	 			<th>상품 소개</th>
	                  	 	 			<th><textarea name="content" id="editor"></textarea>
												<script>
												  ClassicEditor
												  .create(document.querySelector('#editor'), {
														ckfinder: {
															uploadUrl : '/image/upload'
														}
													})
													.then(editor => {
														console.log('Editor was initialized');
													})
												</script>
	                  	 	 			</th>
	                  	 	 		</tr>
	                  	 	 		<tr>
	                  	 	 			<th>파일 업로드</th>
	                  	 	 			<th> <input type="file" class="form-control" id="uploadfile" name="uploadfile">
                			        <label class="input-group-text" for="inputGroupFile02" id="uploadFileBtn" name="uploadFile" onclick="appendFile">사진 추가</label>
                			        <span id="uploadAppend"></span>
                			        <label class="input-group-text" for="inputGroupFile02" id="deleteFile" name="deleteFile" onclick="window.location.reload()">삭제</label>
	                  	 	 			</th>
	                  	 	 		</tr>
	                  	 	 		
	                  	 	 	</table>
							</div>
	                   		<br>
	                   		<div class="demo-inline-spacing" align="center">
                        		<button type="submit" class="btn btn-primary active">작성</button>
                        		<button type="reset" class="btn btn-primary" onclick="window.location.reload()">새로고침</button>
                      		</div>
                   	</div>
              	 	</div>
                  </div>
                     <div class="tab-pane fade" id="navs-top-img" role="tabpanel">
                      <div class="card-body">
                	 </div>
              		</div>
            	</div>
       	<div class="card-body">
    </div>
   </div>
   </div>
   </div>
  </form>
</body>
</html>