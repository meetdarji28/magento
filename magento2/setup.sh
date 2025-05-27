#!/bin/bash

set -a
source .env.magento   # <-- Load Magento Marketplace credentials
set +a

# Configure Composer Magento repo auth using .env.magento
composer config --global http-basic.repo.magento.com "$MAGENTO_PUBLIC_KEY" "$MAGENTO_PRIVATE_KEY"
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition=2.4.7-p3 magento2

set -a
source .env
set +a

cd /var/www/html/magento2

php -d memory_limit=1025M bin/magento setup:install \
  --base-url=http://localhost:8300 \
  --db-host=$MYSQL_HOST \
  --db-name=$MYSQL_DATABASE \
  --db-user=$MYSQL_USER \
  --db-password=$MYSQL_PASSWORD \
  --backend-frontname=admin \
  --admin-firstname=Admin \
  --admin-lastname=User \
  --admin-email=$ADMIN_EMAIL \
  --admin-user=$ADMIN_USER \
  --admin-password=$ADMIN_PASS \
  --language=en_US \
  --currency=USD \
  --timezone=UTC \
  --use-rewrites=1 \
  --search-engine=elasticsearch7 \
  --elasticsearch-host=$ES_HOST \
  --elasticsearch-port=$ES_PORT \
  --session-save=redis \
  --session-save-redis-host=$REDIS_HOST \
  --session-save-redis-port=$REDIS_PORT \
  --session-save-redis-password=$REDIS_PASSWORD

chown -R www-data:www-data /var/www/html/magento2
