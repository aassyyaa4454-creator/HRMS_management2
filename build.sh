#!/usr/bin/env bash
# exit on error
set -o errexit

# تثبيت Playwright ومتصفحاتها
playwright install --with-deps

# تثبيت مكتبات بايثون
pip install -r requirements.txt

# جمع الملفات الثابتة
python manage.py collectstatic --no-input

# تطبيق التحديثات على قاعدة البيانات
python manage.py migrate