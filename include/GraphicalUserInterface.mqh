//?Start of development on 2024/12/04-09:19:25
#ifndef __GraphicalUserInterface__
#define __GraphicalUserInterface__

#property copyright "Created on "
#property strict
#property link      ""
#property version   ""

#include <BasicFunctions.mqh>
void verticalRightButton(string name, string text, int step){
    int Ydistance = 0;
    if(step == 1){Ydistance = 120;}else
    if(step == 2){Ydistance = 240;}else
    if(step == 3){Ydistance = 360;}else
    if(step == 4){Ydistance = 480;}else
    if(step == 5){Ydistance = 600;}else
    if(step == 6){Ydistance = 720;}
    ObjectCreate(name, OBJ_BUTTON, 0, 0, 0);
    ObjectSetInteger(0, name, OBJPROP_COLOR, clrYellow);
    ObjectSetInteger(0, name, OBJPROP_BACK, true);
    ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
    ObjectSetInteger(0, name, OBJPROP_SELECTED, false);
    ObjectSetInteger(0, name, OBJPROP_HIDDEN, true);
    ObjectSetInteger(0, name, OBJPROP_ZORDER, 0);
    ObjectSetString(0, name, OBJPROP_TEXT, text);
    ObjectSetString(0, name, OBJPROP_FONT, "Arial");
    ObjectSetInteger(0, name, OBJPROP_FONTSIZE, 12);
    ObjectSetInteger(0, name, OBJPROP_CORNER, CORNER_RIGHT_UPPER);
    ObjectSetInteger(0, name, OBJPROP_XDISTANCE, 200);
    ObjectSetInteger(0, name, OBJPROP_YDISTANCE, Ydistance);
    ObjectSetInteger(0, name, OBJPROP_XSIZE, 100);
    ObjectSetInteger(0, name, OBJPROP_YSIZE, 100);
    ObjectSetInteger(0, name, OBJPROP_BGCOLOR, clrBlack);
    ObjectSetInteger(0, name, OBJPROP_BORDER_COLOR, clrWhite);
    ObjectSetInteger(0, name, OBJPROP_STATE, false);
}
void verticalLeftButton(string name, string text, int step){
    int Ydistance = 0;
    if(step == 1){Ydistance = 120;}else
    if(step == 2){Ydistance = 240;}else
    if(step == 3){Ydistance = 360;}else
    if(step == 4){Ydistance = 480;}else
    if(step == 5){Ydistance = 600;}else
    if(step == 6){Ydistance = 720;}
    ObjectCreate(name, OBJ_BUTTON, 0, 0, 0);
    ObjectSetInteger(0, name, OBJPROP_COLOR, clrYellow);
    ObjectSetInteger(0, name, OBJPROP_BACK, true);
    ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
    ObjectSetInteger(0, name, OBJPROP_SELECTED, false);
    ObjectSetInteger(0, name, OBJPROP_HIDDEN, true);
    ObjectSetInteger(0, name, OBJPROP_ZORDER, 0);
    ObjectSetString(0, name, OBJPROP_TEXT, text);
    ObjectSetString(0, name, OBJPROP_FONT, "Arial");
    ObjectSetInteger(0, name, OBJPROP_FONTSIZE, 12);
    ObjectSetInteger(0, name, OBJPROP_CORNER, CORNER_LEFT_UPPER);
    ObjectSetInteger(0, name, OBJPROP_XDISTANCE, 100);
    ObjectSetInteger(0, name, OBJPROP_YDISTANCE, Ydistance);
    ObjectSetInteger(0, name, OBJPROP_XSIZE, 100);
    ObjectSetInteger(0, name, OBJPROP_YSIZE, 100);
    ObjectSetInteger(0, name, OBJPROP_BGCOLOR, clrBlack);
    ObjectSetInteger(0, name, OBJPROP_BORDER_COLOR, clrWhite);
    ObjectSetInteger(0, name, OBJPROP_STATE, false);
}
void leftButton(string name, string text, int Xdistance=10, int Ydistance=50, int Xsize=300, int Ysize=35){
    ObjectCreate(0, name, OBJ_BUTTON, 0, 0, 0);
    ObjectSetInteger(0, name, OBJPROP_COLOR, clrBlack);
    ObjectSetInteger(0, name, OBJPROP_BACK, false);
    ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
    ObjectSetInteger(0, name, OBJPROP_SELECTED, false);
    ObjectSetInteger(0, name, OBJPROP_HIDDEN, true);
    ObjectSetInteger(0, name, OBJPROP_ZORDER, 0);
    ObjectSetString(0, name, OBJPROP_TEXT, text);
    ObjectSetString(0, name, OBJPROP_FONT, "Arial");
    ObjectSetInteger(0, name, OBJPROP_FONTSIZE,12);
    ObjectSetInteger(0, name, OBJPROP_CORNER,CORNER_LEFT_LOWER);
    ObjectSetInteger(0, name, OBJPROP_XDISTANCE, Xdistance);
    ObjectSetInteger(0, name, OBJPROP_YDISTANCE, Ydistance);
    ObjectSetInteger(0, name, OBJPROP_XSIZE, Xsize);
    ObjectSetInteger(0, name, OBJPROP_YSIZE,  Ysize);
    ObjectSetInteger(0, name, OBJPROP_BGCOLOR,clrWhite);
    ObjectSetInteger(0, name, OBJPROP_BORDER_COLOR, clrRed);
    ObjectSetInteger(0, name, OBJPROP_STATE, false);
}
void verticalCenterButton(string name, string text, int step, int Xdistance=1100, int Xsize=800, int Ysize=35){
    int Ydistance = 0;
    switch(step){
        case 8: Ydistance = 500; break;
        case 7: Ydistance = 430; break;
        case 6: Ydistance = 360; break;
        case 5: Ydistance = 290; break;
        case 4: Ydistance = 220; break;
        case 3: Ydistance = 150; break;
        case 2: Ydistance = 80; break;
        case 1: Ydistance = 10; break;
        default: Ydistance = 5; break;
    }
    ObjectCreate(0, name, OBJ_BUTTON, 0, 0, 0);
    ObjectSetInteger(0, name, OBJPROP_COLOR, clrBlack);
    ObjectSetInteger(0, name, OBJPROP_BACK, false);
    ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
    ObjectSetInteger(0, name, OBJPROP_SELECTED, false);
    ObjectSetInteger(0, name, OBJPROP_HIDDEN, true);
    ObjectSetInteger(0, name, OBJPROP_ZORDER, 0);
    ObjectSetString(0, name, OBJPROP_TEXT, text);
    ObjectSetString(0, name, OBJPROP_FONT, "Arial");
    ObjectSetInteger(0, name, OBJPROP_FONTSIZE,12);
    ObjectSetInteger(0, name, OBJPROP_CORNER,CORNER_RIGHT_UPPER);
    ObjectSetInteger(0, name, OBJPROP_XDISTANCE,Xdistance);
    ObjectSetInteger(0, name, OBJPROP_YDISTANCE, Ydistance);
    ObjectSetInteger(0, name, OBJPROP_XSIZE,Xsize);
    ObjectSetInteger(0, name, OBJPROP_YSIZE,Ysize);
    ObjectSetInteger(0, name, OBJPROP_BGCOLOR,clrWhite);
    ObjectSetInteger(0, name, OBJPROP_BORDER_COLOR,clrRed);
    ObjectSetInteger(0, name, OBJPROP_STATE, false);
}
void verticalCenterEdit(string name, string text, int step, int Xdistance=1100, int Xsize=800, int Ysize=35){
    int Ydistance = 0;
    switch(step){
        case 6: Ydistance = 360; break;
        case 5: Ydistance = 290; break;
        case 4: Ydistance = 220; break;
        case 3: Ydistance = 150; break;
        case 2: Ydistance = 80; break;
        case 1: Ydistance = 10; break;
        default: Ydistance = 5; break;
    }
    ObjectCreate(0, name, OBJ_EDIT, 0, 0, 0);
    ObjectSetInteger(0, name, OBJPROP_COLOR, clrBlack);
    ObjectSetInteger(0, name, OBJPROP_BACK, false);
    ObjectSetInteger(0, name, OBJPROP_SELECTABLE, false);
    ObjectSetInteger(0, name, OBJPROP_SELECTED, false);
    ObjectSetInteger(0, name, OBJPROP_HIDDEN, true);
    ObjectSetInteger(0, name, OBJPROP_ZORDER, 0);
    ObjectSetString(0, name, OBJPROP_TEXT, text);
    ObjectSetString(0, name, OBJPROP_FONT, "Arial");
    ObjectSetInteger(0, name, OBJPROP_FONTSIZE,12);
    ObjectSetInteger(0, name, OBJPROP_CORNER,CORNER_RIGHT_UPPER);
    ObjectSetInteger(0, name, OBJPROP_XDISTANCE,Xdistance);
    ObjectSetInteger(0, name, OBJPROP_YDISTANCE, Ydistance);
    ObjectSetInteger(0, name, OBJPROP_XSIZE,Xsize);
    ObjectSetInteger(0, name, OBJPROP_YSIZE,Ysize);
    ObjectSetInteger(0, name, OBJPROP_BGCOLOR,clrWhite);
    ObjectSetInteger(0, name, OBJPROP_BORDER_COLOR,clrRed);
    ObjectSetInteger(0, name, OBJPROP_ALIGN,ALIGN_LEFT);
    ObjectSetInteger(0, name, OBJPROP_READONLY,false);
}
void preparationGui(){
    verticalRightButton("preparationOrderType", "order", 1);
    verticalRightButton("backGui", "back", 2);
    ChartRedraw(0);
}
void singleDirectionOrder(){
    verticalRightButton("entry button", "entry", 1);
    verticalRightButton("tp button", "tp", 2);
    verticalRightButton("lc button", "lc", 3);
    verticalLeftButton("reset button", "reset", 1);
    verticalLeftButton("check 2fo", "2fo", 2);
    verticalLeftButton("check sfo", "sfo", 3);
    ChartRedraw(0);
}
void multiDirectionOrder(){
    verticalRightButton("break buy", "buy", 1);
    verticalRightButton("buy tp", "btp", 2);
    verticalRightButton("buy lc", "blc", 3);
    verticalRightButton("break sell", "sell", 4);
    verticalRightButton("sell tp", "stp", 5);
    verticalRightButton("sell lc", "slc", 6);
    verticalLeftButton("reset button", "reset", 1);
    verticalLeftButton("check bb", "bb", 2);
    verticalLeftButton("check bs", "bs", 3);
    ChartRedraw(0);
}
void activateTrendLine(string name){
    ObjectSetInteger(0, name, OBJPROP_SELECTABLE, true);
    ObjectSetInteger(0, name, OBJPROP_RAY_LEFT, true);
    ObjectSetInteger(0, name, OBJPROP_SELECTED, true);
    ChartRedraw(0);
}
void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam){
    if(id == CHARTEVENT_OBJECT_CLICK){
        if(sparam == "backGui"){
            ObjectsDeleteAll(0, 0, OBJ_BUTTON);
            preparationGui();
        }else
        if(sparam == "preparationOrderType"){
            verticalCenterButton("Set Buy Order", "Set Buy Order", 1);
            verticalCenterButton("Set Sell Order", "Set Sell Order", 3);
            verticalCenterButton("Place Order on Breakout", "Place Order on Breakout", 5);
            ChartRedraw(0);
        }else
        if(sparam == "Set Buy Order"){
            ObjectsDeleteAll(0, 0, OBJ_BUTTON);
            int notice = MessageBox(
                "Please set up the two-factor order first." + "\n" +
                "You cannot configure a single-factor order" + "\n" +
                "without setting up the two-factor order.",
                "NOTICE",
                MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
            );
            preparationOrderType = EnumToString(Enum_OrderType=BUY);
            double bid = NormalizeDouble(_bid(), _digits);
            string lineName = trendLinesName[0];
            createTrendLine(lineName, bid, bid, clrDarkViolet, true, true, true);
            activateTrendLine(lineName);
            singleDirectionOrder();
        }else
        if(sparam == "Set Sell Order"){
            ObjectsDeleteAll(0, 0, OBJ_BUTTON);
            int notice = MessageBox(
                "Please set up the two-factor order first." + "\n" +
                "You cannot configure a single-factor order" + "\n" +
                "without setting up the two-factor order.",
                "NOTICE",
                MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
            );
            preparationOrderType = EnumToString(Enum_OrderType=SELL);
            double bid = NormalizeDouble(_bid(), _digits);
            string lineName = trendLinesName[0];
            createTrendLine(lineName, bid, bid, clrDarkViolet, true, true, true);
            activateTrendLine(lineName);
            singleDirectionOrder();
        }else
        if(sparam == "entry button"){
            string lineName = trendLinesName[1];
            double bid = NormalizeDouble(_bid(), _digits);
            if(ObjectFind(0, lineName) != 0){
                if(ObjectFind(0, trendLinesName[2]) == 0 && ObjectFind(0, trendLinesName[3]) == 0){
                    double preparationTwoFactorLcPrice = NormalizeDouble(ObjectGetValueByShift(trendLinesName[2], 0), _digits);
                    double preparationTwoFactorTpPrice = NormalizeDouble(ObjectGetValueByShift(trendLinesName[3], 0), _digits);
                    double preparationTwoFactorEntryPrice = 0.0;
                    if(preparationOrderType == EnumToString(Enum_OrderType=BUY)){
                        double diff = NormalizeDouble(preparationTwoFactorTpPrice-preparationTwoFactorLcPrice, _digits);
                        preparationTwoFactorEntryPrice = NormalizeDouble(preparationTwoFactorLcPrice+(diff*targetRrRate), _digits);
                    }else
                    if(preparationOrderType == EnumToString(Enum_OrderType=BUY)){
                        double diff = NormalizeDouble(preparationTwoFactorLcPrice-preparationTwoFactorTpPrice, _digits);
                        preparationTwoFactorEntryPrice = NormalizeDouble(preparationTwoFactorLcPrice-(diff*targetRrRate), _digits);
                    }
                    createTrendLine(lineName, preparationTwoFactorEntryPrice, preparationTwoFactorEntryPrice, clrSalmon, true, true, true);
                    activateTrendLine(lineName);
                }else{
                    createTrendLine(lineName, bid, bid, clrSalmon, true, true, true);
                    activateTrendLine(lineName);
                }
            }else
            if(ObjectFind(0, lineName) == 0 && (ObjectFind(0, trendLinesName[2]) != 0 || ObjectFind(0, trendLinesName[3]) != 0)){
                int notice = MessageBox(
                    "Please set up the two-factor order first." + "\n" +
                    "You cannot configure a single-factor order" + "\n" +
                    "without setting up the two-factor order.",
                    "NOTICE",
                    MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
                );
                return;
            }else
            if(ObjectFind(0, lineName) == 0 && ObjectFind(0, trendLinesName[2]) == 0 && ObjectFind(0, trendLinesName[3]) == 0){
                if(preparationOrderType == EnumToString(Enum_OrderType=BUY)){
                    lineName = trendLinesName[4];
                    if(ObjectFind(0, trendLinesName[6]) == 0 && ObjectFind(0, trendLinesName[7]) == 0){
                        double preparationTwoFactorLcPrice = NormalizeDouble(ObjectGetValueByShift(trendLinesName[6], 0), _digits);
                        double preparationTwoFactorTpPrice = NormalizeDouble(ObjectGetValueByShift(trendLinesName[7], 0), _digits);
                        double diff = NormalizeDouble(preparationTwoFactorTpPrice-preparationTwoFactorLcPrice, _digits);
                        double preparationTwoFactorEntryPrice = NormalizeDouble(preparationTwoFactorLcPrice+(diff*targetRrRate), _digits);
                        createTrendLine(lineName, preparationTwoFactorEntryPrice, preparationTwoFactorEntryPrice, clrSalmon, true, true, true);
                        activateTrendLine(lineName);
                    }else{
                        createTrendLine(lineName, bid, bid, clrSalmon, true, true, true);
                        activateTrendLine(lineName);
                    }
                }else
                if(preparationOrderType == EnumToString(Enum_OrderType=SELL)){
                    lineName = trendLinesName[5];
                    if(ObjectFind(0, trendLinesName[6]) == 0 && ObjectFind(0, trendLinesName[7]) == 0){
                        double preparationTwoFactorLcPrice = NormalizeDouble(ObjectGetValueByShift(trendLinesName[6], 0), _digits);
                        double preparationTwoFactorTpPrice = NormalizeDouble(ObjectGetValueByShift(trendLinesName[7], 0), _digits);
                        double diff = NormalizeDouble(preparationTwoFactorLcPrice-preparationTwoFactorTpPrice, _digits);
                        double preparationTwoFactorEntryPrice = NormalizeDouble(preparationTwoFactorLcPrice-(diff*targetRrRate), _digits);
                        createTrendLine(lineName, preparationTwoFactorEntryPrice, preparationTwoFactorEntryPrice, clrSalmon, true, true, true);
                        activateTrendLine(lineName);
                    }else{
                        createTrendLine(lineName, bid, bid, clrSalmon, true, true, true);
                        activateTrendLine(lineName);
                    }
                }
            }else{
                int notice = MessageBox(
                    "Error" + "\n" +
                    StringFormat("Edit ======> %s, %d", __FILE__, __LINE__),
                    "NOTICE",
                    MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
                );
            }
        }else
        if(sparam == ""){}
    }
    ChartRedraw(0);
}

#endif