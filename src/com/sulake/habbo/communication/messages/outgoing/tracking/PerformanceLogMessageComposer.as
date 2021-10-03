package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2251:int = 0;
      
      private var var_1590:String = "";
      
      private var var_1994:String = "";
      
      private var var_2252:String = "";
      
      private var var_2250:String = "";
      
      private var var_1697:int = 0;
      
      private var var_2254:int = 0;
      
      private var var_2249:int = 0;
      
      private var var_1592:int = 0;
      
      private var var_2253:int = 0;
      
      private var var_1589:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2251 = param1;
         this.var_1590 = param2;
         this.var_1994 = param3;
         this.var_2252 = param4;
         this.var_2250 = param5;
         if(param6)
         {
            this.var_1697 = 1;
         }
         else
         {
            this.var_1697 = 0;
         }
         this.var_2254 = param7;
         this.var_2249 = param8;
         this.var_1592 = param9;
         this.var_2253 = param10;
         this.var_1589 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2251,this.var_1590,this.var_1994,this.var_2252,this.var_2250,this.var_1697,this.var_2254,this.var_2249,this.var_1592,this.var_2253,this.var_1589];
      }
   }
}
