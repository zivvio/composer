#!/bin/sh -e


php ../../make_composer_json.php composer.json << EOF
{
    "require": {
        "zivvio/zivvio": "~5.0.0"
    },
    "config": {
        "sort-packages": true,
        "allow-plugins": {
            "zivvio/composer": true
        }
    },
    "repositories": [
        {
            "type": "composer",
            "url": "https://asset-packagist.org"
        }
    ]
}
EOF

$COMPOSER_BINARY install

test -f vendor/autoload.php || (echo "vendor/autoload.php does not exist!"; exit 1)
test -f vendor/zivvio/extensions.php || (echo "vendor/zivvio/extensions.php does not exist!"; exit 1)
test -d vendor/zivvio/zivvio || (echo "vendor/zivvio/zivvio does not exist!"; exit 1)
