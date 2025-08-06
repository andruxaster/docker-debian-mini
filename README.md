# docker-debian-mini

git clone https://github.com/andruxaster/docker-debian-mini

cd docker-debian-mini

docker build -t andruxaster/docker-debian-mini .

docker run -d -p 2222:22 andruxaster/docker-debian-mini
