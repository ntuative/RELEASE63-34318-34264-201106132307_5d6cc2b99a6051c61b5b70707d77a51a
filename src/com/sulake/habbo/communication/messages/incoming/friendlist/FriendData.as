package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_1036:int;
      
      private var var_874:Boolean;
      
      private var var_1877:Boolean;
      
      private var var_677:String;
      
      private var var_1578:int;
      
      private var var_1717:String;
      
      private var var_1718:String;
      
      private var var_1716:String;
      
      private var var_2696:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_1036 = param1.readInteger();
         this.var_874 = param1.readBoolean();
         this.var_1877 = param1.readBoolean();
         this.var_677 = param1.readString();
         this.var_1578 = param1.readInteger();
         this.var_1717 = param1.readString();
         this.var_1718 = param1.readString();
         this.var_1716 = param1.readString();
         this.var_2696 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_1036;
      }
      
      public function get online() : Boolean
      {
         return this.var_874;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1877;
      }
      
      public function get figure() : String
      {
         return this.var_677;
      }
      
      public function get categoryId() : int
      {
         return this.var_1578;
      }
      
      public function get motto() : String
      {
         return this.var_1717;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1718;
      }
      
      public function get realName() : String
      {
         return this.var_1716;
      }
      
      public function get facebookId() : String
      {
         return this.var_2696;
      }
   }
}
