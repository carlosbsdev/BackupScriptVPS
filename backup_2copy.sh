#!/bin/bash

COPY_DIR="/backup/copy"
BACKUP_DIR="/backup/data"

# Borrar copias de respaldo viejas de la carpeta copy
rm $COPY_DIR/*.bzip2 >/dev/null 2>&1

# Copiar copias de respaldo nuevas a la carpeta copy
for F in $(find $BACKUP_DIR -type f -name "*.bzip2" -mtime -1); do
  cp $F $COPY_DIR
done

# Borrar copias de respaldo viejas de la carpeta data
rm $BACKUP_DIR/*.bzip2 >/dev/null 2>&1
