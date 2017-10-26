<?php
//https://www.leaseweb.com/labs/2015/10/creating-a-simple-rest-api-in-php/
ini_set( 'html_errors', false );

date_default_timezone_set( 'Europe/Rome' );

header( 'Content-Type: application/json' );
header( 'Access-Control-Allow-Origin: *' );

// get the HTTP method, path and body of the request
$method  = $_SERVER['REQUEST_METHOD'];
$request = explode( '/', trim($_SERVER['PATH_INFO'], '/' ) );
$input   = json_decode( file_get_contents( 'php://input' ), true );
?>