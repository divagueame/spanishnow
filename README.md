# README

https://github.com/divagueame/spanishnow

MAMBO Spanish
A self-studying platform for Spanish-language learners.
www.mambo-spanish.com

####

Load the fixtures for the TestSuite
rails db:create

rails db:migrate

rails db:fixture:load

rails test:all

###

Main Features

Admin Panel for teachers to provide feedback for student's writings.

Drag and Drop DB Persistent Reordering of Lessons with StimulusJS.

Live Update Messages Broadcasting with Action Cable (Broadcasting from a model to the specific user with the corresponding specific channel).

Content Management System to create, edit and remove lessons. Each lesson can be made up of several interchangeable blocks. (Polimorphic approach allows it to be extended as needed)

Timed lessons (DB Persistent)

Integrated payment system with Stripe

###

Testing Suite
62 runs, 152 assertions, 0 failures, 0 errors, 0 skips
