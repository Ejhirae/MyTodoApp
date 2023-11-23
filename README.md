# my_todo_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Basic Features:
[x]Text Field
[x]List of all Tasks
[x]Add Tasks

Intermediate Features:
[x]Edit Tasks
    -Using the dismissable widget we can now swipe right on a task and edit it
[x]Remove Tasks
    - Completed using dismissable widget
[x]More ThoughtFul UI
    - Snackbar to display status of tasks i.e. Created tasks or deleted tasks
    - Dismissable widgets for deleting tasks
    - Instead of blank screen when tasks are empty a text prompting you to add tasks has been included
[x]Complete tasks
    - A checkbox for completed tasks but still keeps the task in the list view
- Parse Date

Advanced warm up features:
- Use of any suitable backend (Mysql is being used)
- Add some settings to it (Dark Mode)
- A profile for logging in and out
- Add some sort of optimisation and clean code.


Advanced Features:
- Playstore ready design
    - Got a design from dribble, creator: Orçun Umut Kumova 
    - link to design: https://dribbble.com/shots/22681173-Daily-UI-042-ToDo-List

    - Got a design from dribble, creator: Osikabor Emmanuel
    - link to design: https://dribbble.com/shots/15503431-Sign-In-and-Sign-Up-Page
- Completed tasks can now be removed from list view and put in history
- Comments where necessary

GITHUB- create new repository from command line arguments
echo "# MyTodoApp" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M development
git remote add origin https://github.com/Ejhirae/MyTodoApp.git
git push -u origin development

Or push from exiisting repository
git remote add origin https://github.com/Ejhirae/MyTodoApp.git
git branch -M development
git push -u origin development