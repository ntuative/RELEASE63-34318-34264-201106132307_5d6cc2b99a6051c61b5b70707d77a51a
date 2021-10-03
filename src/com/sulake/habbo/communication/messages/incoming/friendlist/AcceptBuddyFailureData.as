package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AcceptBuddyFailureData
   {
       
      
      private var var_1089:String;
      
      private var var_1742:int;
      
      public function AcceptBuddyFailureData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1089 = param1.readString();
         this.var_1742 = param1.readInteger();
      }
      
      public function get senderName() : String
      {
         return this.var_1089;
      }
      
      public function get errorCode() : int
      {
         return this.var_1742;
      }
   }
}
