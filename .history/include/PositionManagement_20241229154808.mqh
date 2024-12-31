//?Start of development on 2024/09/26-08:27:53
#ifndef __PositionManagement__
#define __PositionManagement__

#property copyright "Created on 2024-10/27"
#property strict
#property link      ""
#property version   ""

#include <GraphicalUserInterface.mqh>
void openBuyOrder(){
    double bid = NormalizeDouble(_bid(), _digits);
    if(! authed){
        if(bid < firstFactorPrice){authed = true; isTwoFactorEntryAvailable = true;}
        if(isFollowEntryAvailable){
            if(bid > buyEntryPrice){
            //!OrderSend if failed isFollowEntryAvailable = false
            }
        }else{return;}
    }else{
        if(isTwoFactorEntryAvailable){
            if(bid > twoFactorEntryPrice){
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
                
                if(positionTicket != 0){
                    setCloseData();
                }else{
                    isTwoFactorEntryAvailable = false;
                    Print("Order failed. Please check the log information.");
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
