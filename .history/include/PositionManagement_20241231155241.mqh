//?Start of development on 2024/09/26-08:27:53
#ifndef __PositionManagement__
#define __PositionManagement__

#property copyright "Created on 2024-10/27"
#property strict
#property link      ""
#property version   ""

#include <GraphicalUserInterface.mqh>
bool isEnvironmentSuitable(int retry, double gapLimit, double spreadLimit, double cptp){
    double marketGap = MathAbs(NormalizeDouble(iClose(_symbol, _period, 1), _digits)-NormalizeDouble(iOpen(_symbol, _period, 0), _digits));
    double marketSpread = NormalizeDouble((MarketInfo(_symbol, MODE_SPREAD)*MarketInfo(_symbol, MODE_POINT)), _digits)/cptp;
    if(marketGap <= (gapLimit*cptp)){
        if(marketSpread <= spreadLimit){
            return true;
        }else{
            Print("The spread is too wide. Executing the specified number of retries.");
            PrintFormat("Spread : %.3f, acceptable spread limit : %.3f", marketSpread, spreadLimit);
            for(int iCount=1; iCount<=retry; iCount++){
                Sleep(2000);
                PrintFormat("Retry counts is %d Spread is %.3f", iCount, marketSpread);
                if((MarketInfo(_symbol, MODE_SPREAD)*MarketInfo(_symbol, MODE_POINT))/cptp <= (spreadLimit*cptp)){
                    return true;
                }
            }
        }return false;
    }else{
        Print("The gap is too wide, so the trade will be skipped.");
        PrintFormat("Gap : %.3f, acceptable gap limit : %.3f", marketGap, (gapLimit*cptp));
        return false;
    }
}
bool openBuyOrder(){
    double bid = NormalizeDouble(_bid(), _digits);
    if(! authed){
        if(bid < firstFactorPrice){authed = true; isTwoFactorEntryAvailable = true;}
        if(isFollowEntryAvailable){
            if(bid > buyEntryPrice){
                comment = EnumToString(Enum_Comment = FOLLOW);
                positionType = EnumToString(Enum_PositionType = LONG);
                return true;
            //!OrderSend if failed isFollowEntryAvailable = false
            }
        }else{return false;}
    }else{
        if(isTwoFactorEntryAvailable){
            if(bid > twoFactorEntryPrice){
                comment = EnumToString(Enum_Comment = PULL_BACK);
                positionType = EnumToString(Enum_PositionType = LONG);
                return true;
            //!OrderSend if failed isTwoFactorEntryAvailable = false
            }
        }else
        if(! isTwoFactorEntryAvailable){
            if(isFollowEntryAvailable){
                if(bid > buyEntryPrice){
                    comment = EnumToString(Enum_Comment = FOLLOW);
                    positionType = EnumToString(Enum_PositionType = LONG);
                    return true;
                //!OrderSend if failed isFollowEntryAvailable = false
                }
            }
        }
    }return false;
}
bool openSellOrder(){
    double bid = NormalizeDouble(_bid(), _digits);
    if(! authed){
        if(bid > firstFactorPrice){authed = true; isTwoFactorEntryAvailable = true;}
        if(isFollowEntryAvailable){
            if(bid < sellEntryPrice){
                comment = EnumToString(Enum_Comment = FOLLOW);
                positionType = EnumToString(Enum_PositionType = SHORT);
                return true;
            //!OrderSend if failed isFollowEntryAvailable = false
            }
        }else{return false;}
    }else{
        if(isTwoFactorEntryAvailable){
            if(bid < twoFactorEntryPrice){
                comment = EnumToString(Enum_Comment = PULL_BACK);
                positionType = EnumToString(Enum_PositionType = SHORT);
                return true;
            //!OrderSend if failed isTwoFactorEntryAvailable = false
            }
        }else
        if(! isTwoFactorEntryAvailable){
            if(isFollowEntryAvailable){
                if(bid < sellEntryPrice){
                comment = EnumToString(Enum_Comment = FOLLOW);
                positionType = EnumToString(Enum_PositionType = SHORT);
                return true;
                //!OrderSend if failed isFollowEntryAvailable = false
                }
            }
        }
    }return false;
}
bool openBreakOrder(){
    double bid = NormalizeDouble(_bid(), _digits);
    if(isBreakBuyEntryAvailable){
        if(bid > breakBuyPrice){
            comment = EnumToString(Enum_Comment = UPSIDE_BREAK);
            positionType = EnumToString(Enum_PositionType = LONG);
            return true;
            //!OrderSend if failed isBreakBuyEntryAvailable = false
        }
    }
    if(isBreakSellEntryAvailable){
        if(bid < breakSellPrice){
            comment = EnumToString(Enum_Comment = DOWNSIDE_BREAK);
            positionType = EnumToString(Enum_PositionType = SHORT);
            return true;
            //!OrderSend if failed isBreakSellEntryAvailable = false
        }
    }return false;
}

void setCloseData(ulong posTicket){
    Sleep(1000);
    for(int iCount=0; iCount<50; iCount++){
        if(_ordersTotal() >= 1){
            if(comment == EnumToString(Enum_Comment = FOLLOW)){
                if(positionType == EnumToString(Enum_PositionType = LONG)){
                    lcPriceForTrade =
                    tpPriceForTrade =
                }else
                if(positionType == EnumToString(Enum_PositionType = SHORT)){}
            }else
            if(comment == EnumToString(Enum_Comment = PULL_BACK)){
                if(positionType == EnumToString(Enum_PositionType = LONG)){}else
                if(positionType == EnumToString(Enum_PositionType = SHORT)){}
            }else
            if(comment == EnumToString(Enum_Comment = UPSIDE_BREAK)){}else
            if(comment == EnumToString(Enum_Comment = DOWNSIDE_BREAK)){}
            numberOfTransactions += 1;
            isDataRetrieved = true;
            break;
        }
        Sleep(100);
    }
    Print("The order submission has failed for some reason.");
    PrintFormat("Please stop the EA operation. %s, %d", __FILE__, __LINE__);
}

#endif
