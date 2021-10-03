package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_324:int = 1;
      
      public static const const_221:int = 2;
      
      public static const const_295:int = 3;
      
      public static const const_362:int = 4;
      
      public static const const_214:int = 5;
      
      public static const const_438:int = 1;
      
      public static const const_1011:int = 2;
      
      public static const const_776:int = 3;
      
      public static const const_733:int = 4;
      
      public static const const_290:int = 5;
      
      public static const const_864:int = 6;
      
      public static const const_830:int = 7;
      
      public static const const_241:int = 8;
      
      public static const const_453:int = 9;
      
      public static const const_2171:int = 10;
      
      public static const const_969:int = 11;
      
      public static const const_556:int = 12;
       
      
      private var var_463:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_463 = new Array();
         this.var_463.push(new Tab(this._navigator,const_324,const_556,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_560));
         this.var_463.push(new Tab(this._navigator,const_221,const_438,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_560));
         this.var_463.push(new Tab(this._navigator,const_362,const_969,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1287));
         this.var_463.push(new Tab(this._navigator,const_295,const_290,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_560));
         this.var_463.push(new Tab(this._navigator,const_214,const_241,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_941));
         this.setSelectedTab(const_324);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_362;
      }
      
      public function get tabs() : Array
      {
         return this.var_463;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_463)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_463)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_463)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
