#!/usr/bin/env bash
set -o errexit

# Install Python dependencies
pip install -r requirements.txt

# Install Playwright browsers for PDF generation
playwright install --with-deps

# Collect static files for production
python manage.py collectstatic --no-input

# Apply database migrations
python manage.py migrate

# Create/Update the superuser using our custom command
python manage.py createsu