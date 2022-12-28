sudo docker ps -a -q --filter "name=192.168.0.0.31:5000/dockertesting3" | grep -q . && docker stop dockertesting3 && docker rm dockertesting3 | true
sudo docker rmi 192.168.0.0.31:5000/dockertesting3
sudo docker login -u admin -p tnsqja4856 192.168.0.0.31:5000
sudo docker pull 192.168.0.0.31:5000/dockertesting3
docker run -d -p 8080:8080 --name dockertesting3 192.168.0.0.31:5000/dockertesting3