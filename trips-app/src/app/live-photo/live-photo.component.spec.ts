import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LivePhotoComponent } from './live-photo.component';

describe('LivePhotoComponent', () => {
  let component: LivePhotoComponent;
  let fixture: ComponentFixture<LivePhotoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LivePhotoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LivePhotoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
