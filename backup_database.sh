#!/bin/bash

BASE_DIR="/backup"
BACKUP_DIR=$BASE_DIR"/data"
TMP_DIR=$BASE_DIR"/tmp"

# Credenciales de un usuario MySQL con acceso de sólo lectura
MYUSER=backup
MYPASS=12345678

# Parámetros y opciones para mysqldump
ARGS="-u$MYUSER -p$MYPASS --add-drop-database --add-locks \
--create-options --complete-insert --comments --disable-keys \
--dump-date --extended-insert --quick --routines --triggers"

# Recuperar el nombre de base de datos pasado como parámetro
DB="nombre_bd_1"
DB2="nombre_bd_2"
DB3="nombre_bd_3"
DB4="nombre_bd_4"

# Obtener un volcado de la base de datos
mysqldump ${ARGS} $DB > $TMP_DIR/$DB.sql
mysqldump ${ARGS} $DB2 > $TMP_DIR/$DB2.sql
mysqldump ${ARGS} $DB3 > $TMP_DIR/$DB3.sql
mysqldump ${ARGS} $DB4 > $TMP_DIR/$DB4.sql

# Obtener la fecha y hora actual
DATE=$(date +%Y-%m-%d_%H%M%S)

# Comprimir y resguardar
tar cjf $BACKUP_DIR/${DB}_$DATE.tar.bzip2 $TMP_DIR/$DB.sql 2>/dev/null
tar cjf $BACKUP_DIR/${DB2}_$DATE.tar.bzip2 $TMP_DIR/$DB2.sql 2>/dev/null
tar cjf $BACKUP_DIR/${DB3}_$DATE.tar.bzip2 $TMP_DIR/$DB3.sql 2>/dev/null
tar cjf $BACKUP_DIR/${DB4}_$DATE.tar.bzip2 $TMP_DIR/$DB4.sql 2>/dev/null

# Eliminar el volcado
rm $TMP_DIR/*.sql
