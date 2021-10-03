package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_942:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_2575:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_942);
         this.var_2575 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2575;
      }
   }
}
