Replicating the ["Productive - Habit Tracker" app](https://apps.apple.com/us/app/productive-habit-tracker/id983826477) on the iTunes store. I love this app, and decided this would be a great app to replicate to learn iOS fundamentals such as:

* Core Data 
* Pushing and popping view controllers
* Potentially coordinators to manage the pushing and popping
* MVVM
* Transferring data back and forth between screens


# User stories
## P-001 Home Screen
**As a user, I want to see a list of habits**  
**So that I can track that habit or add a new habit**


**In scope**

* Home screen

**Out of scope**

* Suggested category screen
* Schedule screen

### Acceptance criteria

**Scenario 1: Show home screen at launch**

Given that I have launched the app  
When I land in the app  
Then I will see the home screen with a navigation controller and an add button

**Scenario 2: Add new habit**

Given that I am on the home screen  
When I tap on the add button  
Then I will be pushed to the "suggested category" view

**Scenario 3: View habits**

Given that I am on the home screen  
When there is at least one habit  
Then I will see a list of habits  
And the uncompleted habits will be in colour with a cross icon  
And the completed habits will be greyed out with a tick icon

**Scenario 4: Complete a habit**

Given that there are habits  
When I swipe left on a habit  
Then I will mark that habit as completed  
And I will see the completed habit is greyed out with a tick symbol
