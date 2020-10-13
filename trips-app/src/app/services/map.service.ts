import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Post, Marker } from '../types';

@Injectable({
    providedIn: 'root'
})
export class MapService {

    private _markers = [];
    public _markers$: BehaviorSubject<Marker[]>;

    constructor() {
        this._markers$ = new BehaviorSubject(this._markers);
    }

    public initMarkers(posts: Post[]): void {
        this._markers = posts.map((post: Post, index: number) => {
            return this._markerFromPost(post, index);
        });
        this._markers$.next(this._markers);
    }

    public get markers(): BehaviorSubject<Marker[]> {
        return this._markers$;
    }

    public currentMarker(id: string) {
        this._markers = this._markers.map((marker: Marker) => {
            const animated = {
                ...marker.markerOptions,
                animation: google.maps.Animation.BOUNCE
            };

            const notAnimated = {
                ...marker.markerOptions,
                animation: null
            };

            if (marker.id === id) {
                return {
                    ...marker,
                    markerOptions: animated
                };
            }
            return {
                ...marker,
                markerOptions: notAnimated
            };
        });
        this._markers$.next(this._markers);
    }

    private _markerFromPost(post: Post, index: number): Marker {
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
