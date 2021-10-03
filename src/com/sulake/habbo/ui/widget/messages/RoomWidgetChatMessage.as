package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_978:String = "RWCM_MESSAGE_CHAT";
      
      public static const const_136:int = 0;
      
      public static const const_171:int = 1;
      
      public static const const_135:int = 2;
       
      
      private var var_1638:int = 0;
      
      private var _text:String = "";
      
      private var var_2612:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         this._text = param2;
         this.var_1638 = param3;
         this.var_2612 = param4;
      }
      
      public function get chatType() : int
      {
         return this.var_1638;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get recipientName() : String
      {
         return this.var_2612;
      }
   }
}
