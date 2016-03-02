<html>
<head>
<title>CodePamoja Attendance</title>
</head>
<body>
<h2>Register Developer</h2>

	<form class="login-form" method="POST" action="add_attendance" method="post">
        <label>Location</label>
            <input type="text" placeholder="location_name" id="location_name" name="location_name" required/><br>
        <label>In / Out</label>
            <input type="checkbox" value="true" placeholder="getting_in" id="getting_in" name="getting_in" required/><br>
        <label>Narrative</label>
            <input type="text" placeholder="narrative" id="narrative" name="narrative"/><br>
			<button type="submit" >Save</button>
	</form>


</body>
</html>
