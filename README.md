# Explanation about the project:

Project Organisation:-

- Folders are arranged by name.
- Each folder contains its related files.

Explanation About The Code:

- In Model folder we have OperationKind enum and Calculator struct. OperationKind is also used to keep a track of which operation button is clicked, it’s been implemented by comparing its rawValue with button’s tag property. Calculator struct handles all the logic about calculating.
- In View folder we have storyboard. All the constraints and everything related to view is being set up inside storyboard.
- In Controller folder we have viewController which handles the communication between model and views.
- Also unit tests are included and testing is done on every kind of operation used.

- The Calculator model has enum Operation to keep a track of kind of operation we need to do. 
- Also it has operations dictionary which uses OperationKind as a key to keep a track of kind of calculation and Operation(closure) as a value.

With this mechanism in place it is easy to add more functionality and extend the code in the future. e.g. If we want to add a square root functionality then all we need to do is add a new case in OperationKind enum and in operation dictionary a new key for that operation with a value like ‘Operation.unary(sqrt)’
[.sqrt : Operation.unary(sqrt)].

- On the View side the app works with all orientation and screen size. Though there is a localisation issue with numbers in number pad as I am extracting string value with button.currentTitle. But it can be easily resolved by making an enum like Operationkind and hooking it up with the number pad button’s tag property.

Thanks for reading.

