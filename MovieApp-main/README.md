# MovieApp
A movie search engine application which searches all the movies containing the search keyword.


## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Features](#features)

## Installation
1. Clone the repository.
2. Open `MovieApp.xcodeproj` in Xcode.
3. Build and run the app on the simulator or a connected device.

## Usage
Users can type in a keyword in the Search bar and retrieve all the movies that contain the search keyword. It also fetches all the details of the respective movie.

## Screenshots
<img width="1195" alt="Screenshot 2023-07-25 at 1 54 50 AM" src="https://github.com/aashna94/MovieApp/assets/29506525/515ffb20-af40-4d0f-beed-bae468a8609a">

## Video
https://github.com/aashna94/MovieApp/blob/cdb5f5cefc2d290a0a0ab2c713742d8cc392653e/demo-video-2_EUKc81Pt.mp4

## Features
- Feature 1: Search movies with any keyword in the search bar
- Feature 2: View details of the movie clicked
- Feature 3: It also makes use of caching mechanism such that the movie whose details were viewed by the User, it would be cached in memory along with the movie's poster image. Next time if the user searches the same movie, the details of which would be fetched from DB thus avoiding an extra network call.

## Potential enhacements
- Token authentication 
- API back pressure handling
- Auto suggestions 
- List of recently searched movies

## Contact
You can reach me at aashnanarula94@gmail.com.
