# Generated by Django 3.1.4 on 2023-03-20 16:18

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_auto_20230320_1617'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='owner',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='commenter', to=settings.AUTH_USER_MODEL),
        ),
    ]
