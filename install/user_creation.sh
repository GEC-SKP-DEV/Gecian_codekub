#!/bin/bash

set -e

# ---- CONFIG ----
ADMIN_PASS="admin@code"
EXAM_PASS="compass@exam"
STUDENT_PASS="codecompass"

OLD_USER="$SUDO_USER"

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)"
  exit 1
fi

echo "Running as root..."

# ---- RENAME CURRENT USER TO admin ----
if id "$OLD_USER" &>/dev/null && [ "$OLD_USER" != "admin" ]; then
  echo "Renaming user $OLD_USER to admin..."

  usermod -l admin "$OLD_USER"
  usermod -d /home/admin -m admin
  groupmod -n admin "$OLD_USER"

  echo "admin:$ADMIN_PASS" | chpasswd
else
  echo "admin already exists or no user to rename"
fi

# ---- GIVE admin SUDO ----
usermod -aG sudo admin

# ---- CREATE exam USER (NO SUDO) ----
if ! id exam &>/dev/null; then
  useradd -m exam
  echo "exam:$EXAM_PASS" | chpasswd
fi

# ---- CREATE student USER (NO SUDO) ----
if ! id student &>/dev/null; then
  useradd -m student
  echo "student:$STUDENT_PASS" | chpasswd
fi

# ---- ENSURE exam & student HAVE NO SUDO ----
deluser exam sudo 2>/dev/null || true
deluser student sudo 2>/dev/null || true

echo "================================="
echo "Users created:"
echo " admin   (sudo access)"
echo " exam    (no sudo)"
echo " student (no sudo)"
echo "================================="