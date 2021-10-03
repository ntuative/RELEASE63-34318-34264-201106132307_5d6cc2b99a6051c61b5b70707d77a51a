package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2401:int;
      
      private var var_1646:String;
      
      private var _objId:int;
      
      private var var_2020:int;
      
      private var _category:int;
      
      private var var_2224:String;
      
      private var var_2404:Boolean;
      
      private var var_2400:Boolean;
      
      private var var_2402:Boolean;
      
      private var var_2399:Boolean;
      
      private var var_2403:int;
      
      private var var_1616:int;
      
      private var var_1972:String = "";
      
      private var var_1799:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2401 = param1;
         this.var_1646 = param2;
         this._objId = param3;
         this.var_2020 = param4;
         this._category = param5;
         this.var_2224 = param6;
         this.var_2404 = param7;
         this.var_2400 = param8;
         this.var_2402 = param9;
         this.var_2399 = param10;
         this.var_2403 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1972 = param1;
         this.var_1616 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2401;
      }
      
      public function get itemType() : String
      {
         return this.var_1646;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_2020;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2224;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2404;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2400;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2402;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2399;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2403;
      }
      
      public function get slotId() : String
      {
         return this.var_1972;
      }
      
      public function get songId() : int
      {
         return this.var_1799;
      }
      
      public function get extra() : int
      {
         return this.var_1616;
      }
   }
}
