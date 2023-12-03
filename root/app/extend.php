<?php

/*
 * This file is part of Flarum.
 *
 * For detailed copyright and license information, please view the
 * LICENSE file that was distributed with this source code.
 */

use Flarum\Extend;

return [
    new Blomstra\Redis\Extend\Redis([
        'scheme' => 'tls',
        'host' => getenv('REDIS_HOST'),
        'password' => getenv('REDIS_PASSWORD'),
        'port' => getenv('REDIS_PORT'),
        'database' => 1,
        // 'read_write_timeout' => -1
    ])
];    
