package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_1004:int = 1;
      
      public static const const_983:int = 2;
      
      public static const const_735:int = 3;
      
      public static const const_1161:int = 4;
      
      public static const const_725:int = 5;
      
      public static const const_1146:int = 6;
       
      
      private var _type:int;
      
      private var var_1338:int;
      
      private var var_2300:String;
      
      private var var_2641:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1338 = param2;
         this.var_2300 = param3;
         this.var_2641 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2300;
      }
      
      public function get time() : String
      {
         return this.var_2641;
      }
      
      public function get senderId() : int
      {
         return this.var_1338;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
