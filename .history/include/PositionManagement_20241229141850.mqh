//?Start of development on 2024/09/26-08:27:53
#ifndef __PositionManagement__
#define __PositionManagement__

#property copyright "Created on 2024-10/27"
#property strict
#property link      ""
#property version   ""

#include <GraphicalUserInterface.mqh>
void buyOrder(){
  double bid = NormalizeDouble(_bid(), _digits);
  if(! authed){
    if(bid < )
    if(isFollowEntryAvailable){
      if(bid > buyEntryPrice){
        //!OrderSend
      }
    }
  }else
}
void sellOrder(){}
void breakOrder(){}

#endif