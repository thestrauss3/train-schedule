# README

![Build Status](https://codeship.com/projects/5b3f3070-1177-0135-f939-466af79fdcc4/status?branch=master)
![Code Climate](https://codeclimate.com/github/thestrauss3/train-schedule.png)



# Train Spotter

## Purpose
Train Spotter allows users to find schedules to navigate the complicated transportation system in Boston. Although it currently only features commuter rail lines in Boston, eventually it will also include subway and bus lines as well as other major cities. Train Spotter will also serve as a notification app so users can receive text or emails alerting them to any delays on the trains they use most often.

### User Stories

```no-hightlight
As a prospective user
I want to be able to sign up
So that I can have favorited items and receive alerts
```
Acceptance Criteria
- I should see a sign-up button in the nav-bar if not signed in
- After clicking sign-up button, I should be redirected to a page with a form I can fill out with my information
- Upon submitted form successfully, I should be told my account was created and an email should be sent to my email address
- Upon submitted form with invalid information, I should remain on the same page and the form should still have my inputted information

```no-highlight
As an unauthenticated user
I want to see the a list of all train lines in the Boston area
So I know what places I can reach through the MBTA
```
Acceptance Criteria
- On the homepage, I should see all train lines in the Boston area
- I should be able to get to this page by clicking the home button on the nav-bar from any page on the website
- I should see a map of the Boston area including all commuter rail lines
- I should see all alerts for the train system listed

```no-hightlight
As an unauthenticated user
I want to see a list of all stations on a particular train
So I know where that train line can take me
```
Acceptance Criteria
- I should be able to get to this page by clicking on the line from the home page, or from a station belonging to the line
- I should see every station belonging to this train in order
- I should be able to reorder this list as either inbound or outbound
- I should see any alerts related to this line


```no-hightlight
As an unauthenticated user
I want to view the page for a particular station
So I can see if there are any alerts related to this station
```
Acceptance Criteria
- I should be able to get to this page by clicking the station on any train or line page
- I should see any alerts related to this station (e.g. boarding on the opposite track)


```no-hightlight
As an authenticated user
I want to designate train lines I use often as favorites
So i can easily keep track of the lines I use the most
```
Acceptance Criteria
- I want to be able to favorite a train line from the line index page, line show page or from a station belonging to this line
- I should be able to favorite or unfavorite at any time and be able to easily tell whether I currently have it favorited

```no-hightlight
As an authenticated user
I want to designate train stations I use often as favorites
so I can easily keep track of the stations I use the most
```
Acceptance Criteria
- I want to be able to favorite a station from the related station show page
- I should be able to favorite or unfavorite at any time and be able to easily tell whether I currently have it favorited

```no-highlight
As an authenticated user
I want to view my own profile portal page
So I can easily see all my favorites and navigate to relevant pages
```
Acceptance Criteria
- I should be able to get to this page by clicking a link on the nav bar from any page
- This link should only be present if I am logged in
- I should be able to unfavorite any item from this page
- I should see all my favorite lines and stations
- I want to click any of these links to be taken to the appropriate page
- I want to see all alerts related to any of my favorited items
- I want to see an abbreviated schedule of all my favorite lines that only shows my favorite stations times

```no-highlight
As an authenticated user
I want to receive text or email notifications
so I know when my favorited items have important alerts
```
Acceptance Criteria
- I should be able to choose between text, email or both
- I should be able to set my alert threshold to none, important, or all
- I should be able to choose these options from the settings page which I can get to by clicking a link on the nav bar that only appears while logged in
