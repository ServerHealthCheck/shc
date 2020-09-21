<html>
<head>
<meta charset="UTF-8">
<title>Server Health Check</title>
<style>
h1 {
	color: Black;
	text-align:left;
	font: 40px arial;
}

h2 {
	color: Black;
	text-align:left;
	font: 40px arial;
	margin-bottom: 0px;
}

body {
	font-family: arial;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #111;
	position: -webkit-sticky;
	position: sticky;
	top: 0;
	font: 40px arial;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not(.active) {
	background-color: #111;
}

.active {
	background-color: ;
}
</style>
</head>
	
<body>
<ul>	
	<li style="float:left"><a href="http://">Host</a></li> <?php //Add your own host http://hostname_host/ ?>
	<li style="float:center"><a href="http://">RemoteClient</a></li> <?php //Add your own client http://hostname_client/ ?>
</ul>
	
<h2>System</h2>
<?php
	$USER = get_current_user();
	$directory = ("/home/$USER/shc_scripts/");
	$ds_used = shell_exec("$directory/storage_used.sh");
	$ds_total = shell_exec("$directory/storage_total.sh");
	$cpu_temp = shell_exec("$directory/temp.sh");
	$ram_free = shell_exec("$directory/mem_used.sh");
	$ram_total = shell_exec("$directory/mem_total.sh");
	$ip = shell_exec("$directory/ip.sh");
	$hostname = shell_exec("$directory/hostname.sh");
	$os = shell_exec("$directory/os.sh");
	$kernel = shell_exec("$directory/kernel_version.sh");
	$cpu = shell_exec("$directory/cpu.sh");
?>

<html>
<table>
	<tr>
		<td>Hostname</td>
		<td><?php echo $hostname; ?></td>
	</tr>
	<tr>
		<td>OS/Linux</td>
		<td><?php echo $os; ?></td>
	</tr>
	<tr>
		<td>Kernel</td>
		<td><?php echo $kernel; ?></td>
	</tr>
	<tr>
		<td>IP Address/es</td>
		<td><?php echo $ip; ?></td>
	</tr>
	<tr>
		<td>CPU</td>
		<td><?php echo $cpu ?></td>
	</tr>
	<tr>
		<td width="30%">CPU Temperatur   </td>
		<td width="50%"><?php echo $cpu_temp; echo "°C" ?></td>
	</tr>
	<tr>
		<td>Ram Usage</td>
		<td><?php echo $ram_free; echo " MB of "; echo $ram_total; echo "MB" ?></td>
	</tr>
	<tr>
		<td>Disk Usage</td>
		<td><?php echo $ds_used; echo "GB of "; echo $ds_total; echo "GB" ?></td>
	</tr>	
</table>
</html>

<br>
<h2>Services</h2> 
<?php
	$USER = get_current_user();
	$directory = ("/home/$USER/shc_scripts/");
	$bluetooth = shell_exec("$directory/bluetooth_active.sh");
	$sshd = shell_exec("$directory/sshd_active.sh");
?>
	
<html>
<table>
	<tr>
		<td width="30%">Bluetooth</td>
		<td width="25%"><?php echo $bluetooth ?></td>
	</tr>
	<tr>
		<td>sshd</td>
		<td><?php echo $sshd ?></td>
	</tr>
</table>
</html>
</body>
</html>
