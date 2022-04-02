# **TTRPG GAME FINDER**

[Github Repo](https://github.com/wSwanepoel199/WillemSwanepoel_T2A2)
[Deployed Application](https://willemswanepoelt2a2.herokuapp.com/)

## **What problem is being solved?**

Despite Table Top Role Playing Games social aspects, many who are interested in playing or even are veterans of the hobby face repeated difficulties in finding groups. It is this downfall we are solving by facilitiating a space for game masters and players to advertise thier availability and form groups with out the requirement of a large social group.

## **Application Description**

This applications purpose to to facilitate and aid in the forming of groups to partake in TTRPGs. This is done in the form of a 2 way marketplace where game masters are able to list their settings, including details like themes, game systems, basic lore, expectations from players ect. This should allow players to locate game masters that match the expectations for the types of games they would like to play.

The target audience are individuals seeking to form groups in order to partake in table top role playing sessions.

### *sitemap*

![Site Map](https://github.com/wSwanepoel199/WillemSwanepoel_T2A2/blob/main/docs/Sire%20Map.png?raw=true "Site Map")

### *screenshots*

![Listings Page](https://github.com/wSwanepoel199/WillemSwanepoel_T2A2/blob/main/docs/Listings%20Pge.jpg?raw=true "Listings Page")
![Create Listings Page](https://github.com/wSwanepoel199/WillemSwanepoel_T2A2/blob/main/docs/Create%20A%20listing.jpg?raw=true "Create Listings Page")
![Show Listing Page](https://github.com/wSwanepoel199/WillemSwanepoel_T2A2/blob/main/docs/Show%20Page.jpg?raw=true "Show Listing Page")
![User Profile Page](https://github.com/wSwanepoel199/WillemSwanepoel_T2A2/blob/main/docs/User%20Profile%20Page.jpg?raw=true "User Profile Page")

### *tech stack*

Frontend;
Bootstrap
Awesome Font
Select2
jQuery
HTML
ERB
Simple Form

Backend;
Ruby
Rails
Devise
ActsAsTaggable
Heroku

Database;
AWS
PostgreSQL

## **User Stories**

As someone interested in Dungeons & Dragons, I want to be able to find like minded people, so I am able to play Dungeons & Dragons.
As someone interested in telling a story, I want to be able to tell this story through the medium of roleplaying games, so I am able to explore themes which may not be as impactful through other mediums.

## **Wireframes**

![Wireframes](https://github.com/wSwanepoel199/WillemSwanepoel_T2A2/blob/main/docs/WillemSwanepoelT2A2.png?raw=true "Wireframes")

## **ERD**

![ERD](https://github.com/wSwanepoel199/WillemSwanepoel_T2A2/blob/main/docs/ERD.png?raw=true "ERD")

## **Application Abstraction**

Loading into the Root and Listings page it is here where where we load up all current listings with all their details attached such as title, which user made them, a snippet of the discription, and a list of tags, we also use Devise to facilitate user authentication and authorisation but having them login or make an account via Devise's backend. Once logged in several features open up such as being able to use the search function and make new listings.

When making a new listing Simple Form is used to provide quick automated styling via bootstrap. The tag input also uses a jQuery module called select2 to supply a dropdown listing existing tags based on how often they are used, this encourgaes users to use popular tags instead of generating their own, which is also possible. Additionally we use Rails Active Storage paired with AWS S3 to provide offsite image storage for uploaded images. Once made you are automatically redirected to the new listings show page which additionally pulls the creators email as a contact point.

The search bar is accessabile on most pages and can be used to easily find listings which contain key words in either their Title or Tags, or a user is able to search through listings via the username allowing for easily gaining access to a specific users profile or simply their list of games.

ActsAsTaggable gem is used to manage the tags system allowing for easy linking and tracking of tags as well as easy storage it comes with many additional features not currently used but has clear benefits for expantion in the future.

## **Model Relationships**

The User and Listing models have a has_many/has_one relationship allowing users to have many listings but listings to only have 1 user. Additionally an intermediary model between the tags and listings exists called taggings, this model has a has_one relationship with a listingd and a has_many relationship with tags.

## **Database Relations**

There are many tables within the database containing unique relations. Listings for example simply stores the listings name as title, the description, and who made this listing. However, far more complicated tables like User or Taggins store much more, in User's case it not only stores a username, but also the email, an encripted password, and reset information of each tuple in the table, similarly for Taggings, which stores mostly connective attributes in its relations, consiting of the taggable_id identifying which entity recieves tags, the tag_id which allows it to locate the correct tag but it also supports a tagger_id, which would allow it identify who did the tagging or even assign ownership over tags. Tags in contrast is far simpiler containing only really a name as well as a count for how many taggible_id's are linked to each indivial tag.

All tables share 2 attributes, created_at and updated_at, automatically generated by rails it has proved helpful in attempts to order listings by newest.

## **Database Schema Design**

![Database Schema Generated by DBeaver](https://github.com/wSwanepoel199/WillemSwanepoel_T2A2/blob/main/docs/Schema%20Design.jpg?raw=true "Database Schema Design Generated by DBeaver")

## **Project Tracking**

Trello was used for project management and tracking, allowing for easy breaking down of important tasks and figuring out where to go next. Mid development DBeaver was also used to figure out how the background of the application's database was functioning allowing for figuring out task priority.
