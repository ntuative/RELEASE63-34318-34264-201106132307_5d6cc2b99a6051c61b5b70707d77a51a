package com.sulake.habbo.communication.messages.outgoing.navigator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class GetGuestRoomMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_35:Array;
      
      public function GetGuestRoomMessageComposer(param1:int, param2:Boolean, param3:Boolean)
      {
         this.var_35 = new Array();
         super();
         this.var_35.push(param1);
         this.var_35.push(!!param2 ? 1 : 0);
         this.var_35.push(!!param3 ? 1 : 0);
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
