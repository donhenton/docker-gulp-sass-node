FROM luamas/ruby-node-sass
 
ENV appDir /var/www/app/current
ENV NPM_CONFIG_LOGLEVEL=warn
ENV userDir /home/nodeuser

RUN apk add --no-cache \
    openssh-client \
    openssh \
    bash && \
    npm install -g  bower gulp  pm2  && \
    adduser -D -s /bin/sh -h ${userDir} nodeuser

# use this to copy ssh keys to the root user
#COPY homedir/ /root
#RUN chmod 400 /root/.ssh/* && \

# RUN mkdir -p /var/www/app/current  
# Add application files
# WORKDIR ${appDir}
# ADD . /var/www/app/current

# RUN npm i --development && gulp

# Expose the port
# EXPOSE 8888
# set the user to run the app
# USER nodeuser
# CMD ["pm2", "start", "processes.json", "--no-daemon"]
