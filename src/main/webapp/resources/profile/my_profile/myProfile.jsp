<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>MY PROFILE</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="pages/My-personal-profile/my_profile/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="pages/My-personal-profile/my_profile/assets/css/ready.css">
	<link rel="stylesheet" href="pages/My-personal-profile/my_profile/assets/css/demo.css">
	<link rel="stylesheet" type="text/css" href="pages/My-personal-profile/my_profile/myprofileStyle.css">
	<link rel="stylesheet" type="text/css" href="pages/My-personal-profile/my_profile/style.css">
	<script type="text/javascript" src="/resources/js/my_profile/my_profile.js"></script>
</head>
<body onload="set_user_data_from_ajax()">
	<div class="wrapper">
		<div class="main-header">
			<div class="logo-header">
				<a href="myProfile.jsp" class="logo">
					MY PROFILE
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more"><i class="la la-ellipsis-v"></i></button>
			</div>
			<nav class="navbar navbar-header navbar-expand-lg">
				<div class="container-fluid">

					<form class="navbar-left navbar-form nav-search mr-md-3" action="">
						<div class="input-group">
							<input type="text" placeholder="Search ..." class="form-control">
							<div class="input-group-append">
								<span class="input-group-text">
									<i class="la la-search search-icon"></i>
								</span>
							</div>
						</div>
					</form>
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						<li class="nav-item dropdown hidden-caret">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<i class="la la-bell"></i>
								<span class="notification">1</span>
							</a>
							<ul class="dropdown-menu notif-box" aria-labelledby="navbarDropdown">
								<li>
									<div class="dropdown-title">You have 1 new notification</div>
								</li>
								<li>
									<div class="notif-center">
										<a href="#">
											<div class="notif-img">
												<img src="resources/images/male.png" alt="Img Profile">
											</div>
											<div class="notif-content">
												<span class="block">
													Bank send messages to you
												</span>
												<span class="time">12 minutes ago</span>
											</div>
										</a>
									</div>
								</li>
								<li>
									<a class="see-all" href="javascript:void(0);"> <strong>See all notifications</strong> <i class="la la-angle-right"></i> </a>
								</li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false"> <img src="resources/images/male.png" alt="" width="36" class="img-circle"><span >Juraev Nozimjon</span></span> </a>
							<ul class="dropdown-menu dropdown-user">
								<li>
									<div class="user-box">
										<div class="u-img"><img src="resources/images/male.png" alt="user"></div>
										<div class="u-text">
											<h4>Juraev Nozimjon</h4>
											<p class="text-muted">encodern1@gmail.com</p><a href="../report.html" class="btn btn-rounded btn-danger btn-sm">View Profile</a></div>
										</div>
									</li>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#"><i class="ti-user"></i> My Profile</a>
								</ul>
								<!-- /.dropdown-user -->
							</li>
						</ul>
					</div>
				</nav>
			</div>
			<div class="sidebar">
				<div class="scrollbar-inner sidebar-wrapper">
					<div class="user">
						<div class="photo">
							<img src="resources/images/male.png">
						</div>
						<div class="info">
							<a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									Juraev Nozimjon
									<span class="user-level">User</span>
									<span class="caret"></span>
								</span>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="collapseExample" aria-expanded="true" style="">
								<ul class="nav">
									<li>
										<a href="#profile">
											<span class="link-collapse">My Profile</span>
										</a>
									</li>
									<li>
										<a href="#edit">
											<span class="link-collapse">Edit Profile</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<ul class="nav">
						<li class="nav-item active">
							<a href="myProfile.jsp">
								<i class="la la-signal"></i>
								<p>Statistic</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="components.html">
								<i class="la la-table"></i>
								<p>Announcements</p>
								<span class="badge badge-count">14</span>
							</a>
						</li>
						<li class="nav-item">
							<a href="forms.html">
								<i class="la la-keyboard-o"></i>
								<p>Messages</p>
								<span class="badge badge-count">50</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		<div class="main-panel">
	    <div class="content">
        <div class="container-fluid">
        						<h4 class="page-title">Statistic</h4>
        						<div class="row">

        	    	<div class="col-md-8">
        	    		<div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-6">
        		        <div class="mdc-card">
        							<section class="mdc-card__primary">
        								<h1 class="mdc-card__title mdc-card__title--large">Line chart</h1>
        							</section>
        							<section class="mdc-card__supporting-text">
        		            <canvas id="lineChart" style="height:150px"></canvas>
        							</section>
        						</div>
        		      </div>
        	    	</div>
        	    	<div class="col-md-4" style="background-color: white;">
        	    		<div class="form-group from-show-notify row">
                    <div class="col-sm-3">
                      <label class="control-label">Utility</label>
                    </div>
                    <div class="col-md-8">
                      <select class="form-control input-fixed" id="notify_state"></select>
                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="col-sm-3">
                      <label class="control-label">From <span style="color: red;">*</span></label>
                    </div>
                    <div class="col-md-9">
                      <input type="date" name="fromDate" class="col-md-11" required>
                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="col-sm-3">
                      <label class="control-label">To <span style="color: red;">*</span></label>
                    </div>
                    <div class="col-md-9">
                      <input type="date" name="toDate" class="col-md-11" required>
                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="form-group">
                      <button class="btn btn-success btn-lg" style="width: 290px;" onclick="get_statistics()">Get Statistic</button>
                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="form-group">
                      <button class="btn btn-success btn-lg" style="width: 290px;"><a href="../report.html">Report</a></button>
                    </div>
                  </div>

                  </div>
                  </div>
        	    	</div>
      </div>
    </div>

    	</div>
			</div>
		</div>
	</div>
</body>
<script src="pages/My-personal-profile/my_profile/assets/js/core/jquery.3.2.1.min.js"></script>
<script src="pages/My-personal-profile/my_profile/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="pages/My-personal-profile/my_profile/assets/js/core/popper.min.js"></script>
<script src="pages/My-personal-profile/my_profile/assets/js/core/bootstrap.min.js"></script>
<script src="pages/My-personal-profile/my_profile/assets/js/plugin/chartist/chartist.min.js"></script>
<script src="pages/My-personal-profile/my_profile/assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>

<!-- <script src="assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script> -->
<script src="pages/My-personal-profile/my_profile/assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="pages/My-personal-profile/my_profile/assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="pages/My-personal-profile/my_profile/assets/js/plugin/chart-circle/circles.min.js"></script>
<script src="pages/My-personal-profile/my_profile/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="pages/My-personal-profile/my_profile/assets/js/ready.min.js"></script>
<script src="pages/My-personal-profile/my_profile/assets/js/demo.js"></script>
<%--<script type="text/javascript" src="pages/My-personal-profile/my_profile/chart.js"></script>--%>
<script type="text/javascript" src="pages/My-personal-profile/my_profile/chart.min.js"></script>
</html>