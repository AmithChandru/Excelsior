from flask import Flask
from pymongo import MongoClient
import datetime
import pandas as pd

from nsetools import Nse
nse = Nse()

app = Flask(__name__)
con = "mongodb+srv://projectb8:qwerty_b8@cluster0.mvndo.mongodb.net/?retryWrites=true&w=majority"
ini = MongoClient(con,connect=False)
db = ini["db"]
collection = db["price_targets"]

stock_list = {
        "Adani Ports and Special Economic Zone Ltd.": "ADANIPORTS",
        "Apollo Hospitals Enterprise Ltd.": "APOLLOHOSP",
        "Asian Paints Ltd.": "ASIANPAINT",
        "Axis Bank Ltd.": "AXISBANK",
        "Bajaj Auto Ltd.": "BAJAJ-AUTO",
        "Bajaj Finance Ltd.": "BAJFINANCE",
        "Bajaj Finserv Ltd.": "BAJAJFINSV",
        "Bharat Petroleum Corporation Ltd.": "BPCL",
        "Bharti Airtel Ltd.": "BHARTIARTL",
        "Britannia Industries Ltd.": "BRITANNIA",
        "Cipla Ltd.": "CIPLA",
        "Coal India Ltd.": "COALINDIA",
        "Divi's Laboratories Ltd.": "DIVISLAB",
        "Dr. Reddy's Laboratories Ltd.": "DRREDDY",
        "Eicher Motors Ltd.": "EICHERMOT",
        "Grasim Industries Ltd.": "GRASIM",
        "HCL Technologies Ltd.": "HCLTECH",
        "HDFC Bank Ltd.": "HDFCBANK",
        "HDFC Life Insurance Company Ltd.": "HDFCLIFE",
        "Hero MotoCorp Ltd.": "HEROMOTOCO",
        "Hindalco Industries Ltd.": "HINDALCO",
        "Hindustan Unilever Ltd.": "HINDUNILVR",
        "Housing Development Finance Corporation Ltd.": "HDFC",
        "ICICI Bank Ltd.": "ICICIBANK",
        "ITC Ltd.": "ITC",
        "IndusInd Bank Ltd.": "INDUSINDBK",
        "Infosys Ltd.": "INFY",
        "JSW Steel Ltd.": "JSWSTEEL",
        "Kotak Mahindra Bank Ltd.": "KOTAKBANK",
        "Larsen & Toubro Ltd.": "LT",
        "Mahindra & Mahindra Ltd.": "M&M",
        "Maruti Suzuki India Ltd.": "MARUTI",
        "NTPC Ltd.": "NTPC",
        "Nestle India Ltd.": "NESTLEIND",
        "Oil & Natural Gas Corporation Ltd.": "ONGC",
        "Power Grid Corporation of India Ltd.": "POWERGRID",
        "Reliance Industries Ltd.": "RELIANCE",
        "SBI Life Insurance Company Ltd.": "SBILIFE",
        "Shree Cement Ltd.": "SHREECEM",
        "State Bank of India": "SBIN",
        "Sun Pharmaceutical Industries Ltd.": "SUNPHARMA",
        "Tata Consultancy Services Ltd.": "TCS",
        "Tata Consumer Products Ltd.": "TATACONSUM",
        "Tata Motors Ltd.": "TATAMOTORS",
        "Tata Steel Ltd.": "TATASTEEL",
        "Tech Mahindra Ltd.": "TECHM",
        "Titan Company Ltd.": "TITAN",
        "UPL Ltd.": "UPL",
        "UltraTech Cement Ltd.": "ULTRACEMCO",
        "Wipro Ltd.": "WIPRO"}
    

def get_ltp(symbol):
    quote = nse.get_quote(symbol)
    return quote["lastPrice"]

@app.route('/get_nifty_list',methods=['GET'])
def get_nifty_list():
    print('hehe')
    stocks = []
    for stock in stock_list:
        temp = {"name":stock,"symbol":stock_list[stock], "current_price": get_ltp(stock_list[stock])}
        stocks.append(temp)
    result = {
        "status":"successful",
        "list":stocks
        }
    return result


@app.route('/get_prediction/<string:symbol>',methods=['GET'])
def get_prediction(symbol):
    filter = {"symbol": symbol, "date":(datetime.datetime.now() + datetime.timedelta(days=1)).strftime("%Y-%m-%d")}
    docs = collection.find_one(filter)
    if docs:
        result = {
            "status":"successful",
            "predicted_price":docs["predicted_price"]
            }
    else:
        result = {
            "status":"error",
            "message":"No data available for requested stock"
        }
    return result

@app.route('/get_recommendations',methods=['GET'])
def get_recommendations():
    filter = {"date":(datetime.datetime.now()+datetime.timedelta(days=1)).strftime("%Y-%m-%d")}
    docs = collection.find(filter)
    if not docs:
        result = {
            "status":"error",
            "message":"No predictions available for today"
        }
        return result
    max_returns = []
    for doc in docs:
        ltp = get_ltp(doc["symbol"])
        pct_change = abs(doc["predicted_price"] - ltp/ltp)
        max_returns.append({"symbol":doc["symbol"],"pct_change":pct_change, "predicted_price":doc["predicted_price"]})
    recs = sorted(max_returns,key = lambda x: x["pct_change"], reverse=True)
    print(recs)
    recommendations = []
    for idx in range(3):
        if idx >= len(recs):
            break
        recommendations.append({"Symbol":recs[idx]["symbol"],"Recommended price":recs[idx]["predicted_price"], "pct_change":recs[idx]["pct_change"]})
    result = {
        "status": "successful",
        "recommendations": recommendations
    }
    return result

if __name__ == "__main__":
    app.run(debug=True)