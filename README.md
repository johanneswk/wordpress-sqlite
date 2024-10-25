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

![](.github/ready-to-use.jpg)

Use the quick 1-minute initial installation, enjoy.
