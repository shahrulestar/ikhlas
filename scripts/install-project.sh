#!/usr/bin/env bash
set -euo pipefail

SKILL_PATH=".cursor/skills/ikhlas-app-ui"
REPO="${IKHLAS_SKILL_REPO:-git@github.com:shahrulestar2/ikhlas.git}"

if [ ! -d ".git" ]; then
  echo "Run this script from the root of a git repository."
  exit 1
fi

if [ -d "${SKILL_PATH}" ] || [ -f ".gitmodules" ] && grep -q "${SKILL_PATH}" .gitmodules 2>/dev/null; then
  echo "Skill submodule already configured at ${SKILL_PATH}"
  exit 1
fi

mkdir -p .cursor/skills
git submodule add "${REPO}" "${SKILL_PATH}"

echo ""
echo "Added ikhlas-app-ui as project skill at ${SKILL_PATH}"
echo "Team members: git submodule update --init --recursive"
