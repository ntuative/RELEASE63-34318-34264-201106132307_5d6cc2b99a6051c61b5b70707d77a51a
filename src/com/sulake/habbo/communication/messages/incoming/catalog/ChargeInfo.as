package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2917:int;
      
      private var var_2919:int;
      
      private var var_1318:int;
      
      private var var_1317:int;
      
      private var var_2056:int;
      
      private var var_2918:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2917 = param1.readInteger();
         this.var_2919 = param1.readInteger();
         this.var_1318 = param1.readInteger();
         this.var_1317 = param1.readInteger();
         this.var_2056 = param1.readInteger();
         this.var_2918 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2917;
      }
      
      public function get charges() : int
      {
         return this.var_2919;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1318;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1317;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2918;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2056;
      }
   }
}
