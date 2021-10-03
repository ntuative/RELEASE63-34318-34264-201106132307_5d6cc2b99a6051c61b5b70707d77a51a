package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_677:String;
      
      private var var_2772:String;
      
      private var var_1036:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_677 = param1;
         this.var_1036 = param2;
         this.var_2772 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_677;
      }
      
      public function get race() : String
      {
         return this.var_2772;
      }
      
      public function get gender() : String
      {
         return this.var_1036;
      }
   }
}
