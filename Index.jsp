<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" type ="text/css" href="${pageContext.request.contextPath}/Resources/Css/Index.css"/>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>
<body>
    <!-- Nav Bar Section  -->
    <nav class=" navbar navbar-expand-sm justify-content-center">
        <div class="container-fluid">
          <a class="navbar-brand" href="#" class="navbarList" id="bankTitle">Aspire Systems </a>
        </div>
        <ul class="navbar-nav">
          <li class="nav-item active" >
            <a class="nav-link" href="Index.jsp" id="tags">Home</a>
          </li>
          <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="tags" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                       <span class="items2"> Login</span>
                    </a>
         <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarDarkDropdownMenuLink">
                <li><a class="dropdown-item" href="UserLogin.jsp">As User</a></li>
                <li><a class="dropdown-item" href="AdminLogin.jsp">As Admin</a></li>
        </ul>
        </li>
          </ul>
          <li class="nav-item" > <a class="nav-link" href="Index.jsp" id="tags">Services</a>
          </li>
          <li>
          <a class="nav-link" href="Index.jsp" id="tags">Contact Us</a>   
                 </li>
          </ul>
      </nav>

	<div id="hero">
		    <img class="card-img" id="heros" src="${pageContext.request.contextPath}/Resources/Images/Image1.png" alt="...">
		    <div class="card-img-overlay text-white d-flex justify-content-center align-items-center">
		      <div class="container text-center text-md-left" data-aos="fade-up">
      				<h1>Welcome to Aspire Event Voting System</h1>
      				<a href="UserSignUp.jsp" class="btn-get-started ">Get Started</a>
    			</div>
		    </div>
	</div>

      &nbsp;
      <br><br>
      <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="row">
          <div class="col-xl-6 col-lg-7" data-aos="fade-right">
            <img src="${pageContext.request.contextPath}/Resources/Images/Image2.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-xl-6 col-lg-5 pt-5 pt-lg-0">
            <h3 data-aos="fade-up">Motto of our Events</h3>
            <br>
            <div class="icon-box" data-aos="fade-up">
              <h4>Just play.</h4>
              <br>
            </div>

            <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
              <h4>Have fun</h4>
              <br>
            </div>

            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
              <h4> Enjoy the game.</h4>
              <br>
            </div>

          </div>
        </div>

      </div>
    </section>

    <br><br>
      <section id="features" class="features">
        <div class="container">
  
          <h1>Events in our Company</h1>
          <br>
          <div class="row">
            <div class="col-lg-4 mb-5 mb-lg-0" data-aos="fade-right">
              <ul class="nav nav-tabs flex-column">
                <li class="nav-item">
                  <a class="nav-link active show" data-bs-toggle="tab" href="#tab-1">
                    <h4>Company MileStone Events</h4>
                    <p> Company milestone events are a cause for celebration. </p>
                  </a>
                </li>
                <li class="nav-item mt-2">
                  <a class="nav-link" data-bs-toggle="tab" href="#tab-2">
                    <h4>Team-building events</h4>
                    <p> They provide employees with a unique opportunity to come together and explore more about each other in a non-stress-inducing, non-work environment.</p>
                  </a>
                </li>
                <li class="nav-item mt-2">
                  <a class="nav-link" data-bs-toggle="tab" href="#tab-3">
                    <h4>Appreciation Events</h4>
                    <p>The purpose of appreciation events is to bring people together and discuss new business opportunities.</p>
                  </a>
                </li>
                <li class="nav-item mt-2">
                  <a class="nav-link" data-bs-toggle="tab" href="#tab-4">
                    <h4>Product launch events</h4>
                    <p> Product launch events aim to inform employees, clients and media about the company’s recent developments. </p>
                  </a>
                </li>
              </ul>
            </div>
            <div class="col-lg-7 ml-auto" data-aos="fade-left">
              <div class="tab-content">
                <div class="tab-pane active show" id="tab-1">
                  <figure>
                    <img src="${pageContext.request.contextPath}/Resources/Images/features-1.png" alt="" class="img-fluid">
                  </figure>
                </div>
                <div class="tab-pane" id="tab-2">
                  <figure>
                    <img src="${pageContext.request.contextPath}/Resources/Images/features-2.png" alt="" class="img-fluid">
                  </figure>
                </div>
                <div class="tab-pane" id="tab-3">
                  <figure>
                    <img src="${pageContext.request.contextPath}/Resources/Images/features-3.png" alt="" class="img-fluid">
                  </figure>
                </div>
                <div class="tab-pane" id="tab-4">
                  <figure>
                    <img src="${pageContext.request.contextPath}/Resources/Images/features-4.png" alt="" class="img-fluid">
                  </figure>
                </div>
              </div>
            </div>
          </div>
  
        </div>
      </section><!-- End Features Section -->


      <br><br>
      <!-- ======= Team Section ======= -->
    <section id="team" class="team">
        <div class="container">
  
          <div class="section-title" data-aos="fade-up">
            <h2>Event Organizers </h2>
          </div>
  
          <div class="row">
  
            <div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up">
              <div class="member">
                <img src="${pageContext.request.contextPath}/Resources/Images/team-1.jpg" class="img-fluid" alt="">
                <div class="member-info">
                  <div class="member-info-content">
                    <h4>Walter White</h4>
                    <span>Chief Executive Officer</span>
                  </div>
                </div>
              </div>
            </div>
  
            <div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
              <div class="member">
                <img src="${pageContext.request.contextPath}/Resources/Images/team-2.jpeg" class="img-fluid" alt="">
                <div class="member-info">
                  <div class="member-info-content">
                    <h4>Sarah Jhonson</h4>
                    <span>Product Manager</span>
                  </div>
                  
                </div>
              </div>
            </div>
  
            <div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
              <div class="member">
                <img src="${pageContext.request.contextPath}/Resources/Images/team-3.jpg" class="img-fluid" alt="">
                <div class="member-info">
                  <div class="member-info-content">
                    <h4>William Anderson</h4>
                    <span>CTO</span>
                  </div>
                </div>
              </div>
            </div>
  
            <div class="col-xl-3 col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
              <div class="member">
                <img src="${pageContext.request.contextPath}/Resources/Images/team-4.jpg" class="img-fluid" alt="">
                <div class="member-info">
                  <div class="member-info-content">
                    <h4>Amanda Jepson</h4>
                    <span>Accountant</span>
                  </div>
                </div>
              </div>
            </div>
  
          </div>
  
        </div>
      </section><!-- End Team Section -->
  
      
      <!-- ======= Footer ======= -->
  <footer id="footer">


    
    <div class="container">
      <div class="copyright">
        Copyright <strong><span>Aspire Systems </span></strong>. All Rights Reserved
      </div>
    </div>
  </footer><!-- End Footer -->

  
  <!-- Footer -->
      <script>
        AOS.init();
      </script>
</body>
</html>