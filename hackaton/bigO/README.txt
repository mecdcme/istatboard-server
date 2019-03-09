


1. Raw data structure
---------------------

Raw data are organized in one file per user. Each user-folder contains folders
that correspond to recording sessions (name: "1_<session_id>"), metadata (in csv
files) and location data (in file "location.csv").

All csv files contain headers that describe the data type of each column.

Each session contains binary data. The binary format is described in table
"Binary files format" bellow.

Recorded signals are described bellow.
* Accelerometer: Measures the acceleration force in m/sec 2 that is applied to a
    device on all three physical axes (x, y, and z), including the force of gravity.
* Barometer: Measures the ambient air pressure in hPa or mbar.
* Light: Measures the ambient light level (illumination) in lx.
* Proximity sensor: Measures the proximity of an object in cm relative to the view
    screen of a device. This sensor is typically used to determine whether a handset
    is being held up to a person's ear.
* Relative humidity sensor: Measures the relative ambient humidity in percent (%).
* Thermometer: Measures the ambient room temperature in degrees Celsius (°C).

Table: Binary files format
Bytes    Type                      Description 
----------------------------------------------------------------
1−8      Integer IEEE-BE 64-bit    Nanoseconds since device boot
9−12     Float IEEE-BE 32-bit      x-axis value
13−16    Float IEEE-BE 32-bit      y-axis value (only for accelerometer)
17−20    Float IEEE-BE 32-bit      z-axis value (only for accelerometer)



2. Processed data
-----------------

Processed data are organized in three different folders.

Folder "table_a" contains csv files (one per user) with physical activity
related indicators. In particular, the columns are (as also shown in csv header
line):
    utc_timestamp: UTC time of the indicator
    utc_offset   : Time-zone offset from UTC
    geohash      : 6-character geohash localization
    counts       : Number of actigraphy/activity counts
    steps        : Number of steps
    biking       : Number of seconds spend doing this activity type
    downstairs   : Number of seconds spend doing this activity type
    jogging      : Number of seconds spend doing this activity type
    sitting      : Number of seconds spend doing this activity type
    standing     : Number of seconds spend doing this activity type
    upstairs     : Number of seconds spend doing this activity type
    walking      : Number of seconds spend doing this activity type

Similarly, folder "table_b" contains visited points-of-interest (POI). The columns are:
    start_utc_timestamp  : UTC time that the user arrived at the detected POI
    start_utc_offset     : Time-zone offset from UTC (for start_utc_timestamp)
    stop_utc_timestamp   : UTC time that the user departed from the detected POI
    stop_utc_offset      : Time-zone offset from UTC (for stop_utc_timestamp)
    geohash              : 6-character geohash localization
    closest_category_name: The type of POI

Finally, folder "table_c" contains transportation mode for trips between
detected POIs. The columns are:
    start_utc_timestamp: UTC time that the user departed (from the previous POI)
    start_utc_offset   : Time-zone offset from UTC (for start_utc_timestamp)
    stop_utc_timestamp : UTC time that the user arrived (at the next POI)
    stop_utc_offset    : Time-zone offset from UTC (for stop_utc_timestamp)
    geohash_from       : 6-character geohash localization of the previous POI
    geohash_to         : 6-character geohash localization of the next POI
    foot               : Percentage of travel time spent on this transportation mode
    bike               : Percentage of travel time spent on this transportation mode
    car                : Percentage of travel time spent on this transportation mode
    bus                : Percentage of travel time spent on this transportation mode
    train              : Percentage of travel time spent on this transportation mode



3. Self reports
---------------

Self reports are organized in one folder per user. Each user-folder contains
folders that correspond to daily answers, food advertisements, and meals.



3.1 Daily answers

For daily answers, each answer is provided as a JSON document in a separate
file, including the timestamp, user ID, and the mood. In particular, the JSON
document structure is the following:

- datetime [string]: the date and time that the answer was provided, in ISO 8601
                     format
- mood [integer]: the answer to the question "how do you feel", 1 corresponds to
                  grumpy and 5 to excellect
- user_id [integer]: the user id (same as the name of the user folder)



3.2 Food advertisements

For food advertisements, each advertisement is provided again as a JSON document
in a separate file, including location co-ordinates, timestamp, manual annotation
about the meal type, and more. The photo is provided as a JPEG file with the
same name as the JSON file. The JSON document structure is the following:

- annotation_place [string]: the type of place that the advertisement was
                             recorded, e.g. indoors 
- datetime [string]: the date and time that the advertisement was recorded,
                     in ISO 8601 format
- location [JSON]: a small JSON document describing the location that of the
                   advertisement:
  - type [string]: the type of the location, should always be "Point"
  - coordinates [Array of numbers]: the longitude and latitude (in that order)
- location_accuracy [number]: a circle with radious (in meters) that the food
                              advertisement could be into 
- location_altitude [number]: the altitude of the location that the food
                              advertisement was recorded
- location_bearing [number]: the bearing of the mobile phone while recording
                             the food advertisement
- orientation_a [number]: the phone's azimuth angle during the recording
- orientation_p [number]: the phone's pitch angle during the recording
- orientation_r [number]: the phone's roll angle during the recording
- user_id [integer]: the user id (same as the name of the user folder)



3.3 Meals

Finally, meals are provided similarly to food advertisements (including the
photo as JPEG file). The JSON document structure is the following:

- location [JSON]: a small JSON document describing the location that of the
                   advertisement:
  - type [string]: the type of the location, should always be "Point"
  - coordinates [Array of numbers]: the longitude and latitude (in that order)
- location_accuracy [number]: a circle with radious (in meters) that the food
                              advertisement could be into 
- location_altitude [number]: the altitude of the location that the food
                              advertisement was recorded
- location_bearing [number]: the bearing of the mobile phone while recording
                             the food advertisement
- meal_attributes [JSON]: a description of the meal
  - food_temperature [string]: can be "warm" or "cold"
  - fruit [boolean]: if the meal contains fruit
  - home_prepared [boolean]: if the meal has been prepared at home (e.g. not in a
                             restaurant)
  - sugar [boolean]: if the meal contains sugar
- meal_type [string]: can be "breakfast", "snack", "lunch", "dinner", "drink", etc
- orientation_a [number]: the phone's azimuth angle during the recording
- orientation_p [number]: the phone's pitch angle during the recording
- orientation_r [number]: the phone's roll angle during the recording
- snack_attributes [JSON]: attributes of the meal applicable only to snack
  - food_temperature [string]: can be "warm" or "cold"
  - fruit [boolean]: if the meal contains fruit
  - home_prepared [boolean]: if the meal has been prepared at home (e.g. not in a
                             restaurant)
  - retail [boolean]: if the meal comes in retail packaging 
  - sugar [boolean]: if the meal contains sugar
  - other [boolean]: if the meal does not belong to any of the above categories
- drink_attributes [JSON]: attributes of the meal applicable only to drink
  - coffee_tea [boolean]: if drink is coffee or tea
  - dairy_milk [boolean]: if drink is milk or dairy product
  - energy_drink [boolean]: if drink is an energy drink
  - juice [boolean]: if drink is a juice
  - other [boolean]: if drink is something else
  - soft_drink [boolean]: if drink is a soft drink
  - sugar [boolean]: if drink contains sugar
  - water [boolean]: if drink is water
