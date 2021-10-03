package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2452:int;
      
      private var var_2062:String;
      
      private var var_2652:String;
      
      private var var_2656:Boolean;
      
      private var var_2654:Boolean;
      
      private var var_2653:int;
      
      private var var_2655:String;
      
      private var var_2657:String;
      
      private var var_1716:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2452 = param1.readInteger();
         this.var_2062 = param1.readString();
         this.var_2652 = param1.readString();
         this.var_2656 = param1.readBoolean();
         this.var_2654 = param1.readBoolean();
         param1.readString();
         this.var_2653 = param1.readInteger();
         this.var_2655 = param1.readString();
         this.var_2657 = param1.readString();
         this.var_1716 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2452;
      }
      
      public function get avatarName() : String
      {
         return this.var_2062;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2652;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2656;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2654;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2653;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2655;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2657;
      }
      
      public function get realName() : String
      {
         return this.var_1716;
      }
   }
}
