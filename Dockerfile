#FROM python:3.6
#
#ENV PYTHONUNBUFFERED 1
#
#COPY . /code/
#WORKDIR /code/
#
#RUN pip install pipenv
##RUN pip install -r requirements/local.txt
#RUN pipenv install --system

FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
COPY . /code/
WORKDIR /code
ADD requirements/local.txt /code/requirements
ADD requirements/base.txt /code/requirements
RUN pip install -r requirements/local.txt
ADD . /code/