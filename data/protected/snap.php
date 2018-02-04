<?php
	// Payment gateway using midtrans plugin (Veritrans)
	Class snap {
		public function __construct(){
			// if (session_status() == PHP_SESSION_NONE) {session_start();} // session start
			if (session_id() == '') { session_start(); }
			require_once('protected/config.php');
			$this->db = openGate();

			// Configurations
			require_once('payment/Veritrans/Config.php');

			// Veritrans API Resources
			require_once('payment/Veritrans/Transaction.php');

			// Plumbing
			require_once('payment/Veritrans/ApiRequestor.php');
			require_once('payment/Veritrans/SnapApiRequestor.php');
			require_once('payment/Veritrans/Notification.php');
			require_once('payment/Veritrans/VtDirect.php');
			require_once('payment/Veritrans/VtWeb.php');
			require_once('payment/Veritrans/Snap.php');

			// Sanitization
			require_once('payment/Veritrans/Sanitizer.php');
		}

		public function requestData($post, $target){
			switch($target){
				case "requestToken" : $resultList = $this->requestToken($post); break;
				default	   			    : $resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array()); break;
			}

			/* result fetch */
			$json = $resultList;

      return $json;
		}

		public function requestToken($data){
			$resultList = array( "feedStatus" => "failed", "feedType" => "danger", "feedMessage" => "Something went wrong, failed to collect data!", "feedData" => array());

			//Set Your server key
			Veritrans_Config::$serverKey = "SB-Mid-server-l8u18wZuwEFkIVaJvCbkV-RI";

			// Uncomment for production environment
			// Veritrans_Config::$isProduction = true;

			Veritrans_Config::$isSanitized = true;
			Veritrans_Config::$is3ds = true;

			$orderId = $data['keyword'];
			$data = $this->fetchAllRecord('orders_item i JOIN products_variant v ON i.variantId = v.idData JOIN products p ON v.productId = p.idData', array("v.idData, p.name", "v.sku", "i.price", "i.qty"), "orderId = ".$orderId."", "ORDER BY i.idData");
			if($data['feedStatus'] == "success"){
				$data = $data['feedData'];
			}else{
				$data = array();
			}

			if(count($data) > 0){
				$total = 0;
				$grandTotal = 0;
				$item_details = array();
				foreach ($data as $value) {
					$total 			= (int)$value['price'] * (int)$value['qty'];
					$grandTotal = $grandTotal + $total;
					array_push($item_details, array(
				    'id' => $value['idData'],
				    'price' => (int)$value['price'],
				    'quantity' => (int)$value['qty'],
				    'name' => $value['name']
			    ));
				}

				// Fill transaction details
				$transaction_details = array(
				  'order_id' => $orderId,
				  'gross_amount' => $grandTotal, // no decimal allowed
				);


				$info = $this->fetchAllRecord('orders o JOIN countries c ON o.country = c.country_code LEFT JOIN shipping_options s ON o.shippingMethod = s.idData',array("o.name", "o.address", "o.city", "o.zipCode", "c.country_name as country", "c.country_code_iso_3 as country_code", "o.phone", "o.email", "o.total", "o.paymentMethod", "o.bank")
				, "o.idData = ".$orderId."", "");
				if($info['feedStatus'] == "success"){
					$info = $info['feedData'];
				}else{
					$info = array();
				}

				$dumb = array("name"=>"", "address"=>"");
				foreach ($info as $dataInfo) {
					$dumb['name'] = $dataInfo['name'];
					$dumb['email'] = $dataInfo['email'];
					$dumb['address'] = $dataInfo['address'];
					$dumb['city'] = $dataInfo['city'];
					$dumb['zipCode'] = $dataInfo['zipCode'];
					$dumb['phone'] = $dataInfo['phone'];
					$dumb['country_code'] = $dataInfo['country_code'];
				}

				// Optional
				$billing_address = array(
				    'first_name'    => $dumb['name'],
				    'last_name'     => '',
				    'address'       => $dumb['address'],
				    'city'          => $dumb['city'],
				    'postal_code'   => $dumb['zipCode'],
				    'phone'         => $dumb['phone'],
				    'country_code'  => $dumb['country_code']
				    );

				// Optional
				$shipping_address = array(
						'first_name'    => $dumb['name'],
						'last_name'     => '',
						'address'       => $dumb['address'],
						'city'          => $dumb['city'],
						'postal_code'   => $dumb['zipCode'],
						'phone'         => $dumb['phone'],
						'country_code'  => $dumb['country_code']
				    );

				$customer_details = array(
				    'first_name'    => $dumb['name'], //optional
						'last_name'     => '',
				    'email'         => $dumb['email'], //mandatory
				    'phone'         => $dumb['phone'], //mandatory
				    'billing_address'  => $billing_address, //optional
				    'shipping_address' => $shipping_address //optional
				    );

				// Fill transaction details
				$transaction = array(
				    'transaction_details' => $transaction_details,
				    'customer_details' => $customer_details,
				    'item_details' => $item_details,
				    );

				$snapToken = Veritrans_Snap::getSnapToken($transaction);
				$resultList = array( "feedStatus" => "success", "feedType" => "success", "feedMessage" => "", "feedData" => $snapToken);
			}
			return $resultList;
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
	}
?>
