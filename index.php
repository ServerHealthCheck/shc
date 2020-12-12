<html>
<head>
<meta charset="UTF-8">
<title>Server Health Check</title>
<style>

h1 {
	color: 1b1d23;
	text-align:left;
	font: 40px arial;
	margin-bottom: 0px;
}

body {
	background-color: 24292e;
	font-family: arial;
}
	
@media (prefers-color-scheme: dark) {
	html,img,video{filter:invert(1);}
	#wdw_logo,#art_links img{filter:invert(0)}
}

</style>
</head>
	
<body>
<h1>System</h1>
<?php
	$USER = get_current_user();
	$directory = ("/home/$USER/shc_scripts/");
	$ds_used = shell_exec("$directory/storage_used.sh");
	$ds_total = shell_exec("$directory/storage_total.sh");
	$cpu_temp = shell_exec("$directory/temperature.sh");
	$ram_free = shell_exec("$directory/mem_used.sh");
	$ram_total = shell_exec("$directory/mem_total.sh");
	$ip = shell_exec("$directory/ip.sh");
	$hostname = shell_exec("$directory/hostname.sh");
	$os = shell_exec("$directory/os.sh");
	$kernel = shell_exec("$directory/kernel_version.sh");
	$uptime = shell_exec("$directory/uptime.sh");
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
		<td><?php echo $cpu; ?></td>
	</tr>
	<tr>
		<td width="30%">CPU Temperature</td>
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
	<tr>
		<td>Uptime</td>
		<td><?php echo $uptime; ?></td>
	</tr>	
</table>
</html>

<br>
<h1>Services</h1> 
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
