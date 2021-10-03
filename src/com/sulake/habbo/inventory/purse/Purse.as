package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1928:int = 0;
      
      private var var_1929:int = 0;
      
      private var var_2831:int = 0;
      
      private var var_2832:Boolean = false;
      
      private var var_2590:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1928 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1929 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2831 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2832 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2590 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1928;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1929;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2831;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2832;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2590;
      }
   }
}
