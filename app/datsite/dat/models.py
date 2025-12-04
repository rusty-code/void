# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Families(models.Model):
    # pk = models.CompositePrimaryKey('login', 'family_id')
    login = models.ForeignKey('Users', models.DO_NOTHING, db_column='login')
    family = models.ForeignKey('Family', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'families'
        unique_together = (('login', 'family_id'),)

class Family(models.Model):
    family_id = models.UUIDField(primary_key=True)
    name = models.CharField(max_length=64)

    class Meta:
        managed = False
        db_table = 'family'


class Films(models.Model):
    film = models.CharField(primary_key=True, max_length=64)
    view_count = models.IntegerField()
    describe = models.TextField(blank=True, null=True)
    imdb = models.FloatField(blank=True, null=True)
    duration = models.DurationField()
    genre = models.CharField(max_length=25, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'films'


class History(models.Model):
    # pk = models.CompositePrimaryKey('login', 'film')
    login = models.ForeignKey('Users', models.DO_NOTHING, db_column='login')
    film = models.ForeignKey(Films, models.DO_NOTHING, db_column='film')
    date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'history'
        unique_together = (('login', 'film'),)


class Purchases(models.Model):
    purchase_date = models.DateField()
    price = models.IntegerField(blank=True, null=True)
    purchase_id = models.UUIDField(primary_key=True)

    class Meta:
        managed = False
        db_table = 'purchases'


class SubsUsers(models.Model):
    # pk = models.CompositePrimaryKey('name', 'login')
    name = models.ForeignKey('Subscribe', models.DO_NOTHING, db_column='name')
    login = models.ForeignKey('Users', models.DO_NOTHING, db_column='login')
    host = models.BooleanField()
    start_date = models.DateField()
    end_date = models.DateField()

    class Meta:
        managed = False
        db_table = 'subs_users'
        unique_together = (('login', 'name'),)


class Subscribe(models.Model):
    name = models.CharField(primary_key=True, max_length=25)
    price = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'subscribe'


class Users(models.Model):
    login = models.CharField(primary_key=True, max_length=32)
    password = models.CharField(max_length=16)
    first_name = models.CharField(max_length=25)
    last_name = models.CharField(max_length=25)
    birthday_date = models.DateField()
    sex = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'users'


class UsersMarks(models.Model):
    # pk = models.CompositePrimaryKey('login', 'film')
    login = models.ForeignKey(Users, models.DO_NOTHING, db_column='login')
    film = models.ForeignKey(Films, models.DO_NOTHING, db_column='film')
    user_mark = models.FloatField()

    class Meta:
        managed = False,
        db_table = 'users_marks'
        unique_together = (('login', 'film'),)


class UsersPurchases(models.Model):
    # pk = models.CompositePrimaryKey('purchase_id', 'login')
    purchase = models.ForeignKey(Purchases, models.DO_NOTHING)
    login = models.ForeignKey(Users, models.DO_NOTHING, db_column='login')

    class Meta:
        managed = False,
        db_table = 'users_purchases'
        unique_together = (('login', 'purchase_id'),)
