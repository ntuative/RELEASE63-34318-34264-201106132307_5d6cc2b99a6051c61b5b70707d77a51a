package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1229:int;
      
      private var _furniId:int;
      
      private var var_2464:int;
      
      private var var_2224:String;
      
      private var var_1808:int;
      
      private var var_422:int;
      
      private var var_2465:int = -1;
      
      private var var_2256:int;
      
      private var var_1983:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this.var_1229 = param1;
         this._furniId = param2;
         this.var_2464 = param3;
         this.var_2224 = param4;
         this.var_1808 = param5;
         this.var_422 = param6;
         this.var_2465 = param7;
         this.var_2256 = param8;
         this.var_1983 = param9;
      }
      
      public function get offerId() : int
      {
         return this.var_1229;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2464;
      }
      
      public function get stuffData() : String
      {
         return this.var_2224;
      }
      
      public function get price() : int
      {
         return this.var_1808;
      }
      
      public function get status() : int
      {
         return this.var_422;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2465;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2256;
      }
      
      public function get offerCount() : int
      {
         return this.var_1983;
      }
   }
}
