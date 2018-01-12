
<%
if(user==null){
	
}else{
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈페이지</title>
</head>

<link rel="stylesheet" href="<%=rootPath%>/ui/css/list.css" />
<link rel="stylesheet" href="<%=rootPath%>/ui/css/creative.min.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
	
    <div class="container">

      <div class="starter-template">
        <h1><%=user.getUiName()%>님 환영합니다</h1>
       
      </div>
    </div>
    
    
    
    <section class="p-0" id="portfolio">
      <div class="container-fluid p-0">
        <div class="row no-gutters popup-gallery">
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="<%=rootPath %>/ui/img/portfolio/fullsize/1.jpg" >
              <img class="img-fluid" src="<%=rootPath %>/ui/img/portfolio/thumbnails/1.jpg"  alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                  	#1
                  </div>
                  <div class="project-name">
                   Through the laser
                  </div>
                </div>
              </div>
            </a>
          </div>
         
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="<%=rootPath %>/ui/img/portfolio/fullsize/3.jpg">
              <img class="img-fluid" src="<%=rootPath %>/ui/img/portfolio/thumbnails/3.jpg"  alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                   #2
                  </div>
                  <div class="project-name">
                    Through the laser #2
                  </div>
                </div>
              </div>
            </a>
          </div>
          <div class="col-lg-4 col-sm-6">
            <a class="portfolio-box" href="<%=rootPath %>/ui/img/portfolio/fullsize/4.jpg">
              <img class="img-fluid" src="<%=rootPath %>/ui/img/portfolio/thumbnails/4.jpg"  alt="">
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-category text-faded">
                    #3
                  </div>
                  <div class="project-name">
                    Laser Gallery
                  </div>
                </div>
              </div>
            </a>
          </div>
         
         
    </section>
    
     <section class="bg-dark">
      <div class="container text-center " style="color:white">
        <h2 class="mb-4">로그인 하면 더 많은 정보를 볼 수 있습니다</h2>
        <a class="btn btn-light btn-xl sr-button" style="color:white" href="<%= rootPath %>/view/user/signin">지금 회원가입 하세요!</a>
      </div>
    </section>
</body>
</html>
<%
}
%>