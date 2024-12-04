# 既存EA two stage の改良
開始 2024-12/04<br>
終了 
## エントリーの改良
エントリーポイントを一つから二つにする
- single_factor or two_factor だったのを両方設定できるようにする。

コンパイルは旧バージョン 1200ms/vscode
## 時間外の改良
いまいち不透明だった取引時間外の挙動を統制する。
``` c++
if(on_time){
  if(no_position){
    two_factor check
    entry_flag check
  }else
  if(on_position){
    close_flag check
  }else{
    two_factor check
    return;
  }
}
```
