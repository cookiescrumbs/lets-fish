import { Component, Input, SimpleChanges, OnChanges, ViewChild } from '@angular/core';
import { GoogleMap } from '@angular/google-maps';

import { Post, LatLng, Marker } from '../types';


@Component({
    selector: 'app-map',
    templateUrl: './map.component.html',
    styleUrls: ['./map.component.scss']
})
export class MapComponent implements OnChanges {
    @ViewChild(GoogleMap, { static: false }) map: GoogleMap;

    @Input() markers: Array<Marker>;
    @Input() currentPost: Post;

    public options: google.maps.MapOptions = {
        mapTypeId: 'satellite',
        zoomControl: false,
        scrollwheel: false,
        disableDoubleClickZoom: false,
        streetViewControl: false,
        mapTypeControl: false,
        fullscreenControl: false
    };
    public zoom = 15;
    public center: google.maps.LatLngLiteral;

    public ngOnChanges(changes: SimpleChanges): void {
        console.log('ngOnChanges marker', this.markers);
        if (changes.currentPost && this.currentPost) {
            this.map.panTo(this._setCentreToCurrentPost());
            // this.center = this._setCentreToCurrentPost();

        }
    }


    private _setCentreToCurrentPost(): LatLng {
        return this.currentPost.location;
    }

}
