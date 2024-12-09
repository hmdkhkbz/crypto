# Use official Python slim image as base
FROM python:3.9-slim

# Set the working directory
WORKDIR /usr/src/app

# Install MariaDB development libraries (for MySQL compatibility)
RUN apt-get update && \
    apt-get install -y \
    libmariadb-dev \
    pkg-config \
    libmariadb-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*
# Copy the project into the container
COPY . /usr/src/app/
# Copy requirements.txt
COPY requirements.txt /usr/src/app/
# Install dependencies from requirements.txt
RUN pip install --upgrade pip
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Apply database migrations and collect static files
##RUN python /usr/src/app/Exchange/manage.py migrate
##RUN python /usr/src/app/Exchange/manage.py collectstatic --noinput

# Expose the port for the app
EXPOSE 8000

# Command to run the application
CMD python /usr/src/app/manage.py migrate && python /usr/src/app/manage.py runserver 0.0.0.0:8000
##CMD ["python", "/usr/src/app/Exchange/manage.py", "runserver", "0.0.0.0:8000"]