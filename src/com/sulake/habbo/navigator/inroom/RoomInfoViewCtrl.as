package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboNavigatorEvent;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_200:IWindowContainer;
      
      private var var_3020:int;
      
      private var var_371:RoomEventViewCtrl;
      
      private var var_373:Timer;
      
      private var var_149:RoomSettingsCtrl;
      
      private var var_271:RoomThumbnailCtrl;
      
      private var var_954:TagRenderer;
      
      private var var_370:IWindowContainer;
      
      private var var_372:IWindowContainer;
      
      private var var_633:IWindowContainer;
      
      private var var_1779:IWindowContainer;
      
      private var var_1780:IWindowContainer;
      
      private var var_1172:IWindowContainer;
      
      private var var_952:ITextWindow;
      
      private var var_950:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_785:ITextWindow;
      
      private var var_1167:ITextWindow;
      
      private var var_951:ITextWindow;
      
      private var var_784:ITextWindow;
      
      private var var_1476:ITextWindow;
      
      private var var_270:IWindowContainer;
      
      private var var_783:IWindowContainer;
      
      private var var_1471:IWindowContainer;
      
      private var var_1777:ITextWindow;
      
      private var var_632:ITextWindow;
      
      private var var_1778:IWindow;
      
      private var var_1168:IContainerButtonWindow;
      
      private var var_1171:IContainerButtonWindow;
      
      private var var_1169:IContainerButtonWindow;
      
      private var _remFavouriteButton:IContainerButtonWindow;
      
      private var var_1170:IContainerButtonWindow;
      
      private var var_1473:IButtonWindow;
      
      private var var_1475:IButtonWindow;
      
      private var var_1472:IButtonWindow;
      
      private var var_782:IWindowContainer;
      
      private var var_1166:ITextWindow;
      
      private var var_953:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_781:IButtonWindow;
      
      private var var_1474:Boolean = false;
      
      private const const_778:int = 75;
      
      private const const_732:int = 3;
      
      private const const_928:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_371 = new RoomEventViewCtrl(this._navigator);
         this.var_149 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_271 = new RoomThumbnailCtrl(this._navigator);
         this.var_954 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_149);
         this.var_373 = new Timer(6000,1);
         this.var_373.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this.var_373)
         {
            this.var_373.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_373.reset();
            this.var_373 = null;
         }
         this._navigator = null;
         this.var_371 = null;
         this.var_149 = null;
         this.var_271 = null;
         if(this.var_954)
         {
            this.var_954.dispose();
            this.var_954 = null;
         }
         this.var_200 = null;
         this.var_370 = null;
         this.var_372 = null;
         this.var_633 = null;
         this.var_1779 = null;
         this.var_1780 = null;
         this.var_1172 = null;
         this.var_952 = null;
         this.var_950 = null;
         this._ownerName = null;
         this.var_785 = null;
         this.var_1167 = null;
         this.var_951 = null;
         this.var_784 = null;
         this.var_1476 = null;
         this.var_270 = null;
         this.var_783 = null;
         this.var_1471 = null;
         this.var_1777 = null;
         this.var_632 = null;
         this.var_1778 = null;
         this.var_1168 = null;
         this.var_1171 = null;
         this.var_1169 = null;
         this._remFavouriteButton = null;
         this.var_1170 = null;
         this.var_1473 = null;
         this.var_1475 = null;
         this.var_1472 = null;
         this.var_782 = null;
         this.var_1166 = null;
         this.var_953 = null;
         this._buttons = null;
         this.var_781 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_373.reset();
         this.var_371.active = true;
         this.var_149.active = false;
         this.var_271.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_373.reset();
         this.var_149.load(param1);
         this.var_149.active = true;
         this.var_371.active = false;
         this.var_271.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_149.active = true;
         this.var_371.active = false;
         this.var_271.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_373.reset();
         this.var_149.active = false;
         this.var_371.active = false;
         this.var_271.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this.var_1474 = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function toggle() : void
      {
         this.var_373.reset();
         this.var_371.active = false;
         this.var_149.active = false;
         this.var_271.active = false;
         this.refresh();
         this._window.visible = !this._window.visible;
         this._window.x = this._window.desktop.width - this._window.width - this.const_732;
         this._window.y = this.const_778;
         if(this._window.visible)
         {
            this._window.activate();
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this.var_200,["room_info","event_info","embed_info","buttons_container"],0,2);
         this.var_200.height = Util.getLowestPoint(this.var_200);
         var _loc1_:int = this._window.desktop.height - this._window.height - this.const_928;
         if(this._window.y > _loc1_)
         {
            this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_370);
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_149.refresh(this.var_370);
         this.var_271.refresh(this.var_370);
         Util.moveChildrenToColumn(this.var_370,["room_details","room_buttons"],0,2);
         this.var_370.height = Util.getLowestPoint(this.var_370);
         this.var_370.visible = true;
         Logger.log("XORP: " + this.var_372.visible + ", " + this.var_1172.visible + ", " + this.var_633.visible + ", " + this.var_633.rectangle + ", " + this.var_370.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_270);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_371.refresh(this.var_270);
         if(Util.hasVisibleChildren(this.var_270) && !(this.var_149.active || this.var_271.active))
         {
            Util.moveChildrenToColumn(this.var_270,["event_details","event_buttons"],0,2);
            this.var_270.height = Util.getLowestPoint(this.var_270);
            this.var_270.visible = true;
         }
         else
         {
            this.var_270.visible = false;
         }
         Logger.log("EVENT: " + this.var_270.visible + ", " + this.var_270.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","PresentHandler") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_149.active && !this.var_271.active && !this.var_371.active)
         {
            this.var_782.visible = true;
            this.var_953.text = this.getEmbedData();
         }
         else
         {
            this.var_782.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_149.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_781)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_781.visible = _loc1_;
            if(this.var_1474)
            {
               this.var_781.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_781.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_149.active || this.var_271.active)
         {
            return;
         }
         this.var_952.text = param1.roomName;
         this.var_952.height = this.var_952.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_785.text = param1.description;
         this.var_954.refreshTags(this.var_372,param1.tags);
         this.var_785.visible = false;
         if(param1.description != "")
         {
            this.var_785.height = this.var_785.textHeight + 5;
            this.var_785.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1171,"facebook_logo_small",_loc3_,null,0);
         this.var_1171.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1168,"thumb_up",_loc4_,null,0);
         this.var_1168.visible = _loc4_;
         this.var_784.visible = !_loc4_;
         this.var_1476.visible = !_loc4_;
         this.var_1476.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_372,"home",param2,null,0);
         this._navigator.refreshButton(this.var_372,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_372,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_952.y,0);
         this.var_372.visible = true;
         this.var_372.height = Util.getLowestPoint(this.var_372);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_372.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_149.active || this.var_271.active)
         {
            return;
         }
         this.var_950.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_950.height = this.var_950.textHeight + 5;
         this.var_1167.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1167.height = this.var_1167.textHeight + 5;
         Util.moveChildrenToColumn(this.var_633,["public_space_name","public_space_desc"],this.var_950.y,0);
         this.var_633.visible = true;
         this.var_633.height = Math.max(86,Util.getLowestPoint(this.var_633));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_371.active)
         {
            return;
         }
         this.var_1777.text = param1.eventName;
         this.var_632.text = param1.eventDescription;
         this.var_954.refreshTags(this.var_783,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_632.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_632.height = this.var_632.textHeight + 5;
            this.var_632.y = Util.getLowestPoint(this.var_783) + 2;
            this.var_632.visible = true;
         }
         this.var_783.visible = true;
         this.var_783.height = Util.getLowestPoint(this.var_783);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_149.active || this.var_271.active)
         {
            return;
         }
         this.var_1473.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1169.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this._remFavouriteButton.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1170.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1172.visible = Util.hasVisibleChildren(this.var_1172);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_371.active)
         {
            return;
         }
         this.var_1475.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1472.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1471.visible = Util.hasVisibleChildren(this.var_1471);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
         this.var_200 = this._window.findChildByName("content") as IWindowContainer;
         this._window.visible = false;
         this.var_370 = IWindowContainer(this.find("room_info"));
         this.var_372 = IWindowContainer(this.find("room_details"));
         this.var_633 = IWindowContainer(this.find("public_space_details"));
         this.var_1779 = IWindowContainer(this.find("owner_name_cont"));
         this.var_1780 = IWindowContainer(this.find("rating_cont"));
         this.var_1172 = IWindowContainer(this.find("room_buttons"));
         this.var_952 = ITextWindow(this.find("room_name"));
         this.var_950 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_785 = ITextWindow(this.find("room_desc"));
         this.var_1167 = ITextWindow(this.find("public_space_desc"));
         this.var_951 = ITextWindow(this.find("owner_caption"));
         this.var_784 = ITextWindow(this.find("rating_caption"));
         this.var_1476 = ITextWindow(this.find("rating_txt"));
         this.var_270 = IWindowContainer(this.find("event_info"));
         this.var_783 = IWindowContainer(this.find("event_details"));
         this.var_1471 = IWindowContainer(this.find("event_buttons"));
         this.var_1777 = ITextWindow(this.find("event_name"));
         this.var_632 = ITextWindow(this.find("event_desc"));
         this.var_1171 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1168 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_1778 = this.find("staff_pick_button");
         this.var_1169 = IContainerButtonWindow(this.find("add_favourite_button"));
         this._remFavouriteButton = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1170 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1473 = IButtonWindow(this.find("room_settings_button"));
         this.var_1475 = IButtonWindow(this.find("create_event_button"));
         this.var_1472 = IButtonWindow(this.find("edit_event_button"));
         this.var_782 = IWindowContainer(this.find("embed_info"));
         this.var_1166 = ITextWindow(this.find("embed_info_txt"));
         this.var_953 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_781 = IButtonWindow(this.find("zoom_button"));
         this.addMouseClickListener(this.var_1169,this.onAddFavouriteClick);
         this.addMouseClickListener(this._remFavouriteButton,this.onRemoveFavouriteClick);
         this.addMouseClickListener(this.var_1473,this.onRoomSettingsClick);
         this.addMouseClickListener(this.var_1170,this.onMakeHomeClick);
         this.addMouseClickListener(this.var_1475,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1472,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_953,this.onEmbedSrcClick);
         this.addMouseClickListener(this.var_1168,this.onThumbUp);
         this.addMouseClickListener(this.var_1778,this.onStaffPick);
         this.addMouseClickListener(this.var_1171,this.onFacebookLike);
         this.addMouseClickListener(this.var_781,this.onZoomClick);
         this._navigator.refreshButton(this.var_1169,"favourite",true,null,0);
         this._navigator.refreshButton(this._remFavouriteButton,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1170,"home",true,null,0);
         this.addMouseClickListener(this._window.findChildByTag("close"),this.onCloseButtonClick);
         this.addMouseOverListener(this.var_370,this.onHover);
         this.addMouseOverListener(this.var_270,this.onHover);
         this.var_951.width = this.var_951.textWidth;
         Util.moveChildrenToRow(this.var_1779,["owner_caption","owner_name"],this.var_951.x,this.var_951.y,3);
         this.var_784.width = this.var_784.textWidth;
         Util.moveChildrenToRow(this.var_1780,["rating_caption","rating_txt"],this.var_784.x,this.var_784.y,3);
         this.var_1166.height = this.var_1166.textHeight + 5;
         Util.moveChildrenToColumn(this.var_782,["embed_info_txt","embed_src_txt"],this.var_1166.y,2);
         this.var_782.height = Util.getLowestPoint(this.var_782) + 5;
         this.var_3020 = this._window.y + this._window.height;
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function addMouseOverListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,param2);
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc2_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc2_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc2_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc2_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc2_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent) : void
      {
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent) : void
      {
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent) : void
      {
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onFacebookLike(param1:WindowEvent) : void
      {
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent) : void
      {
         this.var_953.setSelection(0,this.var_953.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent) : void
      {
         this._navigator.events.dispatchEvent(new HabboNavigatorEvent(HabboNavigatorEvent.const_349));
         this.var_1474 = !this.var_1474;
         this.refreshButtons();
      }
      
      private function onHover(param1:WindowEvent) : void
      {
         this.var_373.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._window.visible = false;
         if(this.var_149 != null)
         {
            this.var_149.resetView();
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
   }
}
