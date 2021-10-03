package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1329:int = 1;
      
      public static const const_841:int = 2;
      
      public static const const_826:int = 3;
      
      public static const const_1966:int = 4;
       
      
      private var _index:int;
      
      private var var_2814:String;
      
      private var var_2815:String;
      
      private var var_2811:Boolean;
      
      private var var_2812:String;
      
      private var var_1090:String;
      
      private var var_2813:int;
      
      private var var_2566:int;
      
      private var _type:int;
      
      private var var_2575:String;
      
      private var var_1076:GuestRoomData;
      
      private var var_1075:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2814 = param1.readString();
         this.var_2815 = param1.readString();
         this.var_2811 = param1.readInteger() == 1;
         this.var_2812 = param1.readString();
         this.var_1090 = param1.readString();
         this.var_2813 = param1.readInteger();
         this.var_2566 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1329)
         {
            this.var_2575 = param1.readString();
         }
         else if(this._type == const_826)
         {
            this.var_1075 = new PublicRoomData(param1);
         }
         else if(this._type == const_841)
         {
            this.var_1076 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_1076 != null)
         {
            this.var_1076.dispose();
            this.var_1076 = null;
         }
         if(this.var_1075 != null)
         {
            this.var_1075.dispose();
            this.var_1075 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2814;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2815;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2811;
      }
      
      public function get picText() : String
      {
         return this.var_2812;
      }
      
      public function get picRef() : String
      {
         return this.var_1090;
      }
      
      public function get folderId() : int
      {
         return this.var_2813;
      }
      
      public function get tag() : String
      {
         return this.var_2575;
      }
      
      public function get userCount() : int
      {
         return this.var_2566;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_1076;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_1075;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1329)
         {
            return 0;
         }
         if(this.type == const_841)
         {
            return this.var_1076.maxUserCount;
         }
         if(this.type == const_826)
         {
            return this.var_1075.maxUsers;
         }
         return 0;
      }
   }
}
