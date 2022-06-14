<?php
require('vendor/autoload.php');
use \PhpMqtt\Client\MqttClient;
$server   = 'some-broker.example.com';
$port     = 1883;
$clientId = 'test-subscriber';

$mqtt = new \PhpMqtt\Client\MqttClient($server, $port, $clientId);
$mqtt->connect();
$mqtt->subscribe('php-mqtt/client/test', function ($topic, $message) {
    echo sprintf("Received message on topic [%s]: %s\n", $topic, $message);
}, 0);
$mqtt->loop(true);
$mqtt->disconnect();


function decode_binary ($i){
	$i=bindec("$i");
	$i = $i / 100;
	return $i;
}

/*$f=decode_binary(1000101011111);
echo "$f";*/





?>