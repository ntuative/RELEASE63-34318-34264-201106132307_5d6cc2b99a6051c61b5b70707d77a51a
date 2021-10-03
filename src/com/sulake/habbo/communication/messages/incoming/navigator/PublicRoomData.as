package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2364:String;
      
      private var var_2368:int;
      
      private var var_2366:int;
      
      private var var_2365:String;
      
      private var var_2367:int;
      
      private var var_2006:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2364 = param1.readString();
         this.var_2368 = param1.readInteger();
         this.var_2366 = param1.readInteger();
         this.var_2365 = param1.readString();
         this.var_2367 = param1.readInteger();
         this.var_2006 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2364;
      }
      
      public function get unitPort() : int
      {
         return this.var_2368;
      }
      
      public function get worldId() : int
      {
         return this.var_2366;
      }
      
      public function get castLibs() : String
      {
         return this.var_2365;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2367;
      }
      
      public function get nodeId() : int
      {
         return this.var_2006;
      }
   }
}
