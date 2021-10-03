package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.RoomSessionDanceEvent;
   import com.sulake.habbo.session.events.RoomSessionUserDataUpdateEvent;
   import com.sulake.habbo.session.events.UserNameUpdateEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
   import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.ui.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserDataUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
   import flash.events.Event;
   
   public class AvatarInfoWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _widget:AvatarInfoWidget;
      
      public function AvatarInfoWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function set widget(param1:AvatarInfoWidget) : void
      {
         this._widget = param1;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this._container)
            {
               this._container.toolbar.events.removeEventListener(HabboToolbarEvent.const_49,this.onToolbarClicked);
               this._container.sessionDataManager.events.removeEventListener(UserNameUpdateEvent.const_848,this.onUserNameUpdate);
               this._container = null;
            }
            this._widget = null;
            this._disposed = true;
         }
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_132;
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return this._container;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return !!this._container ? this._container.roomEngine : null;
      }
      
      public function get roomSession() : IRoomSession
      {
         return !!this._container ? this._container.roomSession : null;
      }
      
      public function get friendList() : IHabboFriendList
      {
         return !!this._container ? this._container.friendList : null;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         if(param1)
         {
            this._container = param1;
            this._container.toolbar.events.addEventListener(HabboToolbarEvent.const_49,this.onToolbarClicked);
            this._container.sessionDataManager.events.addEventListener(UserNameUpdateEvent.const_848,this.onUserNameUpdate);
         }
      }
      
      private function onToolbarClicked(param1:HabboToolbarEvent) : void
      {
         if(param1.iconId == HabboToolbarIconEnum.MEMENU)
         {
            this.dispatchOwnAvatarInfo();
         }
      }
      
      private function onUserNameUpdate(param1:UserNameUpdateEvent) : void
      {
         this._widget.close();
      }
      
      private function dispatchOwnAvatarInfo() : void
      {
         var _loc1_:int = this._container.sessionDataManager.userId;
         var _loc2_:String = this._container.sessionDataManager.userName;
         var _loc3_:* = !this._container.habboHelp.hasChangedName();
         var _loc4_:IUserData = this._container.roomSession.userDataManager.getUserData(_loc1_);
         if(_loc4_)
         {
            this._container.events.dispatchEvent(new RoomWidgetAvatarInfoEvent(_loc1_,_loc2_,_loc4_.id,_loc3_));
         }
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetRoomObjectMessage.const_806);
         _loc1_.push(RoomWidgetUserActionMessage.const_641);
         _loc1_.push(RoomWidgetUserActionMessage.const_260);
         return _loc1_;
      }
      
      public function getProcessedEvents() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomSessionUserDataUpdateEvent.const_123);
         _loc1_.push(RoomSessionDanceEvent.const_170);
         return _loc1_;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         if(!param1)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetRoomObjectMessage.const_806:
               this.dispatchOwnAvatarInfo();
               break;
            case RoomWidgetUserActionMessage.const_641:
               this._container.habboHelp.startNameChange();
               break;
            case RoomWidgetUserActionMessage.const_260:
               this._widget.handlePetInfo = false;
         }
         return null;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         switch(param1.type)
         {
            case RoomSessionUserDataUpdateEvent.const_123:
               this._container.events.dispatchEvent(new RoomWidgetUserDataUpdateEvent());
               break;
            case RoomSessionDanceEvent.const_170:
               _loc2_ = param1 as RoomSessionDanceEvent;
               if(_loc2_ && this._widget && this.container && this.container.roomSession && this.container.roomSession.userDataManager)
               {
                  _loc3_ = this.container.roomSession.userDataManager.getUserData(this.container.sessionDataManager.userId);
                  if(_loc3_ && _loc2_.userId == _loc3_.id)
                  {
                     this._widget.isDancing = _loc2_.danceStyle != 0;
                  }
               }
         }
      }
      
      public function update() : void
      {
      }
   }
}
