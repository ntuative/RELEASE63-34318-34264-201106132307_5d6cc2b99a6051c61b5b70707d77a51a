package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_397:int;
      
      private var var_2566:int;
      
      private var var_2688:Boolean;
      
      private var var_2288:int;
      
      private var _ownerName:String;
      
      private var var_134:RoomData;
      
      private var var_759:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_397 = param1.readInteger();
         this.var_2566 = param1.readInteger();
         this.var_2688 = param1.readBoolean();
         this.var_2288 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_134 = new RoomData(param1);
         this.var_759 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_134 != null)
         {
            this.var_134.dispose();
            this.var_134 = null;
         }
         if(this.var_759 != null)
         {
            this.var_759.dispose();
            this.var_759 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_397;
      }
      
      public function get userCount() : int
      {
         return this.var_2566;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2688;
      }
      
      public function get ownerId() : int
      {
         return this.var_2288;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_134;
      }
      
      public function get event() : RoomData
      {
         return this.var_759;
      }
   }
}
