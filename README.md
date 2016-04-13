![](https://codeship.com/projects/43375cc0-abc3-0133-9b76-02e6183d343a/status?branch=master)

Let's Fish
================

An app to find, list and write guides to fisheries and waters.

####Restore DB from dump

```pg_restore  --verbose  --no-acl --no-owner -h localhost --data-only -d lets_fish_development ~/Desktop/lets-fish-22-37.dump```


####Trip Spike Notes

##Trip Model

Trip:
    belongs_to: user
    title: "Sutherlands magical hill lochs"
    kml_file_id: (stored in s3)
    weather: (not sure where we get this data)
    has_many: events
    belongs_to: water

##Event Model
Event:
    trip_id:
    title:
    Discription:
    belongs_to: event_type
    longitude: float
    latitude: float
    weather: (not sure where we get this data)
    date/time:

Event_type:
    type: fish-caught, lunch, set-up-camp, ...







