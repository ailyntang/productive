Replicating the ["Productive - Habit Tracker" app](https://apps.apple.com/us/app/productive-habit-tracker/id983826477) on the iTunes store. I love this app, and decided this would be a great app to replicate to learn iOS fundamentals such as:

* Core Data 
* Pushing and popping view controllers
* Potentially coordinators to manage the pushing and popping
* MVVM
* Transferring data back and forth between screens


# User stories
## P-001 Empty Home Screen (DONE)
**As a user, I want to add a new habit**  
**So that I can track that habit**


**In scope**

* Home screen

**Out of scope**

* Suggested category screen
* Schedule screen

### Acceptance Criteria

**Scenario 1: Show home screen at launch**

Given that I have launched the app  
When I land in the app  
Then I will see the home screen with a navigation controller and an add button

**Scenario 2: Add new habit**

Given that I am on the home screen  
When I tap on the add button  
Then I will be pushed to the "suggested category" view

## P-002 Suggested Category (DOING)
**As a user, I want to see a list of suggested categories**  
**So that I can choose a category from the list**

**In scope**

* Suggested Category screen

**Out of scope**

* Schedule screen
* Choose Name and Icon screen
* Suggested Habit screen

### Acceptance Criteria

**Scenario 1: Suggested category**

Given that I am on the suggested category screen  
When I tap on a category  
Then I will be pushed to the "suggested habit" view

**Scenario 2: Write my own habit**

Given that I am on the suggested category screen  
When I tap on "write my own habit"  
Then I will be pushed to the "choose name and icon" view


## P-003 Suggested Habit
**As a user, I want to see a list of suggested habits**  
**So that I can choose a habit from the list**

**In scope**

* Suggested Habit screen

**Out of scope**

* Schedule screen
* Choose Name and Icon screen

**Scenario 1: Suggested habit**

Given that I am on the suggested habit screen  
When I tap on a habit  
Then I will be pushed to the "choose name and icon" view

**Scenario 2: Write my own habit**

Given that I am on the suggested habit screen  
When I tap on "write my own habit"  
Then I will be pushed to the "choose name and icon" view

## P-003 Non-empty Home Screen

### Acceptance Criteria

**Scenario 1: View habits**

Given that I am on the home screen  
When there is at least one habit  
Then I will see a list of habits  
And the uncompleted habits will be in colour with a cross icon  
And the completed habits will be greyed out with a tick icon

**Scenario 2: Complete a habit**

Given that there are habits  
When I swipe left on a habit  
Then I will mark that habit as completed  
And I will see the completed habit is greyed out with a tick symbol

**Scenario 3: Delete a habit**



# Credits
Thanks to these great people for their icons from [freepick](https://www.flaticon.com)

* Freepik
* fjstudio
* Smashicons
