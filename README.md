# Flutter UI Project - Cognise UI design and API data fetch

This Flutter project is a user interface (UI) design that displays a list of scrollable images with their associated text fetched from an API, along with a grid view also populated with data from the same API. It includes a navigation bar using SVG assets and icons from the project's assets folder.

## Features

- Fetch and display a list of scrollable images with text from the API(displayed all images from API): [https://mbl.downloadvid.app/api/data/](https://mbl.downloadvid.app/api/data/)
- Populate a grid view with data from the same API (first two images from API)
- Implement a navigation bar using SVG assets.
- Used cached Network image package and lazy loading to load the images faster
- reusable widgets
- clean and responsive UI design 

## Font

This project uses the Poppins Font for text and typography styles. The font is included as part of the project's assets.


## Installation

1. Clone this repository to your local machine:

  
   git clone https://github.com/SayMyName302/funsoltask_awais

2.  Dependencies
This project utilizes the following packages:

http: For making HTTP requests to fetch data from the API.
cached_network_image: For caching and efficiently loading network images.
flutter_svg: For rendering SVG images for the navigation bar.
To add these dependencies to your project, make sure to include them in your pubspec.yaml file and run flutter pub get.

dependencies:
  http: ^1.1.0
  cached_network_image: ^3.3.0
  flutter_svg: ^2.0.8

3. Usage
The project structure is organized as follows:

lib/ contains the main source code for the Flutter application.
assets/ contains image and SVG assets used in the project.
fonts/ contains the google font used in this project.
pubspec.yaml specifies the project dependencies and assets.
You can modify the source code in lib/ to customize the UI design and behavior according to your project's requirements.

Author
Muhammad Awais
GitHub: https://github.com/SayMyName302


