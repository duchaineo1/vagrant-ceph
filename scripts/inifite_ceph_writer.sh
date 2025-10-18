#!/usr/bin/env bash
# infinite_ceph_writer.sh
# Writes large compressible files forever until stopped (Ctrl+C)

set -euo pipefail

DIR="${1:-/mnt/test}" # Ceph mount path
SIZE_MB="${2:-250}"   # File size in MiB (default 1 GiB)

mkdir -p "$DIR"
echo "Starting infinite file creation in $DIR (${SIZE_MB}MiB per file)"
echo "Press Ctrl+C to stop."

i=1
while true; do
  ts=$(date +%Y%m%d-%H%M%S)
  outfile="$DIR/compressible-${ts}-${i}.bin"
  echo "[$(date +%T)] Writing $outfile ..."
  dd if=/dev/zero of="$outfile" bs=1M count="$SIZE_MB" status=none
  sync "$outfile"
  echo "[$(date +%T)] Done writing $outfile"
  ((i++))
done
