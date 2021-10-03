package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_917:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1854:String = "inventory_effects";
      
      public static const const_1171:String = "inventory_badges";
      
      public static const const_1788:String = "inventory_clothes";
      
      public static const const_1848:String = "inventory_furniture";
       
      
      private var var_2377:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_917);
         this.var_2377 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2377;
      }
   }
}
