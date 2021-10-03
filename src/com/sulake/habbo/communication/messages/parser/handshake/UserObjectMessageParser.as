package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_677:String;
      
      private var var_944:String;
      
      private var var_2840:String;
      
      private var var_1716:String;
      
      private var var_2841:int;
      
      private var var_2839:String;
      
      private var var_2842:int;
      
      private var var_2838:int;
      
      private var var_2666:int;
      
      private var var_1361:int;
      
      private var _petRespectLeft:int;
      
      private var var_2843:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_677 = param1.readString();
         this.var_944 = param1.readString();
         this.var_2840 = param1.readString();
         this.var_1716 = param1.readString();
         this.var_2841 = param1.readInteger();
         this.var_2839 = param1.readString();
         this.var_2842 = param1.readInteger();
         this.var_2838 = param1.readInteger();
         this.var_2666 = param1.readInteger();
         this.var_1361 = param1.readInteger();
         this._petRespectLeft = param1.readInteger();
         this.var_2843 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_677;
      }
      
      public function get sex() : String
      {
         return this.var_944;
      }
      
      public function get customData() : String
      {
         return this.var_2840;
      }
      
      public function get realName() : String
      {
         return this.var_1716;
      }
      
      public function get tickets() : int
      {
         return this.var_2841;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2839;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2842;
      }
      
      public function get directMail() : int
      {
         return this.var_2838;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2666;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1361;
      }
      
      public function get petRespectLeft() : int
      {
         return this._petRespectLeft;
      }
      
      public function get identityId() : int
      {
         return this.var_2843;
      }
   }
}
