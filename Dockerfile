FROM luamas/ruby-node-sass:latest
 
ENV appDir /var/www/app/current
ENV NPM_CONFIG_LOGLEVEL=warn
ENV userDir /home/nodeuser
# npm config set strict-ssl false --global && \
RUN apk add --no-cache \
    openssh-client \
    openssh \
    bash && \
    npm install -g  gulp  pm2  && \
    adduser -D -s /bin/sh -h ${userDir} nodeuser

# use this to copy ssh keys to the root user
#COPY homedir/ /root
#RUN chmod 400 /root/.ssh/* 

RUN mkdir -p /var/www/app/current  
# Add application files
WORKDIR ${appDir}
#ADD ./nodeapp /var/www/app/current

#run this if node_modules not copied in
#RUN npm i --development && gulp

# Expose the port
# EXPOSE 8888
# set the user to run the app
# remove this temporarily to be root
USER nodeuser
#CMD ["pm2", "start", "processes.json", "--no-daemon"]
#use this to troubleshoot instead of cmd above
#replace with pm2 when actually using this
#CMD ["/bin/sh"]
