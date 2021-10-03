package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_2070:int = 1;
      
      public static const const_1804:int = 2;
       
      
      private var var_941:String;
      
      private var var_2970:int;
      
      private var var_2965:int;
      
      private var var_2968:int;
      
      private var var_2966:int;
      
      private var var_2963:Boolean;
      
      private var var_2590:Boolean;
      
      private var var_2591:int;
      
      private var var_2592:int;
      
      private var var_2969:Boolean;
      
      private var var_2964:int;
      
      private var var_2967:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_941 = param1.readString();
         this.var_2970 = param1.readInteger();
         this.var_2965 = param1.readInteger();
         this.var_2968 = param1.readInteger();
         this.var_2966 = param1.readInteger();
         this.var_2963 = param1.readBoolean();
         this.var_2590 = param1.readBoolean();
         this.var_2591 = param1.readInteger();
         this.var_2592 = param1.readInteger();
         this.var_2969 = param1.readBoolean();
         this.var_2964 = param1.readInteger();
         this.var_2967 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_941;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2970;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2965;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2968;
      }
      
      public function get responseType() : int
      {
         return this.var_2966;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2963;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2590;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2591;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2592;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2969;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2964;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2967;
      }
   }
}
