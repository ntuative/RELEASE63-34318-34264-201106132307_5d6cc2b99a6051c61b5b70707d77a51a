package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_2158:int = 0;
      
      private var var_1550:Dictionary;
      
      private var var_1928:int = 0;
      
      private var var_1929:int = 0;
      
      private var var_2590:Boolean = false;
      
      private var var_2591:int = 0;
      
      private var var_2592:int = 0;
      
      public function Purse()
      {
         this.var_1550 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2158;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2158 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1928;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1928 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1929;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1929 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1928 > 0 || this.var_1929 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2590;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2590 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2591;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2591 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2592;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2592 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1550;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1550 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1550[param1];
      }
   }
}
