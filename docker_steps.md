# Instaltion 
## install docker with the apt command:
```sudo apt-get install -y docker.io```

## start Docker with the systemctl command
```sudo systemctl start docker```

## Enable docker to run at system boot
``` sudo systemctl enable docker```

## check the docker version
```docker version```

# Docker commmands 

To create a new container, you should start by choosing a base image with the OS, e.g. ubuntu or centos or windows ... 

```sudo docker search ubuntu```

## download the base image to our server
```sudo docker pull ubuntu```

or 

```sudo docker pull ubuntu:14.04```

## see all downloaded images
```sudo docker images```

## create a container from that image
```sudo docker create ubuntu:16.04```

## start the container 
```docker run -i -t ubuntu:16.04 /bin/bash```

This command will create and run a container based in ubuntu 16.04 image and run a command /bin/bash inside the container, you will be automatically inside the container after running the command. 

**or simple your can srart it by **
```sudo docker run -it ubuntu```

The combination of the -i and -t switches gives you interactive shell access into the container



## stop the container 
```exit```

## can see the container running in the background
```sudo docker ps```

## stop a container in the background 

When you type `exit` on that shell you will leave that shell but the container is still running.
Another command that you will use often is
```docker stop NAME/ContainerID```

##  you can start it again with the command
```docker start NAME/ContainerID```

## remove the container
If you like to remove the container, stop it first and then remove it with the command:

```sodo docker rm NAME/ContainerID```

## install packages inside the container 
```apt-get update```
```apt-get install <packagename>```

