
### EntryController
## Part Two - User Interface
### Master List View
### Detail View

Build a view that provides editing and view methodality for a single entry. You will use a UITextField to capture the title, a UITextView to capture the body, a UIButton to save, and a UIButton to clear the title and body text areas.

Your Detail View should follow the 'updateWith' pattern for updating the view elements with the details of a model object. To follow this pattern, the developer adds an 'updateWith' method that takes a model object. The method updates the view with details from the model object.

1. Add an 'updateWith' method that takes a model object as a parameter (in this case, an Entry)
2. Implement the 'updateWith' methods to update all view elements that reflect details about the model object (in this case, the titleTextField and bodyTextView)

This view needs to serve as a reading and editing view. You will add a UITextField to display the title (titleTextField) and a UITextView to display the body text (bodyTextView), a 'Clear' button that resets both fields, and a 'Save' button that saves the new or changed entry.

#### View Setup

### Segue

## Part Three - Controller Implementation

You will use NSUserDefaults to add basic data persistence to the Journal app. 

### Add Factory Functions to Entry

Because ```Entry``` class objects are not plist compatible, and ```NSUserDefaults``` will only store classes that are, we have two options:

### Add NSUserDefaults Functionality to the EntryController

Our EntryController object is the source of truth for entries. We are now adding a layer of persistent storage, so we need to update our EntryController to load entries from NSUserDefaults on initialization, and save the entries to NSUserDefaults when they are updated.

1. Write a method called ```- (void)saveToPersistentStorage``` that will save the current entries array to NSUserDefaults
    * note: Manually loop through the entries ```NSArray``` to serialize an ```NSArray``` of plist compatible dictionary copies
    * note: Avoid 'Magic Strings' when saving to NSUserDefaults

2. Write a method called ```- (void)loadFromPersistentStorage``` that will load saved dictionary entries from NSUserDefaults and set self.entries to the results
    * note: Use the Entry ```initWithDictionary(NSDictionary *)dictionary``` while looping through the array to turn the dictionaries into Entry class objects

3. Call the ```- (void)loadFromPersistentStorage``` method when the ```EntryController``` is initialized

4. Call the ```- (void)saveToPersistentStorage``` any time that the list of entries is modified

### Black Diamonds

* Implement the NSCoding protocol on the Entry class
* Create a Unit test that verifies NSCoding methodality by converting an instance to and from NSData
* Refactor persistence to work natively with Entry objects

## Contributions

Please refer to CONTRIBUTING.md.

## Copyright

© DevMountain LLC, 2015. Unauthorized use and/or duplication of this material without express and written permission from DevMountain, LLC is strictly prohibited. Excerpts and links may be used, provided that full and clear credit is given to DevMountain with appropriate and specific direction to the original content.