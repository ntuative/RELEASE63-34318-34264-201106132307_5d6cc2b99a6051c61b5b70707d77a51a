package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1781:int;
      
      private var var_2677:String;
      
      private var var_1233:int;
      
      private var var_1295:int;
      
      private var var_1737:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1781 = param1.readInteger();
         this.var_2677 = param1.readString();
         this.var_1233 = param1.readInteger();
         this.var_1295 = param1.readInteger();
         this.var_1737 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1781;
      }
      
      public function get petName() : String
      {
         return this.var_2677;
      }
      
      public function get level() : int
      {
         return this.var_1233;
      }
      
      public function get petType() : int
      {
         return this.var_1295;
      }
      
      public function get breed() : int
      {
         return this.var_1737;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
