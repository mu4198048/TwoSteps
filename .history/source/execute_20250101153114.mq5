//?Start of development on 2024/09/26-08:27:53
#property copyright "Created on 2024-10/27"
#property strict
#property link      ""
#property version   "1.0"
#property description ""

#include <PositionManagement.mqh>

input double allowedRisk = 2.8;        //Allowed Risk
input double allowedGap = 15.0;        //Allowed Gap
input double allowedSpread = 5.0;      //Allowed Spread
input int allowedTransactions = 1;     //Allowed Transactions
input int maxRetries = 10;             //Max Retries
input int tradeStartHour = 15;         //Trade Start Haour
input int tradeEndHour = 20;           //Trade Start Haour
input bool DST = false;                //Daylight Save Time

int OnInit(){
    init_variables(true, false, false);
    getCPTP();
    getMagicNumber(_broker);
    getTradeStrategy();
    getPriceData(priceDataArr, 14);
    if(tradeStrategy == EnumToString(Enum_OrderType=BUY)){
        firstFactorPrice = priceDataArr[0];
        twoFactorEntryPrice = priceDataArr[1];
        twoFactorLcPrice = priceDataArr[2];
        twoFactorTpPrice = priceDataArr[3];
        buyEntryPrice = priceDataArr[4];
        lcPrice = priceDataArr[6];
        tpPrice = priceDataArr[7];
        lossPips = NormalizeDouble((buyEntryPrice-lcPrice)/convertPipsToPrice, _digits);
        followLotSize = calculateLotSize(initialBalance, allowedRisk, lossPips, _symbol);
        Sleep(500);
        lossPips = NormalizeDouble((twoFactorEntryPrice-twoFactorLcPrice)/convertPipsToPrice, _digits);
        pullBackLotSize = calculateLotSize(initialBalance, allowedRisk, lossPips, _symbol);
    }else
    if(tradeStrategy == EnumToString(Enum_OrderType=SELL)){
        firstFactorPrice = priceDataArr[0];
        twoFactorEntryPrice = priceDataArr[1];
        twoFactorLcPrice = priceDataArr[2];
        twoFactorTpPrice = priceDataArr[3];
        sellEntryPrice = priceDataArr[5];
        lcPrice = priceDataArr[6];
        tpPrice = priceDataArr[7];
        lossPips = NormalizeDouble((lcPrice-sellEntryPrice)/convertPipsToPrice, _digits);
        followLotSize = calculateLotSize(initialBalance, allowedRisk, lossPips, _symbol);
        Sleep(500);
        lossPips = NormalizeDouble((twoFactorLcPrice-twoFactorEntryPrice)/convertPipsToPrice, _digits);
        pullBackLotSize = calculateLotSize(initialBalance, allowedRisk, lossPips, _symbol);
    }else
    if(tradeStrategy == EnumToString(Enum_OrderType=BREAK)){
        breakBuyPrice = priceDataArr[8];
        breakBuyLcPrice = priceDataArr[10];
        breakBuyTpPrice = priceDataArr[11];
        breakSellPrice = priceDataArr[9];
        breakSellLcPrice = priceDataArr[12];
        breakSellTpPrice = priceDataArr[13];
        lossPips = NormalizeDouble((breakBuyPrice-breakBuyLcPrice)/convertPipsToPrice, _digits);
        breakBuyLotSize = calculateLotSize(initialBalance, allowedRisk, lossPips, _symbol);
        Sleep(500);
        lossPips = NormalizeDouble((breakSellLcPrice-breakSellPrice)/convertPipsToPrice, _digits);
        breakSellLotSize = calculateLotSize(initialBalance, allowedRisk, lossPips, _symbol);
    }
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
    if(Hour() >= tradeStartHour && Hour() < tradeEndHour){//!==OnTime==
        if(! dailyTaskCompleted){//?==check env==
            checkEnvironment();
            dailyTaskCompleted = true;
        }
        if(_ordersTotal() == 0){//?==entry==
            if(numberOfTransactions < allowedTransactions){
                if(tradeStrategy == EnumToString(Enum_OrderType=BUY)){
                    if(openBuyOrder()){
                        if(isEnvironmentSuitable(maxRetries, allowedGap, allowedSpread, convertPipsToPrice)){
                            if(comment == EnumToString(Enum_Comment = FOLLOW)){
                                lossPips = NormalizeDouble((buyEntryPrice-lcPrice)/convertPipsToPrice, _digits);
                                lotSize = calculateLotSize(initialBalance, allowedRisk, lossPips, _symbol);
                            }else
                            if(comment == EnumToString(Enum_Comment = PULL_BACK)){
                                lossPips = NormalizeDouble((twoFactorEntryPrice-twoFactorLcPrice)/convertPipsToPrice, _digits);
                                lotSize = calculateLotSize(initialBalance, allowedRisk, lossPips, _symbol);
                            }
                            positionComment = StringFormat("%s@%s@%I64u", comment, getTradingSession(DST), magicNumber);
                            positionTicket = _orderSendBuy(lossPips+5.0, lotSize, magicNumber, positionComment, convertPipsToPrice);
                            Sleep(500);
                            setCloseData(positionTicket);
                            if(! isDataRetrieved){
                                if(_ordersTotal() == 0){
                                    if(comment == EnumToString(Enum_Comment = FOLLOW)){isFollowEntryAvailable = false;}else
                                    if(comment == EnumToString(Enum_Comment = PULL_BACK)){isTwoFactorEntryAvailable = false;}
                                }
                            }
                        }
                    }
                }else
                if(tradeStrategy == EnumToString(Enum_OrderType=SELL)){
                    if(openSellOrder()){
                        if(isEnvironmentSuitable(maxRetries, allowedGap, allowedSpread, convertPipsToPrice)){
                            if(comment == EnumToString(Enum_Comment = FOLLOW)){
                                lossPips = NormalizeDouble((lcPrice-sellEntryPrice)/convertPipsToPrice, _digits);
                                lotSize = calculateLotSize(initialBalance, allowedRisk, lossPips, _symbol);
                            }else
                            if(comment == EnumToString(Enum_Comment = PULL_BACK)){
                                lossPips = NormalizeDouble((twoFactorLcPrice-twoFactorEntryPrice)/convertPipsToPrice, _digits);
                                lotSize = calculateLotSize(initialBalance, allowedRisk, lossPips, _symbol);
                            }
                            positionComment = StringFormat("%s@%s@%I64u", comment, getTradingSession(DST), magicNumber);
                            positionTicket = _orderSendSell(lossPips+5.0, lotSize, magicNumber, positionComment, convertPipsToPrice);
                            Sleep(500);
                            setCloseData(positionTicket);
                            if(! isDataRetrieved){
                                if(_ordersTotal() == 0){
                                    if(comment == EnumToString(Enum_Comment = FOLLOW)){isFollowEntryAvailable = false;}else
                                    if(comment == EnumToString(Enum_Comment = PULL_BACK)){isTwoFactorEntryAvailable = false;}
                                }
                            }
                        }
                    }
                }else
                if(tradeStrategy == EnumToString(Enum_OrderType=BREAK)){
                    if(openBreakOrder()){
                        if(isEnvironmentSuitable(maxRetries, allowedGap, allowedSpread, convertPipsToPrice)){
                            if(comment == EnumToString(Enum_Comment = UPSIDE_BREAK)){
                                lossPips = NormalizeDouble((breakBuyPrice-breakBuyLcPrice)/convertPipsToPrice, _digits);
                                lotSize = calculateLotSize(initialBalance, allowedRisk, lossPips, _symbol);
                                positionComment = StringFormat("%s@%s@%I64u", comment, getTradingSession(DST), magicNumber);
                                positionTicket = _orderSendBuy(lossPips+5.0, lotSize, magicNumber, positionComment, convertPipsToPrice);
                                Sleep(500);
                                setCloseData(positionTicket);
                                if(! isDataRetrieved){
                                    if(_ordersTotal() == 0){
                                        isBreakBuyEntryAvailable = false;
                                    }
                                }
                            }else
                            if(comment == EnumToString(Enum_Comment = DOWNSIDE_BREAK)){
                                lossPips = NormalizeDouble((breakSellLcPrice-breakSellPrice)/convertPipsToPrice, _digits);
                                lotSize = calculateLotSize(initialBalance, allowedRisk, lossPips, _symbol);
                                positionComment = StringFormat("%s@%s@%I64u", comment, getTradingSession(DST), magicNumber);
                                positionTicket = _orderSendSell(lossPips+5.0, lotSize, magicNumber, positionComment, convertPipsToPrice);
                                Sleep(500);
                                setCloseData(positionTicket);
                                if(! isDataRetrieved){
                                    if(_ordersTotal() == 0){
                                        isBreakSellEntryAvailable = false;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }else
    if(_ordersTotal() >= 1){//?==exit==
        if(positionType == EnumToString(Enum_PositionType = LONG)){}else
        if(positionType == EnumToString(Enum_PositionType = SHORT)){}
    }else{//!==OffTime==
        if(! authed){
            double bid = NormalizeDouble(_bid(), _digits);
            if(tradeStrategy == EnumToString(Enum_OrderType=BUY)){
                if(bid < firstFactorPrice){
                    authed = true;
                    Print("The first factor has been authenticated.");
                }
            }else
            if(tradeStrategy == EnumToString(Enum_OrderType=SELL)){
                if(bid > firstFactorPrice){
                    authed = true;
                    Print("The first factor has been authenticated.");
                }
            }
        }
    }
}
void getTradeStrategy(){
    if(ObjectFind(0, trendLinesName[4]) == 0){tradeStrategy = EnumToString(Enum_OrderType=BUY);}else
    if(ObjectFind(0, trendLinesName[5]) == 0){tradeStrategy = EnumToString(Enum_OrderType=SELL);}else
    if(ObjectFind(0, trendLinesName[8]) == 0 || ObjectFind(0, trendLinesName[9]) == 0){tradeStrategy = EnumToString(Enum_OrderType=BREAK);}else{
        MsgError(__FILE__, __LINE__);
    }
}
void getPriceData(double &arr[], int length){
    ArrayResize(arr, length);
    for(int iCount=0; iCount<length; iCount++){
        arr[iCount] = NormalizeDouble(ObjectGetValueByShift(trendLinesName[iCount], 0), _digits);
    }
}
void checkEnvironment(){
    double bid = NormalizeDouble(_bid(), _digits);
    if(tradeStrategy == EnumToString(Enum_OrderType=BUY)){
        if(authed){
            Print("The first factor has been authenticated.");
            if(bid < twoFactorEntryPrice){
                isTwoFactorEntryAvailable = true;
                isFollowEntryAvailable = true;
                Print("Follow entries and pullback entries are valid.");
            }else{
                if(bid < buyEntryPrice){
                    isFollowEntryAvailable = true;
                    Print("Follow entry is valid.");
                    Print("The pullback entry is invalid because it exceeds the entry price.");
                }
            }
            if(! isTwoFactorEntryAvailable && ! isFollowEntryAvailable){
                Print("Both the follow entry and the pullback entry are invalid because they exceed the entry price.");
            }
        }else
        if(! authed){
            Print("The first factor has not been authenticated.");
            if(bid < buyEntryPrice){
                isFollowEntryAvailable = true;
                Print("Follow entry is valid.");
            }
        }
    }else
    if(tradeStrategy == EnumToString(Enum_OrderType=SELL)){
        if(authed){
            Print("The first factor has been authenticated.");
            if(bid > twoFactorEntryPrice){
                isTwoFactorEntryAvailable = true;
                isFollowEntryAvailable = true;
                Print("Follow entries and pullback entries are valid.");
            }else{
                if(bid > sellEntryPrice){
                    isFollowEntryAvailable = true;
                    Print("Follow entry is valid.");
                    Print("The pullback entry is invalid because it exceeds the entry price.");
                }
            }
            if(! isTwoFactorEntryAvailable && ! isFollowEntryAvailable){
                Print("Both the follow entry and the pullback entry are invalid because they exceed the entry price.");
            }
        }else
        if(! authed){
            if(bid > sellEntryPrice){
                isFollowEntryAvailable = true;
            }
        }
    }else
    if(tradeStrategy == EnumToString(Enum_OrderType=BREAK)){
        if(bid < breakBuyPrice){
            isBreakBuyEntryAvailable = true;
            Print("Upside break entry is valid.");
        }
        if(bid > breakSellPrice){
            isBreakSellEntryAvailable = true;
            Print("Downside break entry is valid.");
        }
        if(! isBreakBuyEntryAvailable){Print("The upside break entry is invalid because it exceeds the entry price.");}
        if(! isBreakSellEntryAvailable){Print("The downside break entry is invalid because it exceeds the entry price.");}
    }
}
