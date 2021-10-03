package com.sulake.habbo.catalog
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.IDisplayObjectWrapper;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.catalog.club.ClubBuyController;
   import com.sulake.habbo.catalog.club.ClubBuyOfferData;
   import com.sulake.habbo.catalog.club.ClubGiftController;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.catalog.enum.HabboCatalogTrackingEvent;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.catalog.event.CatalogEvent;
   import com.sulake.habbo.catalog.marketplace.IMarketPlace;
   import com.sulake.habbo.catalog.marketplace.MarketPlaceLogic;
   import com.sulake.habbo.catalog.marketplace.MarketplaceItemStats;
   import com.sulake.habbo.catalog.navigation.CatalogNavigator;
   import com.sulake.habbo.catalog.navigation.ICatalogNavigator;
   import com.sulake.habbo.catalog.purchase.ChargeConfirmationDialog;
   import com.sulake.habbo.catalog.purchase.GiftWrappingConfiguration;
   import com.sulake.habbo.catalog.purchase.PlacedObjectPurchaseData;
   import com.sulake.habbo.catalog.purchase.PurchaseConfirmationDialog;
   import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
   import com.sulake.habbo.catalog.purse.IPurse;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.purse.PurseEvent;
   import com.sulake.habbo.catalog.recycler.IRecycler;
   import com.sulake.habbo.catalog.recycler.RecyclerLogic;
   import com.sulake.habbo.catalog.viewer.CatalogViewer;
   import com.sulake.habbo.catalog.viewer.IDragAndDropDoneReceiver;
   import com.sulake.habbo.catalog.viewer.IPageLocalization;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.PageLocalization;
   import com.sulake.habbo.catalog.viewer.RoomPreviewer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSellablePetBreedsEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogIndexMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPublishedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.ChargeInfo;
   import com.sulake.habbo.communication.messages.incoming.catalog.ChargeInfoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.ClubGiftInfoEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftReceiverNotFoundEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.HabboClubOffersMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.IsOfferGiftableMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
   import com.sulake.habbo.communication.messages.incoming.catalog.NotEnoughBalanceMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.PurchaseErrorMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.PurchaseNotAllowedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.PurchaseOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.SellablePetBreedsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.VoucherRedeemErrorMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.VoucherRedeemOkMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.purse.CreditBalanceEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOffersEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketPlaceOwnOffersEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceBuyOfferResultEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceCancelOfferResultEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceConfigurationEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceItemStatsEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceMakeOfferResult;
   import com.sulake.habbo.communication.messages.incoming.notifications.ActivityPointsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.HabboActivityPointNotificationMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerFinishedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerPrizesMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.ApproveNameMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.ScrSendUserInfoEvent;
   import com.sulake.habbo.communication.messages.outgoing.catalog.GetCatalogIndexComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.GetCatalogPageComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.GetClubOffersMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.GetGiftWrappingConfigurationComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.GetIsOfferGiftableComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.GetNewAvailableItemsViewedComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.GetSellablePetBreedsComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseFromCatalogAsGiftComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.PurchaseFromCatalogComposer;
   import com.sulake.habbo.communication.messages.outgoing.catalog.RedeemVoucherMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestRoomPropertySet;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.BuyOfferMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.CancelOfferMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.GetMarketplaceItemStatsComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.GetOffersMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.GetOwnOffersMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.marketplace.RedeemOfferCreditsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.recycler.GetRecyclerPrizesMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.recycler.GetRecyclerStatusMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.recycler.RecycleItemsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.engine.PlaceObjectMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.ApproveNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.catalog.CatalogPageMessageParser;
   import com.sulake.habbo.communication.messages.parser.catalog.ClubGiftInfoParser;
   import com.sulake.habbo.communication.messages.parser.catalog.NotEnoughBalanceMessageParser;
   import com.sulake.habbo.communication.messages.parser.catalog.PurchaseNotAllowedMessageParser;
   import com.sulake.habbo.communication.messages.parser.catalog.SellablePetBreedsParser;
   import com.sulake.habbo.communication.messages.parser.inventory.purse.CreditBalanceParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceConfigurationParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceItemStatsParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceMakeOfferResultParser;
   import com.sulake.habbo.communication.messages.parser.recycler.RecyclerFinishedMessageParser;
   import com.sulake.habbo.communication.messages.parser.recycler.RecyclerPrizesMessageParser;
   import com.sulake.habbo.communication.messages.parser.recycler.RecyclerStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.users.ApproveNameMessageParser;
   import com.sulake.habbo.communication.messages.parser.users.ScrSendUserInfoMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryItemAddedEvent;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectPlacedEvent;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.session.product.IProductDataListener;
   import com.sulake.habbo.sound.HabboSoundTypesEnum;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.utils.WindowToggle;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboIconType;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDCoreLocalizationManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.utils.Vector3d;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import iid.IIDHabboWindowManager;
   
   public class HabboCatalog extends Component implements IHabboCatalog, IProductDataListener, IUpdateReceiver
   {
      
      private static const const_671:uint = 1;
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_169:IHabboConfigurationManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_16:IRoomSessionManager;
      
      private var var_1158:IRoomSession;
      
      private var _localization:ICoreLocalizationManager;
      
      private var var_13:IHabboInventory;
      
      private var var_365:ISessionDataManager;
      
      private var var_1001:IAvatarRenderManager;
      
      private var _soundManager:IHabboSoundManager;
      
      private var _friendList:IHabboFriendList;
      
      private var var_821:Boolean = false;
      
      private var var_212:CatalogViewer;
      
      private var var_314:ICatalogNavigator;
      
      private var var_115:Purse;
      
      private var var_102:RecyclerLogic;
      
      private var var_148:IMarketPlace;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_195:PurchaseConfirmationDialog;
      
      private var var_213:ChargeConfirmationDialog;
      
      private var var_765:String = "";
      
      private var var_942:int = -1;
      
      private var var_1744:int = -1;
      
      private var var_2329:Boolean = true;
      
      private var var_2326:Boolean = true;
      
      private var var_1745:Boolean = false;
      
      private var var_2327:GiftWrappingConfiguration;
      
      private var var_1157:ClubGiftController;
      
      private var var_529:ClubBuyController;
      
      private var var_764:Map;
      
      private var var_1156:Boolean = false;
      
      private var var_763:IPurchasableOffer;
      
      private var var_1450:IDragAndDropDoneReceiver;
      
      private var var_64:PlacedObjectPurchaseData;
      
      private var var_1449:Boolean;
      
      private var var_2328:Boolean;
      
      private var var_622:RoomPreviewer;
      
      private const const_2021:Point = new Point(100,20);
      
      public function HabboCatalog(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_764 = new Map();
         super(param1,param2,param3);
         this.var_115 = new Purse();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationReady);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
         queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
         queueInterface(new IIDCoreLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboInventory(),this.onInventoryReady);
         queueInterface(new IIDSessionDataManager(),this.sessionDataManagerReady);
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRenderManagerReady);
         queueInterface(new IIDHabboSoundManager(),this.onSoundManagerReady);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
         queueInterface(new IIDHabboFriendList(),this.onFriendListReady);
         registerUpdateReceiver(this,1);
      }
      
      public static function setElementImageCentered(param1:IWindow, param2:BitmapData, param3:int = 0) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param2 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param1.disposed)
         {
            return;
         }
         var _loc4_:int = param3 > 0 ? int(param3) : int(param1.height);
         var _loc5_:int = (param1.width - param2.width) / 2;
         var _loc6_:int = (_loc4_ - param2.height) / 2;
         if(param1 as IBitmapWrapperWindow != null)
         {
            _loc7_ = IBitmapWrapperWindow(param1);
            if(_loc7_.bitmap == null || param3 > 0)
            {
               _loc7_.bitmap = new BitmapData(param1.width,_loc4_,true,16777215);
            }
            _loc7_.bitmap.fillRect(_loc7_.bitmap.rect,16777215);
            _loc7_.bitmap.copyPixels(param2,param2.rect,new Point(_loc5_,_loc6_),null,null,false);
            param1.invalidate();
         }
         else if(param1 as IDisplayObjectWrapper != null)
         {
            _loc8_ = IDisplayObjectWrapper(param1);
            _loc8_.setDisplayObject(new Bitmap(param2));
            param1.invalidate();
            Logger.log("WRAPPER SET: " + param2.width + ", " + param2.height + ", " + _loc8_.rectangle + ", " + _loc8_.visible);
         }
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_365;
      }
      
      public function get avatarRenderManager() : IAvatarRenderManager
      {
         return this.var_1001;
      }
      
      public function get localization() : ICoreLocalizationManager
      {
         return this._localization;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_169;
      }
      
      public function get connection() : IConnection
      {
         return this._communication.getHabboMainConnection(null);
      }
      
      public function get giftWrappingConfiguration() : GiftWrappingConfiguration
      {
         return this.var_2327;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return this._roomEngine;
      }
      
      public function get soundManager() : IHabboSoundManager
      {
         return this._soundManager;
      }
      
      public function get roomPreviewer() : RoomPreviewer
      {
         return this.var_622;
      }
      
      override public function dispose() : void
      {
         removeUpdateReceiver(this);
         this.reset(true);
         if(this._toolbar)
         {
            this._toolbar.events.removeEventListener(HabboToolbarEvent.const_49,this.onHabboToolbarEvent);
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this._soundManager)
         {
            this._soundManager.release(new IIDHabboSoundManager());
            this._soundManager = null;
         }
         if(this.var_365)
         {
            this.var_365.release(new IIDSessionDataManager());
            this.var_365 = null;
         }
         if(this.var_1001)
         {
            this.var_1001.release(new IIDAvatarRenderManager());
            this.var_1001 = null;
         }
         if(this.var_169)
         {
            this.var_169.release(new IIDHabboConfigurationManager());
            this.var_169 = null;
         }
         if(this._friendList)
         {
            this._friendList.release(new IIDHabboFriendList());
            this._friendList = null;
         }
         if(this.var_13)
         {
            this.var_13.release(new IIDHabboInventory());
            this.var_13 = null;
         }
         if(this._localization)
         {
            this._localization.release(new IIDCoreLocalizationManager());
            this._localization = null;
         }
         if(this._roomEngine != null)
         {
            this._roomEngine.release(new IIDRoomEngine());
            this._roomEngine = null;
         }
         if(this._windowManager != null)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._communication != null)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_195 != null)
         {
            this.var_195.dispose();
            this.var_195 = null;
         }
         if(this.var_213 != null)
         {
            this.var_213.dispose();
            this.var_213 = null;
         }
         if(this.var_102 != null)
         {
            this.var_102.dispose();
            this.var_102 = null;
         }
         this.var_115 = null;
         this.var_148 = null;
         if(this.var_529 != null)
         {
            this.var_529.dispose();
            this.var_529 = null;
         }
         if(this.var_764 != null)
         {
            this.var_764.dispose();
            this.var_764 = null;
         }
         this.var_1158 = null;
         if(this.var_16 != null)
         {
            this.var_16.events.removeEventListener(RoomSessionEvent.const_75,this.onRoomSessionEvent);
            this.var_16.events.removeEventListener(RoomSessionEvent.const_83,this.onRoomSessionEvent);
            this.var_16.release(new IIDHabboRoomSessionManager());
            this.var_16 = null;
         }
         this.resetPlacedOfferData();
         this.var_1156 = false;
         this.var_1450 = null;
         if(this.var_622 != null)
         {
            this.var_622.dispose();
            this.var_622 = null;
         }
         super.dispose();
      }
      
      private function init() : void
      {
         if(!this.var_821)
         {
            this.createMainWindow();
            this.createCatalogNavigator();
            this.createCatalogViewer();
            this.refreshCatalogIndex();
            this.var_821 = true;
            events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_INITIALIZED));
            this.updatePurse();
            this.createRecycler();
            this.createMarketPlace();
            this.createClubGiftController();
            this.getGiftWrappingConfiguration();
            this.createClubBuyController();
         }
      }
      
      private function reset(param1:Boolean = false) : void
      {
         var _loc2_:Boolean = false;
         this.var_821 = false;
         if(this.var_212 != null)
         {
            this.var_212.dispose();
            this.var_212 = null;
         }
         if(this.var_314 != null)
         {
            this.var_314.dispose();
            this.var_314 = null;
         }
         if(this._mainContainer != null)
         {
            this._mainContainer.dispose();
            this._mainContainer = null;
         }
         if(!param1)
         {
            if(this.var_365 == null)
            {
               Core.crash("Could not reload product data after reset() because _sessionDataManager was null",Core.const_1765);
               return;
            }
            events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_NOT_READY));
            _loc2_ = this.var_365.loadProductData(this);
            if(_loc2_)
            {
               this.init();
            }
         }
      }
      
      public function loadCatalogPage(param1:int, param2:int) : void
      {
         this._communication.getHabboMainConnection(null).send(new GetCatalogPageComposer(param1,param2));
      }
      
      public function purchaseProduct(param1:int, param2:int, param3:String = "") : void
      {
         var _loc4_:IConnection = this._communication.getHabboMainConnection(null);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.send(new PurchaseFromCatalogComposer(param1,param2,param3));
      }
      
      public function purchaseProductAsGift(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int, param7:int, param8:int) : void
      {
         var _loc9_:IConnection = this._communication.getHabboMainConnection(null);
         if(_loc9_ == null)
         {
            return;
         }
         _loc9_.send(new PurchaseFromCatalogAsGiftComposer(param1,param2,param3,param4,param5,param6,param7,param8));
      }
      
      public function approveName(param1:String, param2:int) : void
      {
         this._communication.getHabboMainConnection(null).send(new ApproveNameMessageComposer(param1,param2));
      }
      
      public function getRecyclerStatus() : void
      {
         this._communication.getHabboMainConnection(null).send(new GetRecyclerStatusMessageComposer());
      }
      
      public function getRecyclerPrizes() : void
      {
         this._communication.getHabboMainConnection(null).send(new GetRecyclerPrizesMessageComposer());
      }
      
      public function sendRecycleItems(param1:Array) : void
      {
         this._communication.getHabboMainConnection(null).send(new RecycleItemsMessageComposer(param1));
      }
      
      public function showPurchaseConfirmation(param1:IPurchasableOffer, param2:int, param3:String = "", param4:Boolean = true) : void
      {
         var _loc5_:* = null;
         Logger.log("buy: " + [param1.offerId,param3]);
         if(param1.priceInCredits > 0 && param1.priceInCredits > this.var_115.credits)
         {
            this.showNotEnoughCreditsAlert();
            return;
         }
         if(param1.priceInActivityPoints > 0 && param1.priceInActivityPoints > this.var_115.getActivityPointsForType(param1.activityPointType))
         {
            this.showNotEnoughActivityPointsAlert(param1.activityPointType);
            return;
         }
         if(param1 is Offer)
         {
            if(this.var_195 == null || this.var_195.disposed)
            {
               this.var_195 = new PurchaseConfirmationDialog(this._localization);
            }
            _loc5_ = [];
            if(this._friendList != null)
            {
               _loc5_ = this._friendList.getFriendNames();
            }
            this.var_195.showOffer(this,this._roomEngine,param1,param2,param3,_loc5_);
            if(param4)
            {
               this._communication.getHabboMainConnection(null).send(new GetIsOfferGiftableComposer(param1.offerId));
            }
         }
         else if(param1 is ClubBuyOfferData)
         {
            this.var_529.showConfirmation(param1 as ClubBuyOfferData,param2);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._communication = param2 as IHabboCommunicationManager;
         this._communication.addHabboConnectionMessageEvent(new CatalogIndexMessageEvent(this.onCatalogIndex));
         this._communication.addHabboConnectionMessageEvent(new CatalogPageMessageEvent(this.onCatalogPage));
         this._communication.addHabboConnectionMessageEvent(new CatalogPublishedMessageEvent(this.onCatalogPublished));
         this._communication.addHabboConnectionMessageEvent(new PurchaseErrorMessageEvent(this.onPurchaseError));
         this._communication.addHabboConnectionMessageEvent(new PurchaseNotAllowedMessageEvent(this.onPurchaseNotAllowed));
         this._communication.addHabboConnectionMessageEvent(new PurchaseOKMessageEvent(this.onPurchaseOK));
         this._communication.addHabboConnectionMessageEvent(new GiftReceiverNotFoundEvent(this.onGiftReceiverNotFound));
         this._communication.addHabboConnectionMessageEvent(new NotEnoughBalanceMessageEvent(this.onNotEnoughBalance));
         this._communication.addHabboConnectionMessageEvent(new CreditBalanceEvent(this.onCreditBalance));
         this._communication.addHabboConnectionMessageEvent(new HabboActivityPointNotificationMessageEvent(this.onActivityPointNotification));
         this._communication.addHabboConnectionMessageEvent(new ActivityPointsMessageEvent(this.onActivityPoints));
         this._communication.addHabboConnectionMessageEvent(new VoucherRedeemOkMessageEvent(this.onVoucherRedeemOk));
         this._communication.addHabboConnectionMessageEvent(new VoucherRedeemErrorMessageEvent(this.onVoucherRedeemError));
         this._communication.addHabboConnectionMessageEvent(new ApproveNameMessageEvent(this.onApproveNameResult));
         this._communication.addHabboConnectionMessageEvent(new ScrSendUserInfoEvent(this.onSubscriptionInfo));
         this._communication.addHabboConnectionMessageEvent(new ClubGiftInfoEvent(this.onClubGiftInfo));
         this._communication.addHabboConnectionMessageEvent(new RecyclerStatusMessageEvent(this.onRecyclerStatus));
         this._communication.addHabboConnectionMessageEvent(new RecyclerFinishedMessageEvent(this.onRecyclerFinished));
         this._communication.addHabboConnectionMessageEvent(new RecyclerPrizesMessageEvent(this.onRecyclerPrizes));
         this._communication.addHabboConnectionMessageEvent(new MarketPlaceOffersEvent(this.onMarketPlaceOffers));
         this._communication.addHabboConnectionMessageEvent(new MarketPlaceOwnOffersEvent(this.onMarketPlaceOwnOffers));
         this._communication.addHabboConnectionMessageEvent(new MarketplaceBuyOfferResultEvent(this.onMarketPlaceBuyResult));
         this._communication.addHabboConnectionMessageEvent(new MarketplaceCancelOfferResultEvent(this.onMarketPlaceCancelResult));
         this._communication.addHabboConnectionMessageEvent(new GiftWrappingConfigurationEvent(this.onGiftWrappingConfiguration));
         this._communication.addHabboConnectionMessageEvent(new MarketplaceItemStatsEvent(this.onMarketplaceItemStats));
         this._communication.addHabboConnectionMessageEvent(new IsOfferGiftableMessageEvent(this.onIsOfferGiftable));
         this._communication.addHabboConnectionMessageEvent(new MarketplaceConfigurationEvent(this.onMarketplaceConfiguration));
         this._communication.addHabboConnectionMessageEvent(new MarketplaceMakeOfferResult(this.onMarketplaceMakeOfferResult));
         this._communication.addHabboConnectionMessageEvent(new HabboClubOffersMessageEvent(this.onHabboClubOffers));
         this._communication.addHabboConnectionMessageEvent(new ChargeInfoMessageEvent(this.onChargeInfo));
         this._communication.addHabboConnectionMessageEvent(new CloseConnectionMessageEvent(this.onRoomExit));
         this._communication.addHabboConnectionMessageEvent(new SellablePetBreedsMessageEvent(this.onSellableBreeds));
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._toolbar = param2 as IHabboToolbar;
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_49,this.onHabboToolbarEvent);
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_169 = param2 as IHabboConfigurationManager;
         this.var_2328 = this.isNewItemsNotificationEnabled();
         this.initializeRoomPreviewer();
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._localization = param2 as ICoreLocalizationManager;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_13 = param2 as IHabboInventory;
         this.var_13.events.addEventListener(HabboInventoryItemAddedEvent.HABBO_INVENTORY_ITEM_ADDED,this.onItemAddedToInventory);
      }
      
      private function sessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_365 = param2 as ISessionDataManager;
         this.var_365.loadProductData(this);
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_1001 = param2 as IAvatarRenderManager;
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._roomEngine = param2 as IRoomEngine;
         this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_139,this.onObjectPlaced);
         this.initializeRoomPreviewer();
      }
      
      private function onSoundManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._soundManager = param2 as IHabboSoundManager;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_75,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_83,this.onRoomSessionEvent);
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._friendList = param2 as IHabboFriendList;
      }
      
      private function initializeRoomPreviewer() : void
      {
         if(this._roomEngine != null && this.var_169 != null && this.var_169.getKey("catalog.furniture.animation","PresentHandler") == "true")
         {
            if(this.var_622 == null)
            {
               this.var_622 = new RoomPreviewer(this._roomEngine);
            }
         }
      }
      
      private function isNewItemsNotificationEnabled() : Boolean
      {
         return this.var_169.getKey("toolbar.new_additions.notification.enabled","PresentHandler") == "true";
      }
      
      public function openCatalog() : void
      {
         this.cancelFurniInMover();
         this.toggleCatalog(true);
      }
      
      public function openCatalogPage(param1:String, param2:Boolean = false) : void
      {
         this.cancelFurniInMover();
         if(param2)
         {
            param1 = this.getLocalizedPageName(param1);
         }
         if(!this.var_821)
         {
            this.toggleCatalog();
            this.var_942 = -1;
            this.var_765 = param1;
         }
         else
         {
            this.toggleCatalog(true);
            this.var_314.openPage(param1);
         }
      }
      
      public function openCatalogPageById(param1:int, param2:int) : void
      {
         if(this.var_821)
         {
            this.toggleCatalog(true);
            this.var_314.openPageById(param1,param2);
         }
         else
         {
            this.toggleCatalog();
            this.var_942 = param1;
            this.var_1744 = param2;
            this.var_765 = null;
         }
      }
      
      private function getLocalizedPageName(param1:String) : String
      {
         var _loc2_:ILocalization = this._localization.getLocalization(param1);
         if(_loc2_ != null)
         {
            param1 = _loc2_.value;
         }
         return param1;
      }
      
      public function openInventoryCategory(param1:String) : void
      {
         if(this.var_13 == null)
         {
            return;
         }
         this.var_13.toggleInventoryPage(param1);
      }
      
      public function openCreditsHabblet() : void
      {
         var _loc2_:* = null;
         if(this.var_169 == null)
         {
            return;
         }
         var _loc1_:* = this.var_169.getKey("client.credits.embed.enabled","PresentHandler") == "true";
         if(false && _loc1_)
         {
            ExternalInterface.call("FlashExternalInterface.openHabblet","credits");
         }
         else
         {
            _loc2_ = this.var_169.getKey("link.format.credits","/credits");
            this._windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,this.onExternalLink);
            HabboWebTools.navigateToURL(_loc2_,"habboMain");
         }
      }
      
      public function setupInventoryForRecycler(param1:Boolean) : void
      {
         if(this.var_13 == null)
         {
            return;
         }
         this.var_13.setupRecycler(param1);
      }
      
      public function get privateRoomSessionActive() : Boolean
      {
         return this.var_1745;
      }
      
      public function get tradingActive() : Boolean
      {
         if(this.var_13 == null)
         {
            return false;
         }
         return this.var_13.tradingActive;
      }
      
      public function requestInventoryFurniToRecycler() : int
      {
         if(this.var_13 == null)
         {
            return 0;
         }
         return this.var_13.requestSelectedFurniToRecycler();
      }
      
      public function returnInventoryFurniFromRecycler(param1:int) : Boolean
      {
         if(this.var_13 == null)
         {
            return false;
         }
         return this.var_13.returnInventoryFurniFromRecycler(param1);
      }
      
      public function getProductData(param1:String) : IProductData
      {
         return this.var_365.getProductData(param1);
      }
      
      public function getFurnitureData(param1:int, param2:String) : IFurnitureData
      {
         var _loc3_:* = null;
         if(param2 == ProductTypeEnum.const_72)
         {
            _loc3_ = this.var_365.getFloorItemData(param1);
         }
         if(param2 == ProductTypeEnum.const_63)
         {
            _loc3_ = this.var_365.getWallItemData(param1);
         }
         return _loc3_;
      }
      
      public function getPurse() : IPurse
      {
         return this.var_115;
      }
      
      public function getRecycler() : IRecycler
      {
         return this.var_102;
      }
      
      public function getMarketPlace() : IMarketPlace
      {
         return this.var_148;
      }
      
      public function getClubGiftController() : ClubGiftController
      {
         return this.var_1157;
      }
      
      public function getClubBuyController() : ClubBuyController
      {
         return this.var_529;
      }
      
      public function getPublicMarketPlaceOffers(param1:int, param2:int, param3:String, param4:int) : void
      {
         this._communication.getHabboMainConnection(null).send(new GetOffersMessageComposer(param1,param2,param3,param4));
      }
      
      public function getOwnMarketPlaceOffers() : void
      {
         this._communication.getHabboMainConnection(null).send(new GetOwnOffersMessageComposer());
      }
      
      public function buyMarketPlaceOffer(param1:int) : void
      {
         this._communication.getHabboMainConnection(null).send(new BuyOfferMessageComposer(param1));
      }
      
      public function redeemSoldMarketPlaceOffers() : void
      {
         this._communication.getHabboMainConnection(null).send(new RedeemOfferCreditsMessageComposer());
      }
      
      public function redeemExpiredMarketPlaceOffer(param1:int) : void
      {
         this._communication.getHabboMainConnection(null).send(new CancelOfferMessageComposer(param1));
      }
      
      public function getMarketplaceItemStats(param1:int, param2:int) : void
      {
         if(!this._communication)
         {
            return;
         }
         var _loc3_:IConnection = this._communication.getHabboMainConnection(null);
         if(!_loc3_)
         {
            return;
         }
         _loc3_.send(new GetMarketplaceItemStatsComposer(param1,param2));
      }
      
      public function getPixelEffectIcon(param1:int) : BitmapData
      {
         var _loc2_:BitmapDataAsset = (this.var_13 as Component).assets.getAssetByName("fx_icon_" + param1 + "_png") as BitmapDataAsset;
         if(_loc2_ != null)
         {
            return (_loc2_.content as BitmapData).clone();
         }
         return new BitmapData(1,1,true,16777215);
      }
      
      public function getSubscriptionProductIcon(param1:int) : BitmapData
      {
         var _loc2_:BitmapDataAsset = assets.getAssetByName("ctlg_icon_deal_hc") as BitmapDataAsset;
         if(_loc2_ != null)
         {
            return (_loc2_.content as BitmapData).clone();
         }
         return new BitmapData(1,1,true,16777215);
      }
      
      public function getSellablePetBreeds(param1:String) : Array
      {
         var _loc2_:Array = this.var_764.getValue(param1);
         if(_loc2_ != null)
         {
            return _loc2_.slice();
         }
         this._communication.getHabboMainConnection(null).send(new GetSellablePetBreedsComposer(param1));
         return null;
      }
      
      private function updatePurse() : void
      {
         var _loc2_:* = null;
         if(this._mainContainer == null)
         {
            return;
         }
         this._localization.registerParameter("catalog.purse.creditbalance","balance",String(this.var_115.credits));
         this._localization.registerParameter("catalog.purse.pixelbalance","balance",String(this.var_115.getActivityPointsForType(ActivityPointTypeEnum.PIXEL)));
         var _loc1_:int = 0;
         if(!this.var_115.hasClubLeft)
         {
            _loc2_ = "catalog.purse.club.join";
         }
         else
         {
            if(this.var_115.isVIP)
            {
               _loc2_ = "catalog.purse.vipdays";
               _loc1_ = 0;
            }
            else
            {
               _loc2_ = "catalog.purse.clubdays";
            }
            this._localization.registerParameter(_loc2_,"days",String(this.var_115.clubDays));
            this._localization.registerParameter(_loc2_,"months",String(this.var_115.clubPeriods));
         }
         var _loc3_:IIconWindow = this._mainContainer.findChildByName("clubIcon") as IIconWindow;
         if(_loc3_)
         {
            _loc3_.style = _loc1_;
         }
         var _loc4_:ITextWindow = this._mainContainer.findChildByName("clubText") as ITextWindow;
         if(_loc4_)
         {
            _loc4_.caption = this._localization.getKey(_loc2_);
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.iconId == HabboToolbarIconEnum.CATALOGUE && param1.type == HabboToolbarEvent.const_49)
         {
            this.toggleCatalog();
         }
      }
      
      private function toggleCatalog(param1:Boolean = false) : void
      {
         this.cancelFurniInMover();
         if(this._mainContainer == null)
         {
            return;
         }
         if(!this.mainWindowVisible() || param1)
         {
            if(this.var_1449)
            {
               this.var_1449 = false;
               events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_NEW_ITEMS_HIDE));
               this.markAvailableItemsViewed();
            }
            this.showMainWindow();
         }
         else if(!WindowToggle.isHiddenByOtherWindows(this._mainContainer))
         {
            this.hideMainWindow();
         }
         if(this.mainWindowVisible())
         {
            this._mainContainer.activate();
            HabboTracking.getInstance().trackGoogle("catalogue","open");
         }
         if(this.mainWindowVisible())
         {
            events.dispatchEvent(new Event(HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_OPEN));
            if(this.var_102 != null && this.getCurrentLayoutCode() == "recycler")
            {
               this.var_102.activate();
            }
         }
         else
         {
            events.dispatchEvent(new Event(HabboCatalogTrackingEvent.HABBO_CATALOG_TRACKING_EVENT_CLOSE));
            if(this.var_102 != null && this.getCurrentLayoutCode() == "recycler")
            {
               this.var_102.cancel();
            }
         }
         this.setupInventoryForRecycler(this.var_102.active && this.mainWindowVisible());
      }
      
      private function getCurrentLayoutCode() : String
      {
         if(this.var_212 == null)
         {
            return "";
         }
         return this.var_212.getCurrentLayoutCode();
      }
      
      private function refreshCatalogIndex() : void
      {
         this._communication.getHabboMainConnection(null).send(new GetCatalogIndexComposer());
      }
      
      private function markAvailableItemsViewed() : void
      {
         this._communication.getHabboMainConnection(null).send(new GetNewAvailableItemsViewedComposer());
      }
      
      private function createCatalogNavigator() : void
      {
         var _loc1_:IWindowContainer = this._mainContainer.findChildByName("navigatorMain") as IWindowContainer;
         this.var_314 = new CatalogNavigator(this,_loc1_) as ICatalogNavigator;
         var _loc2_:BitmapDataAsset = assets.getAssetByName("purse_coins_small") as BitmapDataAsset;
         this.setElementImage("creditsIcon",_loc2_.content as BitmapData);
         var _loc3_:BitmapDataAsset = assets.getAssetByName("purse_pixels_small") as BitmapDataAsset;
         this.setElementImage("pixelsIcon",_loc3_.content as BitmapData);
         var _loc4_:BitmapDataAsset = assets.getAssetByName("purse_club_small") as BitmapDataAsset;
         this.setElementImage("clubIcon",_loc4_.content as BitmapData);
      }
      
      private function createCatalogViewer() : void
      {
         var _loc1_:IWindowContainer = this._mainContainer.findChildByName("layoutContainer") as IWindowContainer;
         this.var_212 = new CatalogViewer(this,_loc1_,this._roomEngine);
         this.var_212.habboCatalog = this;
      }
      
      private function createMainWindow() : void
      {
         var _loc1_:XmlAsset = assets.getAssetByName("catalog") as XmlAsset;
         this._mainContainer = this._windowManager.buildFromXML(_loc1_.content as XML,const_671) as IWindowContainer;
         this._mainContainer.tags.push("habbo_catalog");
         this._mainContainer.position = this.const_2021;
         this.hideMainWindow();
         var _loc2_:BitmapDataAsset = assets.getAssetByName("layout_bg") as BitmapDataAsset;
         this.setElementImage("layoutBackground",_loc2_.content as BitmapData);
         var _loc3_:IWindowContainer = this._mainContainer.findChildByName("navigatorMain") as IWindowContainer;
         _loc3_.setParamFlag(WindowParam.const_246,false);
         var _loc4_:IWindow = this._mainContainer.findChildByName("titlebar_close_button");
         if(_loc4_ == null)
         {
            _loc4_ = this._mainContainer.findChildByTag("close");
         }
         if(_loc4_ != null)
         {
            _loc4_.procedure = this.onWindowClose;
         }
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_75:
               this.var_1745 = param1.session.isPrivateRoom;
               this.var_1158 = param1.session;
               if(this.var_102 != null)
               {
                  this.var_102.setRoomSessionActive(true);
               }
               break;
            case RoomSessionEvent.const_83:
               this.var_1745 = false;
               this.var_1158 = null;
               if(this.var_102 != null)
               {
                  this.var_102.setRoomSessionActive(false);
               }
         }
      }
      
      private function createRecycler() : void
      {
         this.var_102 = new RecyclerLogic(this,this._windowManager);
         this.getRecyclerPrizes();
      }
      
      private function createMarketPlace() : void
      {
         if(this.var_148 == null)
         {
            this.var_148 = new MarketPlaceLogic(this,this._windowManager,this._roomEngine);
         }
      }
      
      private function createClubGiftController() : void
      {
         if(this.var_1157 == null)
         {
            this.var_1157 = new ClubGiftController(this);
         }
      }
      
      private function createClubBuyController() : void
      {
         if(this.var_529 == null)
         {
            this.var_529 = new ClubBuyController(this);
         }
      }
      
      private function getGiftWrappingConfiguration() : void
      {
         var _loc1_:IConnection = this._communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new GetGiftWrappingConfigurationComposer());
      }
      
      public function getHabboClubOffers() : void
      {
         var _loc1_:IConnection = this._communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new GetClubOffersMessageComposer());
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideMainWindow();
         if(this.var_212 != null)
         {
            this.var_212.catalogWindowClosed();
         }
         if(this.var_102 != null && this.getCurrentLayoutCode() == "recycler")
         {
            this.var_102.cancel();
            this.setupInventoryForRecycler(false);
         }
      }
      
      private function onCatalogIndex(param1:IMessageEvent) : void
      {
         if(param1 as CatalogIndexMessageEvent == null)
         {
            return;
         }
         if(this.var_314 == null)
         {
            return;
         }
         var _loc2_:NodeData = (param1 as CatalogIndexMessageEvent).root;
         this.var_1449 = (param1 as CatalogIndexMessageEvent).newAdditionsAvailable;
         this.var_314.buildCatalogIndex(_loc2_);
         if(this.var_765 && this.var_765 != "")
         {
            this.var_314.openPage(this.var_765);
            this.var_765 = "";
            this.var_942 = -1;
         }
         else if(this.var_942 > -1)
         {
            this.var_314.openPageById(this.var_942,this.var_1744);
            this.var_942 = -1;
            this.var_1744 = -1;
            this.var_765 = "";
         }
         else if(this.var_1449 && this.var_2328)
         {
            events.dispatchEvent(new CatalogEvent(CatalogEvent.CATALOG_NEW_ITEMS_SHOW));
            this.var_314.loadNewAdditionsPage(this.getLocalizedPageName(CatalogPageName.const_1933));
         }
         else
         {
            this.var_314.loadFrontPage();
         }
      }
      
      private function onCatalogPage(param1:IMessageEvent) : void
      {
         var _loc2_:CatalogPageMessageEvent = param1 as CatalogPageMessageEvent;
         var _loc3_:CatalogPageMessageParser = _loc2_.getParser();
         var _loc4_:int = _loc3_.pageId;
         var _loc5_:String = _loc3_.layoutCode;
         var _loc6_:Array = _loc3_.localization.images.concat();
         var _loc7_:Array = _loc3_.localization.texts.concat();
         var _loc8_:IPageLocalization = new PageLocalization(_loc6_,_loc7_);
         var _loc9_:int = _loc3_.offerId;
         this.var_212.showCatalogPage(_loc4_,_loc5_,_loc8_,_loc3_.offers,_loc9_);
      }
      
      private function onCatalogPublished(param1:IMessageEvent) : void
      {
         var _loc2_:Boolean = false;
         if(this._mainContainer != null)
         {
            _loc2_ = this.mainWindowVisible();
         }
         this.reset();
         if(_loc2_)
         {
            this._windowManager.alert("${catalog.alert.published.title}","${catalog.alert.published.description}",0,this.alertDialogEventProcessor);
         }
      }
      
      private function onPurchaseError(param1:IMessageEvent) : void
      {
         this._windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.purchaseerror.description}",0,this.alertDialogEventProcessor);
      }
      
      private function onPurchaseNotAllowed(param1:IMessageEvent) : void
      {
         var _loc2_:PurchaseNotAllowedMessageEvent = param1 as PurchaseNotAllowedMessageEvent;
         var _loc3_:PurchaseNotAllowedMessageParser = _loc2_.getParser();
         var _loc4_:int = _loc3_.errorCode;
         var _loc5_:String = "";
         switch(_loc4_)
         {
            case 1:
               _loc5_ = "${catalog.alert.purchasenotallowed.hc.description}";
               break;
            default:
               _loc5_ = "${catalog.alert.purchasenotallowed.unknown.description}";
         }
         this._windowManager.alert("${catalog.alert.purchasenotallowed.title}",_loc5_,0,this.alertDialogEventProcessor);
      }
      
      private function onPurchaseOK(param1:IMessageEvent) : void
      {
         if(this.var_195 != null)
         {
            this.var_195.dispose();
         }
         this.var_195 = null;
      }
      
      private function onGiftReceiverNotFound(param1:GiftReceiverNotFoundEvent) : void
      {
         if(this.var_195 != null)
         {
            this.var_195.receiverNotFound();
         }
      }
      
      private function onNotEnoughBalance(param1:IMessageEvent) : void
      {
         var _loc2_:NotEnoughBalanceMessageEvent = param1 as NotEnoughBalanceMessageEvent;
         var _loc3_:NotEnoughBalanceMessageParser = _loc2_.getParser();
         if(_loc3_.notEnoughCredits > 0)
         {
            this.showNotEnoughCreditsAlert();
         }
         else if(_loc3_.notEnoughActivityPoints > 0)
         {
            this.showNotEnoughActivityPointsAlert(_loc3_.activityPointType);
         }
         if(this.var_195 != null)
         {
            this.var_195.notEnoughCredits();
         }
      }
      
      public function showNotEnoughCreditsAlert() : void
      {
         if(!this._windowManager)
         {
            return;
         }
         this._windowManager.confirm("${catalog.alert.notenough.title}","${catalog.alert.notenough.credits.description}",0,this.noCreditsConfirmDialogEventProcessor);
      }
      
      private function showNotEnoughActivityPointsAlert(param1:int) : void
      {
         var _loc2_:String = "catalog.alert.notenough.activitypoints.title." + param1;
         var _loc3_:String = "catalog.alert.notenough.activitypoints.description." + param1;
         if(param1 == 0)
         {
            this._windowManager.confirm(this.localization.getKey(_loc2_),this.localization.getKey(_loc3_),0,this.noPixelsConfirmDialogEventProcessor);
         }
         else
         {
            this._windowManager.alert(this.localization.getKey(_loc2_),this.localization.getKey(_loc3_),0,this.alertDialogEventProcessor);
         }
      }
      
      private function onVoucherRedeemOk(param1:VoucherRedeemOkMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:* = "${catalog.alert.voucherredeem.ok.description}";
         if(param1.productName != "")
         {
            _loc2_ = "catalog.alert.voucherredeem.ok.description.furni";
            this._localization.registerParameter(_loc2_,"productName",param1.productName);
            this._localization.registerParameter(_loc2_,"productDescription",param1.productDescription);
            _loc2_ = "${" + _loc2_ + "}";
         }
         this._windowManager.alert("${catalog.alert.voucherredeem.ok.title}",_loc2_,0,this.alertDialogEventProcessor);
      }
      
      private function onVoucherRedeemError(param1:VoucherRedeemErrorMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:* = "${catalog.alert.voucherredeem.error.description." + param1.errorCode + "}";
         this._windowManager.alert("${catalog.alert.voucherredeem.error.title}",_loc3_,0,this.alertDialogEventProcessor);
      }
      
      private function onApproveNameResult(param1:ApproveNameMessageEvent) : void
      {
         if(param1 == null || this.var_212 == null)
         {
            return;
         }
         var _loc2_:ApproveNameMessageParser = param1.getParser();
         this.var_212.dispatchWidgetEvent(new CatalogWidgetApproveNameResultEvent(_loc2_.result,_loc2_.nameValidationInfo));
      }
      
      private function onCreditBalance(param1:IMessageEvent) : void
      {
         var _loc2_:CreditBalanceEvent = param1 as CreditBalanceEvent;
         var _loc3_:CreditBalanceParser = _loc2_.getParser();
         this.var_115.credits = _loc3_.balance;
         this.updatePurse();
         if(!this.var_2329 && this._soundManager != null)
         {
            this._soundManager.playSound(HabboSoundTypesEnum.const_1210);
         }
         this.var_2329 = false;
         if(this.var_213 != null && !this.var_213.disposed)
         {
            this.var_213.refresh();
         }
         events.dispatchEvent(new PurseEvent(PurseEvent.const_74,this.var_115.credits));
      }
      
      private function onActivityPointNotification(param1:IMessageEvent) : void
      {
         var _loc2_:HabboActivityPointNotificationMessageEvent = param1 as HabboActivityPointNotificationMessageEvent;
         this.var_115.activityPoints[_loc2_.type] = _loc2_.amount;
         this.updatePurse();
         if(!this.var_2326 && this._soundManager != null)
         {
            this._soundManager.playSound(HabboSoundTypesEnum.const_1292);
         }
         this.var_2326 = false;
         if(this.var_213 != null && !this.var_213.disposed)
         {
            this.var_213.refresh();
         }
         if(_loc2_.type == ActivityPointTypeEnum.PIXEL)
         {
            events.dispatchEvent(new PurseEvent(PurseEvent.const_115,_loc2_.amount));
         }
      }
      
      private function onActivityPoints(param1:IMessageEvent) : void
      {
         var _loc2_:ActivityPointsMessageEvent = param1 as ActivityPointsMessageEvent;
         this.var_115.activityPoints = _loc2_.points;
         this.updatePurse();
         if(_loc2_.points["null"] != null)
         {
            events.dispatchEvent(new PurseEvent(PurseEvent.const_115,_loc2_.points["null"]));
         }
      }
      
      private function onSubscriptionInfo(param1:IMessageEvent) : void
      {
         var _loc2_:ScrSendUserInfoMessageParser = (param1 as ScrSendUserInfoEvent).getParser();
         this.var_115.clubDays = Math.max(0,_loc2_.daysToPeriodEnd);
         this.var_115.clubPeriods = Math.max(0,_loc2_.periodsSubscribedAhead);
         this.var_115.isVIP = _loc2_.isVIP;
         this.var_115.pastClubDays = _loc2_.pastClubDays;
         this.var_115.pastVipDays = _loc2_.pastVipDays;
         this.updatePurse();
         if(_loc2_.responseType == 2)
         {
            this.reset();
            this.toggleCatalog(true);
         }
      }
      
      private function onClubGiftInfo(param1:ClubGiftInfoEvent) : void
      {
         if(!param1 || !this.var_1157)
         {
            return;
         }
         var _loc2_:ClubGiftInfoParser = param1.getParser();
         if(!_loc2_)
         {
            return;
         }
         this.var_1157.setInfo(_loc2_.daysUntilNextGift,_loc2_.giftsAvailable,_loc2_.offers,_loc2_.giftData);
      }
      
      private function onRecyclerStatus(param1:IMessageEvent) : void
      {
         var _loc2_:RecyclerStatusMessageParser = (param1 as RecyclerStatusMessageEvent).getParser();
         if(_loc2_ == null || this.var_102 == null)
         {
            return;
         }
         this.var_102.setSystemStatus(_loc2_.recyclerStatus,_loc2_.recyclerTimeoutSeconds);
      }
      
      private function onRecyclerFinished(param1:IMessageEvent) : void
      {
         var _loc2_:RecyclerFinishedMessageParser = (param1 as RecyclerFinishedMessageEvent).getParser();
         if(_loc2_ == null || this.var_102 == null)
         {
            return;
         }
         this.var_102.setFinished(_loc2_.recyclerFinishedStatus,_loc2_.prizeId);
      }
      
      private function onRecyclerPrizes(param1:IMessageEvent) : void
      {
         var _loc2_:RecyclerPrizesMessageParser = (param1 as RecyclerPrizesMessageEvent).getParser();
         if(_loc2_ == null || this.var_102 == null)
         {
            return;
         }
         this.var_102.storePrizeTable(_loc2_.prizeLevels);
      }
      
      private function onMarketPlaceOffers(param1:IMessageEvent) : void
      {
         if(this.var_148 != null)
         {
            this.var_148.onOffers(param1);
         }
      }
      
      private function onMarketPlaceOwnOffers(param1:IMessageEvent) : void
      {
         if(this.var_148 != null)
         {
            this.var_148.onOwnOffers(param1);
         }
      }
      
      private function onMarketPlaceBuyResult(param1:IMessageEvent) : void
      {
         if(this.var_148 != null)
         {
            this.var_148.onBuyResult(param1);
         }
      }
      
      private function onMarketPlaceCancelResult(param1:IMessageEvent) : void
      {
         if(this.var_148 != null)
         {
            this.var_148.onCancelResult(param1);
         }
      }
      
      private function onGiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_2327 = new GiftWrappingConfiguration(param1);
      }
      
      private function onIsOfferGiftable(param1:IsOfferGiftableMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_195 != null)
         {
            this.var_195.onIsOfferGiftable(param1.getParser());
         }
      }
      
      private function onMarketplaceItemStats(param1:MarketplaceItemStatsEvent) : void
      {
         if(!param1 || !this.var_148)
         {
            return;
         }
         var _loc2_:MarketplaceItemStatsParser = param1.getParser();
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:MarketplaceItemStats = new MarketplaceItemStats();
         _loc3_.averagePrice = _loc2_.averagePrice;
         _loc3_.offerCount = _loc2_.offerCount;
         _loc3_.historyLength = _loc2_.historyLength;
         _loc3_.dayOffsets = _loc2_.dayOffsets;
         _loc3_.averagePrices = _loc2_.averagePrices;
         _loc3_.soldAmounts = _loc2_.soldAmounts;
         _loc3_.furniCategoryId = _loc2_.furniCategoryId;
         _loc3_.furniTypeId = _loc2_.furniTypeId;
         this.var_148.itemStats = _loc3_;
      }
      
      private function onMarketplaceConfiguration(param1:MarketplaceConfigurationEvent) : void
      {
         if(!param1 || !this.var_148)
         {
            return;
         }
         var _loc2_:MarketplaceConfigurationParser = param1.getParser();
         if(!_loc2_)
         {
            return;
         }
         this.var_148.averagePricePeriod = _loc2_.averagePricePeriod;
      }
      
      private function onMarketplaceMakeOfferResult(param1:MarketplaceMakeOfferResult) : void
      {
         if(!param1 || !this.var_148)
         {
            return;
         }
         var _loc2_:MarketplaceMakeOfferResultParser = param1.getParser();
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.result == 1)
         {
            this.var_148.refreshOffers();
         }
      }
      
      private function onHabboClubOffers(param1:HabboClubOffersMessageEvent) : void
      {
         if(this.var_529 != null)
         {
            this.var_529.onOffers(param1);
         }
      }
      
      private function onChargeInfo(param1:ChargeInfoMessageEvent) : void
      {
         var _loc2_:ChargeInfo = param1.getParser().chargeInfo;
         if(this.var_213 == null || this.var_213.disposed)
         {
            this.var_213 = new ChargeConfirmationDialog(this,this._localization);
         }
         this.var_213.showChargeInfo(_loc2_);
      }
      
      private function onRoomExit(param1:IMessageEvent) : void
      {
         if(this.var_213 != null)
         {
            this.var_213.close();
         }
      }
      
      private function onSellableBreeds(param1:SellablePetBreedsMessageEvent) : void
      {
         var _loc2_:SellablePetBreedsParser = param1.getParser();
         this.var_764.remove(_loc2_.productCode);
         var _loc3_:Array = _loc2_.sellableBreeds;
         if(_loc3_ != null)
         {
            this.var_764.add(_loc2_.productCode,_loc3_.slice());
            this.var_212.dispatchWidgetEvent(new CatalogWidgetSellablePetBreedsEvent(_loc2_.productCode,_loc3_.slice()));
         }
      }
      
      private function setElementImage(param1:String, param2:BitmapData) : void
      {
         var _loc3_:IBitmapWrapperWindow = this._mainContainer.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ != null)
         {
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            _loc3_.bitmap.copyPixels(param2,param2.rect,new Point(0,0));
         }
         else
         {
            Logger.log("Could not find element: " + param1);
         }
      }
      
      private function alertDialogEventProcessor(param1:IAlertDialog, param2:WindowEvent) : void
      {
         param1.dispose();
         this.resetPlacedOfferData();
      }
      
      private function noCreditsConfirmDialogEventProcessor(param1:IConfirmDialog, param2:WindowEvent) : void
      {
         var _loc3_:* = null;
         param1.dispose();
         this.resetPlacedOfferData();
         if(param2.type == WindowEvent.const_177)
         {
            if(false && "true" == this.var_169.getKey("client.credits.embed.enabled"))
            {
               ExternalInterface.call("FlashExternalInterface.openHabblet","credits");
            }
            else
            {
               _loc3_ = this.var_169.getKey("link.format.credits");
               if(_loc3_ != "")
               {
                  this._windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,this.onExternalLink);
                  HabboWebTools.navigateToURL(_loc3_,"habboMain");
               }
            }
         }
      }
      
      private function noPixelsConfirmDialogEventProcessor(param1:IConfirmDialog, param2:WindowEvent) : void
      {
         var _loc3_:* = null;
         param1.dispose();
         this.resetPlacedOfferData();
         if(param2.type == WindowEvent.const_177)
         {
            _loc3_ = this.var_169.getKey("link.format.pixels");
            if(_loc3_ != "")
            {
               this._windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,this.onExternalLink);
               HabboWebTools.navigateToURL(_loc3_,"habboMain");
            }
         }
      }
      
      private function onExternalLink(param1:IAlertDialog, param2:WindowEvent) : void
      {
         param1.dispose();
      }
      
      public function redeemVoucher(param1:String) : void
      {
         var _loc2_:* = new RedeemVoucherMessageComposer(param1);
         this._communication.getHabboMainConnection(null).send(_loc2_);
         _loc2_.dispose();
         _loc2_ = null;
      }
      
      public function productDataReady() : void
      {
         this.init();
      }
      
      public function isDraggable(param1:Offer) : Boolean
      {
         if(!this.var_169.keyExists("catalog.drag_and_drop") || this.var_169.getKey("catalog.drag_and_drop") != "true")
         {
            return false;
         }
         if(!this.var_1158 || !this.var_1158.isRoomOwner)
         {
            return false;
         }
         var _loc2_:IProduct = param1.productContainer.firstProduct;
         var _loc3_:Boolean = true;
         switch(_loc2_.productType)
         {
            case ProductTypeEnum.const_179:
               _loc3_ = false;
               break;
            case ProductTypeEnum.const_372:
               _loc3_ = false;
         }
         return _loc3_;
      }
      
      private function updateRoom(param1:String, param2:String) : void
      {
         var _loc3_:String = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId,this._roomEngine.activeRoomCategory,RoomObjectVariableEnum.const_199);
         var _loc4_:String = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId,this._roomEngine.activeRoomCategory,RoomObjectVariableEnum.const_215);
         var _loc5_:String = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId,this._roomEngine.activeRoomCategory,RoomObjectVariableEnum.const_218);
         _loc3_ = _loc3_ && _loc3_.length > 0 ? _loc3_ : "101";
         _loc4_ = _loc4_ && _loc4_.length > 0 ? _loc4_ : "101";
         _loc5_ = _loc5_ && _loc5_.length > 0 ? _loc5_ : "1.1";
         switch(param1)
         {
            case "floor":
               this._roomEngine.updateObjectRoom(this._roomEngine.activeRoomId,this._roomEngine.activeRoomCategory,param2,_loc3_,_loc5_,true);
               break;
            case "wallpaper":
               this._roomEngine.updateObjectRoom(this._roomEngine.activeRoomId,this._roomEngine.activeRoomCategory,_loc4_,param2,_loc5_,true);
               break;
            case "landscape":
               this._roomEngine.updateObjectRoom(this._roomEngine.activeRoomId,this._roomEngine.activeRoomCategory,_loc4_,_loc3_,param2,true);
               break;
            default:
               this._roomEngine.updateObjectRoom(this._roomEngine.activeRoomId,this._roomEngine.activeRoomCategory,_loc4_,_loc3_,_loc5_,true);
         }
      }
      
      public function requestSelectedItemToMover(param1:IDragAndDropDoneReceiver, param2:Offer) : void
      {
         var _loc4_:int = 0;
         if(!this.isDraggable(param2))
         {
            return;
         }
         var _loc3_:IProduct = param2.productContainer.firstProduct;
         switch(_loc3_.productType)
         {
            case ProductTypeEnum.const_72:
               _loc4_ = 0;
               break;
            case ProductTypeEnum.const_63:
               _loc4_ = 0;
         }
         var _loc5_:Boolean = this._roomEngine.initializeRoomObjectInsert(-param2.offerId,_loc4_,_loc3_.productClassId,_loc3_.extraParam.toString());
         if(_loc5_)
         {
            this.var_763 = param2;
            this.var_1450 = param1;
            this.hideMainWindow();
            this.var_1156 = true;
         }
      }
      
      private function onObjectPlaced(param1:RoomEngineObjectPlacedEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.var_1156 && param1.type == RoomEngineObjectEvent.const_139)
         {
            this.resetPlacedOfferData(true);
            if(this.var_763 == null || this.var_763.disposed)
            {
               this.resetObjectMover();
               return;
            }
            _loc2_ = param1.category;
            _loc3_ = this.var_763.productContainer.firstProduct;
            _loc4_ = false;
            if(_loc2_ == RoomObjectCategoryEnum.const_26)
            {
               switch(_loc3_.furnitureData.name)
               {
                  case "floor":
                  case "wallpaper":
                  case "landscape":
                     _loc4_ = param1.placedOnFloor || param1.placedOnWall;
                     break;
                  default:
                     _loc4_ = param1.placedInRoom;
               }
            }
            else
            {
               _loc4_ = param1.placedInRoom;
            }
            if(!_loc4_)
            {
               this.resetObjectMover();
               return;
            }
            this.var_64 = new PlacedObjectPurchaseData(param1.roomId,param1.roomCategory,param1.objectId,param1.category,param1.wallLocation,param1.x,param1.y,param1.direction,this.var_763);
            _loc5_ = this.var_1450;
            if(_loc5_ != null)
            {
               _loc5_.onDragAndDropDone(true);
            }
            if(_loc2_ == RoomObjectCategoryEnum.const_27)
            {
               this._roomEngine.addObjectFurniture(param1.roomId,param1.roomCategory,param1.objectId,_loc3_.productClassId,new Vector3d(param1.x,param1.y,param1.z),new Vector3d(param1.direction,0,0),0,"");
            }
            else if(_loc2_ == RoomObjectCategoryEnum.const_26)
            {
               switch(_loc3_.furnitureData.name)
               {
                  case "floor":
                  case "wallpaper":
                  case "landscape":
                     this.updateRoom(_loc3_.furnitureData.name,_loc3_.extraParam);
                     break;
                  default:
                     this._roomEngine.addObjectWallItem(param1.roomId,param1.roomCategory,param1.objectId,_loc3_.productClassId,new Vector3d(param1.x,param1.y,param1.z),new Vector3d(param1.direction * 45,0,0),0,param1.instanceData,false);
               }
            }
            _loc6_ = this._roomEngine.getRoomObject(param1.roomId,param1.roomCategory,param1.objectId,param1.category) as IRoomObjectController;
            if(_loc6_)
            {
               _loc6_.getModelController().setNumber(RoomObjectVariableEnum.const_323,0.5);
            }
         }
      }
      
      private function resetObjectMover() : void
      {
         this.var_1156 = false;
         this.showMainWindow();
         this.var_1450 = null;
      }
      
      public function syncPlacedOfferWithPurchase(param1:IPurchasableOffer) : void
      {
         if(this.var_64)
         {
            if(this.var_64.offerId != param1.offerId)
            {
               this.resetPlacedOfferData();
            }
         }
      }
      
      public function resetPlacedOfferData(param1:Boolean = false) : void
      {
         if(!param1)
         {
            this.resetObjectMover();
         }
         if(this.var_64 != null)
         {
            if(this.var_64.category == RoomObjectCategoryEnum.const_27)
            {
               this._roomEngine.disposeObjectFurniture(this.var_64.roomId,this.var_64.roomCategory,this.var_64.objectId);
            }
            else if(this.var_64.category == RoomObjectCategoryEnum.const_26)
            {
               switch(this.var_64.furniData.name)
               {
                  case "floor":
                  case "wallpaper":
                  case "landscape":
                     this.updateRoom("reset","");
                     break;
                  default:
                     this._roomEngine.method_2(this.var_64.roomId,this.var_64.roomCategory,this.var_64.objectId);
               }
            }
            else
            {
               this._roomEngine.deleteRoomObject(this.var_64.objectId,this.var_64.category);
            }
            this.var_64.dispose();
            this.var_64 = null;
         }
      }
      
      public function cancelFurniInMover() : void
      {
         if(this.var_763 != null)
         {
            this._roomEngine.cancelRoomObjectInsert();
            this.var_1156 = false;
            this.var_763 = null;
         }
      }
      
      private function onItemAddedToInventory(param1:HabboInventoryItemAddedEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(this.var_64 != null && this.var_64.productClassId == param1.classId)
         {
            if(this.var_64.roomCategory == this._roomEngine.activeRoomCategory && this.var_64.roomId == this._roomEngine.activeRoomId)
            {
               _loc2_ = param1.stripId;
               _loc3_ = this.var_64.category;
               _loc4_ = this.var_64.wallLocation;
               _loc5_ = this.var_64.x;
               _loc6_ = this.var_64.y;
               _loc7_ = this.var_64.direction;
               switch(param1.category)
               {
                  case FurniCategory.const_351:
                     _loc8_ = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId,this._roomEngine.activeRoomCategory,RoomObjectVariableEnum.const_215);
                     if(this.var_64.extraParameter != _loc8_)
                     {
                        this._communication.getHabboMainConnection(null).send(new RequestRoomPropertySet(_loc2_));
                     }
                     break;
                  case FurniCategory.const_334:
                     _loc9_ = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId,this._roomEngine.activeRoomCategory,RoomObjectVariableEnum.const_199);
                     if(this.var_64.extraParameter != _loc9_)
                     {
                        this._communication.getHabboMainConnection(null).send(new RequestRoomPropertySet(_loc2_));
                     }
                     break;
                  case FurniCategory.const_328:
                     _loc10_ = this._roomEngine.getRoomStringValue(this._roomEngine.activeRoomId,this._roomEngine.activeRoomCategory,RoomObjectVariableEnum.const_218);
                     if(this.var_64.extraParameter != _loc10_)
                     {
                        this._communication.getHabboMainConnection(null).send(new RequestRoomPropertySet(_loc2_));
                     }
                     break;
                  default:
                     this._communication.getHabboMainConnection(null).send(new PlaceObjectMessageComposer(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_));
               }
               this.resetPlacedOfferData();
            }
         }
      }
      
      public function setImageFromAsset(param1:IWindow, param2:String, param3:Function) : void
      {
         if(!param2 || !assets)
         {
            return;
         }
         var _loc4_:BitmapDataAsset = assets.getAssetByName(param2) as BitmapDataAsset;
         if(_loc4_ == null)
         {
            this.retrievePreviewAsset(param2,param3);
            return;
         }
         if(param1)
         {
            HabboCatalog.setElementImageCentered(param1,_loc4_.content as BitmapData);
         }
      }
      
      private function retrievePreviewAsset(param1:String, param2:Function) : void
      {
         if(!param1 || !assets)
         {
            return;
         }
         var _loc3_:String = this.var_169.getKey("image.library.catalogue.url");
         var _loc4_:* = _loc3_ + param1 + ".png";
         var _loc5_:URLRequest = new URLRequest(_loc4_);
         var _loc6_:AssetLoaderStruct = assets.loadAssetFromFile(param1,_loc5_,"image/png");
         if(!_loc6_)
         {
            return;
         }
         _loc6_.addEventListener(AssetLoaderEvent.ASSET_LOADER_EVENT_COMPLETE,param2);
      }
      
      private function showMainWindow() : void
      {
         var _loc1_:* = null;
         if(this._windowManager != null && this._mainContainer != null && this._mainContainer.parent == null)
         {
            _loc1_ = this._windowManager.getDesktop(const_671);
            if(_loc1_ != null)
            {
               _loc1_.addChild(this._mainContainer);
            }
         }
      }
      
      private function hideMainWindow() : void
      {
         var _loc1_:* = null;
         if(this._windowManager != null && this._mainContainer != null && this._mainContainer.parent != null)
         {
            _loc1_ = this._windowManager.getDesktop(const_671);
            if(_loc1_ != null)
            {
               _loc1_.removeChild(this._mainContainer);
               if(this.var_212 != null)
               {
                  this.var_212.catalogWindowClosed();
               }
            }
         }
      }
      
      private function mainWindowVisible() : Boolean
      {
         if(this._windowManager != null && this._mainContainer != null && this._mainContainer.parent != null)
         {
            return true;
         }
         return false;
      }
      
      public function update(param1:uint) : void
      {
         if(this.var_622 != null)
         {
            this.var_622.updatePreviewRoomView();
         }
      }
   }
}
