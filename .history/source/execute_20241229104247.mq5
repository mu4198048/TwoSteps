//?Start of development on 2024/09/26-08:27:53
#property copyright "Created on 2024-10/27"
#property strict
#property link      ""
#property version   "1.0"
#property description ""

#include <PositionManagement.mqh>

input int tradeStartHour = 15;     //Trade Start Haour
input int tradeEndHour = 20;       //Trade Start Haour
input bool DST = false;            //Daylight Save Time

int OnInit(){
    init_variables(true, false, false);
    getMagicNumber(_broker);
    return(INIT_SUCCEEDED);
}
void OnDeinit(const int reason){
    if(reason == REASON_CHARTCLOSE || reason == REASON_CLOSE || reason == REASON_ACCOUNT){
        _closeAllPositions(magicNumber);
        string reasonForCalled = "";
        if(reason == REASON_CHARTCLOSE){reasonForCalled = "Chart has been closed";}else
        if(reason == REASON_CLOSE){reasonForCalled = "Terminal has been closed";}else
        if(reason == REASON_ACCOUNT){reasonForCalled = "Another account has been activated or reconnection to the trade server has occurred due to changes in the account settings";}
    }
    ObjectsDeleteAll(0, 0, OBJ_BUTTON);
    for(int iCount=0; iCount<ArraySize(trendLinesName); iCount++){
        ObjectDelete(0, trendLinesName[iCount]);
    }
    Comment("");
    ChartRedraw(0);
}
void OnTick(){
    if(! loadSettings){
        getTradeStrategy();
        if(tradeStrategy == EnumToString(Enum_OrderType=BUY)){
            firstFactoPrice = NormalizeDouble(ObjectGetValueByShift(trendLinesName[0], 0), _digits);
            twoFactoEntryPrice = NormalizeDouble(ObjectGetValueByShift(trendLinesName[1], 0), _digits);
        }else
        if(tradeStrategy == EnumToString(Enum_OrderType=SELL)){}else
        if(tradeStrategy == EnumToString(Enum_OrderType=BREAK)){}
    }
    if(Hour() >= tradeStartHour && Hour() < tradeEndHour){//!==OnTime==
        if(_ordersTotal() == 0){//?==entry==
            if(tradeStrategy == EnumToString(Enum_OrderType=BUY)){}else
            if(tradeStrategy == EnumToString(Enum_OrderType=SELL)){}else
            if(tradeStrategy == EnumToString(Enum_OrderType=BREAK)){}
        }else{//?==exit==
            if(tradeStrategy == EnumToString(Enum_OrderType=BUY)){}else
            if(tradeStrategy == EnumToString(Enum_OrderType=SELL)){}else
            if(tradeStrategy == EnumToString(Enum_OrderType=BREAK)){}
        }
    }else{//!==OffTime==
    }
}
void getTradeStrategy(){
    if(ObjectFind(0, trendLinesName[4]) == 0){tradeStrategy = EnumToString(Enum_OrderType=BUY);}else
    if(ObjectFind(0, trendLinesName[5]) == 0){tradeStrategy = EnumToString(Enum_OrderType=SELL);}else
    if(ObjectFind(0, trendLinesName[8]) == 0 || ObjectFind(0, trendLinesName[9]) == 0){tradeStrategy = EnumToString(Enum_OrderType=BREAK);}else{
        MsgError(__FILE__, __LINE__);
    }
}
void GetPriceData(double &arr[], int length){
    ArrayResize(arr, length);
    for(int iCount=0; iCount<ArraySize(trendLinesName); iCount++){
        arr[0] = NormalizeDouble(ObjectGetValueByShift(trendLinesName[0], 0), _digits);
    }

}