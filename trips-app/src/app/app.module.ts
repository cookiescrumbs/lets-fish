import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { GoogleMapsModule } from '@angular/google-maps';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ListPostsComponent } from './list-posts/list-posts.component';
import { MapComponent } from './map/map.component';
import { TripsComponent } from './trips/trips.component';
import { ImageComponent } from './image/image.component';

@NgModule({
  declarations: [
    AppComponent,
    ListPostsComponent,
    MapComponent,
    TripsComponent,
    ImageComponent
  ],
  imports: [
    AppRoutingModule,
    BrowserModule,
    GoogleMapsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
