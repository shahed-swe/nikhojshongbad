from django import forms
from .models import People,SearchImage
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.forms import ModelForm

class InfoForm(forms.ModelForm):
    blood_group = [
        ('A Positive', 'A Positive'),
        ('A Negative', 'A Negative'),
        ('B Positive', 'B Positive'),
        ('B Negative', 'B Negative'),
        ('O Positive', 'O Positive'),
        ('O Negative', 'O Negative'),
        ('AB Positive', 'AB Positive'),
        ('AB Negative', 'AB Negative'),

    ]

    p_id = forms.CharField(max_length=50,widget=forms.TextInput(attrs={
        'class':'form-control',
        'id':'p_id',
        'placeholder':'নিখোঁজ ব্যক্তির আইডি'
    }))

    nick_name = forms.CharField(max_length=150,widget=forms.TextInput(attrs={
        'class':'form-control',
        'id':'nick_name',
        'placeholder':'নিখোঁজ ব্যক্তির ডাক নাম'
    }))
    full_name = forms.CharField(max_length=150,widget=forms.TextInput(attrs={
        'class':'form-control',
        'id':'full_name',
        'placeholder':'নিখোঁজ ব্যক্তির পুর্ন নাম'
    }))
    address = forms.CharField(max_length=500,widget=forms.Textarea(attrs={
        'class':'form-control',
        'id':'address',
        'placeholder':'নিখোঁজ ব্যক্তির ঠিকানা',
        'rows':'5',
        'cols':'20',
    }))
    blood_group = forms.CharField(max_length=20,widget=forms.Select(attrs={
        'class':'form-control',
        'id':'blood_group',
    },choices=blood_group))
    special_mark = forms.CharField(max_length=120,widget=forms.TextInput(attrs={
        'class':'form-control',
        'id':'special_mark',
        'placeholder':'নিখোঁজ ব্যক্তির চিহ্ন',
    }))
    age = forms.CharField(max_length=120,widget=forms.TextInput(attrs={
        'class':'form-control',
        'id':'age',
        'placeholder':'নিখোঁজ ব্যক্তির বয়স',
    }))
    gardian_name = forms.CharField(max_length=120,widget=forms.TextInput(attrs={
        'class':'form-control',
        'id':'age',
        'placeholder':'নিখোঁজ ব্যক্তির অভিভাবক',
    }))
    gardian_phone_number = forms.CharField(max_length=120,widget=forms.TextInput(attrs={
        'class':'form-control',
        'id':'age',
        'placeholder':'নিখোঁজ ব্যক্তির অভিভাবক এর ফোন',
    }))
    skin_tone = forms.CharField(max_length=120,widget=forms.TextInput(attrs={
        'class':'form-control',
        'id':'skin_tone',
        'placeholder':'নিখোঁজ ব্যক্তির গায়ের রং',
    }))
    dress_up = forms.CharField(max_length=120,widget=forms.TextInput(attrs={
        'class':'form-control',
        'id':'dress_up',
        'placeholder':'নিখোঁজ ব্যক্তির পরিহিত কাপড়',
    }))
    phone_number = forms.CharField(max_length=20,widget=forms.TextInput(attrs={
        'class':'form-control',
        'id':'phone_number',
        'placeholder':'ফোন নম্বর',
    }))
    last_location = forms.CharField(max_length=150, widget=forms.TextInput(attrs={
        'class':'form-control',
        'id':'last_location',
        'placeholder':'শেষ যেখানে দেখা গিয়েছিল',
    }))
    miscellaneous = forms.CharField(max_length=500,widget=forms.Textarea(attrs={
        'class':'form-control',
        'id':'miscellaneous',
        'placeholder':'নিখোঁজ ব্যক্তির বিবরন',
    }))
    image = forms.ImageField(widget=forms.FileInput(attrs={
        'class':'form-control',
        'id':'image',
    }))
    class Meta:
        model = People
        fields = ['p_id','nick_name','full_name','address','blood_group','special_mark','age','gardian_name','gardian_phone_number','skin_tone','dress_up','phone_number','last_location','miscellaneous','image']





class CreateUserForm(UserCreationForm):
    username = forms.CharField(max_length=120, widget=forms.TextInput(
        attrs={
            'class': 'form-control',
            'id': 'user_field',
            'placeholder': 'Enter Your Username',
        }
    ))
    first_name = forms.CharField(max_length=120, widget=forms.TextInput(
        attrs={
            'class': 'form-control',
            'id': 'first_name',
            'placeholder': 'Enter Your First Name',
        }
    ))
    last_name = forms.CharField(max_length=120, widget=forms.TextInput(
        attrs={
            'class': 'form-control',
            'id': 'last_name',
            'placeholder': 'Enter Your Last Name',
        }
    ))

    email = forms.CharField(max_length=120, widget=forms.EmailInput(
        attrs={
            'class': 'form-control',
            'id': 'email_field',
            'placeholder': 'Enter Your Email'
        }
    ))
    password1 = forms.CharField(max_length=12, widget=forms.PasswordInput(
        attrs={
            'class': 'form-control',
            'id': 'password_field_one',
            'placeholder': 'Enter Password First',
        }
    ))
    password2 = forms.CharField(max_length=12, widget=forms.PasswordInput(
        attrs={
            'class': 'form-control',
            'id': 'password_field_two',
            'placeholder': 'Enter Password Again',
        }
    ))

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name',
                  'email', 'password1', 'password2']


class SearchForm(forms.ModelForm):

    image = forms.ImageField()
    
    class Meta:
        model = SearchImage
        fields = ['image']