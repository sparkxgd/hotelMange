# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models



class RoomType(models.Model):
    id = models.BigAutoField(primary_key=True)
    typename = models.CharField(max_length=255, blank=True, null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    vip_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    updatetime = models.DateTimeField(blank=True, null=True)
    custumer_type = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'room_type'


class Floor(models.Model):
    id = models.BigAutoField(primary_key=True)
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


class Room(models.Model):
    id = models.BigAutoField(primary_key=True)
    room_type_id = models.ForeignKey(RoomType, models.DO_NOTHING, db_column='room_type_id', to_field="id",blank=True,null=True)
    floorid = models.ForeignKey(Floor, models.DO_NOTHING, db_column='floorid', to_field="id", blank=True,
                                     null=True)
    room = models.CharField(max_length=255, blank=True, null=True)
    floorno = models.CharField(max_length=52,blank=True, null=True)
    updatetime = models.DateTimeField(blank=True, null=True)
    createtime = models.DateTimeField(blank=True, null=True)
    # 状态0：空闲，-1：异常，1：入住，-2：未打扫
    status = models.IntegerField(blank=True, null=True)
    remark = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'room'


class Bill(models.Model):
    id = models.BigAutoField(primary_key=True)
    room = models.IntegerField(blank=True, null=True)
    money = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    inmoney = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    updatetime = models.DateTimeField(blank=True, null=True)
    createtime = models.DateTimeField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)
    remark = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'bill'


class Custumer(models.Model):
    id = models.BigAutoField(primary_key=True)
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


class CheckIn(models.Model):
    custumer_id = models.ForeignKey(Custumer, models.DO_NOTHING,db_column='custumer_id', to_field="id",blank=True,null=True)
    room_id = models.ForeignKey(Room, models.DO_NOTHING,db_column='room_id', to_field="id",blank=True,null=True)
    time_in = models.DateTimeField(blank=True, null=True)
    day = models.IntegerField(blank=True, null=True)
    time_out = models.DateTimeField(blank=True, null=True)
    updatetime = models.DateTimeField(blank=True, null=True)
    createtime = models.DateTimeField(blank=True, null=True)
    bill = models.ForeignKey(Bill, models.DO_NOTHING, db_column='bill',to_field="id",blank=True,null=True)

    class Meta:
        managed = False
        db_table = 'check_in'



class Income(models.Model):
    money = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    create_time = models.DateTimeField(blank=True, null=True)
    in_type = models.IntegerField(blank=True, null=True)
    remark = models.CharField(max_length=255, blank=True, null=True)
    type = models.IntegerField(blank=True, null=True)
    bill = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'income'




class User(models.Model):
    id = models.BigAutoField(primary_key=True)
    username = models.CharField(max_length=255, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)
    updatetime = models.DateTimeField(blank=True, null=True)
    createtime = models.DateTimeField(blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)
    nickname = models.CharField(max_length=255, blank=True, null=True)

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
