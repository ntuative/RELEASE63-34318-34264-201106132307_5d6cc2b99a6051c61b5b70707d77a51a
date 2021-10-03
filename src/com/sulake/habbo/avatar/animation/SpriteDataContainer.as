package com.sulake.habbo.avatar.animation
{
   public class SpriteDataContainer implements ISpriteDataContainer
   {
       
      
      private var var_1127:IAnimation;
      
      private var _id:String;
      
      private var var_2150:int;
      
      private var var_2620:String;
      
      private var var_2619:Boolean;
      
      private var _dx:Array;
      
      private var var_1558:Array;
      
      private var var_1557:Array;
      
      public function SpriteDataContainer(param1:IAnimation, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         super();
         this.var_1127 = param1;
         this._id = String(param2.@id);
         this.var_2150 = parseInt(param2.@ink);
         this.var_2620 = String(param2.@member);
         this.var_2619 = Boolean(parseInt(param2.@directions));
         this._dx = [];
         this.var_1558 = [];
         this.var_1557 = [];
         for each(_loc3_ in param2.direction)
         {
            _loc4_ = parseInt(_loc3_.@id);
            this._dx[_loc4_] = parseInt(_loc3_.@dx);
            this.var_1558[_loc4_] = parseInt(_loc3_.@dy);
            this.var_1557[_loc4_] = parseInt(_loc3_.@dz);
         }
      }
      
      public function getDirectionOffsetX(param1:int) : int
      {
         if(param1 < this._dx.length)
         {
            return this._dx[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetY(param1:int) : int
      {
         if(param1 < this.var_1558.length)
         {
            return this.var_1558[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetZ(param1:int) : int
      {
         if(param1 < this.var_1557.length)
         {
            return this.var_1557[param1];
         }
         return 0;
      }
      
      public function get animation() : IAnimation
      {
         return this.var_1127;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get ink() : int
      {
         return this.var_2150;
      }
      
      public function get member() : String
      {
         return this.var_2620;
      }
      
      public function get hasDirections() : Boolean
      {
         return this.var_2619;
      }
   }
}
