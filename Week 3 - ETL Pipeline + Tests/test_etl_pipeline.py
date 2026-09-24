import pandas as pd

from etl_pipeline import transform_data


def test_transform_data():

    sample_data = [
        {
            "id": 1,
            "name": "John",
            "username": "john123",
            "email": "john@example.com"
        }
    ]

    result = transform_data(sample_data)

    assert isinstance(result, pd.DataFrame)
    assert len(result) == 1


def test_column_names():

    sample_data = [
        {
            "id": 1,
            "name": "John",
            "username": "john123",
            "email": "john@example.com"
        }
    ]

    result = transform_data(sample_data)

    expected_columns = [
        "User_ID",
        "Name",
        "Username",
        "Email"
    ]

    assert list(result.columns) == expected_columns


def test_empty_data():

    result = transform_data([])

    assert result.empty