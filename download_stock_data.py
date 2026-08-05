import yfinance as yf
import pandas as pd

stocks = {
    "Apple": "AAPL",
    "Microsoft": "MSFT",
    "Google": "GOOGL",
    "Amazon": "AMZN",
    "Tesla": "TSLA",
    "NVIDIA": "NVDA"
}

all_data = []

for company, ticker in stocks.items():
    print(f"Downloading {company}...")

    data = yf.download(
        ticker,
        start="2020-01-01",
        end="2026-01-01",
        auto_adjust=True,
        progress=False
    )

    # MultiIndex Remove
    if isinstance(data.columns, pd.MultiIndex):
        data.columns = data.columns.get_level_values(0)

    data.reset_index(inplace=True)

    data["Company"] = company

    data = data[["Date", "Company", "Open", "High", "Low", "Close", "Volume"]]

    all_data.append(data)

final_df = pd.concat(all_data, ignore_index=True)

final_df.to_csv("../Data/stock_data.csv", index=False)

print("✅ Data Saved Successfully!")