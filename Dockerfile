# Use the official Python image.
FROM python:3.9-slim

# Set the working directory inside the container.
WORKDIR /app

# Copy the requirements file into the container.
COPY book_catalog/requirements.txt /app/book_catalog/

# Install the dependencies.
RUN pip install --no-cache-dir -r /app/book_catalog/requirements.txt

# Copy the entire application directory into the container.
COPY book_catalog /app/book_catalog

# Set environment variables
ENV DATABASE_URL=postgresql://db_6_2_user:AFBekLJMrwVRA2CgaXf5fyyWqeC9XFR6@dpg-crbhsc2j1k6c738bvag0-a.oregon-postgres.render.com/db_6_2

# Expose the port FastAPI is running on.
EXPOSE 8000

# Set the working directory to the app's directory
WORKDIR /app/book_catalog

# Start the FastAPI server.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
