DaiDodgeKeyboard
================

Let your textfield / textview automatic dodge your keyboard.

![image](https://s3-ap-northeast-1.amazonaws.com/daidoujiminecraft/Daidouji/DaiDodgeKeyboard.gif)

DaidoujiChen

daidoujichen@gmail.com

總覽
================
嘛...也是一個很懶惰的工具, 有時候我實在很懶惰去算說 view 到底要上升多少才可以剛剛好閃過鍵盤, 然後點其他的輸入框我也想讓他自動的重新幫我算過, 然後自己調整好, 所以就來寫一個自己用的工具.

簡易使用
================
首先必須先 import DaiDodgeKeyboard.h 到你想用他的地方

    #import "DaiDodgeKeyboard.h"
    
之後呢, 一樣不能違背所有工具都該很懶惰的原則, 所以只需要在一個 viewcontroller 起始的時候幫他加入

    [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self.view];
    
這樣一行, 他就會自動的在這個 view 裡面, 幫你的輸入框們自動的閃掉鍵盤, 就這樣, 沒別的了,
然後在結束的地方幫他加上

    [DaiDodgeKeyboard removeRegisterTheViewNeedDodgeKeyboard];
    
就可以移除監控了.

原理
================
本來我是寫說, 如果鍵盤出現了, 我就去找這個 view 下面的 "誰?" 變成 firstresponder 了, 但是後來想想, 有許多情況會有問題,
比方說如果我先出現鍵盤之後, 我再去點其他輸入框, 要閃躲就變得不容易做, 所以最後乾脆逆向思考, 當有某一個 view 自己要 becomefirstresponder 的時候, 自己過來跟我說, 我再去幫他做處理就好了.....嘛...超懶惰的...





