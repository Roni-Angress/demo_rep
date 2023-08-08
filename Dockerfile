# Use the official Python base image
FROM python:3.9-slim-buster

# Install necessary packages
RUN apt-get update && apt-get install -y git

# Use the '.' notation to set the working directory to the current folder
WORKDIR .

# Copy the application files into the container's working directory
COPY app.py .

# Clone the Git repository into the container

# Copy the requirements file
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 5000

# Run the application
CMD [ "python", "app.py" ]

