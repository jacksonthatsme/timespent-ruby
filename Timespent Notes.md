## Models

### Shoot
- Artist name (String)
- Location (String)
- Film Date (Timestamp)
- Blurb (Text)

Has One Video
Has Many Images

### Video
- Video Uploader
- Processes Webm

Belongs to Shoot

### Image
- Image Uploader
- Makes Thumb
- Makes Bg (Converts to grayscale)

Belongs to Shoot

### Post
- Title (String)
- Content (Text)
- Images (Through Editor)

### Admin
- First Name (String)
- Last Name (String)
- Email (String)
- Password (Password)
