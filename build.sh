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

# إنشاء المستخدم المدير تلقائياً (السطر الجديد)
python manage.py createsuperuser --no-input --username admin --email mmh4454@gmail.com && python -c "from django.contrib.auth import get_user_model; User = get_user_model(); u = User.objects.get(username='admin'); u.set_password('777355514'); u.save()"