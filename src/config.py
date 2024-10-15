import datetime
import json
import os
import secrets


class Config:
    JSON_SORT_KEYS = False

    MAIL_SERVER = os.getenv("MAIL_SERVER")
    MAIL_PORT = os.getenv("MAIL_PORT")
    MAIL_USERNAME = os.getenv("MAIL_USERNAME")
    MAIL_PASSWORD = os.getenv("MAIL_PASSWORD")
    MAIL_DEFAULT_SENDER_NAME = os.getenv("MAIL_DEFAULT_SENDER_NAME")
    MAIL_USE_TLS = os.getenv("MAIL_USE_TLS", "false").lower() == "false"
    MAIL_USE_SSL = os.getenv("MAIL_USE_SSL", "false").lower() == "false"

    REMEMBER_COOKIE_DURATION = datetime.timedelta(
        seconds=int(os.getenv("REMEMBER_COOKIE_DURATION", 600))
    )
    PERMANENT_SESSION_LIFETIME = REMEMBER_COOKIE_DURATION

    SECRET_KEY = secrets.token_urlsafe(32)

    SQLALCHEMY_DATABASE_URI = os.getenv("SQLALCHEMY_DATABASE_URI")
    SQLALCHEMY_TRACK_MODIFICATIONS = (
        os.getenv("SQLALCHEMY_TRACK_MODIFICATIONS", "false").lower() == "false"
    )
