package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.ActivityPointDisplayCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.CatalogWidgetEnum;
   import com.sulake.habbo.catalog.viewer.widgets.ClubBuyCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ClubGiftWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ColourGridCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ICatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ItemGridCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ItemGroupCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.LocalizationCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.MadMoneyCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.MarketPlaceCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.MarketPlaceOwnItemsCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.NewPetsCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PetsCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ProductViewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PurchaseCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PurseCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RecyclerCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RecyclerPrizesCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RedeemItemCodeCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RoomPreviewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SingleViewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SongDiskProductViewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SpacesCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SpacesNewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SpecialInfoWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TextInputCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TraxPreviewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TrophyCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetsInitializedEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import flash.events.Event;
   
   public class CatalogPage implements ICatalogPage
   {
      
      protected static const const_2011:String = "ctlg_";
       
      
      protected var var_2219:XML;
      
      protected var _window:IWindowContainer;
      
      private var _viewer:ICatalogViewer;
      
      private var var_1538:int;
      
      private var var_1307:String;
      
      private var _offers:Array;
      
      private var _localization:IPageLocalization;
      
      private var var_40:Array;
      
      private var var_573:EventDispatcher;
      
      private var _catalog:HabboCatalog;
      
      private var var_1308:ItemGridCatalogWidget;
      
      public function CatalogPage(param1:ICatalogViewer, param2:int, param3:String, param4:IPageLocalization, param5:Array, param6:HabboCatalog)
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         this.var_40 = [];
         super();
         this._viewer = param1;
         this.var_1538 = param2;
         this.var_1307 = param3;
         this._localization = param4;
         this._offers = new Array();
         this._catalog = param6;
         for each(_loc7_ in param5)
         {
            _loc8_ = new Array();
            _loc9_ = this._viewer.catalog.getProductData(_loc7_.localizationId);
            for each(_loc10_ in _loc7_.products)
            {
               _loc12_ = this._viewer.catalog.getFurnitureData(_loc10_.furniClassId,_loc10_.productType);
               _loc13_ = new Product(_loc10_.productType,_loc10_.furniClassId,_loc10_.extraParam,_loc10_.productCount,_loc10_.expiration,_loc9_,_loc12_);
               _loc8_.push(_loc13_);
            }
            _loc11_ = new Offer(_loc7_.offerId,_loc7_.localizationId,_loc7_.priceInCredits,_loc7_.priceInActivityPoints,_loc7_.activityPointType,_loc7_.clubLevel,_loc8_,this);
            if(_loc11_.productContainer != null)
            {
               this._offers.push(_loc11_);
            }
            else
            {
               _loc11_.dispose();
            }
         }
         this.var_573 = new EventDispatcher();
         this.var_40 = new Array();
         this.init();
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function get viewer() : ICatalogViewer
      {
         return this._viewer;
      }
      
      public function get pageId() : int
      {
         return this.var_1538;
      }
      
      public function get layoutCode() : String
      {
         return this.var_1307;
      }
      
      public function get offers() : Array
      {
         return this._offers;
      }
      
      public function get localization() : IPageLocalization
      {
         return this._localization;
      }
      
      public function get links() : Array
      {
         return this._localization.getLinks(this.var_1307);
      }
      
      public function get hasLinks() : Boolean
      {
         return this._localization.hasLinks(this.var_1307);
      }
      
      public function selectOffer(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_1308 != null)
         {
            Logger.log("selecting offer " + param1);
            for each(_loc2_ in this._offers)
            {
               if(_loc2_.offerId == param1)
               {
                  _loc3_ = _loc2_.productContainer as IGridItem;
                  this.var_1308.select(_loc3_);
               }
            }
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_40)
         {
            _loc1_.dispose();
         }
         this.var_40 = null;
         this._localization.dispose();
         for each(_loc2_ in this._offers)
         {
            _loc2_.dispose();
         }
         this._offers = [];
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_573 != null)
         {
            this.var_573.dispose();
            this.var_573 = null;
         }
         this._viewer = null;
         this.var_2219 = null;
         this.var_1538 = 0;
         this.var_1307 = "";
      }
      
      public function init() : void
      {
         if(this.createWindow(this.layoutCode))
         {
            this.createWidgets();
         }
      }
      
      public function closed() : void
      {
         var _loc1_:* = null;
         if(this.var_40 != null)
         {
            for each(_loc1_ in this.var_40)
            {
               _loc1_.closed();
            }
         }
      }
      
      protected function createWindow(param1:String) : Boolean
      {
         var _loc2_:String = const_2011 + param1;
         var _loc3_:XmlAsset = this.viewer.catalog.assets.getAssetByName(_loc2_) as XmlAsset;
         if(_loc3_ == null)
         {
            Logger.log("Could not find asset for layout " + _loc2_);
            return false;
         }
         this.var_2219 = _loc3_.content as XML;
         this._window = this.viewer.catalog.windowManager.buildFromXML(this.var_2219) as IWindowContainer;
         if(this._window == null)
         {
            Logger.log("Could not create layout " + param1);
            return false;
         }
         return true;
      }
      
      private function localize() : void
      {
      }
      
      private function createWidgets() : void
      {
         this.createWidgetsRecursion(this._window);
         this.initializeWidgets();
      }
      
      private function createWidgetsRecursion(param1:IWindowContainer) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.numChildren)
            {
               _loc3_ = param1.getChildAt(_loc2_) as IWindowContainer;
               if(_loc3_ != null)
               {
                  this.createWidget(_loc3_);
                  this.createWidgetsRecursion(_loc3_);
               }
               _loc2_++;
            }
         }
      }
      
      private function createWidget(param1:IWindowContainer) : void
      {
         if(param1 == null)
         {
            return;
         }
         switch(param1.name)
         {
            case CatalogWidgetEnum.const_1934:
               if(this.var_1308 == null)
               {
                  this.var_1308 = new ItemGridCatalogWidget(param1,this._catalog.sessionDataManager);
                  this.var_40.push(this.var_1308);
               }
               break;
            case CatalogWidgetEnum.const_1771:
               this.var_40.push(new ItemGroupCatalogWidget(param1,this._catalog.sessionDataManager));
               break;
            case CatalogWidgetEnum.const_1950:
               this.var_40.push(new ProductViewCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1947:
               this.var_40.push(new SongDiskProductViewCatalogWidget(param1,this._catalog.soundManager));
               break;
            case CatalogWidgetEnum.const_1850:
               this.var_40.push(new SingleViewCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1945:
               this.var_40.push(new PurchaseCatalogWidget(param1,this._catalog.sessionDataManager));
               break;
            case CatalogWidgetEnum.const_1921:
               this.var_40.push(new PurseCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1688:
               this.var_40.push(new ColourGridCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1793:
               this.var_40.push(new TraxPreviewCatalogWidget(param1,this._catalog.soundManager));
               break;
            case CatalogWidgetEnum.const_1949:
               this.var_40.push(new RedeemItemCodeCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1812:
               this.var_40.push(new SpacesCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1856:
               this.var_40.push(new SpacesNewCatalogWidget(param1,this._catalog.sessionDataManager));
               break;
            case CatalogWidgetEnum.const_1879:
               this.var_40.push(new RoomPreviewCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1841:
               this.var_40.push(new TrophyCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1970:
               this.var_40.push(new PetsCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1857:
               this.var_40.push(new NewPetsCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1740:
               this.var_40.push(new TextInputCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1732:
               this.var_40.push(new SpecialInfoWidget(param1));
               break;
            case CatalogWidgetEnum.const_1733:
               this.var_40.push(new RecyclerCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1755:
               this.var_40.push(new RecyclerPrizesCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1939:
               this.var_40.push(new MarketPlaceCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1817:
               this.var_40.push(new MarketPlaceOwnItemsCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1738:
               this.var_40.push(new ClubGiftWidget(param1,this._catalog.getClubGiftController()));
               break;
            case CatalogWidgetEnum.const_1737:
               this.var_40.push(new ClubBuyCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1743:
               this.var_40.push(new ActivityPointDisplayCatalogWidget(param1));
               break;
            case CatalogWidgetEnum.const_1828:
               this.var_40.push(new MadMoneyCatalogWidget(param1));
         }
      }
      
      private function initializeWidgets() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = [];
         for each(_loc1_ in this.var_40)
         {
            _loc1_.page = this;
            _loc1_.events = this.var_573;
            if(!_loc1_.init())
            {
               _loc2_.push(_loc1_);
            }
         }
         this.removeWidgets(_loc2_);
         this.initializeLocalizations();
         this.var_573.dispatchEvent(new CatalogWidgetsInitializedEvent());
      }
      
      private function initializeLocalizations() : void
      {
         var _loc1_:ICatalogWidget = new LocalizationCatalogWidget(this._window);
         this.var_40.push(_loc1_);
         _loc1_.page = this;
         _loc1_.events = this.var_573;
         _loc1_.init();
      }
      
      private function removeWidgets(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         for each(_loc2_ in this.var_40)
         {
            if(_loc2_.window != null)
            {
               for each(_loc3_ in param1)
               {
                  if(_loc3_.window != null)
                  {
                     if(_loc3_.window.getChildIndex(_loc2_.window) >= 0)
                     {
                        if(param1.indexOf(_loc2_) < 0)
                        {
                           param1.push(_loc2_);
                        }
                        break;
                     }
                  }
               }
            }
         }
         for each(_loc3_ in param1)
         {
            if(_loc3_.window != null)
            {
               this._window.removeChild(_loc3_.window);
               _loc3_.window.dispose();
            }
            _loc4_ = this.var_40.indexOf(_loc3_);
            if(_loc4_ >= 0)
            {
               this.var_40.splice(_loc4_,1);
            }
            _loc3_.dispose();
         }
      }
      
      public function dispatchWidgetEvent(param1:Event) : Boolean
      {
         if(this.var_573 != null)
         {
            return this.var_573.dispatchEvent(param1);
         }
         return false;
      }
      
      public function replaceOffers(param1:Array, param2:Boolean = false) : void
      {
         var _loc3_:* = null;
         if(param2)
         {
            for each(_loc3_ in this._offers)
            {
               _loc3_.dispose();
            }
         }
         this._offers = param1;
      }
   }
}
