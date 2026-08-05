import pandas as pd

# CSV Read
df = pd.read_csv("../Data/stock_data.csv")

# Date ko datetime format me convert karo
df["Date"] = pd.to_datetime(df["Date"], dayfirst=True)

# New Columns
df["Year"] = df["Date"].dt.year
df["Month"] = df["Date"].dt.month_name()
df["Day"] = df["Date"].dt.day

# Price Change
df["Price Change"] = df["Close"] - df["Open"]

# Daily Return %
df["Daily Return %"] = ((df["Close"] - df["Open"]) / df["Open"]) * 100

# 20 Day Moving Average
df["MA20"] = (
    df.groupby("Company")["Close"]
      .transform(lambda x: x.rolling(20).mean())
)

# 50 Day Moving Average
df["MA50"] = (
    df.groupby("Company")["Close"]
      .transform(lambda x: x.rolling(50).mean())
)

# Missing values ko 0 se fill kar do
df.fillna(0, inplace=True)

# Save new file
df.to_csv("../Data/stock_data_cleaned.csv", index=False)

print("✅ Cleaned Dataset Saved Successfully!")
