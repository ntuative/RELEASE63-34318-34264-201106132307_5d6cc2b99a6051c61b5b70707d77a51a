package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1742:int;
      
      private var var_2107:int;
      
      private var var_2106:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2107 = param1.readInteger();
         this.var_1742 = param1.readInteger();
         this.var_2106 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1742 = 0;
         this.var_2107 = 0;
         this.var_2106 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1742;
      }
      
      public function get messageId() : int
      {
         return this.var_2107;
      }
      
      public function get timestamp() : String
      {
         return this.var_2106;
      }
   }
}
