<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>

<title><%= pageContext.getServletContext().getInitParameter("web_title") %></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>

<!-- END THEME STYLES -->
<link rel="shortcut icon" href="./assets/logos/favicon.png"/>
    <style type="text/css">
        .leftInfo{
            /*background: rgba(255,255,255, 0.3);*/
        }
        #leftInfo{
           /* margin-left: 10px;*/
            margin-top: 50px;
        }
        
        #rightInfo{
            /*margin-right: 10px;*/
            margin-top: 50px;
        }
    
    
    </style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-container page-md login" id="login">
    
    <!-- BEGIN LOGIN -->
    <div class="content">
        <!-- BEGIN LOGIN FORM -->
        <form class="login-form" method="POST" action="j_security_check" method="post">
            <h3 class="form-title">Attendance Login</h3>
            <div class="alert alert-danger display-hide">
                <button class="close" data-close="alert"></button>
                <span>Enter  username and password. </span>
            </div>
            <div class="form-group">
                <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                <label class="control-label visible-ie8 visible-ie9">Username</label>
                <div class="input-icon">
                    <i class="fa fa-user"></i>
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" 
                    id="j_username" name="j_username" autofocus required
                    />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label visible-ie8 visible-ie9">Password</label>
                <div class="input-icon">
                    <i class="fa fa-lock"></i>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" 
                    id="j_password" name="j_password" required/>
                </div>
            </div>
            <div class="form-actions">
                <button type="submit" class="btn blue pull-right">
                Login <i class="m-icon-swapright m-icon-white"></i>
                </button>
            </div>

        </form>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
