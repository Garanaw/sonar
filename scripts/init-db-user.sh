#!/bin/bash

echo "--------------------------------------------------------------------------"
echo "Initializing database user $POSTGRES_USER and schema $POSTGRES_DB..."
echo "--------------------------------------------------------------------------"

set -e -x

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE SCHEMA IF NOT EXISTS "$POSTGRES_DB" AUTHORIZATION "$POSTGRES_USER";
	
	GRANT ALL PRIVILEGES ON DATABASE "$POSTGRES_DB" TO "$POSTGRES_USER";
	
	ALTER USER "$POSTGRES_USER" SET search_path TO "$POSTGRES_DB";
EOSQL
