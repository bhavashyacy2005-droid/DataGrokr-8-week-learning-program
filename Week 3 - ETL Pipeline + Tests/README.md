# Week 3 - ETL Pipeline + Tests

This is my Week 3 Python mini-project. In this project, I created a simple ETL pipeline that gets data from a REST API, processes the data using Pandas, and saves the final result into a CSV file.

I also added some basic unit tests using pytest to check whether the data transformation is working properly.

## About the Project

The project follows the basic ETL process:

**Extract → Transform → Load**

### Extract

First, the program connects to a REST API and fetches user data using the `requests` library.

The API returns the data in JSON format.

### Transform

The JSON data is converted into a Pandas DataFrame.

I then select the required columns, rename them to make them easier to understand, and remove any missing values.

### Load

After the data is processed, it is saved into a CSV file called:

```text
output.csv
```

This gives me a simple way to store the processed data and use it later.

## Testing

I used `pytest` to test the transformation part of the project.

The tests check:

* Whether the returned data is a Pandas DataFrame
* Whether the expected columns are present
* Whether the program correctly handles empty data

## Technologies Used

* Python
* Requests
* Pandas
* REST API
* CSV
* pytest

## Project Structure

```text
Week-3-ETL-Pipeline/
│
├── README.md
├── etl_pipeline.py
├── test_etl_pipeline.py
└── output.csv
```

## How to Run

First, install the required Python libraries:

```bash
pip install requests pandas pytest
```

Run the ETL pipeline:

```bash
python etl_pipeline.py
```

The program will fetch the data from the API, process it, and create/update `output.csv`.

To run the tests:

```bash
python -m pytest
```

If everything is working correctly, the tests should show:

```text
3 passed
```

## ETL Flow

```text
REST API
   ↓
Extract Data
   ↓
Transform using Pandas
   ↓
Save as CSV
   ↓
Run Tests using pytest
```

## What I Learned

While working on this project, I learned how a basic ETL pipeline works. I got practice with calling a REST API, working with JSON data, using Pandas for data transformation, saving data to CSV, and writing simple unit tests using pytest.

This project helped me understand how different Python concepts can be combined into a small data processing workflow.

