FROM node:latest
LABEL enviroment="Prashant-Test-lab"
WORKDIR /usr/src/app
COPY nodeapp/* /
RUN npm install
EXPOSE 3000
CMD [ "npm","start" ]
