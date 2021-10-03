package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendbar.data.FriendNotification;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.view.tabs.tokens.AchievementToken;
   import com.sulake.habbo.friendbar.view.tabs.tokens.MessengerToken;
   import com.sulake.habbo.friendbar.view.tabs.tokens.QuestToken;
   import com.sulake.habbo.friendbar.view.tabs.tokens.RoomEventToken;
   import com.sulake.habbo.friendbar.view.tabs.tokens.Token;
   import com.sulake.habbo.tracking.HabboTracking;
   import flash.display.BitmapData;
   import flash.utils.getQualifiedClassName;
   
   public class FriendEntityTab extends Tab
   {
      
      private static const const_1585:String = "entity_xml";
      
      private static const const_1586:String = "facebook_piece_xml";
      
      private static const const_1587:String = "controls_piece_xml";
      
      protected static const PIECES:String = "pieces";
      
      protected static const const_377:String = "icons";
      
      protected static const const_461:String = "header";
      
      protected static const const_1387:String = "facebook";
      
      protected static const const_1386:String = "controls";
      
      protected static const const_309:String = "canvas";
      
      protected static const const_674:String = "name";
      
      protected static const const_1120:String = "btn_message";
      
      protected static const const_1016:String = "icon_message";
      
      protected static const VISIT:String = "btn_visit";
      
      protected static const ICON:String = "icon";
      
      protected static const const_1015:String = "label";
      
      protected static const const_495:String = "notification";
      
      private static const const_69:uint = 10338138;
      
      private static const const_1043:uint = 13891476;
      
      private static const POOL:Vector.<FriendEntityTab> = new Vector.<FriendEntityTab>();
      
      private static const const_471:Vector.<IWindowContainer> = new Vector.<IWindowContainer>();
       
      
      protected var var_144:IFriendEntity;
      
      protected var var_145:Vector.<Token>;
      
      public function FriendEntityTab()
      {
         super();
      }
      
      public static function allocate(param1:IFriendEntity) : FriendEntityTab
      {
         var _loc3_:* = null;
         var _loc2_:FriendEntityTab = false ? POOL.pop() : new FriendEntityTab();
         _loc2_.var_162 = false;
         _loc2_.friend = param1;
         if(param1.notifications.length > 0)
         {
            for each(_loc3_ in param1.notifications)
            {
               _loc2_.addNotificationToken(_loc3_,false);
            }
         }
         return _loc2_;
      }
      
      private static function purgeEntityPieces(param1:IWindowContainer) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:IItemListWindow = IItemListWindow(param1.getChildByName(PIECES));
         _loc3_ = _loc2_.getListItemByName(const_1387) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         _loc3_ = _loc2_.getListItemByName(const_1386) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         var _loc4_:* = [];
         _loc2_.groupListItemsWithTag(const_495,_loc4_);
         if(_loc4_.length > 0)
         {
            for each(_loc5_ in _loc4_)
            {
               _loc5_.parent = null;
            }
         }
         param1.height = name_1;
         param1.y = 0;
      }
      
      public function set friend(param1:IFriendEntity) : void
      {
         this.var_144 = param1;
         this.refresh();
      }
      
      public function get friend() : IFriendEntity
      {
         return this.var_144;
      }
      
      override public function recycle() : void
      {
         if(!disposed)
         {
            if(!var_162)
            {
               if(_window)
               {
                  this.releaseFriendTabWindow(_window);
                  _window = null;
               }
               if(this.var_145)
               {
                  while(this.var_145.length > 0)
                  {
                     this.var_145.pop().dispose();
                  }
                  this.var_145 = null;
               }
               this.var_144 = null;
               var_162 = true;
               POOL.push(this);
            }
         }
      }
      
      override public function select(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(!selected)
         {
            _loc2_ = IItemListWindow(window.getChildByName(PIECES));
            _loc5_ = false;
            if(this.friend.realName != null && this.friend.realName != "")
            {
               _loc3_ = WINDOWING.buildFromXML(ASSETS.getAssetByName(const_1586).content as XML) as IWindowContainer;
               _loc3_.name = const_1387;
               _loc6_ = _loc3_.getChildByName(const_674) as ITextWindow;
               _loc6_.caption = this.friend.realName;
               if(!_loc6_.wordWrap)
               {
                  var_2169.crop(_loc6_);
               }
               _loc4_ = IBitmapWrapperWindow(_loc3_.getChildByName(ICON));
               _loc4_.bitmap = ASSETS.getAssetByName(_loc4_.bitmapAssetName).content as BitmapData;
               _loc4_.width = _loc4_.bitmap.width;
               _loc4_.height = _loc4_.bitmap.height;
               _loc2_.addListItem(_loc3_);
               _loc5_ = true;
            }
            if(this.var_145)
            {
               for each(_loc7_ in this.var_145)
               {
                  _loc2_.addListItem(_loc7_.windowElement);
                  _loc5_ = true;
               }
            }
            if(this.friend.online)
            {
               _loc3_ = WINDOWING.buildFromXML(ASSETS.getAssetByName(const_1587).content as XML) as IWindowContainer;
               _loc3_.name = const_1386;
               _loc8_ = _loc3_.getChildByName(const_1120);
               if(_loc8_)
               {
                  _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
               }
               _loc8_ = _loc3_.getChildByName(VISIT);
               if(_loc8_)
               {
                  if(this.friend.allowFollow)
                  {
                     _loc8_.visible = true;
                     _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
                  }
                  else
                  {
                     _loc8_.visible = false;
                  }
               }
               _loc2_.addListItem(_loc3_);
               _loc5_ = true;
            }
            if(_loc5_)
            {
               window.height = _loc2_.height;
            }
            window.y = name_1 - 0;
            super.select(param1);
            if(param1)
            {
               HabboTracking.getInstance().trackEventLog("FriendBar","","clicked",this.friend.logEventId > 0 ? String(this.friend.logEventId) : "");
               this.friend.logEventId = -1;
            }
         }
      }
      
      override public function deselect(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(selected)
         {
            if(_window)
            {
               purgeEntityPieces(_window);
               if(this.var_145)
               {
                  _loc2_ = this.var_145.length - 1;
                  while(_loc2_ > -1)
                  {
                     _loc3_ = this.var_145[_loc2_];
                     if(_loc3_.viewOnce)
                     {
                        this.removeNotificationToken(_loc3_.typeCode,param1);
                     }
                     _loc2_--;
                  }
               }
            }
            super.deselect(param1);
         }
      }
      
      override protected function expose() : void
      {
         super.expose();
         _window.color = !!exposed ? uint(const_1043) : uint(const_69);
         ITextWindow(_window.findChildByTag(const_1015)).underline = exposed;
      }
      
      override protected function conceal() : void
      {
         super.conceal();
         _window.color = !!exposed ? uint(const_1043) : uint(const_69);
         ITextWindow(_window.findChildByTag(const_1015)).underline = exposed;
      }
      
      protected function refresh() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_window)
         {
            _window = this.allocateFriendTabWindow();
         }
         if(this.var_144)
         {
            _window.id = this.var_144.id;
            _loc1_ = IItemListWindow(_window.getChildByName(PIECES)).getListItemByName(const_461) as IWindowContainer;
            _loc1_.findChildByName(const_674).caption = this.var_144.name;
            var_2169.crop(_loc1_.getChildByName(const_674) as ITextWindow);
            _loc2_ = IBitmapWrapperWindow(_loc1_.findChildByName(const_309));
            _loc2_.bitmap = var_593.getAvatarFaceBitmap(this.var_144.figure);
            _loc2_.width = _loc2_.bitmap.width;
            _loc2_.height = _loc2_.bitmap.height;
         }
      }
      
      private function allocateFriendTabWindow() : IWindowContainer
      {
         var _loc1_:IWindowContainer = false ? const_471.pop() : WINDOWING.buildFromXML(ASSETS.getAssetByName(const_1585).content as XML) as IWindowContainer;
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(_loc1_.findChildByName(const_309));
         var _loc3_:IRegionWindow = IRegionWindow(_loc1_.findChildByName(const_461));
         var _loc4_:IWindow = _loc1_.findChildByName(const_377);
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = name_2;
         _loc1_.height = name_1;
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc1_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc3_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc4_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc2_.disposesBitmap = true;
         return _loc1_;
      }
      
      private function releaseFriendTabWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            param1.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            _loc2_ = IRegionWindow(param1.findChildByName(const_461));
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            _loc2_.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            _loc3_ = param1.findChildByName(const_377);
            _loc3_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            _loc3_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseClick);
            _loc3_.removeEventListener(WindowMouseEvent.const_25,onMouseClick);
            param1.width = name_2;
            param1.height = name_1;
            param1.color = const_69;
            _loc4_ = IBitmapWrapperWindow(param1.findChildByName(const_309));
            _loc4_.bitmap = null;
            ITextWindow(param1.findChildByTag("label")).underline = false;
            purgeEntityPieces(param1);
            if(const_471.indexOf(param1) == -1)
            {
               const_471.push(param1);
            }
         }
      }
      
      private function onButtonClick(param1:WindowMouseEvent) : void
      {
         if(!disposed && !recycled)
         {
            switch(param1.window.name)
            {
               case const_1120:
               case const_1016:
                  this.removeNotificationToken(FriendNotification.const_401,true);
                  if(var_303 && this.var_144)
                  {
                     var_303.startConversation(this.var_144.id);
                     this.deselect(true);
                     if(param1.window.name == const_1016)
                     {
                        var_593.setMessengerIconNotify(false);
                     }
                  }
                  break;
               case VISIT:
                  if(var_303 && this.var_144)
                  {
                     var_303.followToRoom(this.var_144.id);
                     this.deselect(true);
                  }
            }
         }
      }
      
      public function addNotificationToken(param1:FriendNotification, param2:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.removeNotificationToken(param1.typeCode,false);
         if(!this.var_145)
         {
            this.var_145 = new Vector.<Token>();
         }
         var _loc3_:Boolean = selected;
         if(_loc3_)
         {
            _loc5_ = this.var_145;
            this.var_145 = null;
            this.deselect(false);
            this.var_145 = _loc5_;
         }
         switch(param1.typeCode)
         {
            case FriendNotification.const_1332:
               _loc4_ = new RoomEventToken(this.friend,param1,param2);
               _loc4_.iconElement.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
               break;
            case FriendNotification.TYPE_ACHIEVEMENT:
               _loc4_ = new AchievementToken(this.friend,param1,param2,var_2202);
               _loc4_.iconElement.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
               break;
            case FriendNotification.const_1224:
               _loc4_ = new QuestToken(this.friend,param1,param2,var_2202);
               break;
            case FriendNotification.const_401:
               _loc4_ = new MessengerToken(this.friend,param1,param2);
               _loc4_.iconElement.name = const_1016;
               _loc4_.iconElement.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
               break;
            default:
               throw new Error("Unknown friend notification type: " + param1.typeCode + "!");
         }
         if(_loc4_)
         {
            this.var_145.push(_loc4_);
            IItemListWindow(_window.findChildByName(const_377)).addListItemAt(_loc4_.iconElement,0);
         }
         if(_loc3_)
         {
            this.select(false);
         }
      }
      
      public function removeNotificationToken(param1:int, param2:Boolean) : void
      {
         var _loc4_:* = null;
         if(!this.var_145)
         {
            return;
         }
         var _loc3_:int = this.var_145.length - 1;
         while(_loc3_ > -1)
         {
            _loc4_ = this.var_145[_loc3_];
            if(_loc4_.typeCode == param1)
            {
               this.var_145.splice(_loc3_,1);
               if(param2)
               {
                  this.var_144.notifications.splice(this.var_144.notifications.indexOf(_loc4_.notification),1);
               }
               _loc4_.dispose();
               return;
            }
            _loc3_--;
         }
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + " " + this.var_144.name;
      }
   }
}
