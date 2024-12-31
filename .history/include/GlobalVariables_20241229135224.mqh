//?Start of development on 2024/12/04-09:19:25
#ifndef __GlobalVariables__
#define __GlobalVariables__

#property copyright "Created on "
#property strict
#property link      ""
#property version   ""

#ifdef __MQL4__
    //!#include <stdlib.mqh>
    //!int positionTicket;
    //!int magicNumber;
    int notice = MessageBox(
        "EA is not compatible with MT4." + "\n" +
        "To make it compatible, please create stdlib.mq4 and stdlib.mqh files" + "\n" +
        "and adapt your custom functions to be compatible with MT4." + "\n" +
        "NOTICE",
        MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
    );
#endif

#ifdef __MQL5__
    #include <ErrorDiscription.mqh>
    ulong positionTicket;
    ulong magicNumber;
#endif

#define OANDA
//#define AXIORY
//#define TEST_MODE

string trendLinesName[14] = {
    "first factor line", "two factor entry", "two factor lc", "two factor tp",
    "buy entry", "sell entry", "lc line", "tp line",
    "break buy", "break sell", "break buy lc", "break buy tp", "break sell lc", "break sell tp"
};
enum OrderType{REST, BUY, SELL, BREAK, DYNAMIC};
OrderType Enum_OrderType;

string _symbol;
string _broker;
int _digits;
int _period;
double convertPipsToPrice;
//!=================for preparation=================
string preparationOrderType;
double targetRrRate;
bool firstStepDone;
//!=================for preparation=================
string tradeStrategy;
bool isEnvironmentSuitable;
bool dailyTaskCompleted
double firstFactorPrice;
double twoFactorEntryPrice;
double twoFactorLcPrice;
double twoFactorTpPrice;
double buyEntryPrice;
double sellEntryPrice;
double lcPrice;
double tpPrice;
double breakBuyPrice;
double breakBuyTpPrice;
double breakBuyLcPrice;
double breakSellPrice;
double breakSellTpPrice;
double breakSellLcPrice;
double priceDataArr[];
bool authed;
bool isTwoFactorEntryAvailable;
bool isFollowEntryAvailable;
bool isBreakBuyEntryAvailable;
bool isBreakSellEntryAvailable;
bool printOrderInfo(){return true;}
#endif