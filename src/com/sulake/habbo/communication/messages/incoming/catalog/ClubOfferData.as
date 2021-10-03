package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1229:int;
      
      private var var_1807:String;
      
      private var var_1808:int;
      
      private var _upgrade:Boolean;
      
      private var var_2438:Boolean;
      
      private var var_2435:int;
      
      private var var_2434:int;
      
      private var var_2433:int;
      
      private var var_2439:int;
      
      private var var_2437:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1229 = param1.readInteger();
         this.var_1807 = param1.readString();
         this.var_1808 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2438 = param1.readBoolean();
         this.var_2435 = param1.readInteger();
         this.var_2434 = param1.readInteger();
         this.var_2433 = param1.readInteger();
         this.var_2439 = param1.readInteger();
         this.var_2437 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1229;
      }
      
      public function get productCode() : String
      {
         return this.var_1807;
      }
      
      public function get price() : int
      {
         return this.var_1808;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2438;
      }
      
      public function get periods() : int
      {
         return this.var_2435;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2434;
      }
      
      public function get year() : int
      {
         return this.var_2433;
      }
      
      public function get month() : int
      {
         return this.var_2439;
      }
      
      public function get day() : int
      {
         return this.var_2437;
      }
   }
}
