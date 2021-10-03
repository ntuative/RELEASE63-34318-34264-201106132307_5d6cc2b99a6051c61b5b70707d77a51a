package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.data.FriendRequest;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.events.FriendRequestEvent;
   import com.sulake.habbo.friendbar.events.NewMessageEvent;
   import com.sulake.habbo.friendbar.events.NotificationEvent;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.tabs.AddFriendsTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendRequestTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendRequestsTab;
   import com.sulake.habbo.friendbar.view.tabs.ITab;
   import com.sulake.habbo.friendbar.view.tabs.Tab;
   import com.sulake.habbo.friendbar.view.tabs.tokens.Token;
   import com.sulake.habbo.friendbar.view.utils.FriendListIcon;
   import com.sulake.habbo.friendbar.view.utils.Icon;
   import com.sulake.habbo.friendbar.view.utils.MessengerIcon;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendBarView extends Component implements IHabboFriendBarView, IAvatarImageListener
   {
      
      private static const const_1485:int = 127;
      
      private static const const_466:int = 1;
      
      private static const const_1493:int = 2;
      
      private static const const_683:int = 3;
      
      private static const const_1053:int = 3;
      
      private static const const_1488:Boolean = false;
      
      private static const const_682:int = 3;
      
      private static const const_1490:String = "arrow";
      
      private static const const_1482:String = "left";
      
      private static const const_1480:String = "right";
      
      private static const const_1479:String = "bar_xml";
      
      private static const const_1486:String = "toggle_xml";
      
      private static const const_78:String = "container";
      
      private static const const_1055:String = "wrapper";
      
      private static const const_1491:String = "border";
      
      private static const const_681:String = "list";
      
      private static const const_461:String = "header";
      
      private static const const_309:String = "canvas";
      
      private static const ICON:String = "icon";
      
      private static const PIECES:String = "pieces";
      
      private static const const_1483:String = "button_left";
      
      private static const const_1492:String = "button_right";
      
      private static const const_1487:String = "button_left_page";
      
      private static const const_1484:String = "button_right_page";
      
      private static const const_1489:String = "button_left_end";
      
      private static const const_1495:String = "button_right_end";
      
      private static const const_1382:String = "button_close";
      
      private static const const_1494:String = "button_open";
      
      private static const const_1481:String = "messenger";
      
      private static const const_1054:String = "friendlist";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_793:IAvatarRenderManager;
      
      private var var_59:IHabboFriendBarData;
      
      private var var_966:IHabboLocalizationManager;
      
      private var var_51:IWindowContainer;
      
      private var var_217:IWindowContainer;
      
      private var var_90:Vector.<ITab>;
      
      private var var_1194:ITab;
      
      private var var_965:int = -1;
      
      private var _startIndex:int = 0;
      
      private var var_1497:TextCropper;
      
      private var var_540:FriendListIcon;
      
      private var var_375:MessengerIcon;
      
      private var var_1498:Boolean = true;
      
      public function HabboFriendBarView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         this.var_1497 = new TextCropper();
         this.var_90 = new Vector.<ITab>();
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboFriendBarData(),this.onFriendBarDataAvailable);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationAvailable);
      }
      
      public function setMessengerIconNotify(param1:Boolean) : void
      {
         if(this.var_375)
         {
            this.var_375.notify(param1);
         }
      }
      
      public function setFriendListIconNotify(param1:Boolean) : void
      {
         if(this.var_540)
         {
            this.var_540.notify(param1);
         }
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_375)
            {
               this.var_375.dispose();
               this.var_375 = null;
            }
            if(this.var_540)
            {
               this.var_540.dispose();
               this.var_540 = null;
            }
            if(this.var_217)
            {
               this.var_217.dispose();
               this.var_217 = null;
            }
            if(this.var_51)
            {
               this.var_51.dispose();
               this.var_51 = null;
            }
            while(this.var_90.length > 0)
            {
               ITab(this.var_90.pop()).dispose();
            }
            if(this.var_59)
            {
               if(!this.var_59.disposed)
               {
                  if(this.var_59.events)
                  {
                     this.var_59.events.removeEventListener(FriendBarUpdateEvent.const_816,this.onRefreshView);
                     this.var_59.events.removeEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
                     this.var_59.events.removeEventListener(FriendRequestEvent.const_904,this.onFriendRequestUpdate);
                     this.var_59.events.removeEventListener(NewMessageEvent.const_737,this.onNewInstantMessage);
                     this.var_59.events.removeEventListener(NotificationEvent.const_814,this.onFriendNotification);
                  }
                  this.var_59.release(new IIDHabboFriendBarData());
                  this.var_59 = null;
               }
            }
            if(this._windowManager)
            {
               if(!this._windowManager.disposed)
               {
                  this._windowManager.getWindowContext(const_466).getDesktopWindow().removeEventListener(WindowEvent.const_39,this.onDesktopResized);
                  this._windowManager.release(new IIDHabboWindowManager());
                  this._windowManager = null;
               }
            }
            if(this.var_793)
            {
               if(!this.var_793.disposed)
               {
                  this.var_793.release(new IIDAvatarRenderManager());
                  this.var_793 = null;
               }
            }
            if(this.var_966)
            {
               if(!this.var_966.disposed)
               {
                  this.var_966.release(new IIDHabboLocalizationManager());
                  this.var_966 = null;
               }
            }
            this.var_1497.dispose();
            this.var_1497 = null;
            super.dispose();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_51)
         {
            this.var_51.visible = param1;
            this.var_51.activate();
         }
         if(this.var_217)
         {
            this.var_217.visible = !param1;
            if(this.var_51)
            {
               this.var_217.x = this.var_51.x;
               this.var_217.y = this.var_51.y;
               this.var_217.activate();
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return this.var_51 && this.var_51.visible;
      }
      
      public function populate() : void
      {
         var _loc5_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc1_:int = this.var_965;
         this.deSelect(false);
         var _loc2_:IWindowContainer = this.var_51.findChildByName(const_78) as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_681) as IItemListWindow;
         _loc3_.autoArrangeItems = false;
         var _loc4_:int = _loc3_.numListItems;
         _loc5_ = _loc4_;
         while(_loc5_ > 0)
         {
            _loc3_.removeListItemAt(_loc5_ - 1);
            _loc5_--;
         }
         while(this.var_90.length > 0)
         {
            this.var_90.pop().recycle();
         }
         var _loc6_:int = this.var_59.numFriends;
         var _loc7_:int = this.var_59.numFriendRequests;
         var _loc8_:int = this.maxNumOfTabsVisible;
         var _loc9_:int = _loc6_ + (!!this.var_1498 ? 1 : 0) + (_loc7_ > 0 ? 1 : 0);
         var _loc10_:int = Math.min(_loc8_,_loc9_);
         if(this._startIndex + _loc10_ > _loc9_)
         {
            this._startIndex = Math.max(0,this._startIndex - (this._startIndex + _loc10_ - _loc9_));
         }
         var _loc11_:int = this._startIndex;
         _loc5_ = _loc11_;
         while(_loc5_ < _loc6_ + _loc11_)
         {
            if(_loc5_ >= _loc6_)
            {
               break;
            }
            if(this.var_90.length >= _loc8_)
            {
               break;
            }
            _loc13_ = this.var_59.getFriendAt(_loc5_);
            _loc14_ = FriendEntityTab.allocate(_loc13_);
            this.var_90.push(_loc14_);
            _loc3_.addListItem(_loc14_.window);
            _loc5_++;
         }
         if(this.var_1498)
         {
            if(this.var_90.length < _loc8_)
            {
               _loc15_ = 1;
               if(this.var_90.length + _loc15_ < const_682)
               {
                  _loc15_ = Math.min(_loc8_ - this.var_90.length,const_682 - this.var_90.length);
               }
               _loc9_ = _loc6_ + _loc15_ + (_loc7_ > 0 ? 1 : 0);
               while(_loc15_-- > 0)
               {
                  _loc16_ = AddFriendsTab.allocate();
                  _loc3_.addListItem(_loc16_.window);
                  this.var_90.push(_loc16_);
               }
            }
         }
         _loc3_.autoArrangeItems = true;
         if(_loc1_ > -1)
         {
            this.selectFriendEntity(_loc1_);
         }
         _loc2_.visible = this.var_90.length > 0;
         this.toggleArrowButtons(this.var_90.length < _loc9_,this._startIndex != 0,this._startIndex + this.var_90.length < _loc9_);
      }
      
      private function getFriendEntityTabByID(param1:int) : FriendEntityTab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_90.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_90[_loc4_] as FriendEntityTab;
            if(_loc2_)
            {
               if(_loc2_.friend.id == param1)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private function onFriendBarDataAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_59 = param2 as IHabboFriendBarData;
         this.var_59.events.addEventListener(FriendBarUpdateEvent.const_816,this.onRefreshView);
         this.var_59.events.addEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
         this.var_59.events.addEventListener(FriendRequestEvent.const_904,this.onFriendRequestUpdate);
         this.var_59.events.addEventListener(NewMessageEvent.const_737,this.onNewInstantMessage);
         this.var_59.events.addEventListener(NotificationEvent.const_814,this.onFriendNotification);
      }
      
      private function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onLocalizationAvailable(param1:IID, param2:IHabboLocalizationManager) : void
      {
         this.var_966 = param2 as IHabboLocalizationManager;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return this.var_51 && !this.var_51.disposed;
      }
      
      private function buildUserInterface() : void
      {
         var _loc2_:* = null;
         Tab.var_303 = this.var_59;
         Tab.var_593 = this;
         Tab.ASSETS = assets;
         Tab.WINDOWING = this._windowManager;
         Tab.var_2202 = this.var_966;
         Tab.var_2169 = this.var_1497;
         Token.WINDOWING = this._windowManager;
         Token.ASSETS = assets;
         var _loc1_:IAsset = assets.getAssetByName(const_1479);
         this.var_51 = this._windowManager.buildFromXML(_loc1_.content as XML,const_466) as IWindowContainer;
         this.var_51.x = const_683;
         this.var_51.y = this.var_51.parent.height - (this.var_51.height + const_1493);
         this.var_51.width = this.var_51.parent.width - (const_683 + const_1053);
         this.var_51.setParamFlag(WindowParam.const_303,true);
         this.var_51.procedure = this.barWindowEventProc;
         if(const_1488)
         {
            _loc1_ = assets.getAssetByName(const_1486);
            this.var_217 = this._windowManager.buildFromXML(_loc1_.content as XML,const_466) as IWindowContainer;
            this.var_217.x = this.var_51.x;
            this.var_217.y = this.var_51.y;
            this.var_217.setParamFlag(WindowParam.const_303,true);
            this.var_217.visible = false;
            this.var_217.procedure = this.toggleWindowEventProc;
         }
         _loc2_ = IWindowContainer(this.var_51.findChildByName(const_1054));
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.const_25,this.onIconMouseEvent);
         this.var_540 = new FriendListIcon(assets,_loc2_.getChildByName(ICON) as IBitmapWrapperWindow);
         _loc2_ = IWindowContainer(this.var_51.findChildByName(const_1481));
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.const_25,this.onIconMouseEvent);
         this.var_375 = new MessengerIcon(assets,_loc2_.getChildByName(ICON) as IBitmapWrapperWindow);
         this.var_375.enable(false);
         this.visible = true;
         this._windowManager.getWindowContext(const_466).getDesktopWindow().addEventListener(WindowEvent.const_39,this.onDesktopResized);
      }
      
      private function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_793 = param2 as IAvatarRenderManager;
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_793)
         {
            _loc3_ = this.var_793.createAvatarImage(param1,AvatarScaleType.const_60,null,this);
            if(_loc3_)
            {
               _loc2_ = _loc3_.getCroppedImage(AvatarSetType.const_52);
               _loc3_.dispose();
            }
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc3_:IItemListWindow = this.var_51.findChildByName(const_681) as IItemListWindow;
         var _loc4_:int = this.var_59.numFriends;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_59.getFriendAt(_loc5_);
            if(_loc2_.figure == param1)
            {
               _loc8_ = this.getAvatarFaceBitmap(param1);
               if(_loc8_)
               {
                  _loc9_ = _loc3_.getListItemByID(_loc2_.id) as IWindowContainer;
                  if(_loc9_)
                  {
                     _loc10_ = _loc9_.getChildByName(PIECES) as IItemListWindow;
                     if(_loc10_)
                     {
                        _loc11_ = IWindowContainer(_loc10_.getListItemByName(const_461));
                        if(_loc11_)
                        {
                           _loc12_ = _loc11_.findChildByName(const_309) as IBitmapWrapperWindow;
                           _loc12_.bitmap = _loc8_;
                           _loc12_.width = _loc8_.width;
                           _loc12_.height = _loc8_.height;
                        }
                     }
                  }
               }
               return;
            }
            _loc5_++;
         }
         var _loc6_:Array = this.var_59.getFriendRequestList();
         for each(_loc7_ in _loc6_)
         {
            if(_loc7_.figure == param1)
            {
               for each(_loc13_ in this.var_90)
               {
                  if(_loc13_ is FriendRequestTab)
                  {
                     FriendRequestTab(_loc13_).avatarImageReady(_loc7_,this.getAvatarFaceBitmap(param1));
                     return;
                  }
                  if(_loc13_ is FriendRequestsTab)
                  {
                     FriendRequestsTab(_loc13_).avatarImageReady(_loc7_,this.getAvatarFaceBitmap(param1));
                     return;
                  }
               }
            }
         }
      }
      
      public function faceBookImageReady(param1:BitmapData) : void
      {
      }
      
      private function isFriendSelected(param1:IFriendEntity) : Boolean
      {
         return this.var_965 == param1.id;
      }
      
      public function selectTab(param1:ITab, param2:Boolean) : void
      {
         if(!param1.selected)
         {
            if(this.var_1194)
            {
               this.deSelect(true);
            }
            param1.select(param2);
            this.var_1194 = param1;
            if(param1 is FriendEntityTab)
            {
               this.var_965 = FriendEntityTab(param1).friend.id;
            }
         }
      }
      
      public function selectFriendEntity(param1:int) : void
      {
         if(this.var_965 == param1)
         {
            return;
         }
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1);
         if(_loc2_)
         {
            this.selectTab(_loc2_,false);
            this.var_965 = param1;
         }
      }
      
      public function deSelect(param1:Boolean) : void
      {
         if(this.var_1194)
         {
            this.var_1194.deselect(param1);
            this.var_1194 = null;
            this.var_965 = -1;
         }
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!this.isUserInterfaceReady())
         {
            this.buildUserInterface();
         }
         this.resizeAndPopulate(true);
      }
      
      private function onFindFriendsNotification(param1:FindFriendsNotificationEvent) : void
      {
         var event:FindFriendsNotificationEvent = param1;
         var title:String = !!event.success ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}";
         var text:String = !!event.success ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}";
         this._windowManager.notify(title,text,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         },HabboAlertDialogFlag.const_530);
      }
      
      private function onFriendRequestUpdate(param1:FriendRequestEvent) : void
      {
         if(this.var_540)
         {
            this.var_540.notify(this.var_59.numFriendRequests > 0);
         }
         this.populate();
      }
      
      private function onNewInstantMessage(param1:NewMessageEvent) : void
      {
         if(this.var_375)
         {
            if(param1.notify)
            {
               this.var_375.notify(true);
            }
            else
            {
               this.var_375.enable(true);
            }
         }
      }
      
      private function onFriendNotification(param1:NotificationEvent) : void
      {
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1.var_2988);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.addNotificationToken(param1.notification,true);
      }
      
      private function barWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.type == WindowMouseEvent.const_44)
         {
            _loc3_ = this._startIndex;
            _loc4_ = this.var_59.numFriends + (!!this.var_1498 ? 1 : 0) + (this.var_59.numFriendRequests > 0 ? 1 : 0);
            switch(param2.name)
            {
               case const_1483:
                  _loc3_ = Math.max(0,this._startIndex - 1);
                  break;
               case const_1487:
                  _loc3_ = Math.max(0,this._startIndex - this.maxNumOfTabsVisible);
                  break;
               case const_1489:
                  _loc3_ = 0;
                  break;
               case const_1492:
                  _loc3_ = Math.max(0,Math.min(_loc4_ - this.maxNumOfTabsVisible,this._startIndex + 1));
                  break;
               case const_1484:
                  _loc3_ = Math.max(0,Math.min(_loc4_ - this.maxNumOfTabsVisible,this._startIndex + this.maxNumOfTabsVisible));
                  break;
               case const_1495:
                  _loc3_ = Math.max(0,_loc4_ - this.maxNumOfTabsVisible);
                  break;
               case const_1382:
                  this.visible = false;
                  break;
               case const_1491:
                  this.deSelect(true);
            }
            if(_loc3_ != this._startIndex)
            {
               this.deSelect(true);
               this._startIndex = _loc3_;
               this.resizeAndPopulate(true);
            }
         }
         if(param1.type == WindowEvent.const_636)
         {
            this.deSelect(true);
         }
      }
      
      private function onIconMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:Icon = param1.window.name == const_1054 ? this.var_540 : this.var_375;
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(_loc2_ is FriendListIcon)
               {
                  this.var_59.toggleFriendList();
                  _loc2_.notify(false);
               }
               else if(_loc2_ is MessengerIcon)
               {
                  this.var_59.toggleMessenger();
                  _loc2_.notify(false);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               _loc2_.hover(true);
               break;
            case WindowMouseEvent.const_25:
               _loc2_.hover(false);
         }
      }
      
      private function toggleWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(this.var_217.visible)
         {
            if(param1.type == WindowMouseEvent.const_44)
            {
               switch(param2.name)
               {
                  case const_1494:
                     this.visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:IWindowContainer = this.var_51.findChildByName(const_1055) as IWindowContainer;
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1490,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            _loc4_.visible = param1;
         }
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1482,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            if(param2)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1480,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            if(param3)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
      }
      
      private function resizeAndPopulate(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!disposed)
         {
            if(this.var_51)
            {
               this.var_51.width = this.var_51.parent.width - (const_683 + const_1053);
               if(!param1)
               {
                  _loc2_ = this.maxNumOfTabsVisible;
                  if(_loc2_ < this.var_90.length)
                  {
                     param1 = true;
                  }
                  else if(_loc2_ > this.var_90.length)
                  {
                     if(this.var_90.length < const_682)
                     {
                        param1 = true;
                     }
                     else if(this.var_90.length < this.var_59.numFriends + (!!this.var_1498 ? 1 : 0))
                     {
                        param1 = true;
                     }
                     else if(this.numFriendEntityTabsVisible < this.var_59.numFriends)
                     {
                        param1 = true;
                     }
                  }
               }
               if(param1)
               {
                  this.populate();
               }
            }
         }
      }
      
      private function get numFriendEntityTabsVisible() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.var_90.length;
         while(_loc2_-- > 0)
         {
            if(this.var_90[_loc2_] is FriendEntityTab)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      private function get maxNumOfTabsVisible() : int
      {
         var _loc1_:IWindowContainer = this.var_51.findChildByName(const_78) as IWindowContainer;
         var _loc2_:IWindowContainer = _loc1_.getChildByName(const_1055) as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_681) as IItemListWindow;
         var _loc4_:int = _loc2_.width - _loc3_.width;
         return (_loc1_.width - _loc4_) / (const_1485 + _loc3_.spacing);
      }
      
      private function onDesktopResized(param1:WindowEvent) : void
      {
         this.resizeAndPopulate(false);
      }
   }
}
