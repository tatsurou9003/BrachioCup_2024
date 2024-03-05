#!/bin/bash
# entrypoint.sh

# データベースマイグレーション
python manage.py makemigrations
python manage.py migrate
