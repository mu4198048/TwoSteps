//?Start of development on 2024/12/04-09:19:25
#ifndef __Convert4To5__
#define __Convert4To5__

#property copyright "Created on "
#property strict
#property link      ""
#property version   ""

#include <GlobalVariables.mqh>

#ifdef __MQL4__
#endif
#ifdef __MQL5__
double CopyBuffer(int handle,int index,int shift){
    double buf[];
    switch(index){
        case 0: if(CopyBuffer(handle, 0, shift, 1, buf) > 0) return(buf[0]); break;
        case 1: if(CopyBuffer(handle, 1, shift, 1, buf) > 0) return(buf[0]); break;
        case 2: if(CopyBuffer(handle, 2, shift, 1, buf) > 0) return(buf[0]); break;
        case 3: if(CopyBuffer(handle, 3, shift, 1, buf) > 0) return(buf[0]); break;
        case 4: if(CopyBuffer(handle, 4, shift, 1, buf) > 0) return(buf[0]); break;
        default: break;
    }
    return(EMPTY_VALUE);
}
ENUM_TIMEFRAMES TFMigrate(int tf){
    switch(tf){
        case 0: return(PERIOD_CURRENT); break;
        case 1: return(PERIOD_M1); break;
        case 15: return(PERIOD_M15); break;
        case 60: return(PERIOD_H1); break;
        case 240: return(PERIOD_H4); break;
        case 1440: return(PERIOD_D1); break;
        default: return(PERIOD_CURRENT);
    }
}
#define MODE_POINT 11
#define MODE_SPREAD 13
#define MODE_LOTSIZE 15
#define MODE_MINLOT 23
double MarketInfo(string symbol, int type){
    switch(type){
        case MODE_LOW: return(SymbolInfoDouble(symbol,SYMBOL_LASTLOW));
        case MODE_HIGH: return(SymbolInfoDouble(symbol,SYMBOL_LASTHIGH));
        case MODE_SPREAD: return((double)SymbolInfoInteger(symbol,SYMBOL_SPREAD));
        case MODE_POINT: return(SymbolInfoDouble(symbol,SYMBOL_POINT));
        case MODE_LOTSIZE: return(SymbolInfoDouble(symbol,SYMBOL_TRADE_CONTRACT_SIZE));
        case MODE_MINLOT: return(SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN));
        case 1440: return(PERIOD_D1); break;
        default: return(0);
    }
    return(0);
}
int Year(){MqlDateTime tm; TimeCurrent(tm); return(tm.year);}
int Month(){MqlDateTime tm; TimeCurrent(tm); return(tm.mon);}
int Day(){MqlDateTime tm; TimeCurrent(tm); return(tm.day);}
int Hour(){MqlDateTime tm; TimeCurrent(tm); return(tm.hour);}
int Minute(){MqlDateTime tm; TimeCurrent(tm); return(tm.min);}
int DayOfWeek(){MqlDateTime tm; TimeCurrent(tm); return(tm.day_of_week);}
bool IsTesting(){bool res = MQLInfoInteger(MQL_TESTER); return(res);}
int ObjectsDeleteAll(int window = -1/*EMPTY*/, int type = -1/*EMPTY*/){ return(ObjectsDeleteAll(0, window, type));}
bool ObjectDelete(string name){return(ObjectDelete(0, name));}
bool ObjectCreate(string name, ENUM_OBJECT type, int window, datetime time1, double price1, datetime time2=0, double price2=0, datetime time3=0, double price3=0){
    return(ObjectCreate(0, name, type, window, time1, price1, time2, price2, time3, price3));
}
bool ObjectSet(string name, int index, double value){
    switch(index){
        case 300: ObjectSetInteger(0, name, OBJPROP_TIME, (int)value); return(true);//OBJPROP_TIME1
        case 301: ObjectSetDouble(0, name, OBJPROP_PRICE, value); return(true);//OBJPROP_PRICE1
        case 302: ObjectSetInteger(0, name, OBJPROP_TIME, 1, (int)value); return(true);//OBJPROP_TIME2
        case 303: ObjectSetDouble(0, name, OBJPROP_PRICE, 1, value); return(true);//OBJPROP_PRICE2
        case 304: ObjectSetInteger(0, name, OBJPROP_TIME, 2, (int)value); return(true);//OBJPROP_TIME3
        case 305: ObjectSetDouble(0, name, OBJPROP_PRICE, 2, value); return(true);//OBJPROP_PRICE3
        case 0: ObjectSetInteger(0, name, OBJPROP_COLOR, (int)value); return(true);//OBJPROP_COLOR
        case 1: ObjectSetInteger(0, name, OBJPROP_STYLE, (int)value); return(true);//OBJPROP_STYLE
        case 2: ObjectSetInteger(0, name, OBJPROP_WIDTH, (int)value); return(true);//OBJPROP_WIDTH
        case 3: ObjectSetInteger(0, name, OBJPROP_BACK, (int)value); return(true);//OBJPROP_BACK
        case 1032: ObjectSetInteger(0, name, OBJPROP_RAY_RIGHT, (int)value); return(true);//OBJPROP_RAY
        // case 11://BJPROP_ELLIPSE------------------------------------------------
        //     ObjectSetInteger(0, name, OBJPROP_ELLIPSE, (int)value); return(true);
        case 1006: ObjectSetDouble(0, name, OBJPROP_SCALE, value); return(true);//OBJPROP_SCALE
        case 1007: ObjectSetDouble(0, name, OBJPROP_ANGLE, value); return(true);//OBJPROP_ANGLE
        case 1008: ObjectSetInteger(0, name, OBJPROP_ARROWCODE, (int)value); return(true);//OBJPROP_ARROWCODE
        case 12: ObjectSetInteger(0, name, OBJPROP_TIMEFRAMES, (int)value); return(true);//OBJPROP_TIMEFRAMES
        case 1010: ObjectSetDouble(0, name, OBJPROP_DEVIATION, value); return(true);//OBJPROP_DEVIATION
        case 1002: ObjectSetInteger(0, name, OBJPROP_FONTSIZE, (int)value); return(true);//OBJPROP_FONTSIZE
        case 1026: ObjectSetInteger(0, name, OBJPROP_CORNER, (int)value); return(true);//OBJPROP_CORNER
        case 1012: ObjectSetInteger(0, name, OBJPROP_XDISTANCE, (int)value); return(true);//OBJPROP_XDISTANCE
        case 1013: ObjectSetInteger(0, name, OBJPROP_YDISTANCE, (int)value); return(true);//OBJPROP_YDISTANCE
        // case 200://OBJPROP_FIBOLEVELS------------------------------------------------
        //     ObjectSetInteger(0, name, OBJPROP_LEVELS, (int)value); return(true);
        case 201: ObjectSetInteger(0, name, OBJPROP_LEVELCOLOR, (int)value); return(true);//OBJPROP_LEVELCOLOR
        case 202: ObjectSetInteger(0, name, OBJPROP_LEVELSTYLE, (int)value); return(true);//OBJPROP_LEVELSTYLE
        case 203: ObjectSetInteger(0, name, OBJPROP_LEVELWIDTH, (int)value); return(true);//OBJPROP_LEVELWIDTH
        default: return(false);
    }
    return(false);
}
bool ObjectSetText(string name, string text, int font_size, string font="", color text_color=CLR_NONE){
    int tmpObjType=(int)ObjectGetInteger(0, name, OBJPROP_TYPE);
    if(tmpObjType!=OBJ_LABEL && tmpObjType!=OBJ_TEXT) return(false);
    if(StringLen(text)>0 && font_size>0){
        if(ObjectSetString(0, name, OBJPROP_TEXT, text)==true && ObjectSetInteger(0,name,OBJPROP_FONTSIZE,font_size)==true){
            if((StringLen(font)>0) && ObjectSetString(0, name, OBJPROP_FONT, font)==false) return(false);
            if(text_color!=CLR_NONE && ObjectSetInteger(0, name ,OBJPROP_COLOR, text_color)==false) return(false);
            return(true);
        }
        return(false);
    }
    return(false);
}
double ObjectGetValueByShift(string name, int shift){
    ENUM_TIMEFRAMES timeframe=TFMigrate(PERIOD_CURRENT);
    MqlRates mql4[];
    CopyRates(NULL, timeframe, shift, 1, mql4);
    return(ObjectGetValueByTime(0, name, mql4[0].time, 0));
}
int ObjectFind(string name){return(ObjectFind(0, name));}
ENUM_MA_METHOD MethodMigrate(int method){
    switch(method){
        case 0: return(MODE_SMA);
        case 1: return(MODE_EMA);
        case 2: return(MODE_SMMA);
        case 3: return(MODE_LWMA);
        default: return(MODE_SMA);
    }
}
ENUM_APPLIED_PRICE PriceMigrate(int price){
    switch(price){
        case 1: return(PRICE_CLOSE);
        case 2: return(PRICE_OPEN);
        case 3: return(PRICE_HIGH);
        case 4: return(PRICE_LOW);
        case 5: return(PRICE_MEDIAN);
        case 6: return(PRICE_TYPICAL);
        case 7: return(PRICE_WEIGHTED);
        default: return(PRICE_CLOSE);
    }
}
string WindowExpertName(){string res = MQLInfoString(MQL_PROGRAM_NAME); return(res);}
string AccountCompany(){string res = AccountInfoString(ACCOUNT_COMPANY); return(res);}
double AccountBalance(){double res = AccountInfoDouble(ACCOUNT_BALANCE); return(res);}
double AccountEquity(){double res = AccountInfoDouble(ACCOUNT_EQUITY); return(res);}
double AccountCredit(){double res = AccountInfoDouble(ACCOUNT_CREDIT); return(res);}
long AccountLeverage(){long res = AccountInfoInteger(ACCOUNT_LEVERAGE); return(res);}
double AccountMargin(){double res = AccountInfoDouble(ACCOUNT_MARGIN); return(res);}
double iOpen(string symbol,int tf,int index){
    if(index < 0) return(-1);
    double Arr[];
    ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
    if(CopyOpen(symbol,timeframe, index, 1, Arr)>0) return(Arr[0]);
    else return(-1);
}
double iHigh(string symbol,int tf,int index){
    if(index < 0) return(-1);
    double Arr[];
    ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
    if(CopyHigh(symbol,timeframe, index, 1, Arr)>0) return(Arr[0]);
    else return(-1);
}
double iLow(string symbol,int tf,int index){
    if(index < 0) return(-1);
    double Arr[];
    ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
    if(CopyLow(symbol,timeframe, index, 1, Arr)>0) return(Arr[0]);
    else return(-1);
}
double iClose(string symbol,int tf,int index){
    if(index < 0) return(-1);
    double Arr[];
    ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
    if(CopyClose(symbol,timeframe, index, 1, Arr)>0) return(Arr[0]);
    else return(-1);
}

int iBars(string symbol, int tf){
    ENUM_TIMEFRAMES timeframe = TFMigrate(tf);
    return(Bars(symbol, timeframe));
}
datetime iTime(string symbol,int tf,int index){
    if(index < 0) return(-1);
    ENUM_TIMEFRAMES timeframe=TFMigrate(tf);
    datetime Arr[];
    if(CopyTime(symbol, timeframe, index, 1, Arr)>0)
        return(Arr[0]);
    else return(-1);
}
int Bars(){int res = Bars(_symbol, _Period); return(res);}
int TimeHour(datetime date){
    MqlDateTime tm;
    TimeToStruct(date,tm);
    return(tm.hour);
}
int ObjectsTotal(int type=-1, int window=-1){return(ObjectsTotal(0, window,type));}
string ObjectName(int index){return(ObjectName(0, index));}
int ObjectType(string name){return((int)ObjectGetInteger(0, name, OBJPROP_TYPE));}
int TimeDayOfWeek(datetime date){
    MqlDateTime tm;
    TimeToStruct(date,tm);
    return(tm.day_of_week);
}
#define OBJPROP_TIME1 300
#define OBJPROP_PRICE1 301
#define OBJPROP_TIME2 302
#define OBJPROP_PRICE2 303
double ObjectGet(string name, int prop_id){// Added hacks to match int2double conversion
    switch(prop_id){
        case OBJPROP_TIME1: return((double) ObjectGetInteger(0, name, OBJPROP_TIME));
        case OBJPROP_PRICE1:  return(ObjectGetDouble(0, name, OBJPROP_PRICE));
        case OBJPROP_TIME2: return((double) ObjectGetInteger(0, name, OBJPROP_TIME, 1));
        case OBJPROP_PRICE2: return(ObjectGetDouble(0, name, OBJPROP_PRICE, 1));
        default: return 0;
    }
}
//?============================================================================================================
double _ask(){double res = SymbolInfoDouble(_symbol,SYMBOL_ASK); return(res);}
double _bid(){double res = SymbolInfoDouble(_symbol,SYMBOL_BID); return(res);}
int _ordersTotal(){int res = PositionsTotal(); return(res);}
ENUM_ORDER_TYPE_FILLING fillPolicy(){
    long fillType = SymbolInfoInteger(_symbol, SYMBOL_FILLING_MODE);
    if(fillType == SYMBOL_FILLING_IOC){
        return(ORDER_FILLING_IOC);
    }else
    if(fillType == SYMBOL_FILLING_FOK){
        return (ORDER_FILLING_FOK);
    }else return(ORDER_FILLING_RETURN);
}
MqlTradeRequest request;
MqlTradeResult result;

ulong _orderSendBuy(double absoluteStopLoss, double lot, ulong magic, string orderComment, double cptp){
    ZeroMemory(request);
    ZeroMemory(result);
    ulong res = 0;
    bool receiver = false;
//!============================================================================================================
    request.action = TRADE_ACTION_DEAL;
    request.type = ORDER_TYPE_BUY;
    request.symbol = _symbol;
    request.type_filling = fillPolicy();
    request.price = NormalizeDouble(SymbolInfoDouble(_symbol,SYMBOL_ASK), _digits);
    request.sl = NormalizeDouble(SymbolInfoDouble(_symbol,SYMBOL_BID) - absoluteStopLoss*cptp, _digits);
    request.tp = 0;
    request.deviation = 500;
    request.volume = NormalizeDouble(lot, 2);
    request.magic = magic;
    request.comment = orderComment;
//!============================================================================================================
    receiver = OrderSend(request, result);
    int wait = 500;
    #ifndef useCollectTestResults
    PrintFormat("A buy position order has been sent. Waiting for %d milliseconds.", wait);
    #endif
    Sleep(wait);
    if(receiver != true){
        PrintFormat("** Open position order send error, %d **", GetLastError());
        Print("** This error is due to server refusal. **");
        PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
    }else
    if(receiver == true){
        if(result.retcode == TRADE_RETCODE_PLACED || result.retcode == TRADE_RETCODE_DONE){
            if(printOrderInfo() == true){
                Print("** Open position order send succes **");
                PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
            }
            res = result.order;
        }else
        if(result.retcode == TRADE_RETCODE_DONE_PARTIAL || result.retcode == TRADE_RETCODE_NO_CHANGES){
            PrintFormat("** Open position order send succes, but..., %d **", GetLastError());
            PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
            res = result.order;
        }else{
            PrintFormat("** Open position order send error, %d **", GetLastError());
            Print("** This error is due to a problem with the order details. **");
            PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
        }
    }
    return(res);
}
ulong _orderSendSell(double absoluteStopLoss, double lot, ulong magic, string orderComment, double cptp){
    ZeroMemory(request);
    ZeroMemory(result);
    ulong res = 0;
    bool receiver = false;
//!============================================================================================================
    request.action = TRADE_ACTION_DEAL;
    request.type = ORDER_TYPE_SELL;
    request.symbol = _Symbol;
    request.type_filling = fillPolicy();
    request.price = NormalizeDouble(SymbolInfoDouble(_symbol,SYMBOL_BID), _digits);
    request.sl = NormalizeDouble(SymbolInfoDouble(_symbol,SYMBOL_BID) + absoluteStopLoss*cptp, _digits);
    request.tp = 0;
    request.deviation = 500;
    request.volume = NormalizeDouble(lot, 2);
    request.magic = magic;
    request.comment = orderComment;
//!============================================================================================================
    receiver = OrderSend(request, result);
    int wait = 500;
    #ifndef useCollectTestResults
    PrintFormat("A sell position order has been sent. Waiting for %d milliseconds.", wait);
    #endif
    Sleep(wait);
    if(receiver != true){
        PrintFormat("** Open position order send error, %d **", GetLastError());
        Print("** This error is due to server refusal. **");
        PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
    }else
    if(receiver == true){
        if(result.retcode == TRADE_RETCODE_PLACED || result.retcode == TRADE_RETCODE_DONE){
            if(printOrderInfo() == true){
                Print("** Open position order send succes **");
                PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
            }
            res = result.order;
        }else
        if(result.retcode == TRADE_RETCODE_DONE_PARTIAL || result.retcode == TRADE_RETCODE_NO_CHANGES){
            PrintFormat("** Open position order send succes, but..., %d **", GetLastError());
            PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
            res = result.order;
        }else{
            PrintFormat("** Open position order send error, %d **", GetLastError());
            Print("** This error is due to a problem with the order details. **");
            PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
        }
    }
    return(res);
}
bool _closeSellPosition(ulong magic){
    ulong posNo = PositionGetTicket(_ordersTotal()-1);
    PositionSelectByTicket(posNo);
    double posLot = PositionGetDouble(POSITION_VOLUME);
    ZeroMemory(request);
    ZeroMemory(result);
    bool res = false;
    bool receiver = false;
    if(_ordersTotal() >= 1 && PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL){
        request.action = TRADE_ACTION_DEAL;
        request.type = ORDER_TYPE_BUY;
        request.price= NormalizeDouble(SymbolInfoDouble(_symbol,SYMBOL_ASK), _digits);
        request.symbol = _symbol;
        request.type_filling = fillPolicy();
        request.deviation = 500;
        request.position = posNo;
        request.volume = NormalizeDouble(posLot, 2);
        request.magic = magic;
    }
//!============================================================================================================
    receiver = OrderSend(request, result);
    int wait = 1000;
    #ifndef useCollectTestResults
    PrintFormat("A sell position closing order has been sent. Waiting for %d milliseconds.", wait);
    #endif
    Sleep(wait);
    if(receiver != true){
        PrintFormat("** Close position order send error, %d **", GetLastError());
        Print("** This error is due to server refusal. **");
        PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
    }else
    if(result.retcode == TRADE_RETCODE_PLACED || result.retcode == TRADE_RETCODE_DONE){
        if(printOrderInfo() == true){
            Print("** Close position order send succes **");
            PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
        }
        res = true;
    }else
    if(result.retcode == TRADE_RETCODE_DONE_PARTIAL || result.retcode == TRADE_RETCODE_NO_CHANGES){
        PrintFormat("** Close position order send succes, but..., %d **", GetLastError());
        PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
        res = true;
    }else{
        PrintFormat("** Close position order send error, %d **", GetLastError());
        Print("** This error is due to a problem with the order details. **");
        PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
    }
    return(res);
}
bool _closeBuyPosition(ulong magic){
    ulong posNo = PositionGetTicket(_ordersTotal()-1);
    PositionSelectByTicket(posNo);
    double posLot = PositionGetDouble(POSITION_VOLUME);
    ZeroMemory(request);
    ZeroMemory(result);
    bool res = false;
    bool receiver = false;
    if(_ordersTotal() >= 1 && PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY){
        request.action = TRADE_ACTION_DEAL;
        request.type = ORDER_TYPE_SELL;
        request.price= NormalizeDouble(SymbolInfoDouble(_symbol,SYMBOL_BID), _digits);
        request.symbol = _symbol;
        request.type_filling = fillPolicy();
        request.deviation = 500;
        request.position = posNo;
        request.volume = NormalizeDouble(posLot, 2);
        request.magic = magic;
    }
//!============================================================================================================
    receiver = OrderSend(request, result);
    int wait = 1000;
    #ifndef useCollectTestResults
    PrintFormat("A buy position closing order has been sent. Waiting for %d milliseconds.", wait);
    #endif
    Sleep(wait);
    if(receiver != true){
        PrintFormat("** Close position order send error, %d **", GetLastError());
        Print("** This error is due to server refusal. **");
        PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
    }else
    if(result.retcode == TRADE_RETCODE_PLACED || result.retcode == TRADE_RETCODE_DONE){
        if(printOrderInfo() == true){
            Print("** Close position order send succes **");
            PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
        }
        res = true;
    }else
    if(result.retcode == TRADE_RETCODE_DONE_PARTIAL || result.retcode == TRADE_RETCODE_NO_CHANGES){
        PrintFormat("** Close position order send succes, but..., %d **", GetLastError());
        PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
        res = true;
    }else{
        PrintFormat("** Close position order send error, %d **", GetLastError());
        Print("** This error is due to a problem with the order details. **");
        PrintFormat("** retcode=%u    deal=%I64u    order=%I64u **", result.retcode, result.deal, result.order);
    }
    return(res);
}
void _closeAllPositions(ulong magic){
    PrintFormat("The %s has been called. We will execute %s", __FUNCTION__, __FUNCTION__);
    for(int iCount = _ordersTotal()-1; iCount >= 0 ; iCount--){
        ulong posNo = PositionGetTicket(iCount);
        PositionSelectByTicket(posNo);
        double posLot = PositionGetDouble(POSITION_VOLUME);
        bool res = false;
        ZeroMemory(request);
        ZeroMemory(result);
        if(_ordersTotal() >= 1 && PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY){
            request.action = TRADE_ACTION_DEAL;
            request.type = ORDER_TYPE_SELL;
            request.price= NormalizeDouble(SymbolInfoDouble(_symbol,SYMBOL_BID), _digits);
            request.symbol = _symbol;
            request.type_filling = fillPolicy();
            request.deviation = 500;
            request.position = posNo;
            request.volume = NormalizeDouble(posLot, 2);
            request.magic = magic;
            res = OrderSend(request, result);
            int wait = 1000;
            #ifndef useCollectTestResults
            PrintFormat("A buy position closing order has been sent. Waiting for %d milliseconds.", wait);
            #endif
            Sleep(wait);
            if(res == false){
                PrintFormat("Function %s has failed. Please check the details.", __FUNCTION__);
                PrintFormat("retcode=%u    deal=%I64u    order=%I64u", result.retcode, result.deal, result.order);
            }else
            if(res == true){
            }
        }else
        if(_ordersTotal() >= 1 && PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL){
            request.action = TRADE_ACTION_DEAL;
            request.type = ORDER_TYPE_BUY;
            request.price= NormalizeDouble(SymbolInfoDouble(_symbol,SYMBOL_ASK), _digits);
            request.symbol = _symbol;
            request.type_filling = fillPolicy();
            request.deviation = 500;
            request.position = posNo;
            request.volume = NormalizeDouble(posLot, 2);
            request.magic = magic;
            res = OrderSend(request, result);
            int wait = 1000;
            #ifndef useCollectTestResults
            PrintFormat("A sell position closing order has been sent. Waiting for %d milliseconds.", wait);
            #endif
            Sleep(wait);
            if(res == false){
                PrintFormat("Function %s has failed. Please check the details.", __FUNCTION__);
                PrintFormat("retcode=%u    deal=%I64u    order=%I64u", result.retcode, result.deal, result.order);
            }else
            if(res == true){
            }
        }
    }
    if(_ordersTotal() == 0){
        PrintFormat("The function %s has been executed. As there are no open positions.", __FUNCTION__);
    }
}
//?============================================================================================================
//Other

//?============================================================================================================
#endif
#endif