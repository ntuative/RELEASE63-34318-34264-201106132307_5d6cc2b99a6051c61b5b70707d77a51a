package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1800:int;
      
      private var var_2412:int;
      
      private var var_1609:int;
      
      private var var_2411:int;
      
      private var var_134:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1800 = param1.readInteger();
         this.var_2412 = param1.readInteger();
         this.var_1609 = param1.readInteger();
         this.var_2411 = param1.readInteger();
         this.var_134 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1800);
      }
      
      public function get callId() : int
      {
         return this.var_1800;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2412;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1609;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2411;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_134;
      }
   }
}
