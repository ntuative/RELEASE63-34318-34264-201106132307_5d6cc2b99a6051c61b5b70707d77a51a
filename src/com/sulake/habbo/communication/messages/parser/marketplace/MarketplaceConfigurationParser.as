package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1577:Boolean;
      
      private var var_2509:int;
      
      private var var_1872:int;
      
      private var var_1871:int;
      
      private var var_2510:int;
      
      private var var_2511:int;
      
      private var var_2508:int;
      
      private var var_2486:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1577;
      }
      
      public function get commission() : int
      {
         return this.var_2509;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1872;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1871;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2511;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2510;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2508;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2486;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1577 = param1.readBoolean();
         this.var_2509 = param1.readInteger();
         this.var_1872 = param1.readInteger();
         this.var_1871 = param1.readInteger();
         this.var_2511 = param1.readInteger();
         this.var_2510 = param1.readInteger();
         this.var_2508 = param1.readInteger();
         this.var_2486 = param1.readInteger();
         return true;
      }
   }
}
