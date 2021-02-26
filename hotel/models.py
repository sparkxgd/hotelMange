# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

class CheckIn(models.Model):
    custumer_id = models.IntegerField(db_column='custumer _id', blank=True, null=True)  # Field renamed to remove unsuitable characters.
    room_id = models.IntegerField(blank=True, null=True)
    time_in = models.DateTimeField(blank=True, null=True)
    day = models.IntegerField(blank=True, null=True)
    time_out = models.DateTimeField(blank=True, null=True)
    updatetime = models.DateTimeField(blank=True, null=True)
    createtime = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'check_in'


class Custumer(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    sex = models.IntegerField(blank=True, null=True)
    idcard = models.CharField(max_length=255, blank=True, null=True)
    tel = models.CharField(max_length=255, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    pho = models.TextField(blank=True, null=True)
    updatetime = models.DateTimeField(blank=True, null=True)
    createtime = models.DateTimeField(blank=True, null=True)
    type = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'custumer'


class Floor(models.Model):
    no = models.CharField(max_length=50,blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    floorno = models.CharField(max_length=50,blank=True, null=True)
    updatetime = models.DateTimeField(blank=True, null=True)
    createtime = models.DateTimeField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)
    remark = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'floor'


class Income(models.Model):
    money = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    create_time = models.DateTimeField(blank=True, null=True)
    in_type = models.IntegerField(blank=True, null=True)
    remark = models.CharField(max_length=255, blank=True, null=True)
    type = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'income'


class Room(models.Model):
    room_type_id = models.IntegerField(blank=True, null=True)
    floorid = models.IntegerField(blank=True, null=True)
    room = models.CharField(max_length=255, blank=True, null=True)
    floorno = models.CharField(max_length=52,blank=True, null=True)
    updatetime = models.DateTimeField(blank=True, null=True)
    createtime = models.DateTimeField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'room'


class RoomType(models.Model):
    typename = models.CharField(max_length=255, blank=True, null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    vip_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    updatetime = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'room_type'


class User(models.Model):
    username = models.CharField(max_length=255, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)
    updatetime = models.DateTimeField(blank=True, null=True)
    createtime = models.DateTimeField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user'


class Vip(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)
    sex = models.CharField(max_length=255, blank=True, null=True)
    idcard = models.CharField(max_length=255, blank=True, null=True)
    tel = models.CharField(max_length=255, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    class_field = models.CharField(db_column='class', max_length=255, blank=True, null=True)  # Field renamed because it was a Python reserved word.
    pho = models.TextField(blank=True, null=True)
    integral = models.IntegerField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)
    updatetime = models.DateTimeField(blank=True, null=True)
    createtime = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'vip'
