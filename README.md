# VerkadaPokedex

👋 Hey there, I'm Joshua Le! Thank you for giving me the unique opportunity to showcase my skillset in a take-home iOS project as a part of the interview process at Verkada. This project works right out of the box and should be easy to clone and open up _(but if you run into any problems please contact me at joshua.le@nyu.edu)_.

## Demo

https://user-images.githubusercontent.com/59464508/206889537-e2c0ce04-31cb-439e-967e-d0c8e5fd8c87.mov

### ✅ Milestone 1:
- Created a (Verkada) Pokedex app that successfully calls PokéAPI for a list of our respective Pokemon and shows them in a three column grid layout
- When a Pokemon tile is tapped, a details page is presented specific to that Pokemon (further implmentation needed for specific details)

### ✅ Milestone 2:
- I'll give this milestone a "work-in-progress" status. As you can see in the demo video, the next 21 populated Pokemon (7 rows) are only called when the page is pulled up to refresh. I attempted to implement pagination when scrolling down but could not find a way to with my current LazyVStack layout--the use of Tabs and Lists seemed like an easier approach for this milestone.

### ✅ Milestone 3:
- Successfully implmented image caching with the help of a third-party library, [CachedAsyncImage](https://github.com/lorenzofiamingo/swiftui-cached-async-image)

## Design & Technical Thought Process
At first glance of the project, I wanted to take the approach of 1. Analyzing the RESTful API that PokeAPI uses-seeing the output of each URL request (creating a sort of hiearchy between each request) 2. Creating the struct in which to hold the data we want from the JSON format 3. Fetching the data from JSON using the JSON decoder and Swift's Codable protocol. These files are housed in the PokeAPI folder. As for the design, I wanted to create a simple and easy-to-read UI. As seen in the demo, the NavigationView component divides the screen up with a functional search bar on top with the three column Pokemon grid below. I used SwiftUI to build this project out.

## Issues & Solutions I'd Like to Explore
### Pokemon Types
My origial design idea was to take each Pokemon's respective type and apply its resepective background color to each card. However, I ran into quite a few issues trying to cast the value I was pulling from the PokeAPI into a String (different process than fetching each Pokemon's image). I believe this to be due to one of Swift's string protocols that my code was violating. Though the progress I made was not limited to being able to successfully pull each Pokemon's type and print it to the ouput terminal _(as seen below)_.

<img width="723" alt="Screenshot 2022-12-11 at 1 18 51 AM" src="https://user-images.githubusercontent.com/59464508/206889542-a2e7e87c-a57d-4681-9961-4bd934793191.png">

## Extra Feature
### Carousel Fun


https://user-images.githubusercontent.com/59464508/206891476-2a8baae1-ae9a-4d70-9196-1d40ac2ec608.mov


Mid way through the project I wanted to experiment with a carousel-like view for the Pokemon where the left-most Pokemon is emphasized. You can see this in-app if you comment out the GridView() and uncomment the CarouselView() in ContentView.swift. It was pretty cool to look into the GeometryReader that Swift uses.

