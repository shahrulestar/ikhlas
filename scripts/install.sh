#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="ikhlas-app-ui"
SKILL_DIR="${IKHLAS_SKILL_DIR:-${HOME}/.cursor/skills/${SKILL_NAME}}"
REPO="${IKHLAS_SKILL_REPO:-git@github.com:shahrulestar2/ikhlas.git}"

mkdir -p "${HOME}/.cursor/skills"

if [ -L "${SKILL_DIR}" ]; then
  echo "Symlink already exists at ${SKILL_DIR}"
  echo "Remove it first or set IKHLAS_SKILL_DIR to a different path."
  exit 1
fi

if [ -d "${SKILL_DIR}/.git" ]; then
  echo "Updating existing install at ${SKILL_DIR}..."
  git -C "${SKILL_DIR}" pull --ff-only
elif [ -d "${SKILL_DIR}" ]; then
  echo "Path exists but is not a git clone: ${SKILL_DIR}"
  echo "Remove it or set IKHLAS_SKILL_DIR to a different path."
  exit 1
else
  echo "Cloning ${REPO} to ${SKILL_DIR}..."
  git clone "${REPO}" "${SKILL_DIR}"
fi

if [ ! -f "${SKILL_DIR}/SKILL.md" ]; then
  echo "Install failed: SKILL.md not found in ${SKILL_DIR}"
  exit 1
fi

echo ""
echo "Installed ikhlas-app-ui skill to ${SKILL_DIR}"
echo "Start a new agent session, then prompt:"
echo '  Use the ikhlas-app-ui skill to ...'
