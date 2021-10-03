package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2808:int;
      
      private var var_2805:int;
      
      private var var_874:Boolean;
      
      private var var_2807:int;
      
      private var var_2810:int;
      
      private var var_2809:int;
      
      private var var_2806:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2808 = param1.readInteger();
         this.var_2805 = param1.readInteger();
         this.var_874 = param1.readBoolean();
         this.var_2807 = param1.readInteger();
         this.var_2810 = param1.readInteger();
         this.var_2809 = param1.readInteger();
         this.var_2806 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2808;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2805;
      }
      
      public function get online() : Boolean
      {
         return this.var_874;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2807;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2810;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2809;
      }
      
      public function get banCount() : int
      {
         return this.var_2806;
      }
   }
}
