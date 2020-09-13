from django.db import models

# Create your models here.
class People(models.Model):
    blood_group = [
        ('A Positive','A Positive'),
        ('A Negative','A Negative'),
        ('B Positive','B Positive'),
        ('B Negative','B Negative'),
        ('O Positive','O Positive'),
        ('O Negative','O Negative'),
        ('AB Positive','AB Positive'),
        ('AB Negative','AB Negative'),

    ]

    p_id = models.CharField(max_length=50,blank=True,null=True)
    nick_name = models.CharField(max_length=150,blank=True,null=True)
    full_name = models.CharField(max_length=150,blank=True,null=True)
    address = models.TextField(max_length=500,blank=True,null=True)
    blood_group = models.CharField(max_length=20,choices=blood_group,default='A Positive')
    special_mark = models.CharField(max_length=120,blank=True,null=True)
    age = models.CharField(max_length=120,blank=True,null=True)
    gardian_name = models.CharField(max_length=120,blank=True,null=True)
    gardian_phone_number = models.CharField(max_length=20,blank=True,null=True)
    skin_tone = models.CharField(max_length=120,blank=True,null=True)
    dress_up = models.CharField(max_length=120,blank=True,null=True)
    phone_number = models.CharField(max_length=20,blank=True,null=True)
    last_location = models.CharField(max_length=150,blank=True,null=True)
    miscellaneous = models.TextField(max_length=500,blank=True,null=True)
    image = models.ImageField(upload_to='',null=True)

    def __str__(self):
        return self.nick_name + ' | '+str(self.p_id)

    class Meta:
        db_table = 'people_information'