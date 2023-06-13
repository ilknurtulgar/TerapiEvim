# TerapiEvim Project
TerapiEvim is a mobile application developed by integrating group therapies into an online platform in order to meet this requirement of people who live in places where group therapies are performed sparsely and group therapists are not available much or who need such therapies during the pandemic.

## What does it solve?
- My Therapy House will prevent group therapy inadequacy as a mobile platform application.
- Individuals will be able to receive group therapy without experiencing location and therapist difficulties. Group therapies;
- It prevents individuals from looking at themselves as if they are not alone, only they face problems.
- At the same time, it also offers clients the right to choose a therapist with whom clients can feel close. 
- This creates the opportunity for my TerapiEvim to spread globally to a wide audience.

## Project's Architecture Summary
- We used MVC pattern in our project. We faced some difficulties, so we decided to use BaseView in every page so that every page has its own controller.
- Controllers are intialized only if their view is called. In order to achieve it we used [VB10](https://github.com/VB10)'s BaseView which is explained [here](https://youtu.be/crKJEBxyxS8?list=PL1k5oWAuBhgV_XnhMSyu2YLZMZNGuD0Cv&t=700). It is a great solution for big projects and it is successfully used in our production ready projects. We just modified it handle GetX.

## Used Packages
 - [GetX](https://pub.dev/packages/get)
 - [Video SDK](https://pub.dev/packages/videosdk)
 - [Cloud Firestore](https://pub.dev/packages/cloud_firestore)
 - As a network manager we created VexaFire manager inspired by [Vexana](https://pub.dev/packages/vexana). If we decide to migrate from Firestore it would be easy, because most models are based on Vexana's principle. Services will require less amount of effort as well 

## Previews

https://github.com/ilknurtulgar/TerapiEvim/assets/63793311/06860e51-bb45-4bcf-b1f9-1067a5dd40e5

### Participant's UI

![Screenshot (430)](https://github.com/ilknurtulgar/TerapiEvim/assets/63793311/d39b3423-79ba-483c-a536-7b036157659c)

![Screenshot (429)](https://github.com/ilknurtulgar/TerapiEvim/assets/63793311/b8b87091-1af4-4a2d-90f0-acf1c887d833)

### Therapist's UI

![Screenshot (433)](https://github.com/ilknurtulgar/TerapiEvim/assets/63793311/e4c1b100-27aa-4efc-8ed5-4a43a22b9b4e)

![Screenshot (432)](https://github.com/ilknurtulgar/TerapiEvim/assets/63793311/d4fc3470-d85c-45a5-bf31-3d05bd513069)

![Screenshot (435)](https://github.com/ilknurtulgar/TerapiEvim/assets/63793311/ef034830-b9bb-4c25-8fec-4b347900e29f)

![Screenshot (436)](https://github.com/ilknurtulgar/TerapiEvim/assets/63793311/9657fbd0-b099-4d04-a6d5-08137605f677)
## Our Team 

 - [İlknur Tulgar](https://github.com/ilknurtulgar)
 - [Gizem Göksu](https://github.com/GizemGoksu)
 - [Yasemin Atmaca](https://github.com/jjasminn)
 - [Behzod Faiziev](https://github.com/behzodfaiziev)

<br />

<img align="left" alt="" width="400" src="https://github.com/ilknurtulgar/TerapiEvim/assets/63793311/b873b88e-4524-4a9c-882b-99b56b508522)](https://user-images.githubusercontent.com/63793311/224953868-7c2cd7e3-d850-4ab8-804c-d12e578526eb.svg" />

<img align="left" alt="" width="400" src="https://github.com/ilknurtulgar/TerapiEvim/assets/63793311/206e4125-000c-4f30-85fb-7424d8bd8402" />
