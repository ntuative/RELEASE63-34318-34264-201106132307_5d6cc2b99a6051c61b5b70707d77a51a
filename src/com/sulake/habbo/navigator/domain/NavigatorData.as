package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_2051:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_226:MsgWithRequestId;
      
      private var var_706:RoomEventData;
      
      private var var_2862:Boolean;
      
      private var var_2864:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2452:int;
      
      private var var_292:GuestRoomData;
      
      private var var_1087:PublicRoomShortData;
      
      private var var_2867:int;
      
      private var var_2866:Boolean;
      
      private var var_2871:int;
      
      private var var_2863:Boolean;
      
      private var var_2070:int;
      
      private var var_2869:Boolean;
      
      private var var_1515:Array;
      
      private var var_1633:Array;
      
      private var var_2872:int;
      
      private var var_1634:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1337:Boolean;
      
      private var var_2865:int;
      
      private var var_2868:Boolean;
      
      private var var_2870:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1515 = new Array();
         this.var_1633 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_292 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_292 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_1087 = null;
         this.var_292 = null;
         this._currentRoomOwner = false;
         if(param1.privateRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_1087 = param1.publicSpace;
            this.var_706 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_706 != null)
         {
            this.var_706.dispose();
            this.var_706 = null;
         }
         if(this.var_1087 != null)
         {
            this.var_1087.dispose();
            this.var_1087 = null;
         }
         if(this.var_292 != null)
         {
            this.var_292.dispose();
            this.var_292 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_292 != null)
         {
            this.var_292.dispose();
         }
         this.var_292 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_706 != null)
         {
            this.var_706.dispose();
         }
         this.var_706 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_226 != null && this.var_226 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_226 != null && this.var_226 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_226 != null && this.var_226 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_226 = param1;
         this.var_1337 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_226 = param1;
         this.var_1337 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_226 = param1;
         this.var_1337 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_226 == null)
         {
            return;
         }
         this.var_226.dispose();
         this.var_226 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_226 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_226 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_226 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_706;
      }
      
      public function get avatarId() : int
      {
         return this.var_2452;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2862;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2864;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_292;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_1087;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2866;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2871;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_2070;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2863;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2865;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2867;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2869;
      }
      
      public function get adIndex() : int
      {
         return this.var_2870;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2868;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2452 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2871 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2866 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2862 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2864 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2863 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_2070 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2865 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2867 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2869 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2870 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2868 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1515 = param1;
         this.var_1633 = new Array();
         for each(_loc2_ in this.var_1515)
         {
            if(_loc2_.visible)
            {
               this.var_1633.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1515;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1633;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2872 = param1.limit;
         this.var_1634 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1634 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_292.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_292 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_292.flatId;
         return this.var_2070 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1634 >= this.var_2872;
      }
      
      public function startLoading() : void
      {
         this.var_1337 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1337;
      }
   }
}
