# Vivel mobile app

## Android emulator requirements

- Minimum API Level 18 - required for secure storage of tokens

- Target with Google APIs - required for opening the default maps app

- Recommended image is: `Android 10.0 Google APIs`

The `.env.example` file should be copied as `.env` and a MapBox API key should be added.

## Login credentials

bob user (mobile):

username: `bob`

password: `Pass123$`

---

alice user (mobile):

username: `alice`

password: `Pass123$`

## Useful application information

- for app to function properly you will have to add a `mapbox api key`

- active drives are displayed based on users current location (30 km radius)

- user can apply for a drive if the following conditions are met:
    - currently has no pending donation requests (user can only have one pending request)
    - if the drive bloodtype matches the users blood type
        - if users bloodtype is verified (one donation was approved, or hospital staff added bloodtype to user), user can only apply for bloodtype matched drives
        - if users bloodtype is not yet verified he can apply for any drive
    - if there’s been atleast 3 months since the last donation

- notifications are sent in 5 cases:
    - successfully applied to donation
    - donation scheduled by hospital staff
    - donation approved
    - donation rejected
    - drive open in the vicinity (30 km radius)
    
- badges are awarded
    - every 5 donations
    - every urgent drive approved donation
