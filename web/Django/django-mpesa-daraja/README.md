# DARAJA-API & DJANGO

A **Django** starter which includes **Mpesa's Daraja API**, reset password functionality(Email) and OTP during login.

## Get started

---

### 1. Clone this repository and change directory into Django

```bash
git clone https://github.com/Nerds-Catapult/xzz-code-prompts --depth 1 && cd xzz-code-prompts/web/Django
```

### 2. Create a virtual environment venv by running the following command

```bash
virtualenv venv
```

This should create a new folder venv with the following directories: Lib, Scripts, .gitignore, pyvenv.cfg. Your cli should also have the prefix (venv)

### 3. Activate the virtual environment using the command

```bash
source venv/bin/activate

Windows OS
venv\Scripts\activate
```

### 4. Install the dependencies while the virtual environment is still running

cd into the "django-mpesa-daraja" folder and then cd into the "sample" project

```Bash
pip install -r requirements.txt
```

### 5. Update your Migrations

```bash
python manage.py makemigrations

python manage.py migrate
```

# Features

- Email integration
- Mpesa STK push and confirm payment
- Reset password if email is registered in the DB
- Get OTP code using Authenticator app e.g Google (SMS will soon be included)
- See geolocation of logged in users and optionally log them out

# Technologies used

- Python (Django)
- Daraja API

## Track progress

- [] Mpesa working
- [] Reset password working
- []

The current folder structure is as follows.

```
└── 📁sample(project)
    └── .env.example
    └── .gitignore
    └── db.sqlite3
    └── manage.py
    └── requirements.txt
    └── 📁sample(admin area)
        └── asgi.py
        └── settings.py
        └── urls.py
        └── wsgi.py
        └── __init__.py
        └── 📁__pycache__
    └── 📁sampleapp(modular app)
        └── admin.py
        └── apps.py
        └── forms.py
        └── 📁migrations
        └── models.py
        └── tests.py
        └── urls.py
        └── views.py
        └── __init__.py
        └── 📁__pycache__
            └── forms.cpython-311.pyc
            └── models.cpython-311.pyc
            └── urls.cpython-311.pyc
            └── views.cpython-311.pyc
            └── __init__.cpython-311.pyc
    └── 📁templates
        └── dashboard.html
        └── login.html
        └── mpesa.html
        └── pass_reset_done.html
        └── register.html
        └── reset_pass.html
```
