# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies (if exists)
RUN if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# Default command (change file name if needed)
CMD ["python", "app.py"]
