from .settings import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'blog_backend',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': '127.0.0.1',
        "OPTIONS": {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'"
        }
    }
}