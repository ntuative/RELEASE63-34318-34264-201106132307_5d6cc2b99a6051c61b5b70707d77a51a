package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1761:Boolean;
      
      private var var_2345:int;
      
      private var _owner:Boolean;
      
      private var var_1163:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get privateRoom() : Boolean
      {
         return this.var_1761;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2345;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1163;
      }
      
      public function get owner() : Boolean
      {
         return this._owner;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1163 != null)
         {
            this.var_1163.dispose();
            this.var_1163 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1761 = param1.readBoolean();
         if(this.var_1761)
         {
            this.var_2345 = param1.readInteger();
            this._owner = param1.readBoolean();
         }
         else
         {
            this.var_1163 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
