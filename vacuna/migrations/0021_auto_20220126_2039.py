# Generated by Django 3.2.6 on 2022-01-26 23:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vacuna', '0020_alter_usuariovacuna_vacuna'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='usuariovacuna',
            name='periodoentredosisdias',
        ),
        migrations.AlterField(
            model_name='tipo_de_enfermedad',
            name='nombre',
            field=models.CharField(max_length=150, verbose_name='Tipo de enfermedad'),
        ),
    ]