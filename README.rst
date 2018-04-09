**Local deploy:**

- Clone repo on your local machine\

- install docker and docker-compose

- Change directory to folder, where manage.py file is located

- run: sudo chown -R $USER:$USER .

- run: docker-compose up

- run: docker container ls (You should to find postgres container id)

- run: cat dump.sql | docker exec -i "CONTAINER_ID" psql -Upostgres

- Visit 127.0.0.1:8000/login

** Usage **

The system contains 2 type of users: patients and doctors.

Doctors can invite patient through sending email with credentials for log in.

After you follow 127.0.0.1:8000/login, you can log in as doctor

 with login: *test* and password: *test*.

After login you can see list of profiles of two patients.

You can send them invite email by clicking on 'send invite' button.

In django terminal you can see text of sent email with corresponding

credentials.

So, to log in as patient you should log out and log in using credentials

from email.


