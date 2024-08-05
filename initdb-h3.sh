#!/bin/sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# load H3 for each database
for DB in template_postgis "$POSTGRES_DB"; do
	echo "Loading H3 extensions into $DB"
    pgxn load -d $DB h3==3.7.2
done
