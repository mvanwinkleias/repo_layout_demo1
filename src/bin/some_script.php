<?php

set_include_path(join(
    PATH_SEPARATOR,
    [
        dirname(realpath($argv[0])).'/../lib/php7',
        '/opt/IAS/lib/php7',
        get_include_path(),
    ]
));

include "IAS/HelloRepoLayout.php";

$app = new IAS\HelloRepoLayout();

$app->hello();
