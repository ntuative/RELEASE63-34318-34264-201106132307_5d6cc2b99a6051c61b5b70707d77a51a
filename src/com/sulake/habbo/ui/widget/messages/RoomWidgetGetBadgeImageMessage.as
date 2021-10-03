package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_930:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_340:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_930);
         this.var_340 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_340;
      }
   }
}
