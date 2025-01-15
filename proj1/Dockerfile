FROM node:latest
COPY . .
RUN npm install -g nodemon
RUN npm install
RUN npm rebuild bcrypt --build-from-source
EXPOSE 8000
CMD [ "node","index.mjs"]