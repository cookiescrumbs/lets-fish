import { Component, OnInit, Input, HostListener, ElementRef, EventEmitter, Output, AfterViewInit } from '@angular/core';
import * as LivePhotosKit from 'livephotoskit';
import { Media } from '../types';

@Component({
    selector: 'app-live-photo',
    templateUrl: './live-photo.component.html',
    styleUrls: ['./live-photo.component.scss']
})
export class LivePhotoComponent implements AfterViewInit {
    @Input() media: Media;

    @Output()
    inView: EventEmitter<boolean> = new EventEmitter<boolean>();

    public livePlayer: any;
    public id: string;

    private _player: any;

    constructor(
        private el: ElementRef
    ) {
        this.id = this._generateId();
    }

    ngAfterViewInit() {
        this._createPlayer();
        this.onWindowScroll();
    }


    @HostListener('window:scroll', [])
    onWindowScroll(): void {
        const position = this.el.nativeElement.getBoundingClientRect();
        // detecting if element is fully visible ... is this post the current post?
        if (position.top >= 0 && position.bottom <= window.innerHeight) {
            this.inView.emit(true);
        }
    }

    private _createPlayer() {
        const el = document.getElementById(this.id);
        const liveButtonClass = 'lpk-badge';
        const hasVideo = (this._videoSrc() ? true : false);

        this._player = LivePhotosKit.augmentElementAsPlayer(el);
        this._player.photoSrc = this._imageSrc();
        this._player.videoSrc = this._videoSrc();
        this._removeLiveButton(el, liveButtonClass, hasVideo);
    }

    private _generateId(): string {
        return Math.random().toString(36).replace(/[^a-z]+/g, '').substr(0, 5);
    }

    private _videoSrc(): string | null {
        return this.media.videoSrc ? this.media.videoSrc : null;
    }

    private _imageSrc(): string | null {
        return this.media.imageSrc ? this.media.imageSrc : null;
    }

    private _removeLiveButton(el: any, className: string, hasVideo: boolean): void {
        if (!hasVideo) {
            el.getElementsByClassName(className)[0].style.display = 'none';
        }

    }

}
