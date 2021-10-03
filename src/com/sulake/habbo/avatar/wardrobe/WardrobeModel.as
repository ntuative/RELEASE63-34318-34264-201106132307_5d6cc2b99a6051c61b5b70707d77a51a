package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.ISideContentModel;
   import com.sulake.habbo.communication.messages.incoming.avatar.OutfitData;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   
   public class WardrobeModel implements ISideContentModel
   {
       
      
      private var var_29:HabboAvatarEditor;
      
      private var _view:WardrobeView;
      
      private var var_533:Map;
      
      private var _isInitialized:Boolean = false;
      
      public function WardrobeModel(param1:HabboAvatarEditor)
      {
         super();
         this.var_29 = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         this.var_29 = null;
         for each(_loc1_ in this.var_533)
         {
            _loc1_.dispose();
            _loc1_ = null;
         }
         this.var_533 = null;
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         this._isInitialized = false;
      }
      
      public function reset() : void
      {
         this._isInitialized = false;
      }
      
      private function init() : void
      {
         var _loc2_:* = null;
         if(this.var_29.handler != null)
         {
            this.var_29.handler.getWardrobe();
         }
         if(this.var_533)
         {
            for each(_loc2_ in this.var_533)
            {
               _loc2_.dispose();
               _loc2_ = null;
            }
         }
         this.var_533 = new Map();
         var _loc1_:int = 1;
         while(_loc1_ <= 10)
         {
            this.var_533.add(_loc1_,new WardrobeSlot(this.var_29,_loc1_,this.method_5(_loc1_)));
            _loc1_++;
         }
         if(this._view)
         {
            this._view.dispose();
         }
         this._view = new WardrobeView(this);
         this._isInitialized = true;
         this.updateView();
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return this.var_29;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(!this._isInitialized)
         {
            this.init();
         }
         return this._view.getWindowContainer();
      }
      
      public function updateView() : void
      {
         this._view.update();
      }
      
      public function updateSlots(param1:int, param2:Array) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!this._isInitialized)
         {
            return;
         }
         if(!param2)
         {
            ErrorReportStorage.addDebugData("WardrobeModel","updateSlots: outfits is null!");
         }
         if(!this.var_533)
         {
            ErrorReportStorage.addDebugData("WardrobeModel","updateSlots: _slots is null!");
         }
         for each(_loc4_ in param2)
         {
            _loc3_ = this.var_533.getValue(_loc4_.slotId) as WardrobeSlot;
            if(_loc3_)
            {
               _loc3_.update(_loc4_.figureString,_loc4_.gender,this.method_5(_loc3_.id));
            }
         }
      }
      
      private function method_5(param1:int) : Boolean
      {
         if(param1 <= 5)
         {
            return this.var_29.manager.sessionData.hasUserRight("fuse_use_wardrobe",HabboClubLevelEnum.const_38);
         }
         return this.var_29.manager.sessionData.hasUserRight("fuse_larger_wardrobe",HabboClubLevelEnum.const_46);
      }
      
      public function get slots() : Array
      {
         return this.var_533.getValues();
      }
   }
}
