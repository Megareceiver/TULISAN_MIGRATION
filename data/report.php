<?php
	require_once('protected/config.php');
	$db = openGate();

	ob_clean();
	// The function header by sending raw excel
	header("Content-type: application/vnd-ms-excel");
	// Defines the name of the export file "codelution-export.xls"
	header("Content-Disposition: attachment; filename=Report-export.xls");
	// Add data table
	ob_clean();

	/* initial condition */
	$resultList = array();
	$error			= 0;

	$temp		= "";

	/* open connection */
	$gate = $db;
	if($gate &&
		isset($_GET['type']) && $_GET['type'] != "" &&
		isset($_GET['from']) && $_GET['from'] != "" &&
		isset($_GET['to']) && $_GET['to'] != ""){

		$type = $_GET['type'];
		$from = $_GET['from'];
		$to   = $_GET['to'];

		$sql = "SELECT
						o.idData,o.total, o.name, o.address, o.city, o.zipCode, c.country_name as country, o.phone, o.email, o.status
						FROM
						orders o JOIN countries c ON o.country = c.country_code
						WHERE
						DATE(o.createdDate) >= '".$from."' AND DATE(o.createdDate) <='".$to."'
						ORDER BY o.idData DESC
						";

		$result = $db->query($sql);
		if($result){
?>

		<table border='1'>
			<tr>
				<td colspan="2">ORDER REPORT</td>
				<td colspan="2">From : <?=$from?></td>
				<td>To : <?=$to?></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Order Numb.</td>
				<td>Status</td>
				<td colspan="2">TOTAL</td>
				<td>Customer</td>
				<td>Address</td>
				<td>City</td>
				<td>Zip Code</td>
				<td>Country</td>
				<td>Phone</td>
				<td>Email</td>
			</tr>

<?php
			$data = $result->fetchAll(PDO::FETCH_ASSOC);
			for($loop=0; $loop < count($data); $loop++){
?>
			<tr>
				<td>#<?=$data[$loop]['idData']?></td>
				<td><?=$data[$loop]['status']?></td>
				<td>Rp.</td>
				<td align="right"><?=number_format($data[$loop]['total'])?></td>
				<td><?=$data[$loop]['name']?></td>
				<td><?=$data[$loop]['address']?></td>
				<td><?=$data[$loop]['city']?></td>
				<td><?=$data[$loop]['zipCode']?></td>
				<td><?=$data[$loop]['country']?></td>
				<td><?=$data[$loop]['phone']?></td>
				<td><?=$data[$loop]['email']?></td>
			</tr>

<?php
			}
?>

		</table>

<?php
		}else{
			$error = 1;
		}
	}else{
		$error = 1;
	}

	if($error == 1){
?>

		<h3>Data Not found!</h3>
		<p>You will be redirected in <span id="counter">10</span> second(s).</p>
		<script type="text/javascript">
			function countdown() {
			    var i = document.getElementById('counter');
			    if (parseInt(i.innerHTML)<=0) {
			        location.href = '../admin/formReport.html';
			    }
			    i.innerHTML = parseInt(i.innerHTML)-1;
			}
			setInterval(function(){ countdown(); },1000);
		</script>

<?php
	}
?>
