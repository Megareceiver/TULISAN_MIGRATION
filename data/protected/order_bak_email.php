<?php
	error_reporting(-1);
	ini_set('display_errors', 1);
	define('email_active', false);

	use PHPMailer\PHPMailer\PHPMailer;
	use PHPMailer\PHPMailer\Exception;

	if(email_active == true){
		require 'library/src/Exception.php';
		require 'library/src/PHPMailer.php';
		require 'library/src/SMTP.php';
	}

	Class order {
		public function __construct(){
			// if (session_status() == PHP_SESSION_NONE) {session_start();} // session start
			if (session_id() == '') { session_start(); }
			require_once('protected/config.php');
			$this->db = openGate();
		}

		public function requestData($post, $target){
			switch($target){
				case "orders" 		: $resultList = $this->fetchAllRequest('orders', array("idData", "name", "status", "total", "createdDate"), $post['keyword'], "ORDER BY idData DESC, name ASC", $post['page']); break;
				case "orderFetch" 	: $resultList = $this->fetchSingleRequest('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank", "o.transferPicture", "o.paymentStatus", "o.paymentMessage", "s.name as shippingMethod", "o.receiptNumber", "o.status"), "o.".$post['keyword']); break;
				case "orderItems" 	:
				case "itemsCart" 	: $resultList = $this->fetchAllRecord('orders_item i JOIN products_variant v ON i.variantId = v.idData JOIN products p ON v.productId = p.idData JOIN colors c ON v.colorId = c.idData',array("v.frontPicture", "p.name", "v.sku", "i.price", "v.size", "c.name as color", "i.qty"), $post['keyword'], "ORDER BY i.idData"); break;
				case "orderInfo" 	: $resultList = $this->fetchSingleRequest('orders o JOIN countries c ON o.country = c.country_code',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.paymentMethod"), $post['keyword']); break;
				case "recentOrders" :
					if(isset($_SESSION['tulisan_user_username']))
						$resultList = $this->fetchAllRecord('orders o',array("o.idData as number", 'DATE_FORMAT(o.createdDate, "%M, %d %Y") as date', "status"), "o.createdBy = '".$_SESSION['tulisan_user_username']."' AND o.status <> 'Waiting for payment'", "ORDER BY o.idData");
					else
						$resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array());
				break;
				case "unpaidOrders" :
					if(isset($_SESSION['tulisan_user_username']))
						$resultList = $this->fetchAllRecord('orders o',array("o.idData as number", 'DATE_FORMAT(o.createdDate, "%M, %d %Y") as date', "status"), "o.createdBy = '".$_SESSION['tulisan_user_username']."' AND o.status = 'Waiting for payment'", "ORDER BY o.idData");
					else
						$resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array());
				break;
				case "cancelOrders" : $resultList = $this->fetchAllRequest('cancelation', array("orderId", "reason", "createdDate"), $post['keyword'], "ORDER BY idData DESC", $post['page']); break;
				default	   			: $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		public function removeData($post, $target){
			switch($target){
				case "product" 	: $resultList = $this->deleteById('products', $post['id']); break;

				default	   : $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		public function addData($post, $target){
			switch($target){
				case "order"  :
					$fields = array("name", "address", "city", "zipCode", "country", "phone", "email", "total", "paymentMethod", "bank");
					$values = array();
					foreach ($fields as $key) {
						$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
						array_push($values, $value);
					}

					array_push($fields, "customerId");
					array_push($values, ((isset($_SESSION['tulisan_customer_id']) ? $_SESSION['tulisan_customer_id'] : '0')));

					array_push($fields, "status");
					array_push($values, "Waiting for payment");

					$resultList = $this->insert('orders', $fields, $values);

					if($resultList["feedStatus"] == "success") {
						$resultList['resultItem'] = array();
						$resultList['resultUQty'] = array();
						$resultList['resultEmail'] = array();

						$fields = array("orderId", "variantId", "price", "qty");
						$endLoop = count($post['items']);
						for($loop=0;$loop<$endLoop;$loop++){
							$item 			= $post['items'][$loop];
							$values 		= '"'.$resultList["feedId"].'", "'.$item["variantId"].'",(SELECT price FROM products_variant WHERE idData = "'.$item['variantId'].'"), "'.$item['qty'].'"';
							$resultItem = $this->insert('orders_item', $fields, $values);
							array_push($resultList['resultItem'], $resultItem);

							$resultUQty = $this->update('products_variant', "qty = (qty - ".$item['qty'].")", $item['variantId']);
							array_push($resultList['resultUQty'], $resultUQty);
						}

						$emailResult = $this->emailOrder('placedOrder', array("email"=>$post['email'],"name"=>$post['name']), $resultList["feedId"]);
						array_push($resultList['resultEmail'], $emailResult);
					}
				break;

				case "processOrder"  :
					$values = array("status = 'Shipping'", "shippingMethod='".$post['shippingOptionId']."'", "receiptNumber='".$post['receiptNumber']."'");
					$resultList = $this->update('orders', $values, $post['orderId']);

					if($resultList["feedStatus"] == "success") {
						$resultList['resultEmail'] = array();

						$data = $this->fetchAllRecord('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank", "o.transferPicture", "o.paymentStatus", "o.paymentMessage", "s.name as shippingMethod", "o.receiptNumber", "o.status")
						, "o.idData = ".$post['orderId']."", "");
						if($data['feedStatus'] == "success"){
							$data = $data['feedData'];
						}else{
							$data = array();
						}

						foreach ($data as $value) {
							$post['email'] = $value['email'];
							$post['name'] = $value['name'];
						}

						$emailResult = $this->emailOrder('shipped', array("email"=>$post['email'],"name"=>$post['name']), $post['orderId']);
						array_push($resultList['resultEmail'], $emailResult);
					}
				break;

				case "paymentConfirm" :
					$values = array("status = 'Ready to ship'");
					$resultList = $this->update('orders', $values, $post['idData']);

					if($resultList["feedStatus"] == "success" && isset($post['idData']) && $post['idData']!="") {
						if(isset($_FILES["transferPicture"])){
							$upload = $this->uploadSingleImage($_FILES["transferPicture"], "transferPicture", "orders", "transferPicture", $post['idData'], '1');
							array_push($resultList, array("feedUpload" => $upload['feedMessage']));
						}
					}
				break;

				case "completeConfirm" :
					$values = array("status = 'Complete'");
					$resultList = $this->update('orders', $values, $post['idData']);

					if($resultList["feedStatus"] == "success") {
						$resultList['resultEmail'] = array();

						$data = $this->fetchAllRecord('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank", "o.transferPicture", "o.paymentStatus", "o.paymentMessage", "s.name as shippingMethod", "o.receiptNumber", "o.status")
						, "o.idData = ".$post['idData']."", "");
						if($data['feedStatus'] == "success"){
							$data = $data['feedData'];
						}else{
							$data = array();
						}

						foreach ($data as $value) {
							$post['email'] = $value['email'];
							$post['name'] = $value['name'];
						}

						$emailResult = $this->emailOrder('complete', array("email"=>$post['email'],"name"=>$post['name']), $post['idData']);
						array_push($resultList['resultEmail'], $emailResult);
					}
				break;

				case "cancelConfirm"  :
					$values = array("status = 'Cancel'");
					$resultList = $this->update('orders', $values, $post['idData']);

					if($resultList["feedStatus"] == "success") {
						$resultList['resultEmail'] = array();
						$resultList['resultCancelation'] = array();

						$post['orderId'] = $post['idData'];
						$fields = array("reason", "orderId");
						$values = array();
						foreach ($fields as $key) {
							$value = (isset($post[$key]) && $post[$key] != "") ? $post[$key] : "";
							array_push($values, $value);
						}

						$resultCancelation = $this->insert('cancelation', $fields, $values);
						array_push($resultList['resultCancelation'], $resultCancelation);

						$this->customQuery('UPDATE products_variant v SET qty = qty + (SELECT SUM(qty) FROM orders_item o WHERE variantId = v.idData AND o.orderId = '.$post['orderId'].') WHERE v.idData IN (SELECT variantId FROM orders_item o WHERE o.orderId = '.$post['orderId'].')');

						$data = $this->fetchAllRecord('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank", "o.transferPicture", "o.paymentStatus", "o.paymentMessage", "s.name as shippingMethod", "o.receiptNumber", "o.status")
						, "o.idData = ".$post['orderId']."", "");
						if($data['feedStatus'] == "success"){
							$data = $data['feedData'];
						}else{
							$data = array();
						}

						foreach ($data as $value) {
							$post['email'] = $value['email'];
							$post['name'] = $value['name'];
						}

						$emailResult = $this->emailOrder('cancel', array("email"=>$post['email'],"name"=>$post['name']), $post['orderId']);
						array_push($resultList['resultEmail'], $emailResult);
					}
				break;
				default	   		: $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		public function updateData($post, $target){
			switch($target){
				case "processOrder"  :
					$values = array("status = 'Shipping'");
					$resultList = $this->updateMultiData('orders', $values, $post['pId']);

					//EMAIL
					if($resultList["feedStatus"] == "success") {
						$resultList['resultEmail'] = array();

						$data = $this->fetchAllRecord('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank", "o.transferPicture", "o.paymentStatus", "o.paymentMessage", "s.name as shippingMethod", "o.receiptNumber", "o.status")
						, "o.idData = ".$post['pId']."", "");
						if($data['feedStatus'] == "success"){
							$data = $data['feedData'];
						}else{
							$data = array();
						}

						foreach ($data as $value) {
							$post['email'] = $value['email'];
							$post['name'] = $value['name'];
						}

						$emailResult = $this->emailOrder('shipped', array("email"=>$post['email'],"name"=>$post['name']), $post['pId']);
						array_push($resultList['resultEmail'], $emailResult);
					}
				break;

				case "completeOrder"  :
					$values = array("status = 'Complete'");
					$resultList = $this->updateMultiData('orders', $values, $post['pId']);

					//EMAIL
					if($resultList["feedStatus"] == "success") {
						$resultList['resultEmail'] = array();

						$data = $this->fetchAllRecord('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',
						array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank", "o.transferPicture", "o.paymentStatus", "o.paymentMessage", "s.name as shippingMethod", "o.receiptNumber", "o.status"),
						"o.idData = ".$post['pId']."","");
						if($data['feedStatus'] == "success"){
							$data = $data['feedData'];
						}else{
							$data = array();
						}

						foreach ($data as $value) {
							$post['email'] = $value['email'];
							$post['name'] = $value['name'];
						}

						$emailResult = $this->emailOrder('complete', array("email"=>$post['email'],"name"=>$post['name']), $post['pId']);
						array_push($resultList['resultEmail'], $emailResult);
					}
				break;

				case "cancelOrder"  :
					$values = array("status = 'Cancel'");
					$resultList = $this->updateMultiData('orders', $values, $post['pId']);

					if($resultList["feedStatus"] == "success" && isset($post['pId']) && $post['pId']!="") {
						$this->customQuery('UPDATE products_variant v SET qty = qty + (SELECT SUM(qty) FROM orders_item o WHERE variantId = v.idData AND o.orderId = '.$post['pId'].') WHERE v.idData IN (SELECT variantId FROM orders_item o WHERE o.orderId = '.$post['pId'].')');
					}

					//EMAIL
					if($resultList["feedStatus"] == "success") {
						$resultList['resultEmail'] = array();

						$data = $this->fetchAllRecord('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank", "o.transferPicture", "o.paymentStatus", "o.paymentMessage", "s.name as shippingMethod", "o.receiptNumber", "o.status")
						, "o.idData = ".$post['pId']."", "");
						if($data['feedStatus'] == "success"){
							$data = $data['feedData'];
						}else{
							$data = array();
						}

						foreach ($data as $value) {
							$post['email'] = $value['email'];
							$post['name'] = $value['name'];
						}

						$emailResult = $this->emailOrder('cancel', array("email"=>$post['email'],"name"=>$post['name']), $post['pId']);
						array_push($resultList['resultEmail'], $emailResult);
					}
				break;

				default	   		: $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

	        return $json;
		}

		public function fetchAllRecord($table, $fields, $conditions = "", $orderBy = ""){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($fields)) {
					foreach ($fields as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$fields = $temp;
					$temp   = "";
				}

				if(is_array($conditions)) {
					foreach ($conditions as $value) {
						$temp = $temp." ".$value;
					}

					$conditions = $temp;
					$temp   = "";
				}

				$conditions = ($conditions != "") ? "WHERE ".str_replace('\\', '', $conditions) : "";


				$sql = "SELECT ".$fields." FROM ".$table." ".$conditions." ".$orderBy." ";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData = $result->fetchAll(PDO::FETCH_ASSOC);
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		public function fetchAllRequest($table, $fields, $conditions = "", $orderBy = "", $paging = "1"){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($fields)) {
					foreach ($fields as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$fields = $temp;
					$temp   = "";
				}

				if(is_array($conditions)) {
					foreach ($conditions as $value) {
						$temp = $temp." ".$value;
					}

					$conditions = $temp;
					$temp   = "";
				}

				$conditions = ($conditions != "") ? "WHERE ".str_replace('\\', '', $conditions) : "";


				$temp = intval($paging);
				$temp = ($temp - 1) * 20;

				$paging = "LIMIT ".$temp.",20";

				$sql = "SELECT ".$fields." FROM ".$table." ".$conditions." ".$orderBy." ".$paging;

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData = $result->fetchAll(PDO::FETCH_ASSOC);
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		public function fetchSingleRequest($table, $fields, $conditions = ""){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($fields)) {
					foreach ($fields as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$fields = $temp;
					$temp   = "";
				}

				if(is_array($conditions)) {
					foreach ($conditions as $value) {
						$temp = $temp." ".$value;
					}

					$conditions = $temp;
					$temp   = "";
				}

				$conditions = ($conditions != "") ? "WHERE ".str_replace('\\', '', $conditions) : "";

				$sql = "SELECT ".$fields." FROM ".$table." ".$conditions;

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData = $result->fetch(PDO::FETCH_ASSOC);
				}

					$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		// DELETE DATA
		public function deleteById($table, $conditions, $image){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($conditions)) {
					foreach ($conditions as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$conditions = $temp;
					$temp   = "";
				}

				$sql = "DELETE FROM ".$table." WHERE idData IN (".$conditions.")";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedData   = $conditions;
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		//INSERT DATA
		public function insert($table, $fields, $values){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();
			$feedId		= "";

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($fields)) {
					foreach ($fields as $item) {
						if($temp  == "") $temp = $item;
						else $temp = $temp.",".$item;
					}

					$fields = $temp;
					$temp   = "";
				}

				if(is_array($values)) {
					foreach ($values as $item) {
						if($temp  == "") $temp = "'".$item."'";
						else $temp = $temp.",'".$item."'";
					}

					$values = $temp;
					$temp   = "";
				}

				$user = (isset($_SESSION['tulisan_user_username']) ? $_SESSION['tulisan_user_username'] : 'guest');
				$sql = "INSERT INTO ".$table."(".$fields.", createdBy, createdDate) VALUES (".$values.", '".$user."',NOW())";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
					$feedId 	= $this->db->lastInsertId();
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData, "feedId" => $feedId);

			/* result fetch */
			$json = $resultList;

			return $json;

		}

		//UPDATE DATA
		public function update($table, $values, $id){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();
			$feedId		= "";

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($values)) {
					foreach ($values as $item) {
						if($temp  == "") $temp = $item;
						else $temp = $temp.",".$item;
					}

					$values = $temp;
					$temp   = "";
				}

				if(!isset($_SESSION['tulisan_user_username'])) $_SESSION['tulisan_user_username'] = "guest";
				$sql = "UPDATE ".$table." SET ".$values.", changedBy = '".$_SESSION['tulisan_user_username']."', changedDate = NOW() WHERE idData = '".$id."'";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}

		//QUERY EXECT
		public function customQuery($sql){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();
			$feedId		= "";

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}


		public function updateMultiData($table, $values, $ids){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to collect data!";
			$feedData	= array();
			$feedId		= "";

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				if(is_array($values)) {
					foreach ($values as $item) {
						if($temp  == "") $temp = $item;
						else $temp = $temp.",".$item;
					}

					$values = $temp;
					$temp   = "";
				}

				if(is_array($ids)) {
					foreach ($ids as $value) {
						if($temp  == "") $temp = $value;
						else $temp = $temp.",".$value;
					}

					$ids = $temp;
					$temp   = "";
				}

				$sql = "UPDATE ".$table." SET ".$values.", changedBy = '".$_SESSION['tulisan_user_username']."', changedDate = NOW() WHERE idData IN (".$ids.")";

				$result = $this->db->query($sql);
				if($result){
					$feedStatus	= "success";
					$feedType   = "success";
					$feedMessage= "The process has been successful";
				}

				$feedType = $sql;
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}

		//EMAIL
		public function emailOrder($type, $recipient, $orderId){
			$eMessage= "Something went wrong, failed to send email!";

			try {
					$error   = 0;
					$subject = "";
					$message = "";
					switch ($type) {
						case 'placedOrder':
							$subject = "TULISAN - Hi, here's your order!";
							$message = $this->placeOrderText($orderId);
						break;

						case 'paid':
							$subject = "TULISAN - Hi, we ship your order!";
							$message = $this->paidOrderText($orderId);
						break;

						case 'shipped':
							$subject = "TULISAN - Hi, your order is on the way!";
							$message = $this->shippedOrderText($orderId);
						break;

						case 'complete':
							$subject = "TULISAN - Thank you!";
							$message = $this->completeOrderText($orderId);
						break;

						case 'cancel':
							$subject = "TULISAN - Your order has been canceled!";
							$message = $this->cancelOrderText($orderId);
						break;

						default:
							$error = 1;
						break;
					}

					if($error != 1 && email_active == true){
						$email = new PHPMailer(true); // Passing `true` enables exceptions
				    //Server settings
				    $email->SMTPDebug = 0; // Enable verbose debug output
				    $email->isSMTP(); // Set mailer to use SMTP
				    $email->Host = e_host;  // Specify main and backup SMTP servers
				    $email->SMTPAuth = true;  // Enable SMTP authentication
				    $email->Username = e_user; // SMTP username
				    $email->Password = e_pass; // SMTP password
				    $email->SMTPSecure = 'tls'; // Enable TLS encryption, `ssl` also accepted
				    $email->Port = 587; // TCP port to connect to
				    //Recipients
				    $email->setFrom(e_user, e_name);
				    $email->addAddress($recipient['email'], $recipient['name']); // Add a recipient
						$email->addCC(e_user);
				    $email->addReplyTo(e_user, 'Information');

						$email->AddEmbeddedImage('../assets/PICS/tulisan.png', 'logo_tulisan');
				    //Content
				    $email->isHTML(true);  // Set email format to HTML
				    $email->Subject = $subject;
				    $email->Body    = $message;
				    $email->AltBody = 'Please use Email that Support HTML Email.';

				    $email->send();
				    $eMessage = 'Message has been sent';
					}
			} catch (Exception $e) {
			    $eMessage = 'Mailer Error: ' . $email->ErrorInfo;
			}

			return $eMessage;
		}

		public function placeOrderText($orderId){
			$data = $this->fetchAllRecord('orders_item i JOIN products_variant v ON i.variantId = v.idData JOIN products p ON v.productId = p.idData', array("p.name", "v.sku", "i.price", "i.qty"), "orderId = ".$orderId."", "ORDER BY i.idData");
			if($data['feedStatus'] == "success"){
				$data = $data['feedData'];
			}else{
				$data = array();
			}

			$info = $this->fetchAllRecord('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank")
			, "o.idData = ".$orderId."", "");
			if($info['feedStatus'] == "success"){
				$info = $info['feedData'];
			}else{
				$info = array();
			}

			$dumb = array("name"=>"", "address"=>"");
			foreach ($info as $dataInfo) {
				$dumb['name'] = $dataInfo['name'];
				$dumb['address'] = $dataInfo['address']."<br/>".$dataInfo['city']." ".$dataInfo['zipCode']."<br/>".$dataInfo['country']."<br/>Phone : ".$dataInfo['phone'];
			}

			$htmlText = '<section style="float:left; width:100%;max-width:700px; font-family: Arial, Helvetica, sans-serif; box-sizing: border-box; font-size: 11px">
			  <img src="cid:logo_tulisan" style="width: 200px" />
				<h1>TULISAN</h1>
			  <span style="float: right; color: #CCC">INVOICE</span>
			  <hr style="margin: 20px 0; "/>
			  <h3>Thank you for your order!</h3>
			  <p>Your order number is#'.$orderId.'</p>
			  <p>Confirm your payment here: <a href="'.domain.'/page/paymentConfirm.html?oid='.$orderId.'">Confirm</a></p>
			  <hr style="margin: 20px 0 0 0; "/>
			  <div style="float:left; display: inline-block; width: 49%;">
			    <h4>Shipping Address</h4>
		      <p>'.$dumb['name'].'</p>
		      <p>'.$dumb['address'].'</p>
			  </div>
			  <div style="float:left; display: inline-block; width: 49%;">
			    <h4>Billing Address</h4>
					<p>'.$dumb['name'].'</p>
					<p>'.$dumb['address'].'</p>
			  </div>
			  <table width="100%" border="0" style="border-collapse: separate; margin-top: 30px; font-size: 11px" >
			    <tr style="background-color: #E9E2DB; height: 40px">
			      <th align="left" style="padding: 0 10px">Item</th>
			      <th>SKU</th>
			      <th>Price</th>
			      <th>Discount</th>
			      <th>Qty</th>
			      <th>Total</th>
			    </tr>';

				$grandTotal = 0;
				foreach ($data as $value) {
					$total 			= (int)$value['price'] * (int)$value['qty'];
					$grandTotal = $grandTotal + $total;
					$htmlText .=
			    '<tr style="background-color: #EEEEEE; height: 40px">
			      <td width="30%" style="padding: 0 10px">'.$value['name'].'</td>
			      <td align="center" style="padding: 0 10px">'.$value['sku'].'</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($value['price']).'</td>
			      <td align="center" style="padding: 0 10px">0</td>
			      <td align="center" style="padding: 0 10px">'.$value['qty'].'</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($total).'</td>
			    </tr>';
				}

				$htmlText .=
				'<tr>
			      <td align="right" colspan="5">Cart Total</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($grandTotal).'</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Discount</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Sales tax (TAX)</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Shipping</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5"><b>Grand Total</b></td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($grandTotal).'</td>
			    </tr>
			  </table>
			  <hr style="margin: 20px 0; "/>
			  <p>
			    Please read the important information below thoroughly. <br/><br/>

			    Dear our beloved customers, <br/><br/>

			    We now have a new payment method with DOKU. Since the new instalment is still relatively new and we are doing the process manually, we need your email confirming you selected DOKU as your payment method. Please simply reply this order confirmation to us and wait for our email to process your payment for your order.
			    Orders placed on Fridays, Saturdays, Sundays or holidays will be processed the following business day. We will ship your order, after we receiver your payment confirmation from DOKU automated system.
			    Please note that your order will automatically be cancelled if the payment is not confirmed within 24 hours after the order is made. You will be notified when your payment has been verified by our team.
			    If you select payment via Bank Transfer, please confirm your payment by sending the proof of payment (scanned or picture image) directly to our email (shop@tulisan.com) or simply reply back our Order Confirmation email and we will process and ship your immediately after we receive the proof.

			    <br/><br/>
			    Please make payment transfer to:
			    <br/><br/>
			    PT. Tulisan Susunan Tinta<br/>
			    Bank Mandiri<br/>
			    Branch: Iskandarsyah (Jakarta-Selatan)<br/>
			    Acc. No. 126-00-0689973-5<br/>
			    <br/><br/>
			    (Rupiah Account)
			    <br/><br/>
			    After making your transfer, please verify it by sending the proof of payment to shop@tulisan.com (you can scan or take a picture of it) with your order number and we will process your order after we receive it. Please note that shipping maybe delayed if we need to verify your information with you or your payment process.
			    Please allow 1-2 business days to process your order from our warehouse. Our standard shipping (free delivery) typically arrives between 3-5 business days. Rural and remote areas may incur longer delivery times. Orders placed on Fridays, Saturdays, Sundays or holidays will ship the following business day after we receive your proof of payment.
			    Note that your order will automatically be cancelled if the payment is not confirmed within 24 hours after the order is made. You will be notified when your payment has been verified by our team. Orders are only shipped after we receive your full payment.
			    <br/><br/>
			    Warmest regards,
			    <br/><br/><br/>
			    Team Tulisan.
			    <br/><br/>


			    <hr style="margin: 20px 0; "/>
			    Jika anda memilih metode pembayaran dengan DOKU, mohon tunggu email dari kami untuk dapat memproses pembayaran untuk pesanan Anda. Pesanan yang masuk ke sistem kami pada hari Jumat, Sabtu, minggu atau hari libur akan dikirim pada harı kerja berikutnya. Setelah kami Sudah memverifikasi pembayaran Anda. Kami akan memproses dan mengirimkan pesanan Anda, setelah kami menerima konfirmasi pembayaran dari Sistem Automasi DOKU dari pembayaran yang telah dilakukan.
			    Order Anda akan secara otomatis dibatalkan apabila pembayaran tidak terkonfirmasi dalam 24 jam setelah pembelin dilakukan. Anda akan menerima notifikasi saat pembayaran Anda telah diverifikasi Oleh Tim Tulisan.
			    Jika Anda memilih Pembayaran via bank transfer, mohon transfer ke:
			    <br/><br/>
			    PT. Tulisan Susunan Tinta<br/>
			    Bank Mandiri<br/>
			    Cabang: Iskandarsyah (Jakarta-Selatan)<br/>
			    Acc. No. 126-00-0689973-5<br/>
			    <br/><br/>
			    (Rupiah Account)
			    <br/><br/>
			    Setelah melakukan pembayaran, verifikasi status pembayaran Anda tengan mengirimkan bukti pembayaran ke shop@tulisan.com (bisa berupa scan atau foto) dengan memberikan nommer order pesanan Anda dan kami akan memproses pesanan Anda setelah kami menerima buktinya. Untuk diketahui pengiriman mungkin akan terlambat jika kami harus memverifikasi informasi kepada Anda atau tentang proses pembayaran Anda.
			    Kami membutuhkan 1-2 hari uituk memproses pesanan Anda dari warehouse kami. Pesanan yang masuk ke sistem kami pada hari Jumat, Sabtu, mingau atau hari libar akan dikirimkan pada hari kerja berikutnya setelah kami Sudan memverifikasi pembayaran Anda.
			    Order Anda akan secara otomatis dibatalkan apabila pembayaran tidak terkonfirmasi dalam 24 jam setelah pembelian dilakukan. Lahanan jasa pengiriman reguler kami (gratis biara pengiriman) biasanya sampai ditujuan antara 3-5 hari kerja. Untuk daerah jauh dari pusat pengiriman kami (yaitu Jakarta) akan sampai di tujuan lebih lama dari biasanya. Anda akan menerima notifikasi saat pembayaran Anda telah diverifikasi oleh Tim Tulisan. Order akan dikirimkan setelah pembayaran telah dilakukan secara penuh.
			    <br/><br/>
			    Salam hangat,
			    <br/><br/><br/>
			    Tim Tulisan.
			  </p>
			  <div style="margin-top: 20px">
			    <h3>PT TULISAN SUSUNAN TINTA</h3>
			    <div style="float:left; display: inline-block; width: 49%;">
			      <p>Darmawangsa Square – The City Walk </p>
			      <p>Ground Floor | Unit 24</p>
			      <p>Jalan Darmawangsa VI</p>
			      <p>Jakarta 12160, Indonesia</p>
			    </div>
			    <div style="float:left; display: inline-block; width: 49%;">
			      <p>T +62 21 7278 0235</p>
			      <p>shop@tulisan.com</p>
			      <p>www.tulisan.com</p>
			    </div>
			  </div>
			</section>';

			return $htmlText;
		}

		public function paidOrderText($orderId){
			$data = $this->fetchAllRecord('orders_item i JOIN products_variant v ON i.variantId = v.idData JOIN products p ON v.productId = p.idData', array("p.name", "v.sku", "i.price", "i.qty"), "orderId = ".$orderId."", "ORDER BY i.idData");
			if($data['feedStatus'] == "success"){
				$data = $data['feedData'];
			}else{
				$data = array();
			}

			$info = $this->fetchAllRecord('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank")
			, "o.idData = ".$orderId."", "");
			if($info['feedStatus'] == "success"){
				$info = $info['feedData'];
			}else{
				$info = array();
			}

			$dumb = array("name"=>"", "address"=>"");
			foreach ($info as $dataInfo) {
				$dumb['name'] = $dataInfo['name'];
				$dumb['address'] = $dataInfo['address']."<br/>".$dataInfo['city']." ".$dataInfo['zipCode']."<br/>".$dataInfo['country']."<br/>Phone : ".$dataInfo['phone'];
			}

			$htmlText = '<section style="float:left; width:100%;max-width:700px; font-family: Arial, Helvetica, sans-serif; box-sizing: border-box; font-size: 11px">
			  <img src="'.e_path.'/PICS/tulisan.png" style="width: 200px" />
			  <hr style="margin: 20px 0; "/>
			  <h3>Congratulations, your order is being processed!</h3>
			  <p>Your order number is <b>#'.$orderId.'</b>, Created on <b></b></p>
			  <p>Subtotal: <b>0</b></p>
			  <p>Shipping: <b>0</b></p>
			  <p>Total: <b>0</b></p>
			  <table width="100%" border="0" style="border-collapse: separate; margin-top: 10px; font-size: 11px" >
			    <tr style="background-color: #E9E2DB; height: 40px">
			      <th align="left" style="padding: 0 10px">Item</th>
			      <th>SKU</th>
			      <th>Price</th>
			      <th>Discount</th>
			      <th>Qty</th>
			      <th>Total</th>
			    </tr>';

				$grandTotal = 0;
				foreach ($data as $value) {
					$total 			= (int)$value['price'] * (int)$value['qty'];
					$grandTotal = $grandTotal + $total;
					$htmlText .=
			    '<tr style="background-color: #EEEEEE; height: 40px">
			      <td width="30%" style="padding: 0 10px">'.$value['name'].'</td>
			      <td align="center" style="padding: 0 10px">'.$value['sku'].'</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($value['price']).'</td>
			      <td align="center" style="padding: 0 10px">0</td>
			      <td align="center" style="padding: 0 10px">'.$value['qty'].'</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($total).'</td>
			    </tr>';
				}

				$htmlText .=
				'<tr>
			      <td align="right" colspan="5">Cart Total</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($grandTotal).'</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Discount</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Sales tax (TAX)</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Shipping</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5"><b>Grand Total</b></td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($grandTotal).'</td>
			    </tr>
			  </table>
			  <hr style="margin: 20px 0 0 0; "/>
			  <h3>Customer details</h3>
			  <div style="float:left; display: inline-block; width: 49%;">
			    <h4>Shipping Address</h4>
					<p>'.$dumb['name'].'</p>
					<p>'.$dumb['address'].'</p>
			  </div>
			  <div style="float:left; display: inline-block; width: 49%;">
			    <h4>Billing Address</h4>
					<p>'.$dumb['name'].'</p>
					<p>'.$dumb['address'].'</p>
			  </div>
			  <div style="clear: both"></div>
			  <hr style="margin: 20px 0 0 0; "/>
			  <p>This is an automatic message, Do not reply to it.</p>
			  <div style="margin-top: 20px">
			    <h3>PT TULISAN SUSUNAN TINTA</h3>
			    <div style="float:left; display: inline-block; width: 49%;">
			      <p>Darmawangsa Square – The City Walk </p>
			      <p>Ground Floor | Unit 24</p>
			      <p>Jalan Darmawangsa VI</p>
			      <p>Jakarta 12160, Indonesia</p>
			    </div>
			    <div style="float:left; display: inline-block; width: 49%;">
			      <p>T +62 21 7278 0235</p>
			      <p>shop@tulisan.com</p>
			      <p>www.tulisan.com</p>
			    </div>
			  </div>
			</section>';

			return $htmlText;
		}

		public function shippedOrderText($orderId){
			$data = $this->fetchAllRecord('orders_item i JOIN products_variant v ON i.variantId = v.idData JOIN products p ON v.productId = p.idData', array("p.name", "v.sku", "i.price", "i.qty"), "orderId = ".$orderId."", "ORDER BY i.idData");
			if($data['feedStatus'] == "success"){
				$data = $data['feedData'];
			}else{
				$data = array();
			}

			$info = $this->fetchAllRecord('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',
			array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank", "o.receiptNumber", "s.name as shippingAs", "s.link")
			, "o.idData = ".$orderId."", "");

			if($info['feedStatus'] == "success"){
				$info = $info['feedData'];
			}else{
				$info = array();
			}

			$dumb = array("name"=>"", "address"=>"");
			foreach ($info as $dataInfo) {
				$dumb['name'] = $dataInfo['name'];
				$dumb['shippingAs'] = $dataInfo['shippingAs'];
				$dumb['receiptNumber'] = $dataInfo['receiptNumber'];
				$dumb['link'] = $dataInfo['link'];
				$dumb['address'] = $dataInfo['address']."<br/>".$dataInfo['city']." ".$dataInfo['zipCode']."<br/>".$dataInfo['country']."<br/>Phone : ".$dataInfo['phone'];
			}

			$htmlText = '<section style="float:left; width:100%;max-width:700px; font-family: Arial, Helvetica, sans-serif; box-sizing: border-box; font-size: 11px">
			  <img src="'.e_path.'/PICS/tulisan.png" style="width: 200px" />
			  <hr style="margin: 20px 0; "/>
			  <h3>Great News, your order has shipped!</h3>
			  <p>Your order number is <b>#'.$orderId.'</b>, Created on <b></b></p>
			  <hr style="margin: 10px 0; "/>
			  <h4><b>'.$dumb['shippingAs'].'</b></h4>
			  <p>Your tracking number is <b>'.$dumb['receiptNumber'].'</b></p>
			  <p>Free delivery within Indonesia: Your tracking number is (nomor airway bill / nomor resi) please</p>
			  <p>Check it here : <a href="'.$dumb['link'].'"><b>'.$dumb['link'].'</b></a></p>
			  <hr style="margin: 10px 0; "/>
				<p>Please confirm if you have received the order item : <a href="'.domain.'/page/receivedConfirmation.html?oid='.$orderId.'"><b>'.domain.'/page/receivedConfirmation.html?oid='.$orderId.'</b></a></p>
			  <hr style="margin: 10px 0; "/>
			  <div style="display: inline-block; width: 49%;">
			    <h4>Shipping Address</h4>
					<p>'.$dumb['name'].'</p>
					<p>'.$dumb['address'].'</p>
			  </div>
			  <div style="clear: both"></div>
			  <table width="100%" border="0" style="border-collapse: separate; margin-top: 10px; font-size: 11px" >
			    <tr style="background-color: #E9E2DB; height: 40px">
			      <th align="left" style="padding: 0 10px">Item</th>
			      <th>SKU</th>
			      <th>Price</th>
			      <th>Discount</th>
			      <th>Qty</th>
			      <th>Total</th>
			    </tr>';

				$grandTotal = 0;
				foreach ($data as $value) {
					$total 			= (int)$value['price'] * (int)$value['qty'];
					$grandTotal = $grandTotal + $total;
					$htmlText .=
			    '<tr style="background-color: #EEEEEE; height: 40px">
			      <td width="30%" style="padding: 0 10px">'.$value['name'].'</td>
			      <td align="center" style="padding: 0 10px">'.$value['sku'].'</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($value['price']).'</td>
			      <td align="center" style="padding: 0 10px">0</td>
			      <td align="center" style="padding: 0 10px">'.$value['qty'].'</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($total).'</td>
			    </tr>';
				}

				$htmlText .=
				'<tr>
			      <td align="right" colspan="5">Cart Total</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($grandTotal).'</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Discount</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Sales tax (TAX)</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Shipping</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5"><b>Grand Total</b></td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($grandTotal).'</td>
			    </tr>
			  </table>
			  <hr style="margin: 20px 0 0 0; "/>
			  <p>This is an automatic message, Do not reply to it.</p>
			  <div style="margin-top: 20px">
			    <h3>PT TULISAN SUSUNAN TINTA</h3>
			    <div style="float:left; display: inline-block; width: 49%;">
			      <p>Darmawangsa Square – The City Walk </p>
			      <p>Ground Floor | Unit 24</p>
			      <p>Jalan Darmawangsa VI</p>
			      <p>Jakarta 12160, Indonesia</p>
			    </div>
			    <div style="float:left; display: inline-block; width: 49%;">
			      <p>T +62 21 7278 0235</p>
			      <p>shop@tulisan.com</p>
			      <p>www.tulisan.com</p>
			    </div>
			  </div>
			</section>';

			return $htmlText;
		}

		public function completeOrderText($orderId){
			$data = $this->fetchAllRecord('orders_item i JOIN products_variant v ON i.variantId = v.idData JOIN products p ON v.productId = p.idData', array("p.name", "v.sku", "i.price", "i.qty"), "orderId = ".$orderId."", "ORDER BY i.idData");
			if($data['feedStatus'] == "success"){
				$data = $data['feedData'];
			}else{
				$data = array();
			}

			$info = $this->fetchAllRecord('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank")
			, "o.idData = ".$orderId."", "");
			if($info['feedStatus'] == "success"){
				$info = $info['feedData'];
			}else{
				$info = array();
			}

			$dumb = array("name"=>"", "address"=>"");
			foreach ($info as $dataInfo) {
				$dumb['name'] = $dataInfo['name'];
				$dumb['address'] = $dataInfo['address']."<br/>".$dataInfo['city']." ".$dataInfo['zipCode']."<br/>".$dataInfo['country']."<br/>Phone : ".$dataInfo['phone'];
			}

			$htmlText = '<section style="float:left; width:100%;max-width:700px; font-family: Arial, Helvetica, sans-serif; box-sizing: border-box; font-size: 11px">
			  <img src="'.e_path.'/PICS/tulisan.png" style="width: 200px" />
			  <hr style="margin: 20px 0; "/>
			  <h3>Congratulations, your order has completed!</h3>
			  <h2>Thank you, we are waiting for your next order.</h2>
			  <p>Your order number is <b>#'.$orderId.'</b>, Created on <b></b></p>
			  <table width="100%" border="0" style="border-collapse: separate; margin-top: 10px; font-size: 11px" >
			    <tr style="background-color: #E9E2DB; height: 40px">
			      <th align="left" style="padding: 0 10px">Item</th>
			      <th>SKU</th>
			      <th>Price</th>
			      <th>Discount</th>
			      <th>Qty</th>
			      <th>Total</th>
			    </tr>';

				$grandTotal = 0;
				foreach ($data as $value) {
					$total 			= (int)$value['price'] * (int)$value['qty'];
					$grandTotal = $grandTotal + $total;
					$htmlText .=
			    '<tr style="background-color: #EEEEEE; height: 40px">
			      <td width="30%" style="padding: 0 10px">'.$value['name'].'</td>
			      <td align="center" style="padding: 0 10px">'.$value['sku'].'</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($value['price']).'</td>
			      <td align="center" style="padding: 0 10px">0</td>
			      <td align="center" style="padding: 0 10px">'.$value['qty'].'</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($total).'</td>
			    </tr>';
				}

				$htmlText .=
				'<tr>
			      <td align="right" colspan="5">Cart Total</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($grandTotal).'</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Discount</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Sales tax (TAX)</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Shipping</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5"><b>Grand Total</b></td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($grandTotal).'</td>
			    </tr>
			  </table>
			  <hr style="margin: 20px 0 0 0; "/>
			  <h3>Customer details</h3>
			  <div style="float:left; display: inline-block; width: 49%;">
			    <h4>Shipping Address</h4>
					<p>'.$dumb['name'].'</p>
					<p>'.$dumb['address'].'</p>
			  </div>
			  <div style="float:left; display: inline-block; width: 49%;">
			    <h4>Billing Address</h4>
					<p>'.$dumb['name'].'</p>
					<p>'.$dumb['address'].'</p>
			  </div>
			  <div style="clear: both"></div>
			  <hr style="margin: 20px 0 0 0; "/>
			  <p>This is an automatic message, Do not reply to it.</p>
			  <div style="margin-top: 20px">
			    <h3>PT TULISAN SUSUNAN TINTA</h3>
			    <div style="float:left; display: inline-block; width: 49%;">
			      <p>Darmawangsa Square – The City Walk </p>
			      <p>Ground Floor | Unit 24</p>
			      <p>Jalan Darmawangsa VI</p>
			      <p>Jakarta 12160, Indonesia</p>
			    </div>
			    <div style="float:left; display: inline-block; width: 49%;">
			      <p>T +62 21 7278 0235</p>
			      <p>shop@tulisan.com</p>
			      <p>www.tulisan.com</p>
			    </div>
			  </div>
			</section>';

			return $htmlText;
		}

		public function cancelOrderText($orderId){
			$data = $this->fetchAllRecord('orders_item i JOIN products_variant v ON i.variantId = v.idData JOIN products p ON v.productId = p.idData', array("p.name", "v.sku", "i.price", "i.qty"), "orderId = ".$orderId."", "ORDER BY i.idData");
			if($data['feedStatus'] == "success"){
				$data = $data['feedData'];
			}else{
				$data = array();
			}

			$info = $this->fetchAllRecord('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank")
			, "o.idData = ".$orderId."", "");
			if($info['feedStatus'] == "success"){
				$info = $info['feedData'];
			}else{
				$info = array();
			}

			$dumb = array("name"=>"", "address"=>"");
			foreach ($info as $dataInfo) {
				$dumb['name'] = $dataInfo['name'];
				$dumb['address'] = $dataInfo['address']."<br/>".$dataInfo['city']." ".$dataInfo['zipCode']."<br/>".$dataInfo['country']."<br/>Phone : ".$dataInfo['phone'];
			}

			$htmlText = '<section style="float:left; width:100%;max-width:700px; font-family: Arial, Helvetica, sans-serif; box-sizing: border-box; font-size: 11px">
			  <img src="'.e_path.'/PICS/tulisan.png" style="width: 200px" />
				<h1>TULISAN</h1>
			  <hr style="margin: 20px 0; "/>
			  <h3>Your order has been canceled!</h3>
			  <h2>Thank you, we are waiting for your next order.</h2>
			  <p>Your recent order number is <b>#'.$orderId.'</b>, Created on <b></b></p>
			  <table width="100%" border="0" style="border-collapse: separate; margin-top: 10px; font-size: 11px" >
			    <tr style="background-color: #E9E2DB; height: 40px">
			      <th align="left" style="padding: 0 10px">Item</th>
			      <th>SKU</th>
			      <th>Price</th>
			      <th>Discount</th>
			      <th>Qty</th>
			      <th>Total</th>
			    </tr>';

				$grandTotal = 0;
				foreach ($data as $value) {
					$total 			= (int)$value['price'] * (int)$value['qty'];
					$grandTotal = $grandTotal + $total;
					$htmlText .=
			    '<tr style="background-color: #EEEEEE; height: 40px">
			      <td width="30%" style="padding: 0 10px">'.$value['name'].'</td>
			      <td align="center" style="padding: 0 10px">'.$value['sku'].'</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($value['price']).'</td>
			      <td align="center" style="padding: 0 10px">0</td>
			      <td align="center" style="padding: 0 10px">'.$value['qty'].'</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($total).'</td>
			    </tr>';
				}

				$htmlText .=
				'<tr>
			      <td align="right" colspan="5">Cart Total</td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($grandTotal).'</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Discount</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Sales tax (TAX)</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5">Shipping</td>
			      <td align="right" style="padding: 0 10px">0</td>
			    </tr>
			    <tr>
			      <td align="right" colspan="5"><b>Grand Total</b></td>
			      <td align="right" style="padding: 0 10px">Rp. '.number_format($grandTotal).'</td>
			    </tr>
			  </table>
			  <hr style="margin: 20px 0 0 0; "/>
			  <h3>Customer details</h3>
			  <div style="float:left; display: inline-block; width: 49%;">
			    <h4>Shipping Address</h4>
					<p>'.$dumb['name'].'</p>
					<p>'.$dumb['address'].'</p>
			  </div>
			  <div style="float:left; display: inline-block; width: 49%;">
			    <h4>Billing Address</h4>
					<p>'.$dumb['name'].'</p>
					<p>'.$dumb['address'].'</p>
			  </div>
			  <div style="clear: both"></div>
			  <hr style="margin: 20px 0 0 0; "/>
			  <p>This is an automatic message, Do not reply to it.</p>
			  <div style="margin-top: 20px">
			    <h3>PT TULISAN SUSUNAN TINTA</h3>
			    <div style="float:left; display: inline-block; width: 49%;">
			      <p>Darmawangsa Square – The City Walk </p>
			      <p>Ground Floor | Unit 24</p>
			      <p>Jalan Darmawangsa VI</p>
			      <p>Jakarta 12160, Indonesia</p>
			    </div>
			    <div style="float:left; display: inline-block; width: 49%;">
			      <p>T +62 21 7278 0235</p>
			      <p>shop@tulisan.com</p>
			      <p>www.tulisan.com</p>
			    </div>
			  </div>
			</section>';

			return $htmlText;
		}

		public function emailSender($to, $subject, $message){
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to send email!";
			$feedData		= array();
			$sender 		= "Customer Service";
			$emailSender= "cs@tulisan.com";

			$headers = "MIME-Version: 1.0" . "\r\n";
			$headers .= "Content-type:text/html;charset=iso-8859-1" . "\r\n";

			// More headers
			$headers .= 'From: Tulisan.com <noreply@tulisan.com>'."\r\n" . 'Reply-To: '.$sender.' <'.$emailSender.'>'."\r\n";
			// $headers .= 'Cc: admin@yourdomain.com' . "\r\n"; //untuk cc lebih dari satu tinggal kasih koma

			@mail($to,$subject,$message,$headers);
			if(@mail)
			{
				$feedStatus	= "success";
				$feedType   = "success";
				$feedMessage= "The process has been successful";
			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;
		}

		public function uploadSingleImage($image, $dir, $table, $field, $id, $que = ""){
			error_reporting(E_ALL);
			/* initial condition */
			$resultList = array();
			$feedStatus	= "failed";
			$feedType   = "danger";
			$feedMessage= "Something went wrong, failed to upload data!";
			$feedData	= array();

			$temp		= "";

			/* open connection */
			$gate = $this->db;
			if($gate){

				/*upload image*/
				if(isset($image)){

					$file_name = $image['name'];
				    $file_size = $image['size'];
				    $file_tmp  = $image['tmp_name'];
				    $file_type = $image['type'];

					$Validextensions = array("jpeg", "JPEG", "jpg", "JPG", "png", "PNG", "gif", "GIF");
					$temporary 		 = explode(".", $file_name);
					$fileExtension   = end($temporary);
					$newFileName 	 = $dir."_".$id."_".$que.date("Ymdhisa").".".$fileExtension;
					$saveAs 		 = "../assets/".$dir."/".$newFileName;

					if (in_array($fileExtension, $Validextensions)) {
						if(move_uploaded_file($file_tmp, $saveAs)){
							$sql = "UPDATE ".$table." SET ".$field."='".$newFileName."' WHERE idData ='".$id."'";

							$result = $this->db->query($sql);
							if($result){
								$feedStatus	= "success";
								$feedType   = "success".is_dir($saveAs);
								$feedMessage= "The process has been successful";
							}
						}
					}
				}
				/*upload end*/

			}

			$resultList = array( "feedStatus" => $feedStatus, "feedType" => $feedType, "feedMessage" => $feedMessage, "feedData" => $feedData);

			/* result fetch */
			$json = $resultList;

			return $json;

		}

		public function updatePayment($values, $id){
			$resultList = $this->update('orders', $values, $id);
			return $resultList;
		}
	}
?>
