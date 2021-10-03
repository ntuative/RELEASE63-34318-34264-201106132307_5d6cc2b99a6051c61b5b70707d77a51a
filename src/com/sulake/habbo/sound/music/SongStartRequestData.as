package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1799:int;
      
      private var var_2012:Number;
      
      private var var_2748:Number;
      
      private var var_2751:int;
      
      private var var_2750:Number;
      
      private var var_2749:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1799 = param1;
         this.var_2012 = param2;
         this.var_2748 = param3;
         this.var_2750 = param4;
         this.var_2749 = param5;
         this.var_2751 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1799;
      }
      
      public function get startPos() : Number
      {
         if(this.var_2012 < 0)
         {
            return 0;
         }
         return this.var_2012 + (getTimer() - this.var_2751) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2748;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2750;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2749;
      }
   }
}
