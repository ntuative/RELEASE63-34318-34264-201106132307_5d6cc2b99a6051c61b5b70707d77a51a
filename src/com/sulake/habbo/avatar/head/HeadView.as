package com.sulake.habbo.avatar.head
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.AvatarEditorGridView;
   import com.sulake.habbo.avatar.common.CategoryBaseView;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.utils.Dictionary;
   
   public class HeadView extends CategoryBaseView implements IAvatarEditorCategoryView
   {
       
      
      public function HeadView(param1:IAvatarEditorCategoryModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param2,param3,param1);
      }
      
      override public function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_window)
         {
            _loc1_ = _assetLibrary.getAssetByName("avatareditor_head_base") as XmlAsset;
            if(_loc1_)
            {
               _window = IWindowContainer(_windowManager.buildFromXML(_loc1_.content as XML));
               _window.visible = false;
               _window.procedure = this.windowEventProc;
            }
         }
         if(!var_41)
         {
            var_41 = new Dictionary();
            var_41["null"] = new AvatarEditorGridView(var_76,FigureData.const_224,_windowManager,_assetLibrary);
            var_41["null"] = new AvatarEditorGridView(var_76,FigureData.const_306,_windowManager,_assetLibrary);
            var_41["null"] = new AvatarEditorGridView(var_76,FigureData.const_266,_windowManager,_assetLibrary);
            var_41["null"] = new AvatarEditorGridView(var_76,FigureData.const_247,_windowManager,_assetLibrary);
            var_41["null"] = new AvatarEditorGridView(var_76,FigureData.const_301,_windowManager,_assetLibrary);
         }
         else
         {
            for each(_loc2_ in var_41)
            {
               _loc2_.initFromList();
            }
         }
         _isInitialized = true;
         attachImages();
         if(var_76 && var_163 == "")
         {
            var_76.switchCategory(FigureData.const_224);
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         if(var_163 == param1)
         {
            return;
         }
         inactivateTab(var_50);
         switch(param1)
         {
            case FigureData.const_224:
               var_50 = "tab_hair";
               break;
            case FigureData.const_306:
               var_50 = "tab_hat";
               break;
            case FigureData.const_266:
               var_50 = "tab_accessories";
               break;
            case FigureData.const_247:
               var_50 = "tab_eyewear";
               break;
            case FigureData.const_301:
               var_50 = "tab_masks";
               break;
            default:
               throw new Error("[HeadView] Unknown item category: \"" + param1 + "\"");
         }
         var_163 = param1;
         activateTab(var_50);
         if(!_isInitialized)
         {
            this.init();
         }
         updateGridView();
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "tab_hair":
                  this.switchCategory(FigureData.const_224);
                  break;
               case "tab_hat":
                  this.switchCategory(FigureData.const_306);
                  break;
               case "tab_accessories":
                  this.switchCategory(FigureData.const_266);
                  break;
               case "tab_eyewear":
                  this.switchCategory(FigureData.const_247);
                  break;
               case "tab_masks":
                  this.switchCategory(FigureData.const_301);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            switch(param2.name)
            {
               case "tab_hair":
               case "tab_hat":
               case "tab_accessories":
               case "tab_eyewear":
               case "tab_masks":
                  activateTab(param2.name);
            }
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            switch(param2.name)
            {
               case "tab_hair":
               case "tab_hat":
               case "tab_accessories":
               case "tab_eyewear":
               case "tab_masks":
                  if(var_50 != param2.name)
                  {
                     inactivateTab(param2.name);
                  }
            }
         }
      }
   }
}
