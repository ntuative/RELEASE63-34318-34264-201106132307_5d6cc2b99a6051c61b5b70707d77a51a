package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_441:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1149:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1182:String = "RWOCM_PIXELS";
      
      public static const const_1354:String = "RWOCM_CREDITS";
       
      
      private var var_2396:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_441);
         this.var_2396 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2396;
      }
   }
}
