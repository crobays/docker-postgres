#!/bin/bash
file="$PGDATA/postgresql.conf"

if [ "${ENVIRONMENT:0:3}" == "dev" ]
then
	sed -i -r "s/#?client_min_messages = .*/client_min_messages = log/" "$file"
	sed -i -r "s/#?log_min_messages = .*/log_min_messages = info/" "$file"
	sed -i -r "s/#?log_min_error_statement = .*/log_min_error_statement = info/" "$file"
	sed -i -r "s/#?log_min_duration_statement = .*/log_min_duration_statement = 0/" "$file"
	sed -i -r "s/#?log_statement = .*/log_statement = 'all'/" "$file"
	sed -i -r "s/#?log_line_prefix = .*/log_line_prefix = '%t '/" "$file"
fi

sed -i -r "s/#?log_timezone = .*/log_timezone = '${TIMEZONE//\//\\\/}'/" "$file"
sed -i -r "s/#?timezone = .*/timezone = '${TIMEZONE//\//\\\/}'/" "$file"
