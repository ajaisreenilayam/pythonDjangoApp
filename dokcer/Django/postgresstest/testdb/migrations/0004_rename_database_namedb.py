# Generated by Django 3.2.15 on 2022-08-19 19:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('testdb', '0003_alter_database_id'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='database',
            new_name='namedb',
        ),
    ]