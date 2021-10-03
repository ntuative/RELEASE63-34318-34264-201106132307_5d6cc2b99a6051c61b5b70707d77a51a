package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1233:int;
      
      private var var_1762:int;
      
      private var var_2764:int;
      
      private var var_2079:int;
      
      private var var_1640:int;
      
      private var var_340:int;
      
      private var var_2941:String = "";
      
      private var var_2943:String = "";
      
      private var var_2942:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1233 = param1.readInteger();
         this.var_340 = param1.readInteger();
         this.var_2941 = param1.readString();
         this.var_1762 = param1.readInteger();
         this.var_2764 = param1.readInteger();
         this.var_2079 = param1.readInteger();
         this.var_1640 = param1.readInteger();
         this.var_2942 = param1.readInteger();
         this.var_2943 = param1.readString();
         this._category = param1.readString();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1233;
      }
      
      public function get points() : int
      {
         return this.var_1762;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2764;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2079;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1640;
      }
      
      public function get badgeId() : int
      {
         return this.var_340;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2941;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_2943;
      }
      
      public function get achievementID() : int
      {
         return this.var_2942;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
