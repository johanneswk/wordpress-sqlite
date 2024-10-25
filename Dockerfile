FROM wordpress:fpm-alpine

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV WORDPRESS_PREPARE_DIR=/usr/src/wordpress

#RUN curl -L -o sqlite-database-integration.zip "https://downloads.wordpress.org/plugin/sqlite-database-integration.latest-stable.zip" && \
RUN curl -L -o sqlite-database-integration.zip "https://downloads.wordpress.org/plugin/sqlite-database-integration.latest-stable.zip" && \
    unzip  sqlite-database-integration.zip && \
    mkdir -p ${WORDPRESS_PREPARE_DIR}/wp-content/mu-plugins/sqlite-database-integration && \
    cp -r sqlite-database-integration/* ${WORDPRESS_PREPARE_DIR}/wp-content/mu-plugins/sqlite-database-integration/ && \
    rm -rf sqlite-database-integration && \
    rm -rf sqlite-database-integration.zip && \
    mv "${WORDPRESS_PREPARE_DIR}/wp-content/mu-plugins/sqlite-database-integration/db.copy" "${WORDPRESS_PREPARE_DIR}/wp-content/db.php" && \
    sed -i 's#{SQLITE_IMPLEMENTATION_FOLDER_PATH}#/var/www/html/wp-content/mu-plugins/sqlite-database-integration#' "${WORDPRESS_PREPARE_DIR}/wp-content/db.php" && \
    sed -i 's#{SQLITE_PLUGIN}#sqlite-database-integration/load.php#' "${WORDPRESS_PREPARE_DIR}/wp-content/db.php" && \
    mkdir "${WORDPRESS_PREPARE_DIR}/wp-content/database" && \
    touch "${WORDPRESS_PREPARE_DIR}/wp-content/database/.ht.sqlite" && \
    chmod 640 "${WORDPRESS_PREPARE_DIR}/wp-content/database/.ht.sqlite"
