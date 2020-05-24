# Ansible
### Ansible Course

Hola ! Me encuentro en la realización de un curso sobre Ansible para el manejo de infraestructura ágil. Para dicho curso tuve que obtener conocimientos ya olvidados que pensé que no los iba a volver a repasar como: bash, usuarios en linux, redes, etc.

Para este curso es necesario montar una mínima infraestructura local para que tenga sentido el uso de las herramientas que se proponen. Por tal motivo y con la ayuda de Docker, pude avanzar rápidamente en dicho objetivo. Utilizando Dockerfiles me dispuse a crear 3 imágenes que luego se convertirán en contenedores, las cuales, tienen como objetivo cumplir el rol de servidores clientes (2) y maestros (1). Comparto a continuación el repositorio de dichas imágenes para poder utilizarlas:

```
docker pull thomasdocker92/ansible-centos-master
docker pull thomasdocker92/ansible-debian-client
docker pull thomasdocker92/ansible-ubuntu-client
```

Repositorio en Docker: https://hub.docker.com/r/thomasdocker92

Actualmente se encuentran en desarrollo, para su versión latest está funcionando.

Por otro lado, en el siguiente repositorio en github: https://github.com/thomasrosales/ansible se pueden obtener los archivos de docker para cada una de las imágenes, como a su vez los script que estoy desarrollando que cumplen funcionalidades específicas, como instalaciones de servicios, empaquetamiento de archivos, entre otros. Cabe decir que el archivo docker-compose.yml podría ser de utilidad para trabajar automáticamente que los ser imágenes:

`docker-compose up`

![Image of Powershell](https://github.com/thomasrosales/ansible/blob/master/images/pw1.jpg)

`docker-compose ps`

![Image of Powershell](https://github.com/thomasrosales/ansible/blob/master/images/pw2.jpg)

Utilizando el comando docker-compose up -f se levanta y se crean los contenedores, redes y volúmenes que se hayan especificados en el archivo docker-compose.yml. Conectarse al siguiente contenedor: ansible_master de la siguiente manera:

![Image of Powershell](https://github.com/thomasrosales/ansible/blob/master/images/pw3.jpg)

Generar clave pública y agregar clave a algún servidor local:

 ```
 ssh-keygen
 cat /root/.ssh/id_rsa.pub
 copiar: ssh-rsa AAAA [...] root@<hash>
 ```
 
 Luego conectarse a algunos de los contenedores clientes, que ya están preparados para agregar la clave pública del master a cada uno de ellos. Para realizar esto se debe:
 
 ```
 cd .ssh/
 nano autorized_keys
 Pegar la clave pública copiada en el paso anterior.
 ```
 
 **Nota: _una vez pegado el SHA se debe modificar la palabra root por el nombre del usuario del contenedor, por ejemplo: debian@... _**.
 
 ![Image of Powershell](https://github.com/thomasrosales/ansible/blob/master/images/pw4.jpg)
 
 ```
 ssh debian@192.168.10.4
 ```
 
 ![Image of Powershell](https://github.com/thomasrosales/ansible/blob/master/images/pw5.jpg)
 
