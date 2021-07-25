import { Component, Input, AfterViewInit, ElementRef, EventEmitter, Output, HostListener } from '@angular/core';
@Component({
    selector: 'app-image',
    templateUrl: './image.component.html',
    styleUrls: ['./image.component.scss']
})
export class ImageComponent implements AfterViewInit {

    @Input() imageSrc: string;

    @Output()
    inView: EventEmitter<boolean> = new EventEmitter<boolean>();

    public imageUrl: string;

    constructor(
        private el: ElementRef
    ) { }

    ngOnInit(): void {
        this.imageUrl = `${this.imageSrc}?w=725&H=725&fit=clip&auto=compress`;
    }

    ngAfterViewInit() {
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

}
