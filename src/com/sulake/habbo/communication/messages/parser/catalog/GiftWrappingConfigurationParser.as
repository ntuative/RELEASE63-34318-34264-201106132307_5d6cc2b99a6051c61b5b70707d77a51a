package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2740:Boolean;
      
      private var var_2739:int;
      
      private var var_1909:Array;
      
      private var var_816:Array;
      
      private var var_817:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2740;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2739;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1909;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_816;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_817;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1909 = [];
         this.var_816 = [];
         this.var_817 = [];
         this.var_2740 = param1.readBoolean();
         this.var_2739 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1909.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_816.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_817.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
