#!/usr/bin/env bash
set -euo pipefail

repo_root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
pat_dir="$repo_root/third_party/pat-v0.17.0"
wl2k_dir="$repo_root/third_party/wl2k-go-v0.12.1"
out_dir="$repo_root/dist"

if [[ ! -f "$pat_dir/go.mod" ]]; then
  echo "ERROR: Pat source is missing: $pat_dir" >&2
  exit 1
fi
if [[ ! -f "$wl2k_dir/go.mod" ]]; then
  echo "ERROR: wl2k-go source is missing: $wl2k_dir" >&2
  exit 1
fi

mkdir -p "$out_dir"

# Build from a temporary copy so the tracked upstream go.mod is not edited.
build_dir=$(mktemp -d)
trap 'rm -rf "$build_dir"' EXIT
mkdir -p "$build_dir/pat"
(cd "$pat_dir" && tar --exclude=.git -cf - .) | (cd "$build_dir/pat" && tar -xf -)
go mod edit -modfile="$build_dir/pat/go.mod" \
  -replace="github.com/la5nta/wl2k-go=$wl2k_dir"
cd "$build_dir/pat"

echo "Building Pat v0.17.0 for linux/arm64"
GOOS=linux GOARCH=arm64 CGO_ENABLED=0 \
  go build -modfile="$build_dir/pat/go.mod" -trimpath -o "$out_dir/pat" .

file "$out_dir/pat" || true
sha256sum "$out_dir/pat"
echo "PASS: $out_dir/pat"
