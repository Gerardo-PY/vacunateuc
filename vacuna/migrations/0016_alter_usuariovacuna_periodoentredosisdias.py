# Generated by Django 3.2.6 on 2022-01-13 23:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vacuna', '0015_alter_usuariovacuna_estado'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuariovacuna',
            name='periodoentredosisdias',
            field=models.IntegerField(verbose_name='Periodo entre dosis'),
        ),
    ]
