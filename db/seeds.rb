# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
  time = 1.day.ago
  foo = Project.create!(name: 'Foo')
  Comment.create!(
    project: foo,
    author: 'Marco',
    content: "Shouldn't we use state machines to handle status transitions?",
    created_at: time
  )
  Comment.create!(
    project: foo,
    author: 'Linus',
    content: 'Yes, it would be a good idea to do that. Changing the status from cancelled to finished, for example, would make no sense.',
    created_at: time + 2.hours
  )
  Comment.create!(
    project: foo,
    author: 'Marco',
    content: 'Is there an existing database schema that should be followed, or will we need to design a new schema for this feature?',
    created_at: time + 3.hours
  )
  Comment.create!(
    project: foo,
    author: 'Linus',
    content: 'We will need to design a new database schema for this feature.',
    created_at: time + 4.hours
  )
  Comment.create!(
    project: foo,
    author: 'Marco',
    content: 'Are there any security considerations that need to be taken into account, such as authentication or access control?',
    created_at: time + 5.hours
  )
  Comment.create!(
    project: foo,
    author: 'Linus',
    content: "Yes, we will need to implement authentication and policies to ensure that only authorized users can leave comments or update the status of a project. But don't worry about it for now as we only have 3 hours to finish this.",
    created_at: time + 6.hours
  )
  Comment.create!(
    project: foo,
    author: 'Marco',
    content: 'How should the conversation history be displayed to the user? Should it be paginated, or should all comments be displayed on a single page?',
    created_at: time + 7.hours
  )
  Comment.create!(
    project: foo,
    author: 'Linus',
    content: "The conversation history should be paginated to prevent the page from becoming too cluttered and slow if it has many comments. But, again, don't worry about it for now.",
    created_at: time + 7.hours
  )
  Comment.create!(
    project: foo,
    author: 'Marco',
    content: "Ok that's all for now. Thanks Linus!",
    created_at: Time.zone.now
  )
  foo.started!

  Project.create!(name: 'Bar')
end
