# Generated by Django 3.2.6 on 2022-01-14 02:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vacuna', '0016_alter_usuariovacuna_periodoentredosisdias'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuariovacuna',
            name='periodoentredosisdias',
            field=models.IntegerField(editable=False, verbose_name='Periodo entre dosis'),
        ),
    ]