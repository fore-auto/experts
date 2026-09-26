#!/usr/bin/env bash
# pack.sh — 校验并打包 experts/ 下的全部专家为可上传 zip（产出到 dist/）
#
# 为什么不能直接用官方 package_expert.py：
#   官方校验器强制要求「专家目录位于 <WORKBUDDY_CONFIG_DIR>/plugins/marketplaces/my-experts/plugins 下」，
#   否则报 error 使 is_valid=False，package_expert.py 随即中止打包。
#   发布源天然不在该目录，因此本脚本建一个「临时仿真市场目录」做真实拷贝，
#   让官方脚本在合规路径下完成校验与打包（不触碰真实 my-experts）。
#
# 用法： bash pack.sh            # 打包全部
#        bash pack.sh auto-geo site   # 只打包指定专家

set -euo pipefail

EM=/Applications/WorkBuddy.app/Contents/Resources/app.asar.unpacked/resources/plugins/workbuddy-builtin/skills/expert-manager
PY=${PY:-python3}
SRC="$(cd "$(dirname "$0")" && pwd)"
DIST="$SRC/dist"

ROOT="$(mktemp -d)"
export WORKBUDDY_CONFIG_DIR="$ROOT"
FAKE="$ROOT/plugins/marketplaces/my-experts/plugins"

trap 'rm -rf "$ROOT"' EXIT

# 1) 待打包专家列表
if [ "$#" -gt 0 ]; then
  EXPERTS=("$@")
else
  EXPERTS=()
  for d in "$SRC"/*/; do
    n=$(basename "$d")
    [ "$n" = "dist" ] && continue
    [ -f "$d/.codebuddy-plugin/plugin.json" ] || continue
    EXPERTS+=("$n")
  done
fi

# 2) 前置修复：zip 格式不支持 1980 年前的 mtime，否则打包中途报错
BAD=$(find "$SRC" -type f ! -newermt "1980-01-01" -print 2>/dev/null || true)
if [ -n "$BAD" ]; then
  echo "⚠️  发现 mtime 早于 1980 的文件，已修正时间戳（否则 zip 打包会失败）："
  echo "$BAD" | sed 's/^/    /'
  find "$SRC" -type f ! -newermt "1980-01-01" -print0 2>/dev/null | xargs -0 touch
  echo
fi

# 3) 建仿真市场目录（真实拷贝）
mkdir -p "$FAKE"
for e in "${EXPERTS[@]}"; do
  mkdir -p "$FAKE/$e"
  ( cd "$SRC/$e" && tar cf - . ) | ( cd "$FAKE/$e" && tar xf - )
done

# 4) 校验 + 打包
mkdir -p "$DIST"
rm -f "$DIST"/*.zip
cd "$EM"
FAIL=0
for e in "${EXPERTS[@]}"; do
  echo "########## $e ##########"
  $PY scripts/validate_expert.py "$FAKE/$e" | tail -2 || FAIL=1
  $PY scripts/package_expert.py "$FAKE/$e" "$DIST" | grep -E "✅ Packaged|Size:|Error|aborted" || FAIL=1
  echo
done

echo "=== dist/ 产出 ==="
ls -la "$DIST" | awk 'NR>1{print "  ", $9, $5"B"}'
exit $FAIL
