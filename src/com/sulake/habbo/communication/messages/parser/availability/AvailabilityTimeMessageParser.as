package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityTimeMessageParser implements IMessageParser
   {
       
      
      private var var_1477:Boolean;
      
      private var var_1788:int;
      
      public function AvailabilityTimeMessageParser()
      {
         super();
      }
      
      public function get isOpen() : Boolean
      {
         return this.var_1477;
      }
      
      public function get minutesUntilChange() : int
      {
         return this.var_1788;
      }
      
      public function flush() : Boolean
      {
         this.var_1477 = false;
         this.var_1788 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1477 = param1.readInteger() > 0;
         this.var_1788 = param1.readInteger();
         return true;
      }
   }
}
