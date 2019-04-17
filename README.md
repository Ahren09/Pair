# Pair
##### "Personal Acoustic-Inspiration Relator"
Developed by:
Ahren Jin, Tyler Liu, Leo Liu, Max Zhang

Standing on top of the Empire State Building or strolling on the Whitehaven beach, we always want to find great musics that would accompany with these marvelous sceneries. This is why we developed PAIR. No matter if you are on a spectacular journey or trapped in your tedious daily routine, PAIR makes your life more enjoyable by playing THE song that best suits your surrounding.

This app is built with:
python
Swift
Spotify API
Google Cloud Platform


### What it does
### Demo Video: [a link](https://youtu.be/yv15PhdNgGI)
In a nutshell, PAIR pairs you with musics that match your surrounding.

In more details, PAIR allows user to input an image by either importing from camera rolls or taking a new one, and returns a song whose mood best matches with the mood of the input image. If the user has Spotify installed, PAIR would automatically open Spotify and load the song, if not, it would open up the web version of Spotify in Safari.

### How it works
Our App uses an backend that relies on Google Vision API. The Image from the user is uploaded to be labelled, then embedded to a word map that classify the emotions. The map will output a vector that correspond to our different type of emotions, then we select the one of the music that have the similar emotion vector from the data set. We then use Spotify api to load the song in Spotify app.

### Next Step
First, we can expand our database so that it can include more songs. Currently, we are using spotify. In the future, we can support more apps (music databases) and even let users to choose which apps (databases) they want to use.

Second, we can make some improvement in our emotion-deciding algorithm. Our AI algorithm which defines labels for images is very accurate, but the algorithm which decides which labels are linked to which emotions involves subjectivity. Of course, when we gather enough user feedback in the future, we can make the emotion-deciding algorithm more objective to most users.
