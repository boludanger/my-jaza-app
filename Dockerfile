# Use a lightweight Node.js image to run the Firebase CLI
FROM node:18-alpine

# Install Java, which is required by the Firebase Emulators
RUN apk add --no-cache openjdk17

# Install the Firebase CLI and a simple web server
RUN npm install -g firebase-tools serve

# Copy your application files and the startup script into the container
WORKDIR /app
COPY . .

# Set permissions for the startup script
RUN chmod +x ./start.sh

# Expose the ports for the emulators (Firestore, Auth, and UI) and the web server
EXPOSE 8080 9099 3000

# Run the startup script
CMD ["./start.sh"]