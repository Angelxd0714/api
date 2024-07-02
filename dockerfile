# Base image
FROM node:latest

# Crea el directorio de la aplicación en el contenedor
WORKDIR /api

# Copia los archivos package.json y package-lock.json explícitamente
COPY package.json ./
COPY package-lock.json ./

# Install app dependencies
RUN npm install

# Copia el resto de los archivos de la aplicación
COPY . .


# Creates a "dist" folder with the production build
RUN npm run build

# Expose the port on which the app will run
EXPOSE 5000

# Start the server using the production build
CMD ["npm", "run", "start:prod"]