# This needs to be run from the root directory as you want to call files from mapmaker/static
# to do so use this build command: 
# docker build -t nginx:latest -f Infrastructure/nginx/Dockerfile .

FROM nginx:1.19.0-alpine
# Adding temp file for cache
RUN mkdir /tmp/nginx


# Install git
RUN apk update && apk add git

# Clone specific folder from GitHub
RUN git clone --depth 1 https://github.com/Dossierr/WebserverDjango.git --branch main /tmp/cloned-folder

# Move the cloned folder to the desired location
RUN mv /tmp/cloned-folder/staticfiles /usr/share/nginx/html/static



#Specific settings so nginx works as a reverse proxy
COPY default.conf ./etc/nginx/conf.d/default.conf

EXPOSE 80