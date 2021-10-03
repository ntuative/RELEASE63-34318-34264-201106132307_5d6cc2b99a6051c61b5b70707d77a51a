package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaqTextMessageParser implements IMessageParser
   {
       
      
      private var var_2145:int;
      
      private var var_2144:String;
      
      public function FaqTextMessageParser()
      {
         super();
      }
      
      public function get questionId() : int
      {
         return this.var_2145;
      }
      
      public function get answerText() : String
      {
         return this.var_2144;
      }
      
      public function flush() : Boolean
      {
         this.var_2145 = -1;
         this.var_2144 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2145 = param1.readInteger();
         this.var_2144 = param1.readString();
         return true;
      }
   }
}
