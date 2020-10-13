import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { PostService } from '../services/post.service';
import { MapService } from '../services/map.service';

import { Post, Marker, Start } from '../types';

import { ActivatedRoute, Router } from '@angular/router';


@Component({
    selector: 'app-trips',
    templateUrl: './trips.component.html',
    styleUrls: ['./trips.component.scss']
})
export class TripsComponent implements OnInit {


    public posts$: Observable<Post[]>;
    public start$: Observable<Start>;
    public markers$: Observable<Marker[]>;
    public currentPost$: Observable<Post>;

    private _tripId: string;

    constructor(
        public postService: PostService,
        public mapService: MapService,
        private readonly route: ActivatedRoute
    ) { }

    public ngOnInit() {
        this.route.paramMap.subscribe(params => {
            const tripId = params.get('tripId');
            if (tripId) {
                this._tripId = tripId;
                this._getPosts();
                this._getStart();
                this._getMarkers();
            }
        });
    }

    private _getPosts(): void {
        this.posts$ = this.postService.getPosts(this._tripId)
            .pipe(
                tap(() => {
                    this.currentPost$ = this.postService.getCurrentPost();
                })
            );
    }

    private _getMarkers(): void {
        this.markers$ = this.mapService.markers;
    }

    private _getStart(): void {
        this.start$ = this.postService.getStart(this._tripId);
    }

    public onClickBack(): void {
        document.location.href = '/trips/';
    }

}
