FROM python:3.8

WORKDIR /backend

RUN pip install --upgrade pip
RUN pip install django
RUN pip install mysqlclient
RUN pip install django-autoreload
RUN pip install python-dotenv
RUN pip install django-cors-headers
RUN pip install djangorestframework

COPY emdcbackend/ /backend/

# Ensure the SQLite database is stored in /storage, which is persistent on App Platform
RUN mkdir -p /storage
ENV DATABASE_PATH=/storage/db.sqlite3

EXPOSE 7004

CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:7004"]
