//?Start of development on 2024/09/26-08:27:53
#property copyright "Created on 2024-10/27"
#property strict
#property link      ""
#property version   "1.0"
#property description ""

#include <PositionManagement.mqh>

int OnInit(){
    settingChart(Symbol());
    targetRrRate = 0.45;
    firstStepDone = false;
    _digits = Digits();
    _symbol = Symbol();
    preparationGui();
    getCPTP();
    for(int iCount=0; iCount<ArraySize(trendLinesName); iCount++){
        ObjectDelete(0, trendLinesName[iCount]);
    }
    return(INIT_SUCCEEDED);
}
void OnDeinit(const int reason){
    ObjectsDeleteAll(0, 0, OBJ_BUTTON);
}
void OnTick(){
}
