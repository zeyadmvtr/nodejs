# Use a lightweight official Node.js runtime
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy dependency definitions first to leverage Docker layer caching
COPY package*.json ./

# Install only production dependencies
RUN npm ci --omit=dev || npm install --omit=dev

# Copy application source code
COPY index.js ./

# Expose the default application port
EXPOSE 3000

# Run the app as a non-root user for security
USER node

# Start the application
CMD ["npm", "start"]
