<?php
  require_once('../data/payment/Veritrans.php');
  require_once('../data/protected/snap.php');
  Veritrans_Config::$isProduction = false;
  Veritrans_Config::$serverKey = 'SB-Mid-server-l8u18wZuwEFkIVaJvCbkV-RI';
  $notif = new Veritrans_Notification();
  $order  = new order();

  $transaction = $notif->transaction_status;
  $type = $notif->payment_type;
  $order_id = $notif->order_id;
  $fraud = $notif->fraud_status;
  $status = 0;

  if ($transaction == 'capture') {
    // For credit card transaction, we need to check whether transaction is challenge by FDS or not
    if ($type == 'credit_card'){
      if($fraud == 'challenge'){
        // TODO set payment status in merchant's database to 'Challenge by FDS'
        // TODO merchant should decide whether this transaction is authorized or not in MAP
        echo "Transaction order_id: " . $order_id ." is challenged by FDS";
      }
      else {
      // TODO set payment status in merchant's database to 'Success'
      echo "Transaction order_id: " . $order_id ." successfully captured using " . $type;
      }
    }
    $status = 1;
  }
  else if ($transaction == 'settlement'){
    // TODO set payment status in merchant's database to 'Settlement'
    echo "Transaction order_id: " . $order_id ." successfully transfered using " . $type;
    $status = 1;
  }
  else if($transaction == 'pending'){
    // TODO set payment status in merchant's database to 'Pending'
    echo "Waiting customer to finish transaction order_id: " . $order_id . " using " . $type;
  }
  else if ($transaction == 'deny') {
    // TODO set payment status in merchant's database to 'Denied'
    echo "Payment using " . $type . " for transaction order_id: " . $order_id . " is denied.";
  }
  else if ($transaction == 'expire') {
    // TODO set payment status in merchant's database to 'expire'
    echo "Payment using " . $type . " for transaction order_id: " . $order_id . " is expired.";
  }
  else if ($transaction == 'cancel') {
    // TODO set payment status in merchant's database to 'Denied'
    echo "Payment using " . $type . " for transaction order_id: " . $order_id . " is canceled.";
  }

  $values =
    'paymentMethod       = "'.$notif->payment_type.'",'.
    'paymentId           = "'.$notif->transaction_id.'",'.
    'paymentMessage      = "'.$notif->status_message.'",'.
    'paymentTime         = "'.$notif->transaction_time.'",'.
    'paymentStatus       = "'.$notif->transaction_status.'",'.
    'paymentSignatureKey = "'.$notif->signature_key.'"';

  if($status == 1) {
    $values = $values. ", status = 'Paid'";
  }

  $result = $order->updatePayment($values, $order_id);
?>
