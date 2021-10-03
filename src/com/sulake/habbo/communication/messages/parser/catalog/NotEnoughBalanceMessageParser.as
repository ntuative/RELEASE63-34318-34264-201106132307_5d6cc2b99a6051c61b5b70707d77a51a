package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_2042:int = 0;
      
      private var var_2041:int = 0;
      
      private var var_2056:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_2042;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_2041;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2056;
      }
      
      public function flush() : Boolean
      {
         this.var_2042 = 0;
         this.var_2041 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2042 = param1.readInteger();
         this.var_2041 = param1.readInteger();
         this.var_2056 = param1.readInteger();
         return true;
      }
   }
}
