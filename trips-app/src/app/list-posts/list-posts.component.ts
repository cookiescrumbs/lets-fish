import { Component, Input, OnChanges, SimpleChanges } from '@angular/core';
import { PostService } from '../services/post.service';

import { Post, Start } from '../types';

@Component({
    selector: 'app-list-posts',
    templateUrl: './list-posts.component.html',
    styleUrls: ['./list-posts.component.scss']
})
export class ListPostsComponent {
    @Input() posts: Array<Post>;
    @Input() start: Start;

    constructor(public postService: PostService ) { }

}
