**A Django template which includes Mpesa Daraja API, reset password functionality(Email) and OTP during login.**

## To get started

```
git clone https://github.com/Nerds-Catapult/xzz-code-prompts --depth 1 && cd xzz-code-prompts/Django
```

```
virtualenv venv
```

```
source venv/bin/activate
```

```
pip install -r requirements.txt
```

Ensure to always run:

```
python manage.py make migrations
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
