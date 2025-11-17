#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt
playwright install --with-deps
python manage.py collectstatic --no-input
python manage.py migrate

python manage.py createsuperuser --no-input --username admin --email mmh4454@gmail.com || echo "Superuser already exists."
python -c "from django.contrib.auth import get_user_model; User = get_user_model(); u = User.objects.get(username='admin'); u.set_password('777355514'); u.save()"
