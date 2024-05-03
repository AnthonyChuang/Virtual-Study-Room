Original App Design Project - README Template
===

# Virtual Study Room

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

This app creates a virtual environment for students and professionals to study or work together in real-time, simulating a library atmosphere. Features might include ambient sounds, productivity timers, and the option to join public or private "study rooms".

### App Evaluation

**Category:** Education & Productivity

**Mobile:** Critical for on-the-go access, allowing users to join study sessions from anywhere. The app uses audio and video streaming technology for live interactions and integrates calendar functionality for scheduling study sessions. Mobile notifications remind users of scheduled sessions and updates from study groups.

**Story:** Designed to replicate the collaborative and focused environment of a physical library, this app provides a space for users to engage in deep work without physical boundaries. It encourages discipline and productivity through structured study sessions and real-time interaction, creating a community of learners and professionals who support and motivate each other.

**Market:** Targeted at university students, remote learners, and professionals needing structured work environments. The app could also appeal to freelancers and digital nomads looking for community and routine in their work habits. Monetization could involve subscription-based access to premium features like advanced room customization, additional ambient sounds, or extended session times.

**Habit:** Users engage with the app daily for scheduled study or work sessions. Regular usage is promoted through reminders, rewards for consistency and productivity, and a community feature that fosters peer accountability.

**Scope:** 
- **V1:** Basic features including public study rooms, ambient library sounds, and simple productivity timers.
- **V2:** Introduce private rooms with invitation controls, customizable ambient sounds, and integrated task management tools.
- **V3:** Add advanced scheduling options, analytics for tracking study habits and productivity, and support for larger groups or classes.
- **V4:** Implement community features such as leaderboards, group challenges, and interactive events like study marathons or guest lectures.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Login/Register: Users can login or register a new account to access personal and communal study areas.
* Join/Create Study Room: Users can join existing public study rooms or create private rooms.
* Study Timer: Users can set a productivity timer to manage study sessions effectively.
* Ambient Sounds: Users can select and play various ambient sounds to enhance concentration.
* Chat: Users can communicate with others in the same virtual room via text chat.

**Optional Nice-to-have Stories**

* Video/Audio Option: Enable video or audio for more interactive study sessions.
* Customizable Avatars: Users can customize their virtual presence with avatars.
* Screen Sharing: Allow users to share their screens with others in the study room.
* Study Tools Integration: Integrate tools like virtual whiteboards or document sharing.
* Rewards System: Implement a rewards system for achieving study goals or milestones.

### 2. Screen Archetypes

- [ ] Login / Register Screen
* Users can login or register a new account.
- [ ] Main Lobby Screen
* Users can join a public study room or create a new private room.
* Navigate to settings or profile customization.
- [ ] Study Room Screen
* Interact with the productivity timer, select ambient sounds, and participate in chats.
* If enabled, manage video/audio settings or share screens.
- [ ] Settings Screen
* Adjust user settings such as notifications, sound levels, or account details.
- [ ] Profile Screen
* View and edit user profile, including avatar customization and study statistics.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home: Directs users to the main lobby where they can select or create a study room.
* Discover: Allows users to explore new and popular public study rooms.
* Profile: Users can view their study stats and customize their profile.

**Flow Navigation** (Screen to Screen)

- [ ] Login / Register Screen
* Leads to the Main Lobby Screen after successful login or registration.
- [ ] Main Lobby Screen
* Option to navigate to any active study room or create a new one.
Access settings or profile customization.
- [ ] Study Room Screen
* From here, users can return to the Main Lobby or navigate to settings.
- [ ] Settings Screen
* Users can return to the Main Lobby or the last active study room.
- [ ] Profile Screen
* Return to the Main Lobby or directly access settings.

## Wireframes

<img width="698" alt="image" src="https://github.com/AnthonyChuang/Virtual-Study-Room/assets/85719130/405c0b33-8382-4c7c-9670-e8d5388eefeb">

### [BONUS] Interactive Prototype

## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

## Week 8

## Tasks Accomplished

Created basic file structure and basic UI for login page

## Video Walkthrough
<div>
    <a href="https://www.loom.com/share/87edfc50d7eb43a3915c3ac3bf94a7ff">
    </a>
    <a href="https://www.loom.com/share/87edfc50d7eb43a3915c3ac3bf94a7ff">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/87edfc50d7eb43a3915c3ac3bf94a7ff-with-play.gif">
    </a>
  </div>

## Notes

Had difficulties setting project up and file structure as there were extra folders everywhere. Will next finish implementing login page by making it more secure,and host a backend database of remembering accounts.

## Week 9

## Tasks Accomplished

Recreated basic login UI, reworked password security and textfield propertie. Created Basic HomeScreen with button functionality to join a public room and enter in a private room key. Also created the start of the public room, including name and background changing functionality. 

## Video Walkthrough
<div>
    <a href="https://www.loom.com/share/b1f9cfd3d1a3458b9ae2fc9dbb422d70">
    </a>
    <a href="https://www.loom.com/share/b1f9cfd3d1a3458b9ae2fc9dbb422d70">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/b1f9cfd3d1a3458b9ae2fc9dbb422d70-with-play.gif">
    </a>
  </div>

## Notes

Had many difficulties with user authentification with Github. Couldn't run code again, so had to recreate project from scratch. Many difficulties with managing the timer feature in the app (currently broken), and is something I hope to fix by next week.

## Week 10

## Tasks Accomplished

Created new library-like default background for Study Room. Created better UI for "back to home" button and "settings" button. Created outline for toolbar. Created a pomodoro-style timer, with a reset and start/stop button that are colored. Timer has both work feature and break feature that can allocate time to either study or take a break. Created popup notifications when study break is over, or study time is over. Finally, created music feature where when the timer button is on, and it is in work mode, lofi music plays. 

## Video Walkthrough
<div>
    <a href="https://www.loom.com/share/4071c21400a24bcbad7d82ceca3c72ae">
    </a>
    <a href="https://www.loom.com/share/4071c21400a24bcbad7d82ceca3c72ae">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/4071c21400a24bcbad7d82ceca3c72ae-with-play.gif">
    </a>
  </div>

## Notes

Had lots of difficulties with displaying the timer properly, and struggled even more with fixing bugs for the music player. Spent over 6 hours debugging the music player feature of the app. Music isn't shown in the loom video, unfortunately, but lofi does play when the timer is running under "study" mode. 
