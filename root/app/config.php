<?php 
return array (
  'debug' => getenv('DEBUG') === 'true' ? true : false,
  'offline' => false,
  'database' => array (
    'driver' => 'mysql',
    'host' => getenv('DB_HOST'),
    'port' => getenv('DB_PORT'),
    'database' => getenv('DB_NAME'),
    'username' => getenv('DB_USER'),
    'password' => getenv('DB_PASS'),
    'charset' => 'utf8mb4',
    'collation' => 'utf8mb4_unicode_ci',
    'prefix' => getenv('DB_PREF'),
    'strict' => false,
  ),
  'url' => getenv('FORUM_URL'),
  'paths' => array (
    'api' => 'api',
    'admin' => 'admin',
  ),
);
?>