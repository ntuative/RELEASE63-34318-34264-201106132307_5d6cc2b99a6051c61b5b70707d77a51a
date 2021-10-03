package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_974:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_1194:int = 0;
      
      public static const const_1845:Array = [2,3,4];
       
      
      private var var_89:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_974);
         this.var_89 = param1;
      }
      
      public function get style() : int
      {
         return this.var_89;
      }
   }
}
