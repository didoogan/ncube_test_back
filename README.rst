ncube_test_back
===============

Behold My Awesome Project!

.. image:: https://img.shields.io/badge/built%20with-Cookiecutter%20Django-ff69b4.svg
     :target: https://github.com/pydanny/cookiecutter-django/
     :alt: Built with Cookiecutter Django


:License: MIT


Local deploy:
1. Clone repo on your local machine
2. install docker and docker-compose
3. Change directory to folder, where manage.py file is located
4. run: docker build .
5. run: docker-compose up
6. run: docker container ls (You should to find postgres container id)
7. run: cat dump.sql | docker exec -i `container_id` psql -Upostgres
8. Visit 127.0.0.1:8000

