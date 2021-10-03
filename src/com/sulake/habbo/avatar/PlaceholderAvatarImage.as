package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_760:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1121)
         {
            _structure = null;
            _assets = null;
            var_268 = null;
            var_304 = null;
            var_677 = null;
            var_594 = null;
            var_352 = null;
            if(!var_1388 && var_48)
            {
               var_48.dispose();
            }
            var_48 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_892 = null;
            var_1121 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_760[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_760[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_424:
               switch(_loc3_)
               {
                  case AvatarAction.const_911:
                  case AvatarAction.const_539:
                  case AvatarAction.const_393:
                  case AvatarAction.const_734:
                  case AvatarAction.const_403:
                  case AvatarAction.const_828:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_325:
            case AvatarAction.const_170:
            case AvatarAction.const_269:
            case AvatarAction.const_954:
            case AvatarAction.const_996:
            case AvatarAction.const_1001:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
