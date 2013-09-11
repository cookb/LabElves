# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "cookb@mit.edu", password: "brianbrian", name: "Brian Cook", 
  location: "San Francisco, CA", education: "Doctorate", institution: "MIT", link: "http://www.google.com", latitude: 37.7749295, longitude: -122.4194155, credits: 200)
  
User.create(email: "buddy@northpole.com", password: "christmas", name: "Buddy D. Elf", 
  location: "San Francisco, CA", education: "Masters", institution: "Santa's Workshop", link: "http://www.google.com", latitude: 37.7749295, longitude: -122.4194155, credits: 50)

Specialty.create(author_id: 1, name: "Molecular Biology", description: "Study of the molecular basis of biological processes")  
Specialty.create(parent_id: 1, author_id: 1, name: "PCR", description: "Polymerase Chain Reaction")
Specialty.create(parent_id: 2, author_id: 1, name: "qPCR", description: "quantitative PCR, aka real-time PCR")
Specialty.create(parent_id: 1, author_id: 1, name: "Mini-Prep", description: "Purification of DNA from bacterial culture")
Specialty.create(author_id: 1, name: "Lab Errand", description: "Miscellaneous lab errand")  

SpecJoin.create(user_id: 1, spec_id: 1)
SpecJoin.create(user_id: 1, spec_id: 2)
SpecJoin.create(user_id: 1, spec_id: 4)
SpecJoin.create(user_id: 2, spec_id: 3)
SpecJoin.create(user_id: 2, spec_id: 4)

Task.create(status: "requested", user_id: 1, spec_id: 3, subject: "qPCR help", 
body: "need someone to teach me qPCR!", duration: 60, location: "San Francisco, CA", 
credits: 50, time_start: "2013-09-05 12:00:00", time_end: "2013-09-12 12:00:00", latitude: 37.7749295, longitude: -122.4194155)

Task.create(status: "booked", user_id: 1, elf_id: 2, spec_id: 4, subject: "Mini-Preps", 
body: "do 48 minipreps", duration: 120, location: "San Francisco, CA", 
credits: 100, time_start: "2013-09-05 12:00:00", time_end: "2013-09-07 12:00:00", time_final: "2013-09-06 14:00:00", latitude: 37.7749295, longitude: -122.4194155)

Task.create(status: "completed", user_id: 1, elf_id: 2, spec_id: 5, subject: "Reagent pickup", 
body: "Pickup and deliver my order from the UCSF stockroom", duration: 15, location: "San Francisco, CA", 
credits: 10, time_start: "2013-09-01 09:00:00", time_end: "2013-09-01 14:00:00", time_final: "2013-09-01 12:00:00", latitude: 37.7749295, longitude: -122.4194155)

Task.create(status: "completed", user_id: 1, elf_id: 2, spec_id: 2, subject: "Run a PCR", 
body: "Set up and run PCR for 96 samples", duration: 60, location: "San Francisco, CA", 
credits: 50, time_start: "2013-09-02 09:00:00", time_end: "2013-09-04 14:00:00", time_final: "2013-09-03 12:00:00", latitude: 37.7749295, longitude: -122.4194155)

Bid.create(task_id: 1, elf_id: 2, time_bid: "2013-09-10 14:00:00", credits_bid: 50, comments: "Time is flexible. Feel free to suggest other times.")

Review.create(task_id: 3, title: "Great job!", comments: "Buddy was perfect", endorse: 1)
Review.create(task_id: 4, title: "?", comments: "Buddy ate the samples", endorse: 0)