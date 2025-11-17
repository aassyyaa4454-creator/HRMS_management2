#!/usr/bin/env bash
set -o errexit

# Install Python dependencies
pip install -r requirements.txt

# Install Playwright browsers for PDF generation
playwright install --with-deps

# Collect static files for production
python manage.py collectstatic --no-input

# Apply database migrations to create tables
python manage.py migrate

# 1. Create a superuser if it doesn't already exist
python manage.py createsuperuser --no-input --username admin --email mmh4454@gmail.com || echo "Superuser 'admin' already exists."

# 2. IMPORTANT: Ensure the 'admin' user is staff and a superuser
python -c "from django.contrib.auth import get_user_model; User = get_user_model(); u = User.objects.get(username='admin'); u.is_staff = True; u.is_superuser = True; u.save()"

# 3. Set the password for the 'admin' user
python -c "from django.contrib.auth import get_user_model; User = get_user_model(); u = User.objects.get(username='admin'); u.set_password('777355514'); u.save()"