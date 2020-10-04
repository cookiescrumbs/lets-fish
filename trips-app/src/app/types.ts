export interface LatLng {
    lat: number;
    lng: number;
}

export interface Media {
    type: 'video' | 'live-photo' | 'image';
    videoSrc?: string;
    imageSrc?: string;
}

export interface Post {
    id?: string;
    location: LatLng;
    media: Media;
    timeStamp: number;
    content: string;
    position?: number;
    markerOptions?: any;
}

export interface Marker {
    id: string;
    location: LatLng;
    markerOptions: any;
}

export interface Trip {
    id: string;
    start: {
        title: string;
        content: string;
        media: Media;
        timeStamp: number;
    };
    posts: Post[] | [];
}
