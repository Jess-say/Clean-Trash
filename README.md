[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-f059dc9a6f8d3a56e377f745f24479a46679e63a5d9fe6f495e02850cd0d8118.svg)](https://classroom.github.com/online_ide?assignment_repo_id=5806163&assignment_repo_type=AssignmentRepo)
# CS178A-B-Template

## Table of Contents
- [Overview](#overview)
- [Team](#team)
- [Usage](#usage)
- [How To Run](#how-to-run)
- [Diagrams](#diagrams)
- [Dependencies](#dependencies)
- [Reference](#reference)

## Overview
Clean Trash is mobile application that allows users to take a picture of an object to determine if it’s recyclable or not in their county.
Our goal is to reduce current recycling contamination which has a current rate of 25%, reduce pollution, and conserve energy.

## Team
- <a href="https://github.com/msalloum" target="_blank">Mariam Salloum </a>
- <a href="https://github.com/estela-ramirez" target="_blank">Estela Ramirez Ramirez </a>
- <a href="https://github.com/Jess-say" target="_blank">Jessie Lu </a>
- <a href="https://github.com/mandy840907" target="_blank">Tzu-Ying Chuang </a>
- <a href="https://github.com/briortega" target="_blank">Briana Ortega Vazquez </a>

## Usage
Demo: <Link to youtube video>

<Screenshot of application>

## How To Run

To be able to run our project you need to have pycharm downloaded best version is 3.8 as new verison may not work
  
Then create a new a new project. In the terminal open a git bash then clone the repository into the project run
  * git clone https://github.com/CS-UCR/senior-design-project-ct.git
  
Once you have cloned the repository direct yourself to the src folder by runing 
  * cd src
  
  Note: You may have to run cd senior-design-project-ct-main/src
  
You should now be in the src folder. Now run each of these commands in order
 * python -m pip install --upgrade pip wheel setuptools
 * python -m pip install docutils pygments pypiwin32 kivy.deps.sdl2 kivy.deps.glew
 * python -m pip install kivy.deps.gstreamer
 * python -m pip install kivy.deps.angle
 * python -m pip install pygame
 * python -m pip install kivy

 Now you can just run main by locating the run button under the run tab
 
 Note: If you only get hi pycharm then you need to right click the main.py file and click run main 

## Diagrams

Overall System Diagram
![systemDiagram](/images/systemDiagram.png)
  
UML for Badge System
![UML_For_badge](/images/UML_For_badges.png) 

## Dependencies
Install Node Package Manager (npm). [Helpful Documentation](https://www.npmjs.com/get-npm)
  
## Reference  
### Datasets
- [Waste Classification](https://www.kaggle.com/szdxfkmgnb/waste-classification)
- [Garbage Classification](https://www.kaggle.com/asdasdasasdas/garbage-classification)
- [Garbage Classification (12 Classes)](https://www.kaggle.com/mostafaabla/garbage-classification)

