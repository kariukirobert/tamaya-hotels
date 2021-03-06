# Generated by Django 2.1 on 2020-06-02 13:49

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=191)),
                ('phone', models.CharField(blank=True, max_length=191, null=True)),
                ('id_number', models.CharField(blank=True, max_length=191, null=True)),
                ('is_active', models.BooleanField(default=True)),
                ('created_at', models.DateTimeField(auto_now=True)),
                ('updated_at', models.DateTimeField(auto_now_add=True)),
                ('created_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='+', to=settings.AUTH_USER_MODEL)),
                ('updated_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='+', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'hotel_customers',
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='Reservation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=10, unique=True)),
                ('nights', models.PositiveSmallIntegerField(default=1)),
                ('payment', models.CharField(choices=[('cash', 'Cash'), ('mpesa', 'M-pesa'), ('card', 'Card')], max_length=10)),
                ('check_in', models.DateField()),
                ('check_out', models.DateField()),
                ('is_active', models.BooleanField(default=True)),
                ('created_at', models.DateTimeField(auto_now=True)),
                ('updated_at', models.DateTimeField(auto_now_add=True)),
                ('created_by', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='reservations', to=settings.AUTH_USER_MODEL)),
                ('customer', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='reservations', to='reservations.Customer')),
            ],
            options={
                'db_table': 'hotel_reservations',
                'ordering': ['-created_at'],
            },
        ),
        migrations.CreateModel(
            name='Room',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('room_number', models.CharField(max_length=50, unique=True)),
                ('room_type', models.CharField(choices=[('Single', 'Single'), ('Double', 'Double'), ('Deluxe', 'Deluxe'), ('Suite', 'Suite')], max_length=191)),
                ('price', models.CharField(max_length=10)),
                ('status', models.CharField(choices=[('repair', 'Under Repair'), ('cleaning', 'Cleaning'), ('closed', 'Closed'), ('active', 'Active'), ('missing_materials', 'Missing Materials')], default='active', max_length=20)),
                ('is_booked', models.BooleanField(default=False)),
                ('has_damages', models.BooleanField(default=False)),
                ('description', models.TextField(blank=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('created_by', models.ForeignKey(default=1, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='rooms', to=settings.AUTH_USER_MODEL)),
                ('updated_by', models.ForeignKey(default=1, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='+', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'hotel_rooms',
                'ordering': ['room_number'],
            },
        ),
        migrations.AddField(
            model_name='reservation',
            name='room',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='reservations', to='reservations.Room'),
        ),
        migrations.AddField(
            model_name='reservation',
            name='updated_by',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='+', to=settings.AUTH_USER_MODEL),
        ),
    ]
