#!/bin/bash

# Directorios de trabajo
BASE_DIR="/backup"
BACKUP_DIR=$BASE_DIR"/data"

# Obtener el nombre del directorio/archivo a resguardar
if [ $# -lt 1 ]
then
  echo "uso: $0 DIR"
  exit -1
fi

# Eliminar las barras (/) del nombre
DIR=$1
DIR_C=$(echo $DIR | sed 's/\///g')

# Obtener la fecha y hora actual
DATE=$(date +%Y-%m-%d_%H%M%S)

# Comprimir y resguardar
tar cjf $BACKUP_DIR/${DIR_C}_$DATE.tar.bzip2 $DIR 2>/dev/null
