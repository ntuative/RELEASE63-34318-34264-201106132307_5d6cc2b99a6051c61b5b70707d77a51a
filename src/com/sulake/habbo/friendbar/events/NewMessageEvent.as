package com.sulake.habbo.friendbar.events
{
   import flash.events.Event;
   
   public class NewMessageEvent extends Event
   {
      
      public static const const_737:String = "FBE_MESSAGE";
       
      
      public var notify:Boolean;
      
      public var senderId:int;
      
      public function NewMessageEvent(param1:Boolean, param2:int)
      {
         super(const_737,false,false);
         this.notify = param1;
         this.senderId = param2;
      }
   }
}
