import { Injectable } from '@angular/core';
import { Post } from '../types';
import { BehaviorSubject, Observable } from 'rxjs';
import { map, tap } from 'rxjs/operators';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { MapService } from './map.service';


@Injectable({
    providedIn: 'root'
})
export class PostService {

    private _currentPost: Post;
    private _currentPostId: string;

    private _currentPost$: BehaviorSubject<Post>;
    private postsUrl = 'https://lets-fish-trips.firebaseio.com';

    constructor(
        private http: HttpClient,
        private mapService: MapService
    ) {}

    public getPosts(tripId: string): Observable<Post[]> {

        return this.http.get(`${this.postsUrl}/trips/${tripId}/posts.json`)
        .pipe(
            map(responseData => {
                const keys = Object.keys(responseData);
                return keys.map((key): Post => {
                    const post: Post = responseData[key];
                    return {
                        ...post,
                        id: key
                    };
                });
            }),
            map(posts => this._addPosition(posts)),
            tap(posts => this.mapService.initMarkers(posts)),
            tap((posts) => {
                    this._currentPostId = posts[0].id;
                    this._currentPost = posts[0];
                    this._currentPost$ = new BehaviorSubject<Post>(this._currentPost);
                    this.mapService.currentMarker(posts[0].id);
            })
        );
    }

    // public createPost(): void {
    //     const post: Post = {
    //         location:  {
    //             lat: 54.511348,
    //             lng: -2.888967
    //         },
    //         media:
    //         {
    //             type: 'live-photo',
    //             videoSrc: 'assets/mocks/videos/7.mov',
    //             imageSrc: 'assets/mocks/photos/7.jpeg'
    //         },
    //         timeStamp: 1559583344,
    //         content: 'new post her'
    //     };

    //     this.http.post<Post>(
    //         `${this.postsUrl}/trips/0/posts.json`,
    //         post
    //     )
    //     .subscribe(responseData => console.log(responseData));

    // }

    public setCurrentPost(inView: boolean, post: Post): void {
        if (inView && this._currentPostId !== post.id) {
            this._currentPostId = post.id;
            this._currentPost = post;
            this._currentPost$.next(this._currentPost);
            this.mapService.currentMarker(this._currentPostId);
        }
    }

    private _addPosition(posts: Post[]): Post[] {
        return posts.map((post: Post , index: number) => {
            return {
                ...post,
                position: index + 1,
            };
        });
    }

    public getCurrentPost(): Observable<Post> {
        return this._currentPost$.asObservable();
    }
}
