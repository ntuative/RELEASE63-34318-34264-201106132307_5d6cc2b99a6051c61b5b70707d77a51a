package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1322:Boolean;
      
      private var var_1323:Boolean;
      
      private var var_1629:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1322;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1323;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1629;
      }
      
      public function flush() : Boolean
      {
         this.var_1322 = false;
         this.var_1323 = false;
         this.var_1629 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1322 = param1.readBoolean();
         this.var_1323 = param1.readBoolean();
         this.var_1629 = param1.readBoolean();
         return true;
      }
   }
}
