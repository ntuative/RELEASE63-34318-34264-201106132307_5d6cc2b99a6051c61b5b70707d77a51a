package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2670:int;
      
      private var var_2671:int;
      
      private var var_2672:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2670 = param1;
         this.var_2671 = param2;
         this.var_2672 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2670,this.var_2671,this.var_2672];
      }
      
      public function dispose() : void
      {
      }
   }
}
