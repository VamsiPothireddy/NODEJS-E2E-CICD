# Stage 1: Build Stage (Use an Alpine base to keep it lightweight)
FROM node:16-alpine as build

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Copy the rest of the application code to the container
COPY . .

# Stage 2: Production Stage (Distroless)
FROM gcr.io/distroless/nodejs:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy only the necessary files from the build stage
COPY --from=build /usr/src/app /usr/src/app

# Expose the port the app runs on
EXPOSE 3000

# Start the Node.js application
CMD ["index.js"]
