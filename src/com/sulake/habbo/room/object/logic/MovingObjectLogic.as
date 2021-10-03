package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_890:int = 500;
      
      private static var var_704:Vector3d = new Vector3d();
       
      
      private var var_486:Vector3d;
      
      private var var_103:Vector3d;
      
      private var var_1079:Number = 0.0;
      
      private var var_2066:int = 0;
      
      private var var_2833:int;
      
      private var var_1080:int = 500;
      
      public function MovingObjectLogic()
      {
         this.var_486 = new Vector3d();
         this.var_103 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this.var_2066;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_103 = null;
         this.var_486 = null;
      }
      
      override public function set object(param1:IRoomObjectController) : void
      {
         super.object = param1;
         if(param1 != null)
         {
            this.var_103.assign(param1.getLocation());
         }
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_1080 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         if(param1.loc != null)
         {
            this.var_103.assign(param1.loc);
         }
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               _loc3_ = _loc2_.targetLoc;
               this.var_2833 = this.var_2066;
               this.var_486.assign(_loc3_);
               this.var_486.sub(this.var_103);
            }
         }
      }
      
      protected function getLocationOffset() : IVector3d
      {
         return null;
      }
      
      override public function update(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:IVector3d = this.getLocationOffset();
         var _loc3_:IRoomObjectModelController = object.getModelController();
         if(_loc3_ != null)
         {
            if(_loc2_ != null)
            {
               if(this.var_1079 != _loc2_.z)
               {
                  this.var_1079 = _loc2_.z;
                  _loc3_.setNumber(RoomObjectVariableEnum.const_973,this.var_1079);
               }
            }
            else if(this.var_1079 != 0)
            {
               this.var_1079 = 0;
               _loc3_.setNumber(RoomObjectVariableEnum.const_973,this.var_1079);
            }
         }
         if(this.var_486.length > 0 || _loc2_ != null)
         {
            _loc4_ = param1 - this.var_2833;
            if(_loc4_ == this.var_1080 >> 1)
            {
               _loc4_++;
            }
            if(_loc4_ > this.var_1080)
            {
               _loc4_ = this.var_1080;
            }
            if(this.var_486.length > 0)
            {
               var_704.assign(this.var_486);
               var_704.mul(_loc4_ / Number(this.var_1080));
               var_704.add(this.var_103);
            }
            else
            {
               var_704.assign(this.var_103);
            }
            if(_loc2_ != null)
            {
               var_704.add(_loc2_);
            }
            if(object != null)
            {
               object.setLocation(var_704);
            }
            if(_loc4_ == this.var_1080)
            {
               this.var_486.x = 0;
               this.var_486.y = 0;
               this.var_486.z = 0;
            }
         }
         this.var_2066 = param1;
      }
   }
}
