package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_1059:String = "avatar";
      
      private static const const_684:Number = -0.01;
      
      private static const const_685:Number = -0.409;
      
      private static const const_1060:int = 2;
      
      private static const const_1508:Array = [0,0,0];
      
      private static const const_1509:int = 3;
       
      
      private var var_645:AvatarVisualizationData = null;
      
      private var var_552:Map;
      
      private var var_545:Map;
      
      private var var_1208:int = 0;
      
      private var var_939:Boolean;
      
      private var var_677:String;
      
      private var var_1036:String;
      
      private var var_1209:int = 0;
      
      private var var_644:BitmapDataAsset;
      
      private var var_974:BitmapDataAsset;
      
      private var var_1816:int = -1;
      
      private var var_1815:int = -1;
      
      private var var_1821:int = -1;
      
      private const const_1061:int = 0;
      
      private const const_2032:int = 1;
      
      private const const_2030:int = 2;
      
      private const const_2029:int = 3;
      
      private const const_1510:int = 4;
      
      private var var_1696:int = -1;
      
      private var var_275:String = "";
      
      private var var_1504:String = "";
      
      private var var_1822:Boolean = false;
      
      private var var_1817:Boolean = false;
      
      private var var_1820:Boolean = false;
      
      private var var_1507:Boolean = false;
      
      private var var_609:Boolean = false;
      
      private var var_1505:int = 0;
      
      private var _danceStyle:int = 0;
      
      private var var_1818:int = 0;
      
      private var var_795:int = 0;
      
      private var var_796:int = 0;
      
      private var var_646:int = 0;
      
      private var var_1506:int = 0;
      
      private var var_1198:Boolean = false;
      
      private var var_1819:Boolean = false;
      
      private var var_1200:int = 0;
      
      private var var_797:int = 0;
      
      private var var_1814:Boolean = false;
      
      private var var_1199:int = 0;
      
      private var var_65:IAvatarImage = null;
      
      private var var_1121:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_552 = new Map();
         this.var_545 = new Map();
         this.var_939 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_552 != null)
         {
            this.resetImages();
            this.var_552.dispose();
            this.var_545.dispose();
            this.var_552 = null;
         }
         this.var_645 = null;
         this.var_644 = null;
         this.var_974 = null;
         super.dispose();
         this.var_1121 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1121;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_645 = param1 as AvatarVisualizationData;
         createSprites(this.const_1510);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_164)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_176) > 0 && param3);
            if(_loc5_ != this.var_1822)
            {
               this.var_1822 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_262) > 0;
            if(_loc5_ != this.var_1817)
            {
               this.var_1817 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_240) > 0;
            if(_loc5_ != this.var_1820)
            {
               this.var_1820 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_985) > 0 && param3);
            if(_loc5_ != this.var_1507)
            {
               this.var_1507 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_484) > 0;
            if(_loc5_ != this.var_609)
            {
               this.var_609 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_161);
            if(_loc6_ != this.var_1505)
            {
               this.var_1505 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_300);
            if(_loc7_ != this.var_275)
            {
               this.var_275 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_736);
            if(_loc7_ != this.var_1504)
            {
               this.var_1504 = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_637);
            if(_loc6_ != this._danceStyle)
            {
               this._danceStyle = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_639);
            if(_loc6_ != this.var_795)
            {
               this.var_795 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_352);
            if(_loc6_ != this.var_796)
            {
               this.var_796 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_292);
            if(_loc6_ != this.var_646)
            {
               this.var_646 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_206);
            if(_loc6_ != this.var_1816)
            {
               this.var_1816 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_796 > 0 && param1.getNumber(RoomObjectVariableEnum.const_292) > 0)
            {
               if(this.var_646 != this.var_796)
               {
                  this.var_646 = this.var_796;
                  _loc4_ = true;
               }
            }
            else if(this.var_646 != 0)
            {
               this.var_646 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_399);
            if(_loc6_ != this.var_1200)
            {
               this.var_1200 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.AVATAR_GENDER);
            if(_loc7_ != this.var_1036)
            {
               this.var_1036 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_220);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_394);
            if(_loc6_ != this.var_1818)
            {
               _loc4_ = true;
            }
            var_164 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_677 != param1)
         {
            this.var_677 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_552)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_545)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_552.reset();
         this.var_545.reset();
         this.var_65 = null;
         _loc2_ = getSprite(this.const_1061);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1507 = false;
         }
         if(this.var_275 == "sit" || this.var_275 == "lay")
         {
            this.var_1506 = param1 / 2;
         }
         else
         {
            this.var_1506 = 0;
         }
         this.var_1819 = false;
         this.var_1198 = false;
         if(this.var_275 == "lay")
         {
            this.var_1198 = true;
            _loc2_ = int(this.var_1504);
            if(_loc2_ < 0)
            {
               this.var_1819 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_552.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_545.getValue(_loc4_) as IAvatarImage;
            if(_loc3_)
            {
               _loc3_.forceActionUpdate();
            }
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_645.getAvatar(this.var_677,param1,this.var_1036,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_552.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_545.length >= const_1509)
                  {
                     _loc5_ = this.var_545.remove(this.var_545.getKey(0));
                     if(_loc5_)
                     {
                        _loc5_.dispose();
                     }
                  }
                  this.var_545.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_500 != param1.getUpdateID() || this.var_1696 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1816;
            if(this.var_275 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1815 || param4)
            {
               _loc5_ = true;
               this.var_1815 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_65.setDirectionAngle(AvatarSetType.const_41,_loc6_);
            }
            if(_loc7_ != this.var_1821 || param4)
            {
               _loc5_ = true;
               this.var_1821 = _loc7_;
               if(this.var_1821 != this.var_1815)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_65.setDirectionAngle(AvatarSetType.const_52,_loc7_);
               }
            }
            var_500 = param1.getUpdateID();
            this.var_1696 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_2032);
         this.var_644 = null;
         if(this.var_275 == "mv" || this.var_275 == "std")
         {
            _loc2_.visible = true;
            if(this.var_644 == null || param1 != var_101)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_644 = this.var_65.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_644 = this.var_65.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_644 != null)
               {
                  _loc2_.asset = this.var_644.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_644 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_974 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_2030);
         if(this.var_609)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_974 = this.var_645.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_974 = this.var_645.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_275 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_275 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_974 != null)
            {
               _loc2_.asset = this.var_974.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_2029);
         if(this.var_1200 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_645.getAvatarRendererAsset("number_" + this.var_1200 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_645.getAvatarRendererAsset("number_" + this.var_1200 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_275 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_275 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_797 = 1;
               this.var_1814 = true;
               this.var_1199 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_797 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_2029);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1814)
         {
            ++this.var_1199;
            if(this.var_1199 < 10)
            {
               return false;
            }
            if(this.var_797 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1199 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_797 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_797 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_797 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_797 = 0;
               this.var_1814 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc5_:IRoomObject = object;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_645 == null)
         {
            return;
         }
         var _loc6_:IRoomObjectModel = _loc5_.getModel();
         var _loc7_:Number = param1.scale;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = this.var_795;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = this.updateModel(_loc6_,_loc7_,param3);
         if(this.animateNumberBubble(_loc7_))
         {
            increaseUpdateId();
         }
         if(_loc13_ || _loc7_ != var_101 || this.var_65 == null)
         {
            if(_loc7_ != var_101)
            {
               _loc9_ = true;
               this.validateActions(_loc7_);
            }
            if(_loc11_ != this.var_795)
            {
               _loc12_ = true;
            }
            if(_loc9_ || this.var_65 == null || _loc12_)
            {
               this.var_65 = this.getAvatarImage(_loc7_,this.var_795);
               if(this.var_65 == null)
               {
                  return;
               }
               _loc8_ = true;
               _loc16_ = getSprite(this.const_1061);
               if(_loc16_ && this.var_65 && this.var_65.isPlaceholder())
               {
                  _loc16_.alpha = 150;
               }
               else if(_loc16_)
               {
                  _loc16_.alpha = 255;
               }
            }
            if(this.var_65 == null)
            {
               return;
            }
            this.updateShadow(_loc7_);
            if(_loc9_)
            {
               this.updateTypingBubble(_loc7_);
               this.updateNumberBubble(_loc7_);
            }
            _loc10_ = this.updateObject(_loc5_,param1,param3,true);
            this.updateActions(this.var_65);
            var_101 = _loc7_;
         }
         else
         {
            _loc10_ = this.updateObject(_loc5_,param1,param3);
         }
         var _loc14_:Boolean = _loc10_ || _loc13_ || _loc9_;
         var _loc15_:Boolean = (this.var_939 || this.var_1209 > 0) && param3;
         if(_loc14_)
         {
            this.var_1209 = const_1060;
         }
         if(_loc14_ || _loc15_)
         {
            increaseUpdateId();
            --this.var_1209;
            --this.var_1208;
            if(!(this.var_1208 <= 0 || _loc9_ || _loc13_ || _loc8_))
            {
               return;
            }
            this.var_65.updateAnimationByFrames(1);
            this.var_1208 = const_1060;
            _loc18_ = this.var_65.getCanvasOffsets();
            if(_loc18_ == null || _loc18_.length < 3)
            {
               _loc18_ = const_1508;
            }
            _loc17_ = getSprite(this.const_1061);
            if(_loc17_ != null)
            {
               _loc21_ = this.var_65.getImage(AvatarSetType.const_41,false);
               if(_loc21_ != null)
               {
                  _loc17_.asset = _loc21_;
               }
               if(_loc17_.asset)
               {
                  _loc17_.offsetX = -1 * _loc7_ / 2 + _loc18_[0];
                  _loc17_.offsetY = -_loc17_.asset.height + _loc7_ / 4 + _loc18_[1] + this.var_1506;
               }
               if(this.var_1198)
               {
                  if(this.var_1819)
                  {
                     _loc17_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc17_.relativeDepth = const_685 + _loc18_[2];
                  }
               }
               else
               {
                  _loc17_.relativeDepth = const_684 + _loc18_[2];
               }
            }
            _loc17_ = getSprite(this.const_2030);
            if(_loc17_ != null && _loc17_.visible)
            {
               if(!this.var_1198)
               {
                  _loc17_.relativeDepth = const_684 - 0.01 + _loc18_[2];
               }
               else
               {
                  _loc17_.relativeDepth = const_685 - 0.01 + _loc18_[2];
               }
            }
            this.var_939 = this.var_65.isAnimating();
            _loc19_ = this.const_1510;
            for each(_loc20_ in this.var_65.getSprites())
            {
               if(_loc20_.id == const_1059)
               {
                  _loc17_ = getSprite(this.const_1061);
                  _loc22_ = this.var_65.getLayerData(_loc20_);
                  _loc23_ = _loc20_.getDirectionOffsetX(this.var_65.getDirection());
                  _loc24_ = _loc20_.getDirectionOffsetY(this.var_65.getDirection());
                  if(_loc22_ != null)
                  {
                     _loc23_ += _loc22_.dx;
                     _loc24_ += _loc22_.dy;
                  }
                  if(_loc7_ < 48)
                  {
                     _loc23_ /= 2;
                     _loc24_ /= 2;
                  }
                  _loc17_.offsetX += _loc23_;
                  _loc17_.offsetY += _loc24_;
               }
               else
               {
                  _loc17_ = getSprite(_loc19_);
                  if(_loc17_ != null)
                  {
                     _loc17_.capturesMouse = false;
                     _loc17_.visible = true;
                     _loc25_ = this.var_65.getLayerData(_loc20_);
                     _loc26_ = 0;
                     _loc27_ = _loc20_.getDirectionOffsetX(this.var_65.getDirection());
                     _loc28_ = _loc20_.getDirectionOffsetY(this.var_65.getDirection());
                     _loc29_ = _loc20_.getDirectionOffsetZ(this.var_65.getDirection());
                     _loc30_ = 0;
                     if(_loc20_.hasDirections)
                     {
                        _loc30_ = this.var_65.getDirection();
                     }
                     if(_loc25_ != null)
                     {
                        _loc26_ = _loc25_.animationFrame;
                        _loc27_ += _loc25_.dx;
                        _loc28_ += _loc25_.dy;
                        _loc30_ += _loc25_.directionOffset;
                     }
                     if(_loc7_ < 48)
                     {
                        _loc27_ /= 2;
                        _loc28_ /= 2;
                     }
                     if(_loc30_ < 0)
                     {
                        _loc30_ += 8;
                     }
                     else if(_loc30_ > 7)
                     {
                        _loc30_ -= 8;
                     }
                     _loc31_ = this.var_65.getScale() + "_" + _loc20_.member + "_" + _loc30_ + "_" + _loc26_;
                     _loc32_ = this.var_65.getAsset(_loc31_);
                     if(_loc32_ == null)
                     {
                        continue;
                     }
                     _loc17_.asset = _loc32_.content as BitmapData;
                     _loc17_.offsetX = -_loc32_.offset.x - _loc7_ / 2 + _loc27_;
                     _loc17_.offsetY = -_loc32_.offset.y + _loc28_ + this.var_1506;
                     if(this.var_1198)
                     {
                        _loc17_.relativeDepth = const_685 - 0.001 * spriteCount * _loc29_;
                     }
                     else
                     {
                        _loc17_.relativeDepth = const_684 - 0.001 * spriteCount * _loc29_;
                     }
                     if(_loc20_.ink == 33)
                     {
                        _loc17_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc17_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc19_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_424,this.var_275,this.var_1504);
         if(this.var_1505 > 0)
         {
            param1.appendAction(AvatarAction.const_348,AvatarAction.const_1689[this.var_1505]);
         }
         if(this._danceStyle > 0)
         {
            param1.appendAction(AvatarAction.const_170,this._danceStyle);
         }
         if(this.var_1818 > 0)
         {
            param1.appendAction(AvatarAction.const_954,this.var_1818);
         }
         if(this.var_796 > 0)
         {
            param1.appendAction(AvatarAction.const_996,this.var_796);
         }
         if(this.var_646 > 0)
         {
            param1.appendAction(AvatarAction.const_1001,this.var_646);
         }
         if(this.var_1822)
         {
            param1.appendAction(AvatarAction.const_342);
         }
         if(this.var_1820 || this.var_1507)
         {
            param1.appendAction(AvatarAction.const_650);
         }
         if(this.var_1817)
         {
            param1.appendAction(AvatarAction.const_269);
         }
         if(this.var_795 > 0)
         {
            param1.appendAction(AvatarAction.const_325,this.var_795);
         }
         param1.endActionAppends();
         this.var_939 = param1.isAnimating();
         var _loc2_:int = this.const_1510;
         for each(_loc3_ in this.var_65.getSprites())
         {
            if(_loc3_.id != const_1059)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
