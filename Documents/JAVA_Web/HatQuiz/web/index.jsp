<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.Quiz"%>
<%@page import="controller.SessionCounter"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DAO.QuizDAO"%>
<%@page import="model.Subject"%>
<%@page import="DAO.SubjectDAO"%>
<%@page import="DAO.ViewDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>HatQuiz</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Free HTML5 Website Template by freehtml5.co" />
        <meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
        <meta name="author" content="freehtml5.co" />
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />

        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400" rel="stylesheet">

        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.css">

        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.css">

        <!-- Owl Carousel  -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- Flexslider  -->
        <link rel="stylesheet" href="css/flexslider.css">

        <!-- Pricing -->
        <link rel="stylesheet" href="css/pricing.css">

        <!-- Theme style  -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <!-- FOR IE9 below -->
        <!--[if lt IE 9]>
        <script src="js/respond.min.js"></script>
        <![endif]-->

        <script id="GridToolbarTemplate" type="text/x-kendo-template">    
            <nav id="breadcrumb"></nav>
        </script>     

    </head>
    <body>
        <%
            SubjectDAO subjectDAO = new SubjectDAO();
            QuizDAO quizDAO = new QuizDAO();
            ViewDAO viewDAO = new ViewDAO();
            UserDAO userDAO = new UserDAO();
        %>

        <div id="page">
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="banner.jsp"></jsp:include>
            <%
                // T???ng l?????t truy c???p  
                int view = 0;
                view = viewDAO.getViews();
                application.setAttribute("view", view);
                if (view != 0) {
                    if (session.isNew()) {
                        viewDAO.updateView();
                    }
                }

                // T???ng h???c vi??n
                int users = userDAO.countUser();
                request.setAttribute("users", users);

                // ??ang truy c???p
                SessionCounter counter = (SessionCounter) session.getAttribute(SessionCounter.COUNTER);

                // T???ng ????? thi
                int countQ = quizDAO.countQuiz();
                request.setAttribute("countQ", countQ);

            %>
            <div id="fh5co-course-categories">
                <div class="container">
                    <div class="row animate-box">
                        <div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
                            <h2>C??c m??n thi</h2>
                            <p>C?? l??m th?? m???i c?? ??n, kh??ng l??m m?? ????i ??n th?? ch??? c?? ??n ... ??n :poop:</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-6 text-center animate-box">
                            <div class="services">
                                <a class="icon" href="quiz.jsp?pages=1">
                                    <i class="fa fa-graduation-cap"></i>
                                </a>
                                <div class="desc">
                                    <h3><a href="quiz.jsp?pages=1">T???t c???</a></h3>
                                    <p>Bi???t th?? n??i l?? bi???t. Kh??ng bi???t th?? n??i l?? kh??ng bi???t. Th??? m???i g???i l?? bi???t.<br> <b><i>"Kh???ng T???"</i></b></p>
                                </div>
                            </div>
                        </div>
                        <%                            for (Subject s : subjectDAO.getListSubject()) {
                        %>
                        <div class="col-md-4 col-sm-6 text-center animate-box">
                            <div class="services">
                                <a class="icon" href ="quiz.jsp?subject=<%=s.getSubjectID()%>&pages=1">
                                    <i class="<%=s.getIcon()%>"></i>
                                </a>
                                <div class="desc">
                                    <h3><a href="quiz.jsp?subject=<%=s.getSubjectID()%>&pages=1"><%=s.getSubjectName()%></a></h3>
                                    <p id="test"><%=s.getDescription()%></p>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>          
                    </div>
                </div>
            </div>

            <div id="fh5co-counter" class="fh5co-counters" style="background-image: url(images/img_bg_4.jpg);" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="row">
                                <div class="col-md-3 col-sm-6 text-center animate-box">
                                    <span class="icon"><i class="icon-world"></i></span>
                                    <span class="fh5co-counter js-counter" data-from="0" data-to="<%=view%>" data-speed="5000" data-refresh-interval="50"></span>
                                    <span class="fh5co-counter-label">T???ng l?????t truy c???p</span>
                                </div>
                                <div class="col-md-3 col-sm-6 text-center animate-box">
                                    <span class="icon"><i class="icon-study"></i></span>
                                    <span class="fh5co-counter js-counter" data-from="0" data-to="<%=users%>" data-speed="5000" data-refresh-interval="50"></span>
                                    <span class="fh5co-counter-label">S??? l?????ng h???c vi??n</span>
                                </div>
                                <div class="col-md-3 col-sm-6 text-center animate-box">
                                    <span class="icon"><i class="fas fa-bolt"></i></span>
                                    <span class="fh5co-counter js-counter" data-from="0" data-to="<%=counter.getActiveSessionNumber()%>" data-speed="5000" data-refresh-interval="50"></span>
                                    <span class="fh5co-counter-label">??ang truy c???p</span>
                                </div>
                                <div class="col-md-3 col-sm-6 text-center animate-box">
                                    <span class="icon"><i class="icon-book2"></i></span>
                                    <span class="fh5co-counter js-counter" data-from="0" data-to="<%=countQ%>" data-speed="5000" data-refresh-interval="50"></span>
                                    <span class="fh5co-counter-label">S??? l?????ng ????? thi</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="fh5co-course">
                <div class="container">
                    <div class="row animate-box">
                        <div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
                            <h2>????? thi m???i nh???t</h2>
                            <p>" Nh???ng g?? ch??ng ta bi???t ng??y h??m nay s??? l???i th???i v??o ng??y h??m sau. N???u ch??ng ta ng???ng h???c th?? ch??ng ta s??? ng???ng ph??t tri???n."</p>
                        </div>
                    </div>
                    <div class="row">
                        <%
                            for (Quiz q : quizDAO.getListQuiz(1, 4)) {
                        %>    
                        <div class="col-md-6 animate-box">
                            <div class="course">
                                <a href="detail.jsp" class="course-img" style="background-image: url(<%=q.getImage()%>  );">
                                </a>
                                <div class="desc">
                                    <h3><a href="detail.jsp""><%=q.getQuizName()%></a></h3>
                                    <p style="font-size: 15px; display: grid" class="ltin">
                                        <span><i class="fa fa-bars" aria-hidden="true"></i> <a href="quiz.jsp?subjectID=<%=q.getSubjectID()%>&pages=1           "><%=q.getSubjectName()%></a></span>                                             
                                        <span><i class="fa fa-question-circle" aria-hidden="true"></i> S??? c??u h???i: <b><%=q.getTotalQuestion()%> </b> </span>
                                        <span><i class="fa fa-clock" aria-hidden="true"></i>  Th???i gian: <b><%=q.getTime()%></b></span> 
                                        <span><i class="fa fa-signal" aria-hidden="true"></i>  L?????t thi: 3071</span>
                                        <span><i class="fas fa-edit" aria-hidden="true"></i>  Ng??y ????ng: <fmt:formatDate value="<%=q.getCreateDate()%>" pattern="dd-MM-yyyy"></fmt:formatDate></span>
                                    </p>
                                    <span><a href="detail.jsp" class="btn btn-primary btn-sm btn-course">Xem chi ti???t</a></span>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>

            <div id="fh5co-testimonial" style="background-image: url(images/school.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row animate-box">
                        <div class="col-md-6 col-md-offset-3 text-center fh5co-heading">
                            <h2><span>C???m nh???n ng?????i h???c</span></h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="row animate-box">
                                <div class="owl-carousel owl-carousel-fullwidth">
                                    <div class="item">
                                        <div class="testimony-slide active text-center">
                                            <div class="user" style="background-image: url(https://scontent-hkt1-1.xx.fbcdn.net/v/t1.0-9/159531302_1406717343006790_8090523326038381237_o.jpg?_nc_cat=108&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=52q6ERVWZMwAX9eiNOV&_nc_ht=scontent-hkt1-1.xx&oh=b46bfb4f13e66571d54cf27232b025ed&oe=60793808);"></div>
                                            <span>Ho??ng c???t moi<br><small>H???c sinh</small></span>
                                            <blockquote>
                                                <p>&ldquo;Nh??? c??c kh??a h???c em ???? c?? ???????c ?????nh h?????ng cho b???n th??n m??nh, t??? tin h??n v?? kh??ng c???m th???y hoang mang v??? c??c k?? n??ng h???c n???a!&rdquo;</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="testimony-slide active text-center">
                                            <div class="user" style="background-image: url(https://scontent-hkt1-1.xx.fbcdn.net/v/t1.0-9/10245586_236509373220507_6333942251277991237_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=2c4854&_nc_ohc=Oi6tmPeqEWgAX-jExuZ&_nc_ht=scontent-hkt1-1.xx&oh=3eac1f99e06e54cdc978350ce4960a37&oe=60797703);"></div>
                                            <span>Tr???ng b???ng m???<br><small>H???c sinh</small></span>
                                            <blockquote>
                                                <p>&ldquo;Em ???? h???c ??? website n??y t??? l??u r???i, th???y r???t t???t, nh???ng b??i gi???ng ???????c l??m r???t c??ng phu, h??nh ???nh ?????p v?? n??t  .&rdquo;</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="testimony-slide active text-center">
                                            <div class="user" style="background-image: url(https://scontent-hkt1-1.xx.fbcdn.net/v/t1.0-9/98362483_1140601059607438_8599874791295418368_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=174925&_nc_ohc=_sZbqCaMqHEAX8_BoRh&_nc_ht=scontent-hkt1-1.xx&oh=6b772c352b1f9fcc5debc0ca54955740&oe=607750F0);"></div>
                                            <span>??n ?????u moi<br><small>H???c sinh</small></span>
                                            <blockquote>
                                                <p>&ldquo;C??c Kh??a h???c tr??n website r???t b??? ??ch gi??p em c?? th??m nhi???u k??? n??ng s???ng, l??m vi???c. Em c???m th???y r???t t??? tin v??o b???n th??n!&rdquo;</p>
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>    
        </div>


        <div class="gototop js-top">
            <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
        </div>

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <!-- Stellar Parallax -->
        <script src="js/jquery.stellar.min.js"></script>
        <!-- Carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- Flexslider -->
        <script src="js/jquery.flexslider-min.js"></script>
        <!-- countTo -->
        <script src="js/jquery.countTo.js"></script>
        <!-- Magnific Popup -->
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/magnific-popup-options.js"></script>
        <!-- Count Down -->
        <script src="js/simplyCountdown.js"></script>
        <!-- Main -->
        <script src="js/main.js"></script>
        <script>
            var d = new Date(new Date().getTime() + 1000 * 120 * 120 * 2000);
            // default example
            simplyCountdown('.simply-countdown-one', {
                year: d.getFullYear(),
                month: d.getMonth() + 1,
                day: d.getDate()
            });
            //jQuery example
            $('#simply-countdown-losange').simplyCountdown({
                year: d.getFullYear(),
                month: d.getMonth() + 1,
                day: d.getDate(),
                enableUtc: false
            });
        </script>
    </body>
</html>