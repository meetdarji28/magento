# magento
Magento setup with Docker

1. First, clone this repo on the  server

2. Go to that directory & run the following command:
 - docker-compose up -d

3. Put Magento username and password in magento2/.env.magento file, Like: 
MAGENTO_PUBLIC_KEY=123
MAGENTO_PRIVATE_KEY=123

4. Go to the Docker container and run the setup script:
 - docker exec -it magento_web /bin/bash
 - chmod +x setup.sh
 - bash setup.sh

All done, you can now check the Magento http://localhost:8300/ URL, it will run.

For any query please get in touch with me at meetdarji111@gmail.com



MYSQL_ROOT_PASSWORD=admin@123 

MYSQL_DATABASE=magento_DB 

MYSQL_USER=magento 

MYSQL_PASSWORD=admin@123 

REDIS_PASSWORD=admin@123 

