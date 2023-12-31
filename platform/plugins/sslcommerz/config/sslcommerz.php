<?php

return [
    // For Sandbox, use "https://sandbox.sslcommerz.com"
    // For Live, use "https://securepay.sslcommerz.com"
    'apiUrl' => [
        'make_payment' => '/gwprocess/v4/api.php',
        'transaction_status' => '/validator/api/merchantTransIDvalidationAPI.php',
        'order_validate' => '/validator/api/validationserverAPI.php',
        'refund_payment' => '/validator/api/merchantTransIDvalidationAPI.php',
        'refund_status' => '/validator/api/merchantTransIDvalidationAPI.php',
        'payment_detail' => '/validator/api/merchantTransIDvalidationAPI.php',
    ],
    'connect_from_localhost' => env('IS_LOCALHOST', true), // For Sandbox, use "true", For Live, use "false"
    'success_url' => '/sslcommerz/payment/success',
    'failed_url' => '/sslcommerz/payment/fail',
    'cancel_url' => '/sslcommerz/payment/cancel',
    'ipn_url' => '/sslcommerz/payment/ipn',
];
