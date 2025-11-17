import os
from django.core.management.base import BaseCommand
from django.contrib.auth import get_user_model

User = get_user_model()

class Command(BaseCommand):
    help = "Creates a superuser, or updates an existing one."

    def handle(self, *args, **options):
        username = os.environ.get('DJANGO_SUPERUSER_USERNAME', 'admin')
        email = os.environ.get('DJANGO_SUPERUSER_EMAIL', 'admin@example.com')
        password = os.environ.get('DJANGO_SUPERUSER_PASSWORD', 'password123')

        if not User.objects.filter(username=username).exists():
            self.stdout.write(f'Creating superuser: {username}')
            User.objects.create_superuser(username=username, email=email, password=password)
        else:
            self.stdout.write(f'Superuser "{username}" already exists. Ensuring they are a superuser and updating password.')
            user = User.objects.get(username=username)
            user.set_password(password)
            user.is_staff = True
            user.is_superuser = True
            user.save()
        
        self.stdout.write(self.style.SUCCESS(f'Superuser "{username}" is configured.'))