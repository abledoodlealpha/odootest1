FROM python:3.10

# System dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libpq-dev \
    libsasl2-dev \
    libldap2-dev \
    libxml2-dev \
    libxslt1-dev \
    libzip-dev \
    libjpeg-dev \
    zlib1g-dev \
    libffi-dev \
    libssl-dev \
    libpq-dev \
    wkhtmltopdf \
    nodejs \
    npm

# Set workdir
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy full code
COPY . .

# Expose port
EXPOSE 8080

# Default command to run Odoo
CMD ["odoo-bin", "-c", "odoo.conf", "--http-port=${PORT}"]

