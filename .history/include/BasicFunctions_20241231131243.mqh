//?Start of development on 2024/12/04-09:19:25
#property strict
#ifndef __BasicFunctions__
#define __BasicFunctions__

#property copyright "Created on "
#property link      ""
#property version   ""

#include <Convert4To5.mqh>
string getNameOfBroker(){
    int stringLen = StringFind(AccountCompany(), " ");
    string name = StringSubstr(AccountCompany(), 0, stringLen);
    return(name);
}
void init_variables(bool init, bool open, bool close){
    if(close){
    }else
    if(open){
    }else
    if(init){
        _symbol = Symbol();
        _broker = getNameOfBroker();
        _digits = Digits();
        _period = Period();
        dailyTaskCompleted = false;
        firstFactorPrice = 0.0;
        twoFactorEntryPrice = 0.0;
        twoFactorLcPrice = 0.0;
        twoFactorTpPrice = 0.0;
        buyEntryPrice = 0.0;
        sellEntryPrice = 0.0;
        lcPrice = 0.0;
        tpPrice = 0.0;
        breakBuyPrice = 0.0;
        breakBuyTpPrice = 0.0;
        breakBuyLcPrice = 0.0;
        breakSellPrice = 0.0;
        breakSellTpPrice = 0.0;
        breakSellLcPrice = 0.0;
        ArrayInitialize(priceDataArr, 0.0);
        authed = false;
        isTwoFactorEntryAvailable = false;
        isFollowEntryAvailable = false;
        isBreakBuyEntryAvailable = false;
        isBreakSellEntryAvailable = false;
        comment = EnumToString(Enum_Comment = _);
        initialBalance = (int)(AccountEquity()-AccountCredit());
        latestBalance = initialBalance;
        lossPips = -1.0;
    }
}
void getMagicNumber(string broker){
    if(broker == "Axiory"){magicNumber = 473829;}else
    if(broker == "OANDA"){magicNumber = 182745;}else{
        PrintFormat("Error ======> %s, %d", __FILE__, __LINE__);
        int notice = MessageBox(
            StringFormat("This broker '%s' is not supported.", broker) + "\n" +
            "Please register the broker to the source code to continue." + "\n" +
            StringFormat("Edit ======> %s, %d", __FILE__, __LINE__),
            "NOTICE",
            MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
        );
        ExpertRemove();
    }
}
void getCPTP(){
    if(_symbol == "XAUUSD"){convertPipsToPrice = 0.1;}else{
        int notice = MessageBox(
            StringFormat("This pair '%s' is not supported.", _symbol) + "\n" +
            "Please register the broker to the source code to continue." + "\n" +
            StringFormat("Edit ======> %s, %d", __FILE__, __LINE__),
            "NOTICE",
            MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
        );
        ExpertRemove();
    }
}
void settingChart(string symbol){
    double hundredPipDigits = 0.0;
    if(symbol == "GBPJPY" || symbol == "USDJPY"){hundredPipDigits = 1.0;}else
    if(symbol == "CL" || symbol == "USOIL"){hundredPipDigits = 1.0;}else
    if(symbol == "XAUUSD"){hundredPipDigits = 10.0;}else{
        int notice = MessageBox(
            StringFormat("This currency pair '%s'is not supported.", symbol) + "\n" +
            "Please register the broker or currency pair to the source code to continue." + "\n" +
            StringFormat("Edit ======> %s, %d", __FILE__, __LINE__),
            "NOTICE",
            MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
        );
    }
    ChartSetInteger(ChartID(), CHART_MODE, CHART_CANDLES);
    ChartSetInteger(ChartID(), CHART_SHOW_PERIOD_SEP, true);
    ChartSetInteger(ChartID(), CHART_SHOW_GRID, false);
    ChartSetInteger(ChartID(), CHART_COLOR_FOREGROUND, clrGold);
    ChartSetInteger(ChartID(), CHART_COLOR_CHART_UP, clrOlive);
    ChartSetInteger(ChartID(), CHART_COLOR_CHART_DOWN, clrOlive);
    ChartSetInteger(ChartID(), CHART_SHOW_TRADE_LEVELS, false);
    double roundLinePrice = MathFloor(NormalizeDouble((_bid()/hundredPipDigits), _digits));
    for(int iCount = 0; iCount <= 50; iCount ++){
        ObjectCreate(0, "Round"+(string)iCount, OBJ_HLINE, 0, 0, (roundLinePrice+iCount)*hundredPipDigits);
        ObjectSet("Round"+(string)iCount, OBJPROP_COLOR, clrSnow);
        ObjectSet("Round"+(string)iCount, OBJPROP_STYLE, STYLE_DOT);
        ObjectSet("Round"+(string)iCount, OBJPROP_BACK, true);
        ObjectSet("Round"+(string)iCount, OBJPROP_SELECTABLE, false);
    }
    for(int iCount = 0; iCount >= -50; iCount --){
        ObjectCreate(0, "Round"+(string)iCount, OBJ_HLINE, 0, 0, (roundLinePrice+iCount)*hundredPipDigits);
        ObjectSet("Round"+(string)iCount, OBJPROP_COLOR, clrSnow);
        ObjectSet("Round"+(string)iCount, OBJPROP_STYLE, STYLE_DOT);
        ObjectSet("Round"+(string)iCount, OBJPROP_BACK, true);
        ObjectSet("Round"+(string)iCount, OBJPROP_SELECTABLE, false);
    }
    ChartRedraw(0);
}
string stringJST(bool dst, string in_colon=":"){
    int adjustJst = 0;
    if(dst){adjustJst=6;}else{adjustJst=7;}
    string adjustedJST = "";
    int adjustHour = Hour()+adjustJst;
    string  adjustMinute = IntegerToString(Minute());
    if(StringLen(adjustMinute) == 1){
        adjustMinute = "0"+adjustMinute;
    }
    if(adjustHour >= 24){adjustHour -= 24;}
    adjustedJST = IntegerToString(adjustHour) + in_colon + adjustMinute;
    return(adjustedJST);
}
void createTrendLine(string name, double price_1, double price_2, int lineColor, bool visible=true, bool dot=false, bool ray=false, int width=1){
    ObjectDelete(name);
    ObjectCreate(name, OBJ_TREND, 0, iTime(_symbol, _Period, 23), price_1, iTime(_symbol, _Period, 0)+60*60*23, price_2);
    ObjectSet(name, OBJPROP_COLOR, lineColor);
    ObjectSet(name, OBJPROP_BACK, false);
    ObjectSet(name, OBJPROP_SELECTABLE, false);
    ObjectSet(name, OBJPROP_WIDTH, width);
    ObjectSet(name, OBJPROP_RAY, ray);
    if(dot){
        ObjectSet(name, OBJPROP_STYLE, STYLE_DOT);
    }
    if(visible){
        ObjectSet(name, OBJPROP_TIMEFRAMES, OBJ_PERIOD_H1);
    }else
    if(!visible){
        ObjectSet(name, OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
    }
}
double CalculateLotSize(int accountBalance, double riskPercentage, double stopLossPips, string symbol){
    double riskAmount = accountBalance * (riskPercentage / 100.0);
    if(StringSubstr(symbol, 3, 3) == "JPY"){
        double conversionValue = 0.01;
        double contractSize = 100000;
        return NormalizeDouble((riskAmount/(stopLossPips*conversionValue)/contractSize), 2);
    }else
    if(symbol == "XAUUSD"){
        double JpyRate = NormalizeDouble(SymbolInfoDouble("USDJPY", SYMBOL_BID), _digits);
        double conversionValue = 0.1;
        double contractSize = 100;
        return NormalizeDouble((riskAmount/(stopLossPips*conversionValue*JpyRate)/contractSize), 2);
    }else
    if(symbol == "CL" || symbol == "USOIL"){
        double JpyRate = NormalizeDouble(SymbolInfoDouble("USDJPY", SYMBOL_BID), _digits);
        double conversionValue = 0.01;
        double contractSize = 1000;
        return NormalizeDouble((riskAmount/(stopLossPips*conversionValue*JpyRate)/contractSize), 2);
    }else{
        int notice = MessageBox(
            StringFormat("This pair '%s' is not supported.", symbol) + "\n" +
            "Does not support USD currency pairs." + "\n" +
            StringFormat("Edit ======> %s, %d", __FILE__, __LINE__),
            "NOTICE",
            MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
        );
        return 0.0;
    }
}
double calculateLossJPY(string symbol, double lot, double stopLossPips){
    if(StringSubstr(symbol, 3, 3) == "JPY"){
        double conversionValue = 0.01;
        double contractSize = 100000;
        return NormalizeDouble(stopLossPips*conversionValue*lot*contractSize, 2);
    }else
    if(symbol == "XAUUSD"){
        double JpyRate = NormalizeDouble(SymbolInfoDouble("USDJPY", SYMBOL_BID), _digits);
        double conversionValue = 0.1;
        double contractSize = 100;
        return NormalizeDouble((stopLossPips*conversionValue*lot*contractSize)*JpyRate, 2);
    }else
    if(symbol == "CL" || symbol == "USOIL"){
        double JpyRate = NormalizeDouble(SymbolInfoDouble("USDJPY", SYMBOL_BID), _digits);
        double conversionValue = 0.01;
        double contractSize = 1000;
        return NormalizeDouble((stopLossPips*conversionValue*lot*contractSize)*JpyRate, 2);
    }else{
        int notice = MessageBox(
            StringFormat("This pair '%s' is not supported.", symbol) + "\n" +
            "Does not support USD currency pairs." + "\n" +
            StringFormat("Edit ======> %s, %d", __FILE__, __LINE__),
            "NOTICE",
            MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
        );
        return 0.0;
    }
}
void MsgError(string file, int line){
    int notice = MessageBox(
        "Error" + "\n" +
        StringFormat("Edit ======> %s, %d", file, line),
        "NOTICE",
        MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
    );
}
#endif