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
                return true;
            //!OrderSend if failed isFollowEntryAvailable = false
            }
        }else{return;}
    }else{
        if(isTwoFactorEntryAvailable){
            if(bid > twoFactorEntryPrice){
                return true
            //!OrderSend if failed isTwoFactorEntryAvailable = false
            }
        }else
        if(! isTwoFactorEntryAvailable){
            if(isFollowEntryAvailable){
                if(bid > buyEntryPrice){
                //!OrderSend if failed isFollowEntryAvailable = false
                }
            }
        }
    }
}
void openSellOrder(){
    double bid = NormalizeDouble(_bid(), _digits);
    if(! authed){
        if(bid > firstFactorPrice){authed = true; isTwoFactorEntryAvailable = true;}
        if(isFollowEntryAvailable){
            if(bid < sellEntryPrice){
            //!OrderSend if failed isFollowEntryAvailable = false
            }
        }else{return;}
    }else{
        if(isTwoFactorEntryAvailable){
            if(bid < twoFactorEntryPrice){
                positionTicket = _orderSendSell(100/*stop*/, 0.1/*lot*/, magicNumber, "positionComment", convertPipsToPrice);
                Sleep(1000);
                if(positionTicket != 0){
                    setCloseData();
                }else{
                    isTwoFactorEntryAvailable = false;
                    Print("Order failed. Please check the log information.");
                    setCloseData();//!<---Safety Measure
                }
            //!OrderSend if failed isTwoFactorEntryAvailable = false
            }
        }else
        if(! isTwoFactorEntryAvailable){
            if(isFollowEntryAvailable){
                if(bid < sellEntryPrice){
                //!OrderSend if failed isFollowEntryAvailable = false
                }
            }
        }
    }
}
void openBreakOrder(){
    double bid = NormalizeDouble(_bid(), _digits);
    if(isBreakBuyEntryAvailable){
        if(bid > breakBuyPrice){
            //!OrderSend if failed isBreakBuyEntryAvailable = false
        }
    }
    if(isBreakSellEntryAvailable){
        if(bid < breakSellPrice){
            //!OrderSend if failed isBreakSellEntryAvailable = false
        }
    }
}

void setCloseData(){
    Sleep(1000);
    for(int iCount=0; iCount<50; iCount++){
        if(OrdersTotal() == 1){
            // 注文が通った場合の処理
            break;
        }
        Sleep(100);
    }
}

#endif
