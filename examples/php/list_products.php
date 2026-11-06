<?php
// List Tracked Products – PHP example (ext-curl)
// Usage: ASIN_API_KEY=your-key php list_products.php

function call(string $method, string $url, ?string $body = null): string
{
    $ch = curl_init($url);
    $headers = ['Authorization: Bearer ' . getenv('ASIN_API_KEY')];
    if ($body !== null) {
        $headers[] = 'Content-Type: application/json';
        curl_setopt($ch, CURLOPT_POSTFIELDS, $body);
    }
    curl_setopt_array($ch, [
        CURLOPT_CUSTOMREQUEST => $method,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT => 120,
        CURLOPT_HTTPHEADER => $headers,
    ]);
    $res = curl_exec($ch);
    $status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    if ($status >= 400) {
        fwrite(STDERR, "HTTP $status: $res\n");
        exit(1);
    }
    return $res;
}

$query = http_build_query([
    'filter' => 'drops',
    'limit' => '20'
]);
$response = call('GET', 'https://www.asin.dev/api/v1/products' . ($query ? '?' . $query : ''));

echo json_encode(json_decode($response, true), JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE), PHP_EOL;
