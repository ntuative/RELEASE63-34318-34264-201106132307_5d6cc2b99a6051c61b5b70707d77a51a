package com.sulake.habbo.communication.messages.outgoing.marketplace
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class MakeOfferMessageComposer implements IMessageComposer, IDisposable
   {
      
      public static const const_2078:int = 1;
      
      public static const const_2262:int = 2;
       
      
      private var var_35:Array;
      
      public function MakeOfferMessageComposer(param1:int, param2:int, param3:int)
      {
         this.var_35 = new Array();
         super();
         this.var_35.push(param1);
         this.var_35.push(param2);
         this.var_35.push(param3);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_35;
      }
      
      public function dispose() : void
      {
         this.var_35 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
