package com.sulake.habbo.friendbar.events
{
   import com.sulake.habbo.friendbar.data.FriendNotification;
   import flash.events.Event;
   
   public class NotificationEvent extends Event
   {
      
      public static const const_814:String = "FBE_NOTIFICATION_EVENT";
       
      
      public var var_2988:int;
      
      public var notification:FriendNotification;
      
      public function NotificationEvent(param1:int, param2:FriendNotification)
      {
         super(const_814);
         this.var_2988 = param1;
         this.notification = param2;
      }
   }
}
