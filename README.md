Example To-Do List Application
This repository is a simple to-do list manager that runs on Node.js.

Getting started
Download Docker Desktop for Mac or Windows. Docker Compose will be automatically installed.
On Linux, make sure you have the latest version of Compose.

Clone the repository
Open a terminal and clone this application:


git clone https://github.com/Kundan547/todo-testing.git
Run the app
Navigate into the todo-testing directory:

docker compose up -d --build
When you run this command, you should see an output like this:


[+] Running 4/4
✔ app 3 layers [⣿⣿⣿]      0B/0B            Pulled           7.1s
  ✔ e6f4e57cc59e Download complete                          0.9s
  ✔ df998480d81d Download complete                          1.0s
  ✔ 31e174fedd23 Download complete                          2.5s
[+] Running 2/4
  ⠸ Network todo-testing_default           Created         0.3s
  ⠸ Volume "todo-testing_todo-mysql-data"  Created         0.3s
  ✔ Container todo-testing-app-1           Started         0.3s
  ✔ Container todo-testing-mysql-1         Started         0.3s
List the services

docker compose ps

Example output:

bash
Copy
Edit
NAME                        IMAGE            COMMAND                  SERVICE   CREATED          STATUS          PORTS
todo-testing-app-1          node:18-alpine   "docker-entrypoint.s…"   app       24 seconds ago   Up 7 seconds    127.0.0.1:3000->3000/tcp
todo-testing-mysql-1        mysql:8.0        "docker-entrypoint.s…"   mysql     24 seconds ago   Up 23 seconds   3306/tcp, 33060/tcp
Access the app
The to-do list app will be running at http://localhost:3000.

Do you also want me to update the Docker Compose service names so they use todo-testing instead of todo-list-app? That way your container names will match your new project name.


