(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["main"],{

/***/ "./$$_lazy_route_resource lazy recursive":
/*!******************************************************!*\
  !*** ./$$_lazy_route_resource lazy namespace object ***!
  \******************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

function webpackEmptyAsyncContext(req) {
	// Here Promise.resolve().then() is used instead of new Promise() to prevent
	// uncaught exception popping up in devtools
	return Promise.resolve().then(function() {
		var e = new Error("Cannot find module '" + req + "'");
		e.code = 'MODULE_NOT_FOUND';
		throw e;
	});
}
webpackEmptyAsyncContext.keys = function() { return []; };
webpackEmptyAsyncContext.resolve = webpackEmptyAsyncContext;
module.exports = webpackEmptyAsyncContext;
webpackEmptyAsyncContext.id = "./$$_lazy_route_resource lazy recursive";

/***/ }),

/***/ "./src/app/app-routing.module.ts":
/*!***************************************!*\
  !*** ./src/app/app-routing.module.ts ***!
  \***************************************/
/*! exports provided: AppRoutingModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppRoutingModule", function() { return AppRoutingModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _trips_trips_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./trips/trips.component */ "./src/app/trips/trips.component.ts");





const routes = [
    { path: 'trip/:tripId', component: _trips_trips_component__WEBPACK_IMPORTED_MODULE_2__["TripsComponent"] }
];
class AppRoutingModule {
}
AppRoutingModule.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({ type: AppRoutingModule });
AppRoutingModule.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({ factory: function AppRoutingModule_Factory(t) { return new (t || AppRoutingModule)(); }, imports: [[_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forRoot(routes)],
        _angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](AppRoutingModule, { imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]], exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](AppRoutingModule, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"],
        args: [{
                imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forRoot(routes)],
                exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
            }]
    }], null, null); })();


/***/ }),

/***/ "./src/app/app.component.ts":
/*!**********************************!*\
  !*** ./src/app/app.component.ts ***!
  \**********************************/
/*! exports provided: AppComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppComponent", function() { return AppComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");



class AppComponent {
}
AppComponent.ɵfac = function AppComponent_Factory(t) { return new (t || AppComponent)(); };
AppComponent.ɵcmp = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineComponent"]({ type: AppComponent, selectors: [["app-root"]], decls: 1, vars: 0, template: function AppComponent_Template(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](0, "router-outlet");
    } }, directives: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterOutlet"]], styles: ["\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IiIsImZpbGUiOiJzcmMvYXBwL2FwcC5jb21wb25lbnQuc2NzcyJ9 */"] });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](AppComponent, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"],
        args: [{
                selector: 'app-root',
                templateUrl: './app.component.html',
                styleUrls: ['./app.component.scss']
            }]
    }], null, null); })();


/***/ }),

/***/ "./src/app/app.module.ts":
/*!*******************************!*\
  !*** ./src/app/app.module.ts ***!
  \*******************************/
/*! exports provided: AppModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "AppModule", function() { return AppModule; });
/* harmony import */ var _angular_platform_browser__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/platform-browser */ "./node_modules/@angular/platform-browser/__ivy_ngcc__/fesm2015/platform-browser.js");
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_google_maps__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/google-maps */ "./node_modules/@angular/google-maps/__ivy_ngcc__/fesm2015/google-maps.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/http.js");
/* harmony import */ var _app_routing_module__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./app-routing.module */ "./src/app/app-routing.module.ts");
/* harmony import */ var _app_component__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./app.component */ "./src/app/app.component.ts");
/* harmony import */ var _list_posts_list_posts_component__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ./list-posts/list-posts.component */ "./src/app/list-posts/list-posts.component.ts");
/* harmony import */ var _live_photo_live_photo_component__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ./live-photo/live-photo.component */ "./src/app/live-photo/live-photo.component.ts");
/* harmony import */ var _map_map_component__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ./map/map.component */ "./src/app/map/map.component.ts");
/* harmony import */ var _trips_trips_component__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! ./trips/trips.component */ "./src/app/trips/trips.component.ts");











class AppModule {
}
AppModule.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_1__["ɵɵdefineNgModule"]({ type: AppModule, bootstrap: [_app_component__WEBPACK_IMPORTED_MODULE_5__["AppComponent"]] });
AppModule.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_1__["ɵɵdefineInjector"]({ factory: function AppModule_Factory(t) { return new (t || AppModule)(); }, providers: [], imports: [[
            _app_routing_module__WEBPACK_IMPORTED_MODULE_4__["AppRoutingModule"],
            _angular_platform_browser__WEBPACK_IMPORTED_MODULE_0__["BrowserModule"],
            _angular_google_maps__WEBPACK_IMPORTED_MODULE_2__["GoogleMapsModule"],
            _angular_common_http__WEBPACK_IMPORTED_MODULE_3__["HttpClientModule"]
        ]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_1__["ɵɵsetNgModuleScope"](AppModule, { declarations: [_app_component__WEBPACK_IMPORTED_MODULE_5__["AppComponent"],
        _list_posts_list_posts_component__WEBPACK_IMPORTED_MODULE_6__["ListPostsComponent"],
        _live_photo_live_photo_component__WEBPACK_IMPORTED_MODULE_7__["LivePhotoComponent"],
        _map_map_component__WEBPACK_IMPORTED_MODULE_8__["MapComponent"],
        _trips_trips_component__WEBPACK_IMPORTED_MODULE_9__["TripsComponent"]], imports: [_app_routing_module__WEBPACK_IMPORTED_MODULE_4__["AppRoutingModule"],
        _angular_platform_browser__WEBPACK_IMPORTED_MODULE_0__["BrowserModule"],
        _angular_google_maps__WEBPACK_IMPORTED_MODULE_2__["GoogleMapsModule"],
        _angular_common_http__WEBPACK_IMPORTED_MODULE_3__["HttpClientModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_1__["ɵsetClassMetadata"](AppModule, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_1__["NgModule"],
        args: [{
                declarations: [
                    _app_component__WEBPACK_IMPORTED_MODULE_5__["AppComponent"],
                    _list_posts_list_posts_component__WEBPACK_IMPORTED_MODULE_6__["ListPostsComponent"],
                    _live_photo_live_photo_component__WEBPACK_IMPORTED_MODULE_7__["LivePhotoComponent"],
                    _map_map_component__WEBPACK_IMPORTED_MODULE_8__["MapComponent"],
                    _trips_trips_component__WEBPACK_IMPORTED_MODULE_9__["TripsComponent"]
                ],
                imports: [
                    _app_routing_module__WEBPACK_IMPORTED_MODULE_4__["AppRoutingModule"],
                    _angular_platform_browser__WEBPACK_IMPORTED_MODULE_0__["BrowserModule"],
                    _angular_google_maps__WEBPACK_IMPORTED_MODULE_2__["GoogleMapsModule"],
                    _angular_common_http__WEBPACK_IMPORTED_MODULE_3__["HttpClientModule"]
                ],
                providers: [],
                bootstrap: [_app_component__WEBPACK_IMPORTED_MODULE_5__["AppComponent"]]
            }]
    }], null, null); })();


/***/ }),

/***/ "./src/app/list-posts/list-posts.component.ts":
/*!****************************************************!*\
  !*** ./src/app/list-posts/list-posts.component.ts ***!
  \****************************************************/
/*! exports provided: ListPostsComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ListPostsComponent", function() { return ListPostsComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _services_post_service__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../services/post.service */ "./src/app/services/post.service.ts");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/common.js");
/* harmony import */ var _live_photo_live_photo_component__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../live-photo/live-photo.component */ "./src/app/live-photo/live-photo.component.ts");





function ListPostsComponent_div_1_Template(rf, ctx) { if (rf & 1) {
    const _r3 = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵgetCurrentView"]();
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "div", 2);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](1, "app-live-photo", 3);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("inView", function ListPostsComponent_div_1_Template_app_live_photo_inView_1_listener($event) { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵrestoreView"](_r3); const post_r1 = ctx.$implicit; const ctx_r2 = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵnextContext"](); return ctx_r2.postService.setCurrentPost($event, post_r1); });
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](2, "div", 4);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](3, "div", 5);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](4, "div");
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](5, "span", 6);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](6);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](7, "div");
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](8, "span", 7);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](9);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵpipe"](10, "date");
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](11, "div", 8);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
} if (rf & 2) {
    const post_r1 = ctx.$implicit;
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](1);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("media", post_r1.media);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](5);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtextInterpolate"](post_r1.position);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](3);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtextInterpolate"](_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵpipeBind2"](10, 4, post_r1.timeStamp, "shortTime"));
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](2);
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("innerHTML", post_r1.content, _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsanitizeHtml"]);
} }
class ListPostsComponent {
    constructor(postService) {
        this.postService = postService;
    }
}
ListPostsComponent.ɵfac = function ListPostsComponent_Factory(t) { return new (t || ListPostsComponent)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_services_post_service__WEBPACK_IMPORTED_MODULE_1__["PostService"])); };
ListPostsComponent.ɵcmp = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineComponent"]({ type: ListPostsComponent, selectors: [["app-list-posts"]], inputs: { posts: "posts" }, decls: 2, vars: 1, consts: [[1, "list-container"], ["class", "post", 4, "ngFor", "ngForOf"], [1, "post"], [3, "media", "inView"], [1, "content"], [1, "header"], [1, "badge"], [1, "date-time"], [1, "main", 3, "innerHTML"]], template: function ListPostsComponent_Template(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "div", 0);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtemplate"](1, ListPostsComponent_div_1_Template, 12, 7, "div", 1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    } if (rf & 2) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("ngForOf", ctx.posts);
    } }, directives: [_angular_common__WEBPACK_IMPORTED_MODULE_2__["NgForOf"], _live_photo_live_photo_component__WEBPACK_IMPORTED_MODULE_3__["LivePhotoComponent"]], pipes: [_angular_common__WEBPACK_IMPORTED_MODULE_2__["DatePipe"]], styles: [".list-container[_ngcontent-%COMP%] {\n  display: -ms-flexbox;\n  display: flex;\n  -ms-flex-direction: column;\n      flex-direction: column;\n  margin: 10px;\n}\n\n.header[_ngcontent-%COMP%] {\n  display: -ms-flexbox;\n  display: flex;\n  -ms-flex-direction: row;\n      flex-direction: row;\n  -ms-flex-pack: justify;\n      justify-content: space-between;\n}\n\n.header[_ngcontent-%COMP%]    > div[_ngcontent-%COMP%] {\n  padding: 10px;\n}\n\n.content[_ngcontent-%COMP%] {\n  font-family: \"Roboto Slab\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\n  position: relative;\n  z-index: 10;\n  width: 350px;\n  background-color: #fff;\n  padding-bottom: 20px;\n}\n\n@media (min-width: 600px) {\n  .content[_ngcontent-%COMP%] {\n    width: 500px;\n  }\n}\n\n@media (min-width: 645px) {\n  .content[_ngcontent-%COMP%] {\n    width: 645px;\n  }\n}\n\n.date-time[_ngcontent-%COMP%] {\n  display: block;\n  white-space: nowrap;\n  font-size: 14px;\n}\n\n.main[_ngcontent-%COMP%] {\n  padding: 20px 15px 10px 15px;\n  margin-bottom: 35px;\n  line-height: 1.7;\n  font-weight: normal;\n}\n\n.post[_ngcontent-%COMP%] {\n  margin-bottom: 500px;\n}\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9Vc2Vycy9zdGV2ZW4uY29va0BlZi5jb20vbGV0cy1maXNoL3RyaXBzLWFwcC9zcmMvYXBwL2xpc3QtcG9zdHMvbGlzdC1wb3N0cy5jb21wb25lbnQuc2NzcyIsInNyYy9hcHAvbGlzdC1wb3N0cy9saXN0LXBvc3RzLmNvbXBvbmVudC5zY3NzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0VBQ0ksb0JBQUE7RUFBQSxhQUFBO0VBQ0EsMEJBQUE7TUFBQSxzQkFBQTtFQUNBLFlBQUE7QUNDSjs7QURFQTtFQUNJLG9CQUFBO0VBQUEsYUFBQTtFQUNBLHVCQUFBO01BQUEsbUJBQUE7RUFDQSxzQkFBQTtNQUFBLDhCQUFBO0FDQ0o7O0FERUE7RUFDSSxhQUFBO0FDQ0o7O0FERUE7RUFDSSwwRUFBQTtFQUNBLGtCQUFBO0VBQ0EsV0FBQTtFQUNBLFlBQUE7RUFDQSxzQkFBQTtFQUNBLG9CQUFBO0FDQ0o7O0FER0E7RUFDSTtJQUNJLFlBQUE7RUNBTjtBQUNGOztBREdBO0VBQ0k7SUFDSSxZQUFBO0VDRE47QUFDRjs7QURLQTtFQUNJLGNBQUE7RUFDQSxtQkFBQTtFQUNBLGVBQUE7QUNISjs7QURPQTtFQUNJLDRCQUFBO0VBQ0EsbUJBQUE7RUFDQSxnQkFBQTtFQUNBLG1CQUFBO0FDSko7O0FEUUE7RUFDSSxvQkFBQTtBQ0xKIiwiZmlsZSI6InNyYy9hcHAvbGlzdC1wb3N0cy9saXN0LXBvc3RzLmNvbXBvbmVudC5zY3NzIiwic291cmNlc0NvbnRlbnQiOlsiLmxpc3QtY29udGFpbmVyIHtcbiAgICBkaXNwbGF5OiBmbGV4O1xuICAgIGZsZXgtZGlyZWN0aW9uOiBjb2x1bW47XG4gICAgbWFyZ2luOiAxMHB4O1xufVxuXG4uaGVhZGVyIHtcbiAgICBkaXNwbGF5OiBmbGV4O1xuICAgIGZsZXgtZGlyZWN0aW9uOiByb3c7XG4gICAganVzdGlmeS1jb250ZW50OiBzcGFjZS1iZXR3ZWVuO1xufVxuXG4uaGVhZGVyID4gZGl2IHtcbiAgICBwYWRkaW5nOiAxMHB4O1xufVxuXG4uY29udGVudCB7XG4gICAgZm9udC1mYW1pbHk6IFwiUm9ib3RvIFNsYWJcIiwgXCJIZWx2ZXRpY2EgTmV1ZVwiLCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmO1xuICAgIHBvc2l0aW9uOiByZWxhdGl2ZTtcbiAgICB6LWluZGV4OiAxMDtcbiAgICB3aWR0aDogMzUwcHg7XG4gICAgYmFja2dyb3VuZC1jb2xvcjogI2ZmZjtcbiAgICBwYWRkaW5nLWJvdHRvbTogMjBweDtcbn1cblxuXG5AbWVkaWEgKG1pbi13aWR0aDogNjAwcHgpIHtcbiAgICAuY29udGVudCB7XG4gICAgICAgIHdpZHRoOiA1MDBweDtcbiAgICB9XG59XG5cbkBtZWRpYSAobWluLXdpZHRoOiA2NDVweCkge1xuICAgIC5jb250ZW50IHtcbiAgICAgICAgd2lkdGg6IDY0NXB4O1xuICAgIH1cbn1cblxuXG4uZGF0ZS10aW1lIHtcbiAgICBkaXNwbGF5OiBibG9jaztcbiAgICB3aGl0ZS1zcGFjZTogbm93cmFwO1xuICAgIGZvbnQtc2l6ZTogMTRweDtcbiAgICAvLyBwYWRkaW5nOiAxNXB4IDVweDtcbn1cblxuLm1haW4ge1xuICAgIHBhZGRpbmc6IDIwcHggMTVweCAxMHB4IDE1cHg7XG4gICAgbWFyZ2luLWJvdHRvbTogMzVweDtcbiAgICBsaW5lLWhlaWdodDogMS43O1xuICAgIGZvbnQtd2VpZ2h0OiBub3JtYWw7XG5cbn1cblxuLnBvc3Qge1xuICAgIG1hcmdpbi1ib3R0b206IDUwMHB4O1xufVxuXG5cbiIsIi5saXN0LWNvbnRhaW5lciB7XG4gIGRpc3BsYXk6IGZsZXg7XG4gIGZsZXgtZGlyZWN0aW9uOiBjb2x1bW47XG4gIG1hcmdpbjogMTBweDtcbn1cblxuLmhlYWRlciB7XG4gIGRpc3BsYXk6IGZsZXg7XG4gIGZsZXgtZGlyZWN0aW9uOiByb3c7XG4gIGp1c3RpZnktY29udGVudDogc3BhY2UtYmV0d2Vlbjtcbn1cblxuLmhlYWRlciA+IGRpdiB7XG4gIHBhZGRpbmc6IDEwcHg7XG59XG5cbi5jb250ZW50IHtcbiAgZm9udC1mYW1pbHk6IFwiUm9ib3RvIFNsYWJcIiwgXCJIZWx2ZXRpY2EgTmV1ZVwiLCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmO1xuICBwb3NpdGlvbjogcmVsYXRpdmU7XG4gIHotaW5kZXg6IDEwO1xuICB3aWR0aDogMzUwcHg7XG4gIGJhY2tncm91bmQtY29sb3I6ICNmZmY7XG4gIHBhZGRpbmctYm90dG9tOiAyMHB4O1xufVxuXG5AbWVkaWEgKG1pbi13aWR0aDogNjAwcHgpIHtcbiAgLmNvbnRlbnQge1xuICAgIHdpZHRoOiA1MDBweDtcbiAgfVxufVxuQG1lZGlhIChtaW4td2lkdGg6IDY0NXB4KSB7XG4gIC5jb250ZW50IHtcbiAgICB3aWR0aDogNjQ1cHg7XG4gIH1cbn1cbi5kYXRlLXRpbWUge1xuICBkaXNwbGF5OiBibG9jaztcbiAgd2hpdGUtc3BhY2U6IG5vd3JhcDtcbiAgZm9udC1zaXplOiAxNHB4O1xufVxuXG4ubWFpbiB7XG4gIHBhZGRpbmc6IDIwcHggMTVweCAxMHB4IDE1cHg7XG4gIG1hcmdpbi1ib3R0b206IDM1cHg7XG4gIGxpbmUtaGVpZ2h0OiAxLjc7XG4gIGZvbnQtd2VpZ2h0OiBub3JtYWw7XG59XG5cbi5wb3N0IHtcbiAgbWFyZ2luLWJvdHRvbTogNTAwcHg7XG59Il19 */"] });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](ListPostsComponent, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"],
        args: [{
                selector: 'app-list-posts',
                templateUrl: './list-posts.component.html',
                styleUrls: ['./list-posts.component.scss']
            }]
    }], function () { return [{ type: _services_post_service__WEBPACK_IMPORTED_MODULE_1__["PostService"] }]; }, { posts: [{
            type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"]
        }] }); })();


/***/ }),

/***/ "./src/app/live-photo/live-photo.component.ts":
/*!****************************************************!*\
  !*** ./src/app/live-photo/live-photo.component.ts ***!
  \****************************************************/
/*! exports provided: LivePhotoComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "LivePhotoComponent", function() { return LivePhotoComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var livephotoskit__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! livephotoskit */ "./node_modules/livephotoskit/livephotoskit.js");
/* harmony import */ var livephotoskit__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(livephotoskit__WEBPACK_IMPORTED_MODULE_1__);



class LivePhotoComponent {
    constructor(el) {
        this.el = el;
        this.inView = new _angular_core__WEBPACK_IMPORTED_MODULE_0__["EventEmitter"]();
        this.id = this._generateId();
    }
    ngAfterViewInit() {
        this._createPlayer();
        this.onWindowScroll();
    }
    onWindowScroll() {
        const position = this.el.nativeElement.getBoundingClientRect();
        // detecting if element is fully visible ... is this post the current post?
        if (position.top >= 0 && position.bottom <= window.innerHeight) {
            this.inView.emit(true);
        }
    }
    _createPlayer() {
        const el = document.getElementById(this.id);
        const liveButtonClass = 'lpk-badge';
        const hasVideo = (this._videoSrc() ? true : false);
        this._player = livephotoskit__WEBPACK_IMPORTED_MODULE_1__["augmentElementAsPlayer"](el);
        this._player.photoSrc = this._imageSrc();
        this._player.videoSrc = this._videoSrc();
        this._removeLiveButton(el, liveButtonClass, hasVideo);
    }
    _generateId() {
        return Math.random().toString(36).replace(/[^a-z]+/g, '').substr(0, 5);
    }
    _videoSrc() {
        return this.media.videoSrc ? this.media.videoSrc : null;
    }
    _imageSrc() {
        return this.media.imageSrc ? this.media.imageSrc : null;
    }
    _removeLiveButton(el, className, hasVideo) {
        if (!hasVideo) {
            el.getElementsByClassName(className)[0].style.display = 'none';
        }
    }
}
LivePhotoComponent.ɵfac = function LivePhotoComponent_Factory(t) { return new (t || LivePhotoComponent)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_angular_core__WEBPACK_IMPORTED_MODULE_0__["ElementRef"])); };
LivePhotoComponent.ɵcmp = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineComponent"]({ type: LivePhotoComponent, selectors: [["app-live-photo"]], hostBindings: function LivePhotoComponent_HostBindings(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("scroll", function LivePhotoComponent_scroll_HostBindingHandler() { return ctx.onWindowScroll(); }, false, _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵresolveWindow"]);
    } }, inputs: { media: "media" }, outputs: { inView: "inView" }, decls: 2, vars: 1, consts: [[3, "id"]], template: function LivePhotoComponent_Template(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "div", 0);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](1, "div");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    } if (rf & 2) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵpropertyInterpolate"]("id", ctx.id);
    } }, styles: ["div[_ngcontent-%COMP%] {\n  width: 350px;\n  height: 263px;\n  background-color: #fff;\n  z-index: 1;\n}\n\n@media (min-width: 600px) {\n  div[_ngcontent-%COMP%] {\n    width: 500px;\n    height: 375px;\n  }\n}\n\n@media (min-width: 645px) {\n  div[_ngcontent-%COMP%] {\n    width: 645px;\n    height: 484px;\n  }\n}\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9Vc2Vycy9zdGV2ZW4uY29va0BlZi5jb20vbGV0cy1maXNoL3RyaXBzLWFwcC9zcmMvYXBwL2xpdmUtcGhvdG8vbGl2ZS1waG90by5jb21wb25lbnQuc2NzcyIsInNyYy9hcHAvbGl2ZS1waG90by9saXZlLXBob3RvLmNvbXBvbmVudC5zY3NzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0VBQ0ksWUFBQTtFQUNBLGFBQUE7RUFDQSxzQkFBQTtFQUNBLFVBQUE7QUNDSjs7QURFQTtFQUNJO0lBQ0ksWUFBQTtJQUNBLGFBQUE7RUNDTjtBQUNGOztBREVBO0VBQ0k7SUFDSSxZQUFBO0lBQ0EsYUFBQTtFQ0FOO0FBQ0YiLCJmaWxlIjoic3JjL2FwcC9saXZlLXBob3RvL2xpdmUtcGhvdG8uY29tcG9uZW50LnNjc3MiLCJzb3VyY2VzQ29udGVudCI6WyJkaXYge1xuICAgIHdpZHRoOiAzNTBweDtcbiAgICBoZWlnaHQ6IDI2M3B4O1xuICAgIGJhY2tncm91bmQtY29sb3I6ICNmZmY7XG4gICAgei1pbmRleDogMVxufVxuXG5AbWVkaWEgKG1pbi13aWR0aDogNjAwcHgpIHtcbiAgICBkaXYge1xuICAgICAgICB3aWR0aDogNTAwcHg7XG4gICAgICAgIGhlaWdodDogMzc1cHg7XG4gICAgfVxufVxuXG5AbWVkaWEgKG1pbi13aWR0aDogNjQ1cHgpIHtcbiAgICBkaXYge1xuICAgICAgICB3aWR0aDogNjQ1cHg7XG4gICAgICAgIGhlaWdodDogNDg0cHg7XG4gICAgfVxufVxuIiwiZGl2IHtcbiAgd2lkdGg6IDM1MHB4O1xuICBoZWlnaHQ6IDI2M3B4O1xuICBiYWNrZ3JvdW5kLWNvbG9yOiAjZmZmO1xuICB6LWluZGV4OiAxO1xufVxuXG5AbWVkaWEgKG1pbi13aWR0aDogNjAwcHgpIHtcbiAgZGl2IHtcbiAgICB3aWR0aDogNTAwcHg7XG4gICAgaGVpZ2h0OiAzNzVweDtcbiAgfVxufVxuQG1lZGlhIChtaW4td2lkdGg6IDY0NXB4KSB7XG4gIGRpdiB7XG4gICAgd2lkdGg6IDY0NXB4O1xuICAgIGhlaWdodDogNDg0cHg7XG4gIH1cbn0iXX0= */"] });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](LivePhotoComponent, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"],
        args: [{
                selector: 'app-live-photo',
                templateUrl: './live-photo.component.html',
                styleUrls: ['./live-photo.component.scss']
            }]
    }], function () { return [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["ElementRef"] }]; }, { media: [{
            type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"]
        }], inView: [{
            type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Output"]
        }], onWindowScroll: [{
            type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["HostListener"],
            args: ['window:scroll', []]
        }] }); })();


/***/ }),

/***/ "./src/app/map/map.component.ts":
/*!**************************************!*\
  !*** ./src/app/map/map.component.ts ***!
  \**************************************/
/*! exports provided: MapComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "MapComponent", function() { return MapComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_google_maps__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/google-maps */ "./node_modules/@angular/google-maps/__ivy_ngcc__/fesm2015/google-maps.js");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/common.js");





function MapComponent_map_marker_1_Template(rf, ctx) { if (rf & 1) {
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](0, "map-marker", 2);
} if (rf & 2) {
    const marker_r1 = ctx.$implicit;
    _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("position", marker_r1.location)("options", marker_r1.markerOptions);
} }
class MapComponent {
    constructor() {
        this.options = {
            mapTypeId: 'satellite',
            zoomControl: false,
            scrollwheel: false,
            disableDoubleClickZoom: false,
            streetViewControl: false,
            mapTypeControl: false,
            fullscreenControl: false
        };
        this.zoom = 15;
    }
    ngOnChanges(changes) {
        console.log('ngOnChanges marker', this.markers);
        if (changes.currentPost && this.currentPost) {
            this.map.panTo(this._setCentreToCurrentPost());
            // this.center = this._setCentreToCurrentPost();
        }
    }
    _setCentreToCurrentPost() {
        return this.currentPost.location;
    }
}
MapComponent.ɵfac = function MapComponent_Factory(t) { return new (t || MapComponent)(); };
MapComponent.ɵcmp = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineComponent"]({ type: MapComponent, selectors: [["app-map"]], viewQuery: function MapComponent_Query(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵviewQuery"](_angular_google_maps__WEBPACK_IMPORTED_MODULE_1__["GoogleMap"], true);
    } if (rf & 2) {
        var _t;
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵqueryRefresh"](_t = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵloadQuery"]()) && (ctx.map = _t.first);
    } }, inputs: { markers: "markers", currentPost: "currentPost" }, features: [_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵNgOnChangesFeature"]], decls: 2, vars: 4, consts: [["width", "100%", "height", "100%", 3, "center", "zoom", "options"], [3, "position", "options", 4, "ngFor", "ngForOf"], [3, "position", "options"]], template: function MapComponent_Template(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "google-map", 0);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtemplate"](1, MapComponent_map_marker_1_Template, 1, 2, "map-marker", 1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    } if (rf & 2) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("center", ctx.center)("zoom", ctx.zoom)("options", ctx.options);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("ngForOf", ctx.markers);
    } }, directives: [_angular_google_maps__WEBPACK_IMPORTED_MODULE_1__["GoogleMap"], _angular_common__WEBPACK_IMPORTED_MODULE_2__["NgForOf"], _angular_google_maps__WEBPACK_IMPORTED_MODULE_1__["MapMarker"]], styles: ["[_nghost-%COMP%] {\n  margin: 0;\n  padding: 0;\n  width: 100%;\n  height: 100%;\n  position: fixed;\n  top: 0;\n  left: 0;\n  z-index: 0;\n}\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9Vc2Vycy9zdGV2ZW4uY29va0BlZi5jb20vbGV0cy1maXNoL3RyaXBzLWFwcC9zcmMvYXBwL21hcC9tYXAuY29tcG9uZW50LnNjc3MiLCJzcmMvYXBwL21hcC9tYXAuY29tcG9uZW50LnNjc3MiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7RUFDSSxTQUFBO0VBQ0EsVUFBQTtFQUNBLFdBQUE7RUFDQSxZQUFBO0VBQ0EsZUFBQTtFQUNBLE1BQUE7RUFDQSxPQUFBO0VBQ0EsVUFBQTtBQ0NKIiwiZmlsZSI6InNyYy9hcHAvbWFwL21hcC5jb21wb25lbnQuc2NzcyIsInNvdXJjZXNDb250ZW50IjpbIjpob3N0IHtcbiAgICBtYXJnaW46IDA7XG4gICAgcGFkZGluZzogMDtcbiAgICB3aWR0aDogMTAwJTtcbiAgICBoZWlnaHQ6IDEwMCU7XG4gICAgcG9zaXRpb246IGZpeGVkO1xuICAgIHRvcDogMDtcbiAgICBsZWZ0OiAwO1xuICAgIHotaW5kZXg6IDA7XG59XG4iLCI6aG9zdCB7XG4gIG1hcmdpbjogMDtcbiAgcGFkZGluZzogMDtcbiAgd2lkdGg6IDEwMCU7XG4gIGhlaWdodDogMTAwJTtcbiAgcG9zaXRpb246IGZpeGVkO1xuICB0b3A6IDA7XG4gIGxlZnQ6IDA7XG4gIHotaW5kZXg6IDA7XG59Il19 */"] });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](MapComponent, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"],
        args: [{
                selector: 'app-map',
                templateUrl: './map.component.html',
                styleUrls: ['./map.component.scss']
            }]
    }], null, { map: [{
            type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["ViewChild"],
            args: [_angular_google_maps__WEBPACK_IMPORTED_MODULE_1__["GoogleMap"], { static: false }]
        }], markers: [{
            type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"]
        }], currentPost: [{
            type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"]
        }] }); })();


/***/ }),

/***/ "./src/app/services/map.service.ts":
/*!*****************************************!*\
  !*** ./src/app/services/map.service.ts ***!
  \*****************************************/
/*! exports provided: MapService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "MapService", function() { return MapService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var rxjs__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! rxjs */ "./node_modules/rxjs/_esm2015/index.js");



class MapService {
    constructor() {
        this._markers = [];
        this._markers$ = new rxjs__WEBPACK_IMPORTED_MODULE_1__["BehaviorSubject"](this._markers);
    }
    initMarkers(posts) {
        this._markers = posts.map((post, index) => {
            return this._markerFromPost(post, index);
        });
        this._markers$.next(this._markers);
    }
    get markers() {
        return this._markers$;
    }
    currentMarker(id) {
        this._markers = this._markers.map((marker) => {
            const animated = Object.assign(Object.assign({}, marker.markerOptions), { animation: google.maps.Animation.BOUNCE });
            const notAnimated = Object.assign(Object.assign({}, marker.markerOptions), { animation: null });
            if (marker.id === id) {
                return Object.assign(Object.assign({}, marker), { markerOptions: animated });
            }
            return Object.assign(Object.assign({}, marker), { markerOptions: notAnimated });
        });
        this._markers$.next(this._markers);
    }
    _markerFromPost(post, index) {
        return {
            id: post.id,
            location: post.location,
            markerOptions: {
                draggable: false,
                icon: {
                    url: `https://chart.googleapis.com/chart?chst=d_map_spin&chld=1|0|fed136|13|_|${index + 1}`
                }
            }
        };
    }
}
MapService.ɵfac = function MapService_Factory(t) { return new (t || MapService)(); };
MapService.ɵprov = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjectable"]({ token: MapService, factory: MapService.ɵfac, providedIn: 'root' });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](MapService, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"],
        args: [{
                providedIn: 'root'
            }]
    }], function () { return []; }, null); })();


/***/ }),

/***/ "./src/app/services/post.service.ts":
/*!******************************************!*\
  !*** ./src/app/services/post.service.ts ***!
  \******************************************/
/*! exports provided: PostService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "PostService", function() { return PostService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var rxjs__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! rxjs */ "./node_modules/rxjs/_esm2015/index.js");
/* harmony import */ var rxjs_operators__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! rxjs/operators */ "./node_modules/rxjs/_esm2015/operators/index.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/http.js");
/* harmony import */ var _map_service__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./map.service */ "./src/app/services/map.service.ts");






class PostService {
    constructor(http, mapService) {
        this.http = http;
        this.mapService = mapService;
        this.postsUrl = 'http://localhost:5000';
    }
    getPosts(tripId) {
        return this.http.get(`${this.postsUrl}/trips/${tripId}.json`)
            .pipe(
        // map(responseData => {
        //     const keys = Object.keys(responseData);
        //     return keys.map((key): Post => {
        //         const post: Post = responseData[key];
        //         return {
        //             ...post,
        //             id: key
        //         };
        //     });
        // }),
        Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_2__["map"])(posts => this._addPosition(posts)), Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_2__["tap"])(posts => this.mapService.initMarkers(posts)), Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_2__["tap"])((posts) => {
            this._currentPostId = posts[0].id;
            this._currentPost = posts[0];
            this._currentPost$ = new rxjs__WEBPACK_IMPORTED_MODULE_1__["BehaviorSubject"](this._currentPost);
            this.mapService.currentMarker(posts[0].id);
        }));
    }
    // public getStart(tripId: string): Observable<Start>{
    //     return this.http.get<Start>(`${this.postsUrl}/trips/${tripId}/start.json`);
    // }
    setCurrentPost(inView, post) {
        if (inView && this._currentPostId !== post.id) {
            this._currentPostId = post.id;
            this._currentPost = post;
            this._currentPost$.next(this._currentPost);
            this.mapService.currentMarker(this._currentPostId);
        }
    }
    _addPosition(posts) {
        return posts.map((post, index) => {
            return Object.assign(Object.assign({}, post), { position: index + 1 });
        });
    }
    getCurrentPost() {
        return this._currentPost$.asObservable();
    }
}
PostService.ɵfac = function PostService_Factory(t) { return new (t || PostService)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_angular_common_http__WEBPACK_IMPORTED_MODULE_3__["HttpClient"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵinject"](_map_service__WEBPACK_IMPORTED_MODULE_4__["MapService"])); };
PostService.ɵprov = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjectable"]({ token: PostService, factory: PostService.ɵfac, providedIn: 'root' });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](PostService, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"],
        args: [{
                providedIn: 'root'
            }]
    }], function () { return [{ type: _angular_common_http__WEBPACK_IMPORTED_MODULE_3__["HttpClient"] }, { type: _map_service__WEBPACK_IMPORTED_MODULE_4__["MapService"] }]; }, null); })();


/***/ }),

/***/ "./src/app/trips/trips.component.ts":
/*!******************************************!*\
  !*** ./src/app/trips/trips.component.ts ***!
  \******************************************/
/*! exports provided: TripsComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "TripsComponent", function() { return TripsComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var rxjs_operators__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! rxjs/operators */ "./node_modules/rxjs/_esm2015/operators/index.js");
/* harmony import */ var _services_post_service__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../services/post.service */ "./src/app/services/post.service.ts");
/* harmony import */ var _services_map_service__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../services/map.service */ "./src/app/services/map.service.ts");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _list_posts_list_posts_component__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ../list-posts/list-posts.component */ "./src/app/list-posts/list-posts.component.ts");
/* harmony import */ var _map_map_component__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ../map/map.component */ "./src/app/map/map.component.ts");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/__ivy_ngcc__/fesm2015/common.js");









class TripsComponent {
    constructor(postService, mapService, route) {
        this.postService = postService;
        this.mapService = mapService;
        this.route = route;
    }
    ngOnInit() {
        this.route.paramMap.subscribe(params => {
            const tripId = params.get('tripId');
            if (tripId) {
                this._tripId = tripId;
                this._getPosts();
                // this._getStart();
                this._getMarkers();
            }
        });
    }
    _getPosts() {
        this.posts$ = this.postService.getPosts(this._tripId)
            .pipe(Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_1__["tap"])(() => {
            this.currentPost$ = this.postService.getCurrentPost();
        }));
        this.posts$.subscribe((posts) => { console.log(posts); });
    }
    _getMarkers() {
        this.markers$ = this.mapService.markers;
    }
    // private _getStart(): void {
    //     this.start$ = this.postService.getStart(this._tripId);
    // }
    onClickBack() {
        document.location.href = '/trips/';
    }
}
TripsComponent.ɵfac = function TripsComponent_Factory(t) { return new (t || TripsComponent)(_angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_services_post_service__WEBPACK_IMPORTED_MODULE_2__["PostService"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_services_map_service__WEBPACK_IMPORTED_MODULE_3__["MapService"]), _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdirectiveInject"](_angular_router__WEBPACK_IMPORTED_MODULE_4__["ActivatedRoute"])); };
TripsComponent.ɵcmp = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineComponent"]({ type: TripsComponent, selectors: [["app-trips"]], decls: 10, vars: 9, consts: [["id", "nav"], [1, "badge", "back", 3, "click"], [3, "posts"], ["id", "map"], [3, "markers", "currentPost"]], template: function TripsComponent_Template(rf, ctx) { if (rf & 1) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](0, "div", 0);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](1, "button", 1);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵlistener"]("click", function TripsComponent_Template_button_click_1_listener() { return ctx.onClickBack(); });
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵtext"](2, "<");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](3, "div");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](4, "app-list-posts", 2);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵpipe"](5, "async");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementStart"](6, "div", 3);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelement"](7, "app-map", 4);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵpipe"](8, "async");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵpipe"](9, "async");
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵelementEnd"]();
    } if (rf & 2) {
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](4);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("posts", _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵpipeBind1"](5, 3, ctx.posts$));
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵadvance"](3);
        _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵproperty"]("markers", _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵpipeBind1"](8, 5, ctx.markers$))("currentPost", _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵpipeBind1"](9, 7, ctx.currentPost$));
    } }, directives: [_list_posts_list_posts_component__WEBPACK_IMPORTED_MODULE_5__["ListPostsComponent"], _map_map_component__WEBPACK_IMPORTED_MODULE_6__["MapComponent"]], pipes: [_angular_common__WEBPACK_IMPORTED_MODULE_7__["AsyncPipe"]], styles: ["#nav[_ngcontent-%COMP%] {\n  position: fixed;\n  z-index: 20;\n  padding: 10px;\n}\n\n.back[_ngcontent-%COMP%] {\n  padding: 8px 14px;\n  font-size: 1.3em;\n  background-color: #fff;\n  color: #777777;\n  border: 1px solid #DDDDDD !important;\n  cursor: pointer !important;\n  outline: none;\n  box-shadow: 0 1px 2px black;\n  transition: box-shadow 0.3s ease-in-out;\n}\n\n.back[_ngcontent-%COMP%]:hover {\n  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);\n  -ms-transform: scale(1.1, 1.1);\n      transform: scale(1.1, 1.1);\n}\n/*# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9Vc2Vycy9zdGV2ZW4uY29va0BlZi5jb20vbGV0cy1maXNoL3RyaXBzLWFwcC9zcmMvYXBwL3RyaXBzL3RyaXBzLmNvbXBvbmVudC5zY3NzIiwic3JjL2FwcC90cmlwcy90cmlwcy5jb21wb25lbnQuc2NzcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQTtFQUNJLGVBQUE7RUFDQSxXQUFBO0VBQ0EsYUFBQTtBQ0NKOztBREVBO0VBQ0ksaUJBQUE7RUFDQSxnQkFBQTtFQUNBLHNCQUFBO0VBQ0EsY0FBQTtFQUNBLG9DQUFBO0VBQ0EsMEJBQUE7RUFDQSxhQUFBO0VBQ0EsMkJBQUE7RUFDQSx1Q0FBQTtBQ0NKOztBREVBO0VBQ0kseUNBQUE7RUFDQSw4QkFBQTtNQUFBLDBCQUFBO0FDQ0oiLCJmaWxlIjoic3JjL2FwcC90cmlwcy90cmlwcy5jb21wb25lbnQuc2NzcyIsInNvdXJjZXNDb250ZW50IjpbIiNuYXYge1xuICAgIHBvc2l0aW9uOiBmaXhlZDtcbiAgICB6LWluZGV4OiAyMDtcbiAgICBwYWRkaW5nOiAxMHB4O1xufVxuXG4uYmFjayB7XG4gICAgcGFkZGluZzogOHB4IDE0cHg7XG4gICAgZm9udC1zaXplOiAxLjNlbTtcbiAgICBiYWNrZ3JvdW5kLWNvbG9yOiAjZmZmO1xuICAgIGNvbG9yOiAjNzc3Nzc3O1xuICAgIGJvcmRlcjogMXB4IHNvbGlkICNEREREREQgIWltcG9ydGFudDtcbiAgICBjdXJzb3I6IHBvaW50ZXIgIWltcG9ydGFudDtcbiAgICBvdXRsaW5lOm5vbmU7XG4gICAgYm94LXNoYWRvdzogMCAxcHggMnB4IHJnYmEoMCwwLDAsMS4yKTtcbiAgICB0cmFuc2l0aW9uOiBib3gtc2hhZG93IDAuM3MgZWFzZS1pbi1vdXQ7XG59XG5cbi5iYWNrOmhvdmVye1xuICAgIGJveC1zaGFkb3c6IDAgNXB4IDE1cHggcmdiYSgwLDAsMCwwLjMpO1xuICAgIHRyYW5zZm9ybTogc2NhbGUoMS4xLCAxLjEpO1xufVxuIiwiI25hdiB7XG4gIHBvc2l0aW9uOiBmaXhlZDtcbiAgei1pbmRleDogMjA7XG4gIHBhZGRpbmc6IDEwcHg7XG59XG5cbi5iYWNrIHtcbiAgcGFkZGluZzogOHB4IDE0cHg7XG4gIGZvbnQtc2l6ZTogMS4zZW07XG4gIGJhY2tncm91bmQtY29sb3I6ICNmZmY7XG4gIGNvbG9yOiAjNzc3Nzc3O1xuICBib3JkZXI6IDFweCBzb2xpZCAjREREREREICFpbXBvcnRhbnQ7XG4gIGN1cnNvcjogcG9pbnRlciAhaW1wb3J0YW50O1xuICBvdXRsaW5lOiBub25lO1xuICBib3gtc2hhZG93OiAwIDFweCAycHggYmxhY2s7XG4gIHRyYW5zaXRpb246IGJveC1zaGFkb3cgMC4zcyBlYXNlLWluLW91dDtcbn1cblxuLmJhY2s6aG92ZXIge1xuICBib3gtc2hhZG93OiAwIDVweCAxNXB4IHJnYmEoMCwgMCwgMCwgMC4zKTtcbiAgdHJhbnNmb3JtOiBzY2FsZSgxLjEsIDEuMSk7XG59Il19 */"] });
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](TripsComponent, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"],
        args: [{
                selector: 'app-trips',
                templateUrl: './trips.component.html',
                styleUrls: ['./trips.component.scss']
            }]
    }], function () { return [{ type: _services_post_service__WEBPACK_IMPORTED_MODULE_2__["PostService"] }, { type: _services_map_service__WEBPACK_IMPORTED_MODULE_3__["MapService"] }, { type: _angular_router__WEBPACK_IMPORTED_MODULE_4__["ActivatedRoute"] }]; }, null); })();


/***/ }),

/***/ "./src/environments/environment.ts":
/*!*****************************************!*\
  !*** ./src/environments/environment.ts ***!
  \*****************************************/
/*! exports provided: environment */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "environment", function() { return environment; });
// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.
const environment = {
    production: false
};
/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.


/***/ }),

/***/ "./src/main.ts":
/*!*********************!*\
  !*** ./src/main.ts ***!
  \*********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _environments_environment__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./environments/environment */ "./src/environments/environment.ts");
/* harmony import */ var _app_app_module__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./app/app.module */ "./src/app/app.module.ts");
/* harmony import */ var _angular_platform_browser__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/platform-browser */ "./node_modules/@angular/platform-browser/__ivy_ngcc__/fesm2015/platform-browser.js");




if (_environments_environment__WEBPACK_IMPORTED_MODULE_1__["environment"].production) {
    Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["enableProdMode"])();
}
_angular_platform_browser__WEBPACK_IMPORTED_MODULE_3__["platformBrowser"]().bootstrapModule(_app_app_module__WEBPACK_IMPORTED_MODULE_2__["AppModule"])
    .catch(err => console.error(err));


/***/ }),

/***/ 0:
/*!***************************!*\
  !*** multi ./src/main.ts ***!
  \***************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(/*! /Users/steven.cook@ef.com/lets-fish/trips-app/src/main.ts */"./src/main.ts");


/***/ })

},[[0,"runtime","vendor"]]]);
//# sourceMappingURL=main.js.map