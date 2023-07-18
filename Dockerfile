# Use the official Python base image
FROM python:3.9-slim-buster

# Install necessary packages
RUN apt-get update && apt-get install -y git

# Set the working directory
WORKDIR /app

# Clone the Git repository into the container
RUN git clone https://github.com/Roni-Angress/demo_rep.git /app

# Copy the requirements file
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 5000

# Run the application
CMD [ "python", "app.py" ]

