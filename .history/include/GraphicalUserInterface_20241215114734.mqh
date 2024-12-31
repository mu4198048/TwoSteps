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
    verticalLeftButton("reset button", "reset", 1);
    ChartRedraw(0);
}
void singleDirectionOrder(){
    verticalRightButton("entry button", "entry", 1);
    verticalRightButton("tp button", "tp", 2);
    verticalRightButton("lc button", "lc", 3);
    verticalLeftButton("reset button", "reset", 1);
    verticalLeftButton("check 2fo", "2-F", 2);
    verticalLeftButton("check sfo", "1-F", 3);
    verticalLeftButton("confirm button", "confirm", 4);
    ChartRedraw(0);
}
void multiDirectionOrder(){
    verticalRightButton("break buy tp button", "btp", 1);
    verticalRightButton("break buy lc button", "blc", 2);
    verticalRightButton("break sell tp button", "stp", 3);
    verticalRightButton("break sell lc button", "slc", 4);
    verticalLeftButton("reset button", "reset", 1);
    verticalLeftButton("check bb", "bb", 2);
    verticalLeftButton("check bs", "bs", 3);
    verticalLeftButton("confirm button", "confirm", 4);
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
        if(sparam == "check 2fo"){toggleLinesVisibility(trendLinesName[0]);}else
        if(sparam == "check sfo"){toggleLinesVisibility(trendLinesName[4]);}else
        if(sparam == "confirm button"){
            if(preparationOrderType == EnumToString(Enum_OrderType=REST) || ! checkThreeObjectsExist(trendLinesName[1], trendLinesName[2], trendLinesName[3])){
                int notice = MessageBox(
                    StringFormat("Order type is %s", preparationOrderType) + "\n" +
                    "Configuration is incomplete or insufficient. Please try again.",
                    "NOTICE",
                    MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
                );
            }else
            if(preparationOrderType == EnumToString(Enum_OrderType=BUY) || preparationOrderType == EnumToString(Enum_OrderType=SELL)){
                double details[];
                GetDetailsFollow(details, 6);
                int notice = MessageBox(
                    StringFormat("Order type is %s", preparationOrderType) + "\n" +
                    "<== Two Factor Order ==>" + "\n" +
                    StringFormat("TP Pips : %.2f LC Pips : %.2f RR : %.2f", details[0], details[1], details[2]) + "\n" +
                    "<== Single Factor Order ==>" + "\n" +
                    StringFormat("TP Pips : %.2f LC Pips : %.2f RR : %.2f", details[3], details[4], details[5]) + "\n" + "\n" +
                    "Do you confirm?",
                    "CONFIRM",
                MB_ICONINFORMATION | MB_YESNO | MB_DEFBUTTON1
                );
                if(notice == IDYES){
                    ObjectsDeleteAll(0, 0, OBJ_BUTTON);
                    showLines();
                    ExpertRemove();
                }else{return;}
            }else
            if(preparationOrderType == EnumToString(Enum_OrderType=BREAK)){
                double details[];
            }else
            if(preparationOrderType == EnumToString(Enum_OrderType=DYNAMIC)){}
        }else
        if(sparam == "reset button"){
            for(int iCount=0; iCount<ArraySize(trendLinesName); iCount++){
                ObjectDelete(0, trendLinesName[iCount]);
            }
            firstStepDone = false;
            preparationOrderType = EnumToString(Enum_OrderType=REST);
            ObjectsDeleteAll(0, 0, OBJ_BUTTON);
            preparationGui();
        }else
        if(sparam == "backGui"){
            ObjectsDeleteAll(0, 0, OBJ_BUTTON);
            preparationOrderType = EnumToString(Enum_OrderType=REST);
            preparationGui();
        }else
        if(sparam == "preparationOrderType"){
            verticalCenterButton("Set Buy Order", "Set Buy Order", 1);
            verticalCenterButton("Set Sell Order", "Set Sell Order", 3);
            verticalCenterButton("Place Order on Breakout", "Set Break Out", 5);
            verticalCenterButton("Place Order on Dynamic Lines", "Dynamic Rounded Lines", 7);
            ChartRedraw(0);
        }else
        if(sparam == "Set Buy Order"){
            ObjectsDeleteAll(0, 0, OBJ_BUTTON);
            preparationOrderType = EnumToString(Enum_OrderType=BUY);
            int notice = MessageBox(
                StringFormat("Order type is %s", preparationOrderType) + "\n" +
                "Please set up the two-factor order first." + "\n" +
                "You cannot configure a single-factor order" + "\n" +
                "without setting up the two-factor order.",
                "NOTICE",
                MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
            );
            double bid = NormalizeDouble(_bid(), _digits);
            string lineName = trendLinesName[0];
            createTrendLine(lineName, bid, bid, clrDarkViolet, true, true, true);
            activateTrendLine(lineName);
            singleDirectionOrder();
        }else
        if(sparam == "Set Sell Order"){
            ObjectsDeleteAll(0, 0, OBJ_BUTTON);
            preparationOrderType = EnumToString(Enum_OrderType=SELL);
            int notice = MessageBox(
                StringFormat("Order type is %s", preparationOrderType) + "\n" +
                "Please set up the two-factor order first." + "\n" +
                "You cannot configure a single-factor order" + "\n" +
                "without setting up the two-factor order.",
                "NOTICE",
                MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
            );
            double bid = NormalizeDouble(_bid(), _digits);
            string lineName = trendLinesName[0];
            createTrendLine(lineName, bid, bid, clrDarkViolet, true, true, true);
            activateTrendLine(lineName);
            singleDirectionOrder();
        }else
        if(sparam == "Place Order on Breakout"){
            ObjectsDeleteAll(0, 0, OBJ_BUTTON);
            preparationOrderType = EnumToString(Enum_OrderType=BREAK);
            int notice = MessageBox(
                StringFormat("Order type is %s", preparationOrderType) + "\n" +
                "Please determine the upper and lower limits of the range first." + "\n" +
                "Then, decide TP and LC respectively.",
                "NOTICE",
                MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
            );
            double bid = NormalizeDouble(_bid(), _digits);
            double upperLimits = bid+(100*convertPipsToPrice);
            double lowerLimits = bid-(100*convertPipsToPrice);
            createTrendLine(trendLinesName[8], upperLimits, upperLimits, clrOrangeRed, true, false, true);
            createTrendLine(trendLinesName[9], lowerLimits, lowerLimits, clrTomato, true, false, true);
            activateTrendLine(trendLinesName[8]);
            activateTrendLine(trendLinesName[9]);
            multiDirectionOrder();
        }else
        if(sparam == "tp button"){
            if(checkThreeObjectsExist(trendLinesName[1], trendLinesName[2], trendLinesName[3])){
                string tempEntryLineName = "";
                if(preparationOrderType == EnumToString(Enum_OrderType=BUY)){tempEntryLineName = trendLinesName[4];}else
                if(preparationOrderType == EnumToString(Enum_OrderType=SELL)){tempEntryLineName = trendLinesName[5];}
                if(checkLastObject(tempEntryLineName, trendLinesName[6])){
                    double bid = calculationTpFromRr(tempEntryLineName, trendLinesName[6]);
                    string lineName = trendLinesName[7];
                    createTrendLine(lineName, bid, bid, clrGold, true, false, true);
                    activateTrendLine(lineName);
                }else{
                    double bid = NormalizeDouble(_bid(), _digits);
                    string lineName = trendLinesName[7];
                    createTrendLine(lineName, bid, bid, clrGold, true, false, true);
                    activateTrendLine(lineName);
                }
            }else{
                if(checkLastObject(trendLinesName[1], trendLinesName[2])){
                    double bid = calculationTpFromRr(trendLinesName[1], trendLinesName[2]);
                    string lineName = trendLinesName[3];
                    createTrendLine(lineName, bid, bid, clrGold, true, true, true);
                    activateTrendLine(lineName);
                }else{
                    double bid = NormalizeDouble(_bid(), _digits);
                    string lineName = trendLinesName[3];
                    createTrendLine(lineName, bid, bid, clrGold, true, true, true);
                    activateTrendLine(lineName);
                }
            }
        }else
        if(sparam == "lc button"){
            if(checkThreeObjectsExist(trendLinesName[1], trendLinesName[2], trendLinesName[3])){
                string tempEntryLineName = "";
                if(preparationOrderType == EnumToString(Enum_OrderType=BUY)){tempEntryLineName = trendLinesName[4];}else
                if(preparationOrderType == EnumToString(Enum_OrderType=SELL)){tempEntryLineName = trendLinesName[5];}
                if(checkLastObject(tempEntryLineName, trendLinesName[7])){
                    double bid = calculationLcFromRr(tempEntryLineName, trendLinesName[7]);
                    string lineName = trendLinesName[6];
                    createTrendLine(lineName, bid, bid, clrMediumSpringGreen, true, false, true);
                    activateTrendLine(lineName);
                }else{
                    double bid = NormalizeDouble(_bid(), _digits);
                    string lineName = trendLinesName[6];
                    createTrendLine(lineName, bid, bid, clrMediumSpringGreen, true, false, true);
                    activateTrendLine(lineName);
                }
            }else{
                if(checkLastObject(trendLinesName[1], trendLinesName[3])){
                    double bid = calculationLcFromRr(trendLinesName[1], trendLinesName[3]);
                    string lineName = trendLinesName[2];
                    createTrendLine(lineName, bid, bid, clrMediumSpringGreen, true, true, true);
                    activateTrendLine(lineName);
                }else{
                    double bid = NormalizeDouble(_bid(), _digits);
                    string lineName = trendLinesName[2];
                    createTrendLine(lineName, bid, bid, clrMediumSpringGreen, true, true, true);
                    activateTrendLine(lineName);
                }
            }
        }else
        if(sparam == "entry button"){
            if(checkThreeObjectsExist(trendLinesName[1], trendLinesName[2], trendLinesName[3])){
                if(checkLastObject(trendLinesName[6], trendLinesName[7])){
                    double bid = calculationEntryFromRr(trendLinesName[7], trendLinesName[6]);
                    string lineName = "";
                    if(preparationOrderType == EnumToString(Enum_OrderType=BUY)){lineName = trendLinesName[4];}else
                    if(preparationOrderType == EnumToString(Enum_OrderType=SELL)){lineName = trendLinesName[5];}
                    createTrendLine(lineName, bid, bid, clrDeepPink, true, false, true);
                    activateTrendLine(lineName);
                }else{
                    double bid = NormalizeDouble(_bid(), _digits);
                    string lineName = "";
                    if(preparationOrderType == EnumToString(Enum_OrderType=BUY)){lineName = trendLinesName[4];}else
                    if(preparationOrderType == EnumToString(Enum_OrderType=SELL)){lineName = trendLinesName[5];}
                    createTrendLine(lineName, bid, bid, clrDeepPink, true, false, true);
                    activateTrendLine(lineName);
                }
            }else{
                if(checkLastObject(trendLinesName[2], trendLinesName[3])){
                    double bid = calculationEntryFromRr(trendLinesName[3], trendLinesName[2]);
                    string lineName = trendLinesName[1];
                    createTrendLine(lineName, bid, bid, clrDeepPink, true, true, true);
                    activateTrendLine(lineName);
                }else{
                    double bid = NormalizeDouble(_bid(), _digits);
                    string lineName = trendLinesName[1];
                    createTrendLine(lineName, bid, bid, clrDeepPink, true, true, true);
                    activateTrendLine(lineName);
                }
            }
        }else
        if(sparam == "break buy tp button"){
            if(checkLastObject(trendLinesName[8], trendLinesName[10])){
                preparationOrderType = EnumToString(Enum_OrderType=BUY);
                double bid = calculationTpFromRr(trendLinesName[8], trendLinesName[10]);
                string lineName = trendLinesName[11];
                createTrendLine(lineName, bid, bid, clrMediumSeaGreen, true, true, true);
                activateTrendLine(lineName);
                preparationOrderType = EnumToString(Enum_OrderType=BREAK);
            }else{
                double bid = NormalizeDouble(_bid(), _digits);
                string lineName = trendLinesName[11];
                createTrendLine(lineName, bid, bid, clrMediumSeaGreen, true, true, true);
                activateTrendLine(lineName);
            }
        }else
        if(sparam == "break buy lc button"){
            if(checkLastObject(trendLinesName[8], trendLinesName[11])){
                preparationOrderType = EnumToString(Enum_OrderType=BUY);
                double bid = calculationTpFromRr(trendLinesName[8], trendLinesName[11]);
                string lineName = trendLinesName[10];
                createTrendLine(lineName, bid, bid, clrDarkOliveGreen, true, true, true);
                activateTrendLine(lineName);
                preparationOrderType = EnumToString(Enum_OrderType=BREAK);
            }else{
                double bid = NormalizeDouble(_bid(), _digits);
                string lineName = trendLinesName[10];
                createTrendLine(lineName, bid, bid, clrDarkOliveGreen, true, true, true);
                activateTrendLine(lineName);
            }
        }else
        if(sparam == "break sell tp button"){
            if(checkLastObject(trendLinesName[9], trendLinesName[12])){
                preparationOrderType = EnumToString(Enum_OrderType=SELL);
                double bid = calculationTpFromRr(trendLinesName[9], trendLinesName[12]);
                string lineName = trendLinesName[13];
                createTrendLine(lineName, bid, bid, clrLightCoral, true, true, true);
                activateTrendLine(lineName);
                preparationOrderType = EnumToString(Enum_OrderType=BREAK);
            }else{
                double bid = NormalizeDouble(_bid(), _digits);
                string lineName = trendLinesName[13];
                createTrendLine(lineName, bid, bid, clrLightCoral, true, true, true);
                activateTrendLine(lineName);
            }
        }else
        if(sparam == "break sell lc button"){
            if(checkLastObject(trendLinesName[9], trendLinesName[13])){
                preparationOrderType = EnumToString(Enum_OrderType=SELL);
                double bid = calculationTpFromRr(trendLinesName[9], trendLinesName[13]);
                string lineName = trendLinesName[12];
                createTrendLine(lineName, bid, bid, clrLightSalmon, true, true, true);
                activateTrendLine(lineName);
                preparationOrderType = EnumToString(Enum_OrderType=BREAK);
            }else{
                double bid = NormalizeDouble(_bid(), _digits);
                string lineName = trendLinesName[12];
                createTrendLine(lineName, bid, bid, clrLightSalmon, true, true, true);
                activateTrendLine(lineName);
            }
        }else
        if(sparam == "check bb"){toggleLinesVisibility(trendLinesName[8]);}else
        if(sparam == "check bs"){toggleLinesVisibility(trendLinesName[9]);}else
        if(sparam == ""){}
    }
    ChartRedraw(0);
}
bool checkThreeObjectsExist(string OBJ_1, string OBJ_2, string OBJ_3){
    if(ObjectFind(0, OBJ_1) == 0 && ObjectFind(0, OBJ_2) == 0 && ObjectFind(0, OBJ_3) == 0){
        if(! firstStepDone){
            int notice = MessageBox(
            "First step setting is done." + "\n" +
            "Please proceed to the next step.",
            "NOTICE",
            MB_ICONINFORMATION | MB_OK | MB_DEFBUTTON1
            );
            toggleLinesVisibility(trendLinesName[0]);
            firstStepDone = true;
        }
        return true;
    }else{return false;}
}
bool checkLastObject(string OBJ_1, string OBJ_2){
    if(ObjectFind(0, OBJ_1) == 0 && ObjectFind(0, OBJ_2) == 0){
        return true;
    }else{
        return false;
    }
}
double calculationEntryFromRr(string OBJ_1, string OBJ_2){
    if(preparationOrderType == EnumToString(Enum_OrderType=BUY)){
        double preparationTpPrice = NormalizeDouble(ObjectGetValueByShift(OBJ_1, 0), _digits);
        double preparationLcPrice = NormalizeDouble(ObjectGetValueByShift(OBJ_2, 0), _digits);
        double diff = NormalizeDouble(preparationTpPrice-preparationLcPrice, _digits);
        return NormalizeDouble(preparationLcPrice+(diff*targetRrRate), _digits);
    }else
    if(preparationOrderType == EnumToString(Enum_OrderType=SELL)){
        double preparationTpPrice = NormalizeDouble(ObjectGetValueByShift(OBJ_1, 0), _digits);
        double preparationLcPrice = NormalizeDouble(ObjectGetValueByShift(OBJ_2, 0), _digits);
        double diff = NormalizeDouble(preparationLcPrice-preparationTpPrice, _digits);
        return NormalizeDouble(preparationLcPrice-(diff*targetRrRate), _digits);
    }else{
        Print("ERROR");
        MsgError(__FILE__, __LINE__);
        return _bid();
    }
}
double calculationTpFromRr(string OBJ_1, string OBJ_2){
    if(preparationOrderType == EnumToString(Enum_OrderType=BUY)){
        double preparationEntryPrice = NormalizeDouble(ObjectGetValueByShift(OBJ_1, 0), _digits);
        double preparationLcPrice = NormalizeDouble(ObjectGetValueByShift(OBJ_2, 0), _digits);
        double diff = NormalizeDouble(preparationEntryPrice-preparationLcPrice, _digits);
        return NormalizeDouble(preparationLcPrice+(diff/targetRrRate), _digits);
    }else
    if(preparationOrderType == EnumToString(Enum_OrderType=SELL)){
        double preparationEntryPrice = NormalizeDouble(ObjectGetValueByShift(OBJ_1, 0), _digits);
        double preparationLcPrice = NormalizeDouble(ObjectGetValueByShift(OBJ_2, 0), _digits);
        double diff = NormalizeDouble(preparationLcPrice-preparationEntryPrice, _digits);
        return NormalizeDouble(preparationLcPrice-(diff/targetRrRate), _digits);
    }else{
        Print("ERROR");
        MsgError(__FILE__, __LINE__);
        return _bid();
    }
}
double calculationLcFromRr(string OBJ_1, string OBJ_2){
    if(preparationOrderType == EnumToString(Enum_OrderType=BUY)){
        double preparationEntryPrice = NormalizeDouble(ObjectGetValueByShift(OBJ_1, 0), _digits);
        double preparationTpPrice = NormalizeDouble(ObjectGetValueByShift(OBJ_2, 0), _digits);
        double diff = NormalizeDouble(preparationTpPrice-preparationEntryPrice, _digits);
        return NormalizeDouble(preparationTpPrice-(diff/(1-targetRrRate)), _digits);
    }else
    if(preparationOrderType == EnumToString(Enum_OrderType=SELL)){
        double preparationEntryPrice = NormalizeDouble(ObjectGetValueByShift(OBJ_1, 0), _digits);
        double preparationTpPrice = NormalizeDouble(ObjectGetValueByShift(OBJ_2, 0), _digits);
        double diff = NormalizeDouble(preparationEntryPrice-preparationTpPrice, _digits);
        return NormalizeDouble(preparationTpPrice+(diff/(1-targetRrRate)), _digits);
    }else{
        Print("ERROR");
        MsgError(__FILE__, __LINE__);
        return _bid();
    }
}
void showLines(){
    for(int iCount=0; iCount<ArraySize(trendLinesName); iCount++){
        ObjectSet(trendLinesName[iCount], OBJPROP_TIMEFRAMES, OBJ_PERIOD_H1);
    }
}
void hydeLines(){
    for(int iCount=0; iCount<ArraySize(trendLinesName); iCount++){
        ObjectSet(trendLinesName[iCount], OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
    }
}
void toggleLinesVisibility(string step){
    if(step == trendLinesName[0]){
        if(ObjectGetInteger(0, trendLinesName[0], OBJPROP_TIMEFRAMES) == OBJ_PERIOD_H1){
            for(int iCount=0; iCount<4; iCount++){
                ObjectSet(trendLinesName[iCount], OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
            }
        }else{
            for(int iCount=0; iCount<4; iCount++){
                ObjectSet(trendLinesName[iCount], OBJPROP_TIMEFRAMES, OBJ_PERIOD_H1);
            }
        }
    }else
    if(step == trendLinesName[4]){
        if(ObjectGetInteger(0, trendLinesName[7], OBJPROP_TIMEFRAMES) == OBJ_PERIOD_H1){
            for(int iCount=4; iCount<8; iCount++){
                ObjectSet(trendLinesName[iCount], OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
            }
        }else{
            for(int iCount=4; iCount<8; iCount++){
                ObjectSet(trendLinesName[iCount], OBJPROP_TIMEFRAMES, OBJ_PERIOD_H1);
            }
        }
    }
    if(step == trendLinesName[8]){
        if(ObjectGetInteger(0, trendLinesName[8], OBJPROP_TIMEFRAMES) == OBJ_PERIOD_H1){
            ObjectSet(trendLinesName[8], OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
            for(int iCount=10; iCount<12; iCount++){
                ObjectSet(trendLinesName[iCount], OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
            }
        }else{
            ObjectSet(trendLinesName[8], OBJPROP_TIMEFRAMES, OBJ_PERIOD_H1);
            for(int iCount=10; iCount<12; iCount++){
                ObjectSet(trendLinesName[iCount], OBJPROP_TIMEFRAMES, OBJ_PERIOD_H1);
            }
        }
    }
    if(step == trendLinesName[9]){
        if(ObjectGetInteger(0, trendLinesName[9], OBJPROP_TIMEFRAMES) == OBJ_PERIOD_H1){
            ObjectSet(trendLinesName[9], OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
            for(int iCount=12; iCount<14; iCount++){
                ObjectSet(trendLinesName[iCount], OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
            }
        }else{
            ObjectSet(trendLinesName[9], OBJPROP_TIMEFRAMES, OBJ_PERIOD_H1);
            for(int iCount=12; iCount<14; iCount++){
                ObjectSet(trendLinesName[iCount], OBJPROP_TIMEFRAMES, OBJ_PERIOD_H1);
            }
        }
    }
}
void GetDetailsFollow(double &arr[], int length){
    ArrayResize(arr, length);
    double firstFactorValue = NormalizeDouble(ObjectGetValueByShift(trendLinesName[0], 0), _digits);
    double twoFactorEntryValue = NormalizeDouble(ObjectGetValueByShift(trendLinesName[1], 0), _digits);
    double twoFactorTpValue = NormalizeDouble(ObjectGetValueByShift(trendLinesName[3], 0), _digits);
    double twoFactorLcValue = NormalizeDouble(ObjectGetValueByShift(trendLinesName[2], 0), _digits);
    double singleFactorEntryValue = 0.0;
    double singleFactorTpValue = NormalizeDouble(ObjectGetValueByShift(trendLinesName[7], 0), _digits);
    double singleFactorLcValue = NormalizeDouble(ObjectGetValueByShift(trendLinesName[6], 0), _digits);
    if(preparationOrderType == EnumToString(Enum_OrderType=BUY)){
        singleFactorEntryValue = NormalizeDouble(ObjectGetValueByShift(trendLinesName[4], 0), _digits);
        if(twoFactorTpValue < twoFactorEntryValue || twoFactorEntryValue < twoFactorLcValue){
            MsgError(__FILE__, __LINE__);
        }
        if(singleFactorTpValue < singleFactorEntryValue || singleFactorEntryValue < singleFactorLcValue){
            MsgError(__FILE__, __LINE__);
        }
    }else
    if(preparationOrderType == EnumToString(Enum_OrderType=SELL)){
        singleFactorEntryValue = NormalizeDouble(ObjectGetValueByShift(trendLinesName[5], 0), _digits);
        if(twoFactorTpValue > twoFactorEntryValue || twoFactorEntryValue > twoFactorLcValue){
            MsgError(__FILE__, __LINE__);
        }
        if(singleFactorTpValue > singleFactorEntryValue || singleFactorEntryValue > singleFactorLcValue){
            MsgError(__FILE__, __LINE__);
        }
    }
    arr[0] = MathAbs((twoFactorTpValue-twoFactorEntryValue)/convertPipsToPrice);
    arr[1] = MathAbs((twoFactorEntryValue-twoFactorLcValue)/convertPipsToPrice);
    arr[2] = MathAbs((twoFactorTpValue-twoFactorEntryValue)/(twoFactorEntryValue-twoFactorLcValue));
    arr[3] = MathAbs((singleFactorTpValue-singleFactorEntryValue)/convertPipsToPrice);
    arr[4] = MathAbs((singleFactorEntryValue-singleFactorLcValue)/convertPipsToPrice);
    arr[5] = MathAbs((singleFactorTpValue-singleFactorEntryValue)/(singleFactorEntryValue-singleFactorLcValue));
}

#endif