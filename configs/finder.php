<?php

use StubsGenerator\Finder;

return Finder::create()
    ->in(array(
        'source/surecart',
    ))
    ->sortByName(true)
;
