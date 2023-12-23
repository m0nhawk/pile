.PHONY: initdb startdb createdb stopdb initialize

# default target if "make" command is issued without any arguments
default: initdb startdb createdb stopdb

initdb:
	@echo "Initializing database..."
	initdb -D .tmp/mydb

startdb:
	@echo "Starting database..."
	pg_ctl -D .tmp/mydb -l $$PWD/.tmp/logfile -o "--unix_socket_directories='$$PWD/.tmp'" start

createdb:
	@echo "Creating database 'mydb'..."
	createdb -h $$PWD/.tmp mydb

stopdb:
	@echo "Stopping database..."
	pg_ctl -D .tmp/mydb stop

psql:
	@echo "psql..."
	psql -h $$PWD/.tmp -d mydb

initialize: initdb startdb createdb
