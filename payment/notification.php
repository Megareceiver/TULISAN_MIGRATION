<?php
  // Configurations
  require_once('../data/payment/Veritrans/Config.php');

  // Veritrans API Resources
  require_once('../data/payment/Veritrans/Transaction.php');

  // Plumbing
  require_once('../data/payment/Veritrans/ApiRequestor.php');
  require_once('../data/payment/Veritrans/SnapApiRequestor.php');
  require_once('../data/payment/Veritrans/Notification.php');
  require_once('../data/payment/Veritrans/VtDirect.php');
  require_once('../data/payment/Veritrans/VtWeb.php');
  require_once('../data/payment/Veritrans/Snap.php');

  // Sanitization
  require_once('../data/payment/Veritrans/Sanitizer.php');

  //modul start
  Veritrans_Config::$isProduction = false;
  Veritrans_Config::$serverKey = 'SB-Mid-server-l8u18wZuwEFkIVaJvCbkV-RI';
  $notif = new Veritrans_Notification();
  $notification = new notification();
  print_r($notification->execPayment($notif));



  Class notification {
		public function __construct(){
			// if (session_status() == PHP_SESSION_NONE) {session_start();} // session start
			if (session_id() == '') { session_start(); }
			require_once('../data/protected/config.php');
			$this->db = openGate();
		}

    public function execPayment($notif){
      // $values =
      //   'paymentMethod       = "'.$notif['payment_type'].'",'.
      //   'paymentId           = "'.$notif['transaction_id'].'",'.
      //   'paymentMessage      = "'.$notif['status_message'].'",'.
      //   'paymentTime         = "'.$notif['transaction_time'].'",'.
      //   'paymentStatus       = "'.$notif['transaction_status'].'",'.
      //   'paymentSignatureKey = "'.$notif['signature_key'].'"';
      $transaction   = $notif->transaction_status;
      $type          = $notif->payment_type;
      $order_id      = $notif->order_id;
      $fraud         = $notif->fraud_status;
      $status        = 0;
      $status_message= "";

      if ($transaction == 'capture') {
        // For credit card transaction, we need to check whether transaction is challenge by FDS or not
        if ($type == 'credit_card'){
          if($fraud == 'challenge'){
            // TODO set payment status in merchant's database to 'Challenge by FDS'
            // TODO merchant should decide whether this transaction is authorized or not in MAP
            $status_message = "Transaction order_id: " . $order_id ." is challenged by FDS";
          }
          else {
            // TODO set payment status in merchant's database to 'Success'
            $status_message = "Transaction order_id: " . $order_id ." successfully captured using " . $type;
          }
        }
        $status = 1;
      }
      else if ($transaction == 'settlement'){
        // TODO set payment status in merchant's database to 'Settlement'
        $status_message = "Transaction order_id: " . $order_id ." successfully transfered using " . $type;
        $status = 1;
      }
      else if($transaction == 'pending'){
        // TODO set payment status in merchant's database to 'Pending'
        $status_message = "Waiting customer to finish transaction order_id: " . $order_id . " using " . $type;
      }
      else if ($transaction == 'deny') {
        // TODO set payment status in merchant's database to 'Denied'
        $status_message = "Payment using " . $type . " for transaction order_id: " . $order_id . " is denied.";
      }
      else if ($transaction == 'expire') {
        // TODO set payment status in merchant's database to 'expire'
        $status_message = "Payment using " . $type . " for transaction order_id: " . $order_id . " is expired.";
      }
      else if ($transaction == 'cancel') {
        // TODO set payment status in merchant's database to 'Denied'
        $status_message = "Payment using " . $type . " for transaction order_id: " . $order_id . " is canceled.";
      }

      $values =
        'paymentMethod       = "'.$notif->payment_type.'",'.
        'paymentId           = "'.$notif->transaction_id.'",'.
        'paymentMessage      = "'.$status_message.'",'.
        'paymentTime         = "'.$notif->transaction_time.'",'.
        'paymentStatus       = "'.$notif->transaction_status.'",'.
        'paymentSignatureKey = "'.$notif->signature_key.'"';

      if($status == 1) {
        $values = $values. ", status = 'Paid'";
      }

      $result = $this->updatePayment($values, $order_id);
      return $result;
    }

    public function updatePayment($values, $id){
			$resultList = $this->update('orders', $values, $id);
			return $resultList;
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
  }
?>
