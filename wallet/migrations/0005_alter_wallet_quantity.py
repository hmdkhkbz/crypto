# Generated by Django 4.0.7 on 2022-09-23 20:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('wallet', '0004_token_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='wallet',
            name='quantity',
            field=models.FloatField(default=0.0),
        ),
    ]
