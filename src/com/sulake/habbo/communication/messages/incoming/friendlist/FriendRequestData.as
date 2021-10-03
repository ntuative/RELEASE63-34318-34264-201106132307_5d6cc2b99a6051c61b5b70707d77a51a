package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1226:int;
      
      private var var_2703:String;
      
      private var var_2704:int;
      
      private var var_2613:String;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1226 = param1.readInteger();
         this.var_2703 = param1.readString();
         this.var_2613 = param1.readString();
         this.var_2704 = this.var_1226;
      }
      
      public function get requestId() : int
      {
         return this.var_1226;
      }
      
      public function get requesterName() : String
      {
         return this.var_2703;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2704;
      }
      
      public function get figureString() : String
      {
         return this.var_2613;
      }
   }
}
