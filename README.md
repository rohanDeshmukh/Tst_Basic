# Tst_Basis


1.Analyse requirements:
  a.API implementation:
      1.There is no authentication required for an api to call.
      2.This api consists of weird responses starting from “/”.
      3.No specification given on use of Http methods (Get,Post).
  b.User Interface:
      1.Create swipe cards to display the text, which should swipe in both directions right to left and left to right
      2.It should contain a title which displays the card number out of total cards and subtitle with displays the response text
     
2.Project Structure:
	    In this project, we are using MVVM design pattern template and each folder represents there responsibility as follows as:
      1.Resources: This will include the third party codes, which are commons to use as Reachability like to check the internet connectivity for app
      2.Service: This will include all services classes as the call of api and api parser classes with error handling codes.
      3.ViewModel: This will include class with forms connectivity and data binding between the view and model classes.
      4.View: This is where the user interface classes reside, in which we display the swipe cards gestures.
      5.Model: This will include to store data values.
      6.We have user cocoapods to install third party library: 
        iCarousel - for swipe cards
        
Software uses:
Xcode: version 11.3.1
iOS Deployment Target: 13.2
Test Device: iPhone 11 Pro Max


 
 

 
