#property copyright ""
#property link      ""
#property version   "1.00"
#property strict
void OnStart(){
    ChartSetInteger(ChartID(), CHART_MODE, CHART_CANDLES);
    ChartSetInteger(ChartID(), CHART_SHOW_PERIOD_SEP, true);
    ChartSetInteger(ChartID(), CHART_SHOW_GRID, false);
    ChartSetInteger(ChartID(), CHART_COLOR_FOREGROUND, clrYellow);
    ChartSetInteger(ChartID(), CHART_COLOR_CHART_UP, clrLime);
    ChartSetInteger(ChartID(), CHART_COLOR_CHART_DOWN, clrLime);
    ChartSetInteger(ChartID(), CHART_SHOW_TRADE_LEVELS, false);
    double _bid = NormalizeDouble(myBid(), Digits());
    double round;
    double aHundredPipsDigits;
    if(StringSubstr(_Symbol, 0, 3) == "XAU"){
        aHundredPipsDigits = 0.1;
        round = MathFloor(_bid*aHundredPipsDigits);
    }else
    if(StringSubstr(_Symbol, 3, 3) == "JPY"){
        aHundredPipsDigits = 1.0;
        round = MathFloor(_bid*aHundredPipsDigits);
    }else
    if(StringSubstr(_Symbol, 3, 3) == "USD"){
        aHundredPipsDigits = 100.0;
        round = MathFloor(_bid*aHundredPipsDigits);
    }else{
        aHundredPipsDigits = 100.0;
        round = MathFloor(_bid*aHundredPipsDigits);
    }
    for(int iCount = 0; iCount <= 50; iCount ++){
        ObjectCreate("Round"+(string)iCount, OBJ_HLINE, 0, 0, (round+iCount)/aHundredPipsDigits);
        ObjectSet("Round"+(string)iCount, OBJPROP_COLOR, clrSnow);
        ObjectSet("Round"+(string)iCount, OBJPROP_STYLE, STYLE_DOT);
        ObjectSet("Round"+(string)iCount, OBJPROP_BACK, true);
        ObjectSet("Round"+(string)iCount, OBJPROP_SELECTABLE, false);
    }
    for(int iCount = 0; iCount >= -50; iCount --){
        ObjectCreate("Round"+(string)iCount, OBJ_HLINE, 0, 0, (round+iCount)/aHundredPipsDigits);
        ObjectSet("Round"+(string)iCount, OBJPROP_COLOR, clrSnow);
        ObjectSet("Round"+(string)iCount, OBJPROP_STYLE, STYLE_DOT);
        ObjectSet("Round"+(string)iCount, OBJPROP_BACK, true);
        ObjectSet("Round"+(string)iCount, OBJPROP_SELECTABLE, false);
    }
}
