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
double _getPositionLot(ulong ticket){
    static double res = 0.0;
    if(result.order != ticket){
        Print("Preliminary Report");
        PrintFormat("<< " + "position ticket is %I64u, result.order is %I64u" + " >>", ticket, result.order);
        PrintFormat("<< " + "position lot is %.2f, open price is %.4f, open bar is %d" + " >>", result.volume, result.price, Bars());
    }else
    if(ticket == result.order){
        PositionSelectByTicket(ticket);
        res = NormalizeDouble(PositionGetDouble(POSITION_VOLUME), 2);
    }
    return(res);
}
double _getPositionOpenPrice(ulong ticket){
    double res = -1.0;
    if(ticket == result.order){
        PositionSelectByTicket(ticket);
        res = NormalizeDouble(PositionGetDouble(POSITION_PRICE_OPEN), _digits);
    }
    return(res);
}
void setCloseData(ulong posTicket){
    Sleep(1000);
    for(int iCount=0; iCount<50; iCount++){
        if(_ordersTotal() >= 1){
            if(result.retcode == TRADE_RETCODE_DONE){
                if(posTicket == PositionGetTicket(PositionsTotal()-1)){
                    lotSizeForTrade = _getPositionLot(posTicket);
                    openPriceForTrade = _getPositionOpenPrice(posTicket);
                }else{LogError(__FILE__, __LINE__);}
            }else{LogError(__FILE__, __LINE__);}
            if(comment == EnumToString(Enum_Comment = FOLLOW)){
                lcPriceForTrade = NormalizeDouble(lcPrice, _digits);
                tpPriceForTrade = NormalizeDouble(tpPrice, _digits);
            }else
            if(comment == EnumToString(Enum_Comment = PULL_BACK)){
                lcPriceForTrade = NormalizeDouble(twoFactorLcPrice, _digits);
                tpPriceForTrade = NormalizeDouble(twoFactorTpPrice, _digits);
            }else
            if(comment == EnumToString(Enum_Comment = UPSIDE_BREAK)){
                lcPriceForTrade = NormalizeDouble(breakBuyLcPrice, _digits);
                tpPriceForTrade = NormalizeDouble(breakBuyTpPrice, _digits);
            }else
            if(comment == EnumToString(Enum_Comment = DOWNSIDE_BREAK)){
                lcPriceForTrade = NormalizeDouble(breakSellLcPrice, _digits);
                tpPriceForTrade = NormalizeDouble(breakSellTpPrice, _digits);
            }
            numberOfTransactions += 1;
            isDataRetrieved = true;
            break;
        }
        Sleep(100);
    }LogError(__FILE__, __LINE__);
}
/*
void trailingTP(){
    double bid = NormalizeDouble(_bid(), _digits);
    if(! activateTrailingTP){
        if(positionType == EnumToString(Enum_PositionType=LONG)){
            if(bid >= tpPrice){
                irreversibleTrailingTP = bid - ((winPips*trailingMarginRate)*convertPipsToPrice);
                activateTrailingTP = true;
            }
        }else
        if(positionType == (Enum_PositionType=SHORT)){
            if(bid <= tpPrice){
                irreversibleTrailingTP = bid + ((winPips*trailingMarginRate)*convertPipsToPrice);
                activateTrailingTP = true;
            }
        }
    }
    if(activateTrailingTP){
        double trailingMargin = winPips*trailingMarginRate;
        if(positionType == EnumToString(Enum_PositionType=LONG)){
            double newTrail = bid - (trailingMargin*convertPipsToPrice);
            if(newTrail > irreversibleTrailingTP){
                irreversibleTrailingTP = newTrail;
            }
            if(bid <= irreversibleTrailingTP){
                activateTrailingTP = false;
                irreversibleTrailingTP = -1.0;
                reasonClose = EnumToString(Enum_ClsType=TAKE_PROFITS);
                _closeBuyPosition(magicNumber);
            }
        }else
        if(positionType == (Enum_PositionType=SHORT)){
            double newTrail = bid + (trailingMargin*convertPipsToPrice);
            if(newTrail < irreversibleTrailingTP){
                irreversibleTrailingTP = newTrail;
            }
            if(bid >= irreversibleTrailingTP){
                activateTrailingTP = false;
                irreversibleTrailingTP = -1.0;
                reasonClose = EnumToString(Enum_ClsType=TAKE_PROFITS);
                _closeSellPosition(magicNumber);
            }
        }
    }
}
void logTrailing(){
    double bid = NormalizeDouble(_bid(), _digits);
    static double minLog = MathLog(10);
    static double maxLog = MathLog(winPips);
    static double bottom = NormalizeDouble(maxLog-minLog, 5);
    if(! activateTrailingClose){
        if(positionType == (Enum_PositionType=LONG)){
            activateTrailingClose = true;
            irreversibleTrailingClose = NormalizeDouble(entryPrice - (initialLossPipsForClose*convertPipsToPrice), _digits);
            trailingClosStartPrice = irreversibleTrailingClose;
        }else
        if(positionType == (Enum_PositionType=SHORT)){
            activateTrailingClose = true;
            irreversibleTrailingClose = NormalizeDouble(entryPrice + (initialLossPipsForClose*convertPipsToPrice), _digits);
            trailingClosStartPrice = irreversibleTrailingClose;
        }
    }else{
        if(positionType == (Enum_PositionType=LONG)){
            double gainPips = NormalizeDouble((bid - entryPrice)/convertPipsToPrice, _digits);
            double trailingClose = trailingClosStartPrice+((gainPips*0.7)+(gainPips*MathPow((MathLog(gainPips)-minLog)/bottom, 4)))*convertPipsToPrice;
            if(trailingClose > irreversibleTrailingClose){
                irreversibleTrailingClose = trailingClose;
            }
            if(bid <= irreversibleTrailingClose){
                activateTrailingClose = false;
                irreversibleTrailingClose = -1.0;
                reasonClose = EnumToString(Enum_ClsType=TRAILING_CLOSE);
                _closeBuyPosition(magicNumber);
            }
        }else
        if(positionType == (Enum_PositionType=SHORT)){
            double gainPips = NormalizeDouble((entryPrice - bid)/convertPipsToPrice, _digits);
            double trailingClose = trailingClosStartPrice-((gainPips*0.7)+(gainPips*MathPow((MathLog(gainPips)-minLog)/bottom, 4)))*convertPipsToPrice;
            if(trailingClose < irreversibleTrailingClose){
                irreversibleTrailingClose = trailingClose;
            }
            if(bid >= irreversibleTrailingClose){
                activateTrailingClose = false;
                irreversibleTrailingClose = -1.0;
                reasonClose = EnumToString(Enum_ClsType=TRAILING_CLOSE);
                _closeSellPosition(magicNumber);
            }
        }
    }
}
#endif
