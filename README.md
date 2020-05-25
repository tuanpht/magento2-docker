# Magento 2 docker environment

![](https://images.viblo.asia/3b804ac8-287b-4d8d-96a6-9f402a81b144.png)

Reference: https://viblo.asia/p/magento-2-docker-environment-eW65Gvx9lDO

# Usage
Clone or download:
```bash
git clone https://github.com/tuanpht/magento2-docker.git
```

Prepare you HTTPS and custom domain => See: [./vhosts/README.md](./vhosts/README.md)

=> Example: https://magento2.test

Copy docker files to magento project folder:
```bash
cd magento2-docker.git
cp -r dev/docker ~/Project/magento2-test/dev/
cp docker-compose.dev.yml ~/Project/magento2-test/docker-compose.yml
```

Update or copy file env for docker:
```bash
cp dev/docker/env.docker-example.php ~/Project/magento2-test/app/etc/env.php
```

Up and running:
```bash
cd ~/Project/magento2-test
docker-compose up -d
```

Prepare your magento installation:
```bash
# Enter `php` container
docker-compose exec php bash

cd /var/www/html/magento

# Setup file permissions, except folder `dev/docker`
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} + \
    && find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} + \
    && chown -R :www-data $(ls -Idev/docker)

# Run this to install db if it is new installation,
# or you can import your SQL in adminer: http://localhost:8088
php bin/magento setup:install \
    --db-host=mysql \
    --db-name=magento_db \
    --db-user=magento \
    --db-password=secret \
    --backend-frontname=admin_mn \
    --admin-firstname=Super \
    --admin-lastname=Admin \
    --admin-email=admin@example.com \
    --admin-user=admin \
    --admin-password=s3cret@123

# Update config
# Config to use varnish
php bin/magento config:set system/full_page_cache/caching_application 2
php bin/magento config:set system/full_page_cache/varnish/backend_host nginx
php bin/magento config:set system/full_page_cache/varnish/backend_port 80
# Base url and https
php bin/magento config:set web/unsecure/base_url http://magento2.test/
php bin/magento config:set web/secure/base_url https://magento2.test/
php bin/magento config:set web/secure/use_in_frontend 1
php bin/magento config:set web/secure/use_in_adminhtml 1
php bin/magento config:set web/seo/use_rewrites 1
# Locale, timezone, currency
php bin/magento config:set general/locale/code en_US
php bin/magento config:set general/locale/timezone Asia/Ho_Chi_Minh
php bin/magento config:set currency/options/base VND
# Flush cache
php bin/magento config:set cache:flush
```
