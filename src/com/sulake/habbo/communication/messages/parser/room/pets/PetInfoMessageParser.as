package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1781:int;
      
      private var _name:String;
      
      private var var_1233:int;
      
      private var var_2375:int;
      
      private var var_2284:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_677:String;
      
      private var var_2376:int;
      
      private var var_2374:int;
      
      private var var_2373:int;
      
      private var var_2282:int;
      
      private var var_2288:int;
      
      private var _ownerName:String;
      
      private var var_580:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1781;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1233;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2375;
      }
      
      public function get experience() : int
      {
         return this.var_2284;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_677;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2376;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2374;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2373;
      }
      
      public function get respect() : int
      {
         return this.var_2282;
      }
      
      public function get ownerId() : int
      {
         return this.var_2288;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_580;
      }
      
      public function flush() : Boolean
      {
         this.var_1781 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1781 = param1.readInteger();
         this._name = param1.readString();
         this.var_1233 = param1.readInteger();
         this.var_2375 = param1.readInteger();
         this.var_2284 = param1.readInteger();
         this.var_2376 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2374 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2373 = param1.readInteger();
         this.var_677 = param1.readString();
         this.var_2282 = param1.readInteger();
         this.var_2288 = param1.readInteger();
         this.var_580 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
