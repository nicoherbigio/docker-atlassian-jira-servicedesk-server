#!/bin/bash
set -ex

psql -v ON_ERROR_STOP=1 --username "${POSTGRES_USER}" <<-EOSQL
    CREATE USER ${JIRA_DATABASE_USER} ENCRYPTED PASSWORD '${JIRA_DATABASE_PASSWORD}';
    CREATE DATABASE ${JIRA_DATABASE_NAME} ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
    GRANT ALL PRIVILEGES ON DATABASE ${JIRA_DATABASE_NAME} TO ${JIRA_DATABASE_USER};
EOSQL