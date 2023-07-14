# TEST CLOUD FUNCTION

## Local Setup

1. Create a file called `.env` and add the require values for the function to run. You can use `.env-example` as a base.

2. Build the docker image:

   `docker build -t test_cloud_function .`

## Using the function

1. Start up the docker container with the following command:

   *You'll need to use the command defined in the [Database]() section if you plan on using the database directly*

    `docker run -p 8080:8080 test_cloud_function`

2. You can trigger the function by hitting it's endpoint:

   `curl http://0.0.0.0:8080`


## Registering changes

There is currently no hot reload setup for this cloud function, so you'll have to rebuild the docker image after every change:
   
   `docker build -t test_cloud_function .`


## Database

*You can ignore this if you're not gonna use any active record models directly in the function*

1. Make sure you're running your local docker container database for Buddy.
   
     `docker-compose up mysql`

2. Get the docker container's name for your DB with:
   
     `docker ps`

    You should see something like this
    ```
      CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS         PORTS                    NAMES
      6ffa16c6c575   mysql:5.6   "docker-entrypoint.s…"   2 minutes ago   Up 2 minutes   0.0.0.0:3306->3306/tcp   buddy-mysql-1
    ```

3. Get the network of your database with the following command:
   
     `docker network ls`
  
    You should see something like this
    ```
      NETWORK ID     NAME            DRIVER    SCOPE
      7616481555c1   buddy_default   bridge    local
    ```

4. If this is the first time you're running the function, remember to build it with the following command:

    `docker build -t test_cloud_function .`

5. Whenever you run the cloud function docker command, you should create a link between the cloud function and the DB container like so:

    `docker run -p 8080:8080 --network buddy_default --link buddy-mysql-1:mysql test_cloud_function`
