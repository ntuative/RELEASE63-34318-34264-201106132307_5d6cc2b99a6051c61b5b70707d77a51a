package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_165:String = "ROE_MOUSE_CLICK";
      
      public static const const_182:String = "ROE_MOUSE_ENTER";
      
      public static const const_620:String = "ROE_MOUSE_MOVE";
      
      public static const const_194:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2185:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_608:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1705:String = "";
      
      private var var_2318:Boolean;
      
      private var var_2319:Boolean;
      
      private var var_2321:Boolean;
      
      private var var_2320:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1705 = param2;
         this.var_2318 = param5;
         this.var_2319 = param6;
         this.var_2321 = param7;
         this.var_2320 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1705;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2318;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2319;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2321;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2320;
      }
   }
}
