<?php

// @TODO add to .envvars
$oAuth = "";
$secret = "";

$userAgent = "KURL KLIENT/0.1 by x-fool";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "ttps://www.reddit.com/api/v1/access_token");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_USERAGENT, $userAgent);
$posts = curl_exec($ch);
curl_close($ch);
