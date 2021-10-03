package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2478:int;
      
      private var var_1646:String;
      
      private var var_2758:int;
      
      private var var_2757:int;
      
      private var _category:int;
      
      private var var_2224:String;
      
      private var var_1616:int;
      
      private var var_2754:int;
      
      private var var_2753:int;
      
      private var var_2752:int;
      
      private var var_2756:int;
      
      private var var_2755:Boolean;
      
      private var var_3067:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2478 = param1;
         this.var_1646 = param2;
         this.var_2758 = param3;
         this.var_2757 = param4;
         this._category = param5;
         this.var_2224 = param6;
         this.var_1616 = param7;
         this.var_2754 = param8;
         this.var_2753 = param9;
         this.var_2752 = param10;
         this.var_2756 = param11;
         this.var_2755 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2478;
      }
      
      public function get itemType() : String
      {
         return this.var_1646;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2758;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2757;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2224;
      }
      
      public function get extra() : int
      {
         return this.var_1616;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2754;
      }
      
      public function get creationDay() : int
      {
         return this.var_2753;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2752;
      }
      
      public function get creationYear() : int
      {
         return this.var_2756;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2755;
      }
      
      public function get songID() : int
      {
         return this.var_1616;
      }
   }
}
