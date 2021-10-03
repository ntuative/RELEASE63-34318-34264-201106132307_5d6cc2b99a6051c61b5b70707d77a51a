package com.sulake.habbo.communication.messages.parser.facebook
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaceBookAppRequestMessageParser implements IMessageParser
   {
       
      
      private var var_1773:String;
      
      private var _data:String;
      
      private var var_1772:String;
      
      private var var_2357:int;
      
      public function FaceBookAppRequestMessageParser()
      {
         super();
      }
      
      public function get authToken() : String
      {
         return this.var_1773;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get userFilter() : String
      {
         return this.var_1772;
      }
      
      public function get senderReference() : int
      {
         return this.var_2357;
      }
      
      public function flush() : Boolean
      {
         var _loc1_:* = null;
         this.var_1772 = null;
         this.var_1773 = this._data = _loc1_;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1773 = param1.readString();
         this._data = param1.readString();
         this.var_1772 = param1.readString();
         this.var_2357 = param1.readInteger();
         return true;
      }
   }
}
