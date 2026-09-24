import requests
import pandas as pd


API_URL = "https://jsonplaceholder.typicode.com/users"


def extract_data():
    response = requests.get(API_URL)

    if response.status_code == 200:
        return response.json()
    else:
        print("Failed to fetch data.")
        return []


def transform_data(data):
    df = pd.DataFrame(data)

    if df.empty:
        return df

    df = df[["id", "name", "username", "email"]]

    df = df.rename(columns={
        "id": "User_ID",
        "name": "Name",
        "username": "Username",
        "email": "Email"
    })

    df = df.dropna()

    return df


def load_data(df):
    df.to_csv("output.csv", index=False)
    print("Data saved to output.csv")


def main():

    print("===== ETL PIPELINE =====")

    print("\nExtracting data...")
    data = extract_data()

    print("Records fetched:", len(data))

    print("\nTransforming data...")
    df = transform_data(data)

    print(df)

    print("\nLoading data...")
    load_data(df)

    print("\nETL process completed successfully.")


if __name__ == "__main__":
    main()