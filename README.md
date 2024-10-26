# Docker SQLite WordPress

![](.github/about.jpg)

WordPress with SQLite, ready to use out of the box.

- Based on [official image](https://hub.docker.com/_/wordpress), Easier and more sustainable solution.
- DockerHub Page: https://hub.docker.com/r/johanneswk/wordpress-sqlite

## Quick Start

You can download GitHub's clean and secure docker image using the following command:

```bash
# use latest
docker pull johanneswk/wordpress-sqlite
```

Use the following command to quickly launch the wordpress with port `8080`:

```bash
docker run --rm -it -p 8080:80 -v `pwd`/wordpress:/var/www/html johanneswk/wordpress-sqlite
```

You can also use docker compose to start wordpress:

```yaml
version: '3'

services:

  wordpress:
    image: johanneswk/wordpress-sqlite
    restart: always
    ports:
      - 8080:80
    volumes:
      - ./wordpress:/var/www/html
```

Save the file as `docker-compose.yml` and then execute `docker compose up`, then use browser access to `localhost:8080`.


## Issue with Wordpress on Azure File Share

There is an issue with the SQLite database on an Azure File Share. The database cannot be created automatically. Therefore you need to put an empty Wordpress database upfront into the file share.

⚠️ Important: Before you can proceed make sure to make the storage account accessible. Go to the storage account Networking tab and check Enabled from all networks. After you copied the files as decribed below, make sure to switch back to Enabled from selected virtual networks and IP addresses.

In the repo there is an empty database file '.ht.sqlite' that you can use. Just download the zip file, unzip all 3 files and upload them to the file share:

    Go to the Azure portal and navigate to the storage account
    Click on the file share 
    Click on Upload and upload the file '.ht.sqlite'

Use the quick 1-minute initial installation, enjoy.
![](.github/ready-to-use.jpg)
