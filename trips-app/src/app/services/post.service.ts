import { Injectable } from '@angular/core';
import { Post, Start} from '../types';
import { BehaviorSubject, Observable } from 'rxjs';
import { map, tap } from 'rxjs/operators';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { MapService } from './map.service';
import { environment } from '../../environments/environment';




@Injectable({
    providedIn: 'root'
})
export class PostService {

    private _currentPost: Post;
    private _currentPostId: string;

    private _currentPost$: BehaviorSubject<Post>;
    private apiUrl = environment.apiUrl;

    constructor(
        private http: HttpClient,
        private mapService: MapService
    ) {}

    public getPosts(tripId: string): Observable<Post[]> {
        return this.http.get<Post[]>(`${this.apiUrl}/trips/${tripId}/posts.json`)
        .pipe(
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

    public getStart(tripId: string): Observable<Start>{
        return this.http.get<Start>(`${this.apiUrl}/trips/${tripId}.json`);
    }

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
                position: index + 1
            };
        });
    }

    public getCurrentPost(): Observable<Post> {
        return this._currentPost$.asObservable();
    }
}
