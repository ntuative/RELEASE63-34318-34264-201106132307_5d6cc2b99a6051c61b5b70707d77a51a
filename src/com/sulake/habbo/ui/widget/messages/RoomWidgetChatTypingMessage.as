package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_868:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_609:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_868);
         this.var_609 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_609;
      }
   }
}
