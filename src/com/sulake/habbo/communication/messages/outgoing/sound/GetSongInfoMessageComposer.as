package com.sulake.habbo.communication.messages.outgoing.sound
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class GetSongInfoMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_35:Array;
      
      public function GetSongInfoMessageComposer(param1:Array)
      {
         var _loc2_:int = 0;
         this.var_35 = new Array();
         super();
         this.var_35.push(param1.length);
         for each(_loc2_ in param1)
         {
            this.var_35.push(_loc2_);
         }
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
